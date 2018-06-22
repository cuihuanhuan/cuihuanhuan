---
layout: post
---

<h4>seafile文件上传-token相关</h4>

    [1]
    token = seafile_api.get_fileserver_access_token(repo_id, 'dummy', 'upload', request.user.username)
    [2]
    class SeafileAPI(object):

        def __init__(self):
            pass

        # fileserver token
        def get_fileserver_access_token(self, repo_id, obj_id, op, username):
            """Generate token for access file/dir in fileserver

            op: the operation, 'view', 'download', 'download-dir'

            Return: the access token in string
            """
            return seafserv_rpc.web_get_access_token(repo_id, obj_id, op, username)

    [3]
     
    @searpc_func("string", ["string", "string", "string", "string"])
    def seafile_web_get_access_token(repo_id, obj_id, op, username):
        pass
    web_get_access_token = seafile_web_get_access_token
    
    
    [4]
    
    char *
    seafile_web_get_access_token (const char *repo_id,
                                  const char *obj_id,
                                  const char *op,
                                  const char *username,
                                  GError **error)
    {
        char *token;

        if (!repo_id || !obj_id || !op || !username) {
            g_set_error (error, SEAFILE_DOMAIN, SEAF_ERR_BAD_ARGS, "Missing args");
            return NULL;
        }

        token = seaf_web_at_manager_get_access_token (seaf->web_at_mgr,
                                                      repo_id, obj_id, op, username);
        return token;
    }
    
    [5]
    char *
    seaf_web_at_manager_get_access_token (SeafWebAccessTokenManager *mgr,
                                          const char *repo_id,
                                          const char *obj_id,
                                          const char *op,
                                          const char *username)
    {
        GString *key = g_string_new (NULL);
        AccessToken *token;
        AccessInfo *info;
        long now = (long)time(NULL);
        long expire;
        char *t;

        g_string_printf (key, "%s %s %s %s", repo_id, obj_id, op, username);

        token = g_hash_table_lookup (mgr->access_info_hash, key->str);
        /* To avoid returning an almost expired token, we returns token
         * that has at least 1 minute "life time".
         */
        if (!token || token->expire_time - now <= 60) {
            t = gen_new_token (mgr->access_token_hash);
            expire = now + TOKEN_EXPIRE_TIME;

            token = g_new0 (AccessToken, 1);
            memcpy (token->token, t, TOKEN_LEN);
            token->expire_time = expire;

            g_hash_table_insert (mgr->access_info_hash, g_strdup(key->str), token);

            info = g_new0 (AccessInfo, 1);
            info->repo_id = g_strdup (repo_id);
            info->obj_id = g_strdup (obj_id);
            info->op = g_strdup (op);
            info->username = g_strdup (username);
            info->expire_time = expire;

            g_hash_table_insert (mgr->access_token_hash, g_strdup(t), info);

            g_free (t);
        }

        g_string_free (key, TRUE);
        return g_strdup(token->token);
    }