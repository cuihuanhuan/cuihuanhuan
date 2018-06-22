---
layout: post
---

<h4>seafile文件上传的api</h4>

    class UploadLinkView(APIView):
        authentication_classes = (TokenAuthentication, )
        permission_classes = (IsAuthenticated, )
        throttle_classes = (UserRateThrottle, )

        def get(self, request, repo_id, format=None):
            parent_dir = request.GET.get('p', '/')
            if check_folder_permission(request, repo_id, parent_dir) != 'rw':
                return api_error(status.HTTP_403_FORBIDDEN,
                        'You do not have permission to access this folder.')

            if check_quota(repo_id) < 0:
                return api_error(HTTP_520_OPERATION_FAILED, 'Above quota')

            token = seafile_api.get_fileserver_access_token(
                repo_id, 'dummy', 'upload', request.user.username, use_onetime = False)
            url = gen_file_upload_url(token, 'upload-api')
            return Response(url)
            
            
    def gen_file_upload_url(token, op):
        return '%s/%s/%s' % (get_fileserver_root(), op, token)
        
        
    cb = evhtp_set_regex_cb (htp, "^/upload-api/.*", upload_api_cb, NULL);
    evhtp_set_hook(&cb->hooks, evhtp_hook_on_headers, upload_headers_cb, NULL);

