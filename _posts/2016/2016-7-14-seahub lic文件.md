---
layout: post
---

<h4>seahub lic文件</h4>

    # encoding: utf-8
    import json
    import platform
    import uuid
    from hashlib import md5

    from django.core.urlresolvers import reverse
    from django.contrib import messages
    from django.http import HttpResponse, Http404, HttpResponseRedirect
    from django.shortcuts import render_to_response
    from django.template import RequestContext
    from django.utils.translation import ugettext as _

    from seaserv import ccnet_threaded_rpc, seafserv_threaded_rpc, get_emailusers, \
        CALC_SHARE_USAGE, seafile_api
    from pysearpc import SearpcError

    from seahub.base.accounts import User
    from seahub.base.models import UserLastLogin
    from seahub.base.decorators import sys_staff_required
    from seahub.auth.decorators import login_required, login_required_ajax
    from seahub.constants import GUEST_USER, DEFAULT_USER
    from seahub.utils import IS_EMAIL_CONFIGURED, string2list, is_valid_username
    from seahub.views import get_system_default_repo_id
    from seahub.forms import SetUserQuotaForm, AddUserForm, BatchAddUserForm
    from seahub.profile.models import Profile, DetailedProfile
    from seahub.share.models import FileShare

    import base64
    from M2Crypto import X509, RSA

    LICENSE_TXT = 'seahub/license/license.txt'
    I2_CRT = 'seahub/license/i2.crt'

    class i2_lic(object):
        code = ''

        count_ldapusers = 0
        count_dbusers = 0

        count_ldapquota = 0
        count_dbquota = 0

        user_count = 0
        quota_space = 0

        max_user_count = -1
        max_quota_space = -1
        license_type = 0
        product_type = 0
        serial_number = 0
        maintenance_period = 0
        register_name = 0
        hardware_code = ''

        emailusers_count = 0

        def __init__(self):
            self.code = ''

        def load_code(self):
            try:
                f = open(LICENSE_TXT)
                msg = f.read( )
                f.close( )

                self.parserLicense(msg)
            except:
                self.maintenance_period = 0
                self.license_type = 'unknown'
                self.register_name = 'unknown'
                self.serial_number = 'unknown'
                self.max_user_count = -1
                self.max_quota_space = -1
                self.product_type = 'unknown'

        def get_info(self):
            self.emailusers_count = ccnet_threaded_rpc.count_emailusers()

            count_ldapusers = 0
            count_ldapquota = 0
            try:
                users = get_emailusers('LDAP', -1, -1)
                last_logins = UserLastLogin.objects.filter(username__in=[x.email for x in users])
                for user in users:
                    for last_login in last_logins:
                        if last_login.username == user.email:
                            count_ldapusers = count_ldapusers + 1
                            count_ldapquota = count_ldapquota + seafile_api.get_user_quota(user.email)
                            '''messages.success(request, _(u'Successfully get current ldap user quota count = %s') % count_ldapquota)
                            HttpResponse(json.dumps({'success': True}), content_type=content_type)'''

                self.count_ldapusers = count_ldapusers
                self.count_ldapquota = count_ldapquota
            except:
                self.count_ldapusers = 0
                self.count_ldapquota = 0

            count_dbusers = 0
            try:
                count_dbusers = ccnet_threaded_rpc.count_db_emailusers()
                self.count_dbusers = count_dbusers
            except:
                self.count_dbusers = 0

            self.user_count = count_ldapusers + count_dbusers

            count_dbquota = 0
            try:
                users = get_emailusers('DB', -1, -1)
                for user in users:
                    org = ccnet_threaded_rpc.get_orgs_by_user(user.email)
                    if not org:
                        count_dbquota = count_dbquota + seafile_api.get_user_quota(user.email)
                    else:
                        user.org = org[0]
                        org_id = user.org.org_id
                        count_dbquota = count_dbquota + seafserv_threaded_rpc.get_org_user_quota(org_id, user.email)
                    '''messages.success(request, _(u'Successfully get current db quota count = %s') % count_dbquota)
                    HttpResponse(json.dumps({'success': True}), content_type=content_type)'''

                self.count_dbquota = count_dbquota
            except:
                self.count_dbquota = 0

            self.quota_space = self.count_ldapquota + self.count_dbquota

        def get_max_user_count(self):
            return self.max_user_count

        def get_max_quota_space(self):
            return self.max_quota_space

        def get_user_count(self):
            return self.user_count

        def get_quota_space(self):
            return self.quota_space

        def load_code_print(self, request):
            content_type = 'application/json; charset=utf-8'

            messages.success(request, _(u'Successfully get max user count is %s') % self.max_user_count)
            HttpResponse(json.dumps({'success': True}), content_type=content_type)

            messages.success(request, _(u'Successfully get max user quota is %s GB') % self.max_quota_space)
            HttpResponse(json.dumps({'success': True}), content_type=content_type)

        def get_info_print(self, request):
            content_type = 'application/json; charset=utf-8'

            messages.success(request, _(u'Successfully get user count = %s') % self.emailusers_count)
            HttpResponse(json.dumps({'success': True}), content_type=content_type)

            messages.success(request, _(u'Successfully get current ldap user count = %s') % self.count_ldapusers)
            HttpResponse(json.dumps({'success': True}), content_type=content_type)

            messages.success(request, _(u'Successfully get current db user count = %s') % self.count_dbusers)
            HttpResponse(json.dumps({'success': True}), content_type=content_type)

            messages.success(request, _(u'Successfully get all current user count = %s') % self.user_count)
            HttpResponse(json.dumps({'success': True}), content_type=content_type)

            messages.success(request, _(u'Successfully get all user count = %s') % self.emailusers_count)
            HttpResponse(json.dumps({'success': True}), content_type=content_type)

            messages.success(request, _(u'Successfully get current ldap user quota count = %s') % self.count_ldapquota)
            HttpResponse(json.dumps({'success': True}), content_type=content_type)

            messages.success(request, _(u'Successfully get current db user quota count = %s') % self.count_dbquota)
            HttpResponse(json.dumps({'success': True}), content_type=content_type)

            messages.success(request, _(u'Successfully get all current user quota count = %s') % self.quota_space)
            return HttpResponse(json.dumps({'success': True}), content_type=content_type)

        def isWindowsSystem():
            return 'Windows' in platform.system()

        def isLinuxSystem():
            return 'Linux' in platform.system()

        def getOsType():
            if isWindowsSystem():
                return 1
            else:
                return 2

        def getHardwareCode(self):
            m = md5()
            mac=uuid.UUID(int = uuid.getnode()).hex[-12:]
            macStr = ":".join([mac[e:e+2] for e in range(0,11,2)]).upper()
            m.update(macStr)
            return m.hexdigest().upper()

        def parserLicense(self,encCode):
            data = base64.b64decode(encCode)
            cert = X509.load_cert(I2_CRT)
            puk = cert.get_pubkey().get_rsa()
            self.code = puk.public_decrypt(data, RSA.pkcs1_padding)

            i2codes = self.code
            i2code_list = i2codes.split(',')

            self.maintenance_period = i2code_list[3]
            self.hardware_code = i2code_list[4]
            self.license_type = i2code_list[5]
            self.register_name = i2code_list[7]
            self.serial_number = i2code_list[8]
            self.max_user_count = i2code_list[10]
            self.max_quota_space = i2code_list[12]
            self.product_type = i2code_list[17]	    