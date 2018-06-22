---
layout: post
---

<h4>seahub license的问题</h4>

    @login_required_ajax
    @sys_staff_required
    def user_set_quota(request, email):
        if request.method != 'POST':
            raise Http404

        content_type = 'application/json; charset=utf-8'
        result = {}

        f = SetUserQuotaForm(request.POST)
        if f.is_valid():
            email = f.cleaned_data['email']
            quota_mb = f.cleaned_data['quota']
            quota = quota_mb * (1 << 20)

            i2 = i2_lic()
            i2.load_code()
            i2.get_info()
            max_quota = i2.get_max_quota_space()
            if max_quota == -1:
                result['error'] = _(u'Failed to set quota: get license quota fail')
                return HttpResponse(json.dumps(result), status=400, content_type=content_type)

            if i2.get_quota_space() + quota > int(max_quota)*1024*1024*1024:
                #设置容量失败，超出容量限制(200 GB)。
                result['error'] = _(u'Failed to set quota: exceed license allowed(%s GB)') % max_quota
                return HttpResponse(json.dumps(result), status=400, content_type=content_type)

            org = ccnet_threaded_rpc.get_orgs_by_user(email)
            try:
                if not org:
                    seafile_api.set_user_quota(email, quota)
                else:
                    org_id = org[0].org_id
                    seafserv_threaded_rpc.set_org_user_quota(org_id, email, quota)
            except:
                result['error'] = _(u'Failed to set quota: internal server error')
                return HttpResponse(json.dumps(result), status=500, content_type=content_type)

            result['success'] = True
            return HttpResponse(json.dumps(result), content_type=content_type)
        else:
            result['error'] = str(f.errors.values()[0])
            return HttpResponse(json.dumps(result), status=400, content_type=content_type)
