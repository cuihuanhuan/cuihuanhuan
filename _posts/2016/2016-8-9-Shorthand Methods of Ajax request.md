---
layout: post
title: "Shorthand Methods of Ajax request"
date: 2016-8-9
---
jQuery.get()函数
Load data from the server using a HTTP GET request.

jQuery.getJSON()函数
Load JSON-encoded data from the server using a GET HTTP request.

jQuery.post()函数
Load data from the server using a HTTP POST request.

jQuery.load()函数
Load data from the server and place the returned HTML into the matched element.

$.getScript()函数

jQuery.getScript( url [, success ] )

Description: Load a JavaScript file from the server using a GET HTTP request, then execute it.

url

Type: String

A string containing the URL to which the request is sent.

success

Type: Function( String script, String textStatus, jqXHR jqXHR )

A callback function that is executed if the request succeeds.


This is a shorthand Ajax function, which is equivalent to:

    $.ajax({
      url: url,
      dataType: "script",
      success: success
    });

The script is executed in the global context, so it can refer to other variables and use jQuery functions. Included scripts can have some impact on the current page.

$.ajax()函数

Description: Perform an asynchronous HTTP (Ajax) request.