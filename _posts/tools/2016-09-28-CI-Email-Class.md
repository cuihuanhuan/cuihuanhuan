---
title: Email Class
categories: Codeigniter
tags: Codeigniter
---



下载CI,Welcome  controller里面写上文档里面的demo code

```php
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller
{
    public function index()
    {
        $this->load->library('email');

        $this->email->from('cuihh@info2soft.com', 'cuihuanhuan');
        $this->email->to('1696539307@qq.com');
        $this->email->subject('Email Test');
        $this->email->message('Testing the email class.');
        $this->email->send();
    }
}

```



```
A PHP Error was encountered

Severity: Warning

Message: date(): It is not safe to rely on the system's timezone settings. You are *required* to use the date.timezone setting or the date_default_timezone_set() function. In case you used any of those methods and you are still getting this warning, you most likely misspelled the timezone identifier. We selected the timezone 'UTC' for now, but please set date.timezone to select your timezone.

Filename: libraries/Email.php

Line Number: 979

Backtrace:

File: C:\Program Files (x86)\info2soft-ctrlcenter\Apache Software Foundation\Apache2.2\htdocs\codeIgniter-3.1.5\application\controllers\Welcome.php
Line: 24
Function: library

File: C:\Program Files (x86)\info2soft-ctrlcenter\Apache Software Foundation\Apache2.2\htdocs\codeIgniter-3.1.5\index.php
Line: 316
Function: require_once

A PHP Error was encountered

Severity: Warning

Message: date(): It is not safe to rely on the system's timezone settings. You are *required* to use the date.timezone setting or the date_default_timezone_set() function. In case you used any of those methods and you are still getting this warning, you most likely misspelled the timezone identifier. We selected the timezone 'UTC' for now, but please set date.timezone to select your timezone.

Filename: libraries/Email.php

Line Number: 984

Backtrace:

File: C:\Program Files (x86)\info2soft-ctrlcenter\Apache Software Foundation\Apache2.2\htdocs\codeIgniter-3.1.5\application\controllers\Welcome.php
Line: 24
Function: library

File: C:\Program Files (x86)\info2soft-ctrlcenter\Apache Software Foundation\Apache2.2\htdocs\codeIgniter-3.1.5\index.php
Line: 316
Function: require_once

A PHP Error was encountered

Severity: Warning

Message: mail(): Failed to connect to mailserver at "localhost" port 25, verify your "SMTP" and "smtp_port" setting in php.ini or use ini_set()

Filename: libraries/Email.php

Line Number: 1888

Backtrace:

File: C:\Program Files (x86)\info2soft-ctrlcenter\Apache Software Foundation\Apache2.2\htdocs\codeIgniter-3.1.5\application\controllers\Welcome.php
Line: 30
Function: send

File: C:\Program Files (x86)\info2soft-ctrlcenter\Apache Software Foundation\Apache2.2\htdocs\codeIgniter-3.1.5\index.php
Line: 316
Function: require_once
```

前几个关于时区的报错

在入口文件index.php中设置时区

```
date_default_timezone_set('PRC');
```

接下来刷新页面报下面的错

```
A PHP Error was encountered

Severity: Warning

Message: mail(): Failed to connect to mailserver at "localhost" port 25, verify your "SMTP" and "smtp_port" setting in php.ini or use ini_set()

Filename: libraries/Email.php

Line Number: 1888

Backtrace:

File: C:\Program Files (x86)\info2soft-ctrlcenter\Apache Software Foundation\Apache2.2\htdocs\codeIgniter-3.1.5\application\controllers\Welcome.php
Line: 30
Function: send

File: C:\Program Files (x86)\info2soft-ctrlcenter\Apache Software Foundation\Apache2.2\htdocs\codeIgniter-3.1.5\index.php
Line: 316
Function: require_once
```

打开php.ini,查找smtp,修改为smtp.qq.com,重启服务,刷新页面,报错如下

```
A PHP Error was encountered

Severity: Warning

Message: mail(): SMTP server response: 503 Error: need EHLO and AUTH first !

Filename: libraries/Email.php

Line Number: 1888

Backtrace:

File: C:\Program Files (x86)\info2soft-ctrlcenter\Apache Software Foundation\Apache2.2\htdocs\codeIgniter-3.1.5\application\controllers\Welcome.php
Line: 30
Function: send

File: C:\Program Files (x86)\info2soft-ctrlcenter\Apache Software Foundation\Apache2.2\htdocs\codeIgniter-3.1.5\index.php
Line: 316
Function: require_once
```

