---
layout: post
---

<h4>JavaScript中定义变量的时候不能定义为这种带有-线的</h4>

    $('#set-expiration-switch').click(function () {
        var form = $('#link-options'),
            expiration_input = $('input[name="expire_days"]', form);
        var link_expiration = $('#link-expiration');

        if ($(this).attr('checked')) {
            expiration_input.attr('disabled', false).removeClass('input-disabled');
            link_expiration.slideDown(100);
        } else {
            link_expiration.slideUp(100);
            expiration_input.attr('disabled', true).addClass('input-disabled');
        }
    });
    
    若js变量名中含-，则报错detailed error: SyntaxError: missing ; before statement
    应该为下划线