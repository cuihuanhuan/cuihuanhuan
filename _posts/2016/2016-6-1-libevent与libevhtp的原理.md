---
layout: post
---

<h4>libevent与libevhtp的原理</h4>

    Libevent工作原理如下：
    Libevent是一个基于事件通知机制的网络库，用来开发可扩展性的多线程的网络服务器。

    Libevent提供了一种机制，可以在指定某个文件描述符或者某个超时事件到达时，执行一个回调函数。
    应用程序只需要调用event_dispatch()，然后动态增加或移除事件，而不用修改事件循环。

    libevhtp工作原理如下：

    Create a parent evhtp_t structure.
    Assign callbacks to the parent for specific URIs or posix-regex based URI's
    Optionally assign per-connection hooks (see hooks) to the callbacks.
    Optionally assign pre-accept and post-accept callbacks for incoming connections.
    Optionally enable built-in threadpool for connection handling (lock-free, and non-blocking).
    Optionally morph your server to HTTPS.
    Start the evhtp listener.


    Optionally deal with pre-accept and post-accept callbacks if they exist, allowing for a connection to be rejected if the function deems it as unacceptable.
    Optionally assign per-request hooks (see hooks) for a request (the most optimal place for setting these hooks is on a post-accept callback).
    Deal with either per-connection or per-request hook callbacks if they exist.
    Once the request has been fully processed, inform evhtp to send a reply.
    
    
<h4>libevhtp</h4>

    libevhtp官方文档:http://ellzey.github.io/libevhtp/
	
	/*设置回调函数*/
    cb = evhtp_set_regex_cb (htp, "^/upload-aj/.*", upload_ajax_cb, NULL);
    evhtp_set_hook(&cb->hooks, evhtp_hook_on_headers, upload_headers_cb, NULL);
	
	
	/*第一个函数*/
    /*
    Handle AJAX file upload.
    @return an array of json data, e.g. [{"name": "foo.txt"}]
    */
    static void
    upload_ajax_cb(evhtp_request_t *req, void *arg)
    {
        RecvFSM *fsm = arg;
        SearpcClient *rpc_client = NULL;
        char *parent_dir;
        GError *error = NULL;
        int error_code = ERROR_INTERNAL;
        char *filenames_json, *tmp_files_json;
        
        evhtp_headers_add_header (req->headers_out,
                              evhtp_header_new("Access-Control-Allow-Headers",
                                               "x-requested-with, content-type, accept, origin, authorization", 1, 1));
        evhtp_headers_add_header (req->headers_out,
                              evhtp_header_new("Access-Control-Allow-Methods",
                                               "GET, POST, PUT, PATCH, DELETE, OPTIONS", 1, 1));
        evhtp_headers_add_header (req->headers_out,
                              evhtp_header_new("Access-Control-Allow-Origin",
                                               "*", 1, 1));
        evhtp_headers_add_header (req->headers_out,
                              evhtp_header_new("Access-Control-Max-Age",
                                               "86400", 1, 1));

        evhtp_headers_add_header (req->headers_out,
                              evhtp_header_new("Content-Type",
                                               "application/json; charset=utf-8", 1, 1));

        if (evhtp_request_get_method(req) == htp_method_OPTIONS) {
        /* If CORS preflight header, then create an empty body response (200 OK)
         * and return it.
         */
            set_content_length_header (req);
            evhtp_send_reply (req, EVHTP_RES_OK);
            return;
        }
        /* After upload_headers_cb() returns an error, libevhtp may still
        * receive data from the web browser and call into this cb.
        * In this case fsm will be NULL.
        */
        if (!fsm || fsm->state == RECV_ERROR)
            return;
    
        if (!fsm->files) {
            seaf_warning ("[upload] No file uploaded.\n");
            set_content_length_header (req);
            evhtp_send_reply (req, EVHTP_RES_BADREQ);
            return;
        }
    
        parent_dir = g_hash_table_lookup (fsm->form_kvs, "parent_dir");
        if (!parent_dir) {
            seaf_warning ("[upload] No parent dir given.\n");
            evbuffer_add_printf(req->buffer_out, "Invalid URL.\n");
            set_content_length_header (req);
            evhtp_send_reply (req, EVHTP_RES_BADREQ);
            return;
        }
    
        if (!check_tmp_file_list (fsm->files, &error_code))
            goto error;

        rpc_client = ccnet_create_pooled_rpc_client (seaf->client_pool,
                                                 NULL,
                                                 "seafserv-threaded-rpcserver");

        if (seafile_check_quota (rpc_client, fsm->repo_id, NULL) < 0) {
            seaf_warning ("[upload] Out of quota.\n");
            error_code = ERROR_QUOTA;
            goto error;
        }
		
        filenames_json = file_list_to_json (fsm->filenames);
        tmp_files_json = file_list_to_json (fsm->files);
    
        char *ret_json = seafile_post_multi_files (rpc_client,
                                               fsm->repo_id,
                                               parent_dir,
                                               filenames_json,
                                               tmp_files_json,
                                               fsm->user,
                                               0,
                                               &error);
        g_free (filenames_json);
        g_free (tmp_files_json);
        if (error) {
            if (error->code == POST_FILE_ERR_FILENAME) {
                error_code = ERROR_FILENAME;
                seaf_warning ("[upload] Bad filename.\n");
            }
        g_clear_error (&error);
        goto error;
        }

        ccnet_rpc_client_free (rpc_client);

        evbuffer_add (req->buffer_out, ret_json, strlen(ret_json));
        g_free (ret_json);

        set_content_length_header (req);
        evhtp_send_reply (req, EVHTP_RES_OK);
        return;
    
    error:
        if (rpc_client)
            ccnet_rpc_client_free (rpc_client);
    
        switch (error_code) {
        case ERROR_FILENAME:
            evbuffer_add_printf(req->buffer_out, "{\"error\": \"Invalid filename.\"}");
            set_content_length_header (req);
            evhtp_send_reply (req, SEAF_HTTP_RES_BADFILENAME);
            break;
        case ERROR_EXISTS:
            evbuffer_add_printf(req->buffer_out, "{\"error\": \"File already exists.\"}");
            set_content_length_header (req);
            evhtp_send_reply (req, SEAF_HTTP_RES_EXISTS);
            break;
        case ERROR_SIZE:
            evbuffer_add_printf(req->buffer_out, "{\"error\": \"File size is too large.\"}");
            set_content_length_header (req);
            evhtp_send_reply (req, SEAF_HTTP_RES_TOOLARGE);
            break;
        case ERROR_QUOTA:
            evbuffer_add_printf(req->buffer_out, "{\"error\": \"Out of quota.\"}");
            set_content_length_header (req);
            evhtp_send_reply (req, SEAF_HTTP_RES_NOQUOTA);
            break;
        case ERROR_RECV:
        case ERROR_INTERNAL:
            set_content_length_header (req);
            evhtp_send_reply (req, EVHTP_RES_SERVERR);
            break;
        }
    }
    
	
	
	/*第二个函数*/
    static evhtp_res
    upload_headers_cb (evhtp_request_t *req, evhtp_headers_t *hdr, void *arg)
    {
        SearpcClient *rpc_client = NULL;
        char *token, *repo_id = NULL, *user = NULL;
        char *boundary = NULL;
        gint64 content_len;
        char *progress_id = NULL;
        char *err_msg = NULL;
        RecvFSM *fsm = NULL;
        Progress *progress = NULL;
    
        if (evhtp_request_get_method(req) == htp_method_OPTIONS) {
            return EVHTP_RES_OK;
        }    
    
        /* URL format: http://host:port/[upload|update]/<token>?X-Progress-ID=<uuid> */
        token = req->uri->path->file;
        if (!token) {
        seaf_warning ("[upload] No token in url.\n");
        err_msg = "Invalid URL";
        goto err;
        }

        rpc_client = ccnet_create_pooled_rpc_client (seaf->client_pool,
                                                 NULL,
                                                 "seafserv-rpcserver");

        if (check_access_token (rpc_client, token, &repo_id, &user) < 0) {
            seaf_warning ("[upload] Invalid token.\n");
            err_msg = "Access denied";
            goto err;
        }
    
        boundary = get_boundary (hdr);
        if (!boundary) {
            goto err;
        }

        if (get_progress_info (req, hdr, &content_len, &progress_id) < 0)
            goto err;

        if (progress_id != NULL) {
            pthread_mutex_lock (&pg_lock);
            if (g_hash_table_lookup (upload_progress, progress_id)) {
                pthread_mutex_unlock (&pg_lock);
                err_msg = "Duplicate progress id.\n";
                goto err;
            }
            pthread_mutex_unlock (&pg_lock);
        }
    
        fsm = g_new0 (RecvFSM, 1);
        fsm->boundary = boundary;
        fsm->repo_id = repo_id;
        fsm->user = user;
        fsm->line = evbuffer_new ();
        fsm->form_kvs = g_hash_table_new_full (g_str_hash, g_str_equal,
                                           g_free, g_free);

        if (progress_id != NULL) {
            progress = g_new0 (Progress, 1);
            progress->size = content_len;
            fsm->progress_id = progress_id;
            fsm->progress = progress;
    
            pthread_mutex_lock (&pg_lock);
            g_hash_table_insert (upload_progress, g_strdup(progress_id), progress);
            pthread_mutex_unlock (&pg_lock);
        }
    
        /* Set up per-request hooks, so that we can read file data piece by piece. */
        evhtp_set_hook (&req->hooks, evhtp_hook_on_read, upload_read_cb, fsm);
        evhtp_set_hook (&req->hooks, evhtp_hook_on_request_fini, upload_finish_cb, fsm);
        /* Set arg for upload_cb or update_cb. */
        req->cbarg = fsm;
    
        ccnet_rpc_client_free (rpc_client);
    
        return EVHTP_RES_OK;
    
    err:
        /* Don't receive any data before the connection is closed. */
        evhtp_request_pause (req);
    
        /* Set keepalive to 0. This will cause evhtp to close the
        * connection after sending the reply.
        */
        req->keepalive = 0;
        if (err_msg)
            evbuffer_add_printf (req->buffer_out, "%s\n", err_msg);
            set_content_length_header (req);
            evhtp_send_reply (req, EVHTP_RES_BADREQ);
    
        if (rpc_client)
            ccnet_rpc_client_free (rpc_client);
    
        g_free (repo_id);
        g_free (user);
        g_free (boundary);
        g_free (progress_id);
        return EVHTP_RES_OK;
    }
    
    
<h4>一段代码看懂libevhtp</h4>

    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <stdint.h>
    #include <errno.h>
     
    #include <evhtp.h>
 
    void
    testcb(evhtp_request_t * req, void * a);
 
    void
    testcb(evhtp_request_t * req, void * a) {
        evbuffer_add_reference(req->buffer_out, "foobar", 6, NULL, NULL);
        evhtp_send_reply(req, EVHTP_RES_OK);
    }
 
    int main (int argc, const char * argv[])
    {
        evbase_t *evbase = event_base_new();
        evhtp_t *htp = evhtp_new(evbase, NULL);
    
        evhtp_set_cb(htp, "/", testcb, NULL); /* 设置回调函数 */
        evhtp_use_threads(htp, NULL, 4, NULL); /* 设置4个线程 */
 
        /* 监听本地所有IP的8080端口, backlog为1024 */
        evhtp_bind_socket(htp, "0.0.0.0", 8080, 1024);
     
        /* 进入循环、监听连接，http server开始工作 */
        event_base_loop(evbase, 0);
 
        return 0;
    }


<h4>libevhtp之evhtp_header_new</h4>

    libevhtp官方文档:http://ellzey.github.io/libevhtp/
    EVHTP_EXPORT evhtp_header_t* evhtp_header_new(const char * key,
                                                  const char * val,
                                                  char kalloc,
                                                  char valloc 
                                                 )
    
    creates a new evhtp_header_t key/val structure
    
    Parameters
        key	     a null terminated string
        val	     a null terminated string
        kalloc	 if 1, key will be copied, otherwise no copy performed
        valloc	 if 1, val will be copied, otehrwise no copy performed
    Returns
        evhtp_header_t * or NULL on error
    Referenced by _evhtp_create_reply(), _evhtp_default_request_cb(), evhtp_header_key_add(), evhtp_send_reply_chunk_start(), main(), and make_request().
    


Here is the caller graph for this function:

![xxx](/xxx/media/img/evhtp_header_new.png)    