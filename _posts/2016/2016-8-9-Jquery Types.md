---
layout: post
title: "Jquery Types"
date: 2016-8-9
---
JavaScript provides several built-in datatypes. In addition to those, this page documents virtual types like Selectors, enhanced pseudo-types like Events and some concepts you need to know about Functions. If you want to study these concepts in depth, take a look at MDN.

You should be able to try out most of the examples below by just copying them to your browser's JavaScript Console (Chrome, Safari with Develop menu activated, IE 8+) or Firebug console (Firefox).

Whenever an example mentions that a type defaults to a boolean value, the result is good to know when using that type in a boolean context:

    var x = "";
    if ( x ) {
      console.log( "x defaulted to true" );
    } else {
      console.log( "x defaulted to false" );
    }
In this case, "x defaulted to false" is printed.

To keep the examples short, the invert ("not") operator and double-negation are used to show a boolean context:

    var x = "";
    !x // true
    !!x // false (Double negation: Since "not (empty string)" is true, negating that makes it false)
On to the actual types.


Anything
The Anything virtual type is used in jQuery documentation to indicate that any type can be used or should be expected.

String
A string in JavaScript is an immutable object that contains none, one or many characters.

    "I'm a String in JavaScript!"
    'So am I!'
The type of a string is "string".


    typeof "some string"; // "string"
Quoting

A string can be defined using single or double quotes. You can nest single quotes inside of double quotes, and the other way around. To mix double quotes with double quotes (or single with single), the nested ones have to be escaped with a backslash.

    "You make 'me' sad."
    'That\'s "cranking" good fun!'
    "<a href=\"home\">Home</a>"
    Built-in Methods

A string in JavaScript has some built-in methods to manipulate the string, though the result is always a new string - or something else, eg. split returns an array.

    "hello".charAt( 0 ) // "h"
    "hello".toUpperCase() // "HELLO"
    "Hello".toLowerCase() // "hello"
    "hello".replace( /e|o/g, "x" ) // "hxllx"
    "1,2,3".split( "," ) // [ "1", "2", "3" ]
Length Property

All strings have a length property.

    "Hello".length // 5
    "".length // 0
Boolean Default

An empty string defaults to false:

    !"" // true
    !!"" // false
    !"hello" // false
    !"true" // false
    !new Boolean( false ) // false
htmlString
A string is designated htmlString in jQuery documentation when it is used to represent one or more DOM elements, typically to be created and inserted in the document. When passed as an argument of the jQuery() function, the string is identified as HTML if it starts with <tag ... >) and is parsed as such until the final > character. Prior to jQuery 1.9, a string was considered to be HTML if it contained <tag ... > anywhere within the string.

When a string as passed as an argument to a manipulation method such as .append(), it is always considered to be HTML since jQuery's other common interpretation of a string (CSS selectors) does not apply in those contexts.

For explicit parsing of a string to HTML, the $.parseHTML() method is available as of jQuery 1.8.

    // Appends <b>hello</b>:
    $( "<b>hello</b>" ).appendTo( "body" );
     
    // Appends <b>hello</b>:
    $( "<b>hello</b>bye" ).appendTo( "body" );
     
    // Syntax error, unrecognized expression: bye<b>hello</b>
    $( "bye<b>hello</b>" ).appendTo( "body" );
     
    // Appends bye<b>hello</b>:
    $( $.parseHTML( "bye<b>hello</b>" ) ).appendTo( "body" );
     
    // Appends <b>hello</b>wait<b>bye</b>:
    $( "<b>hello</b>wait<b>bye</b>" ).appendTo( "body" );
Number
Numbers in JavaScript are double-precision 64-bit format IEEE 754 values. They are immutable, just as strings. All operators common in c-based languages are available to work with numbers (+, -, *, /, %, =, +=, -=, *=, /=, ++, --).

The type of a number is "number".

    typeof 12 // "number"
    typeof 3.543 // "number"
Boolean Default

If a number is zero, it defaults to false:

    !0 // true
    !!0 // false
    !1 // false
    !-1 // false
Due to the implementation of numbers as double-precision values, the following result is not an error:

    0.1 + 0.2 // 0.30000000000000004

Math

JavaScript provides utilities to work with numbers in the Math object:

    Math.PI // 3.141592653589793
    Math.cos( Math.PI ) // -1
Parsing Numbers

parseInt and parseFloat help parsing strings into numbers. Both do some implicit conversion if the base isn't specified:

    parseInt( "123" ) = 123 // (implicit decimal)
    parseInt( "010" ) = 8 // (implicit octal)
    parseInt( "0xCAFE" ) = 51966 // (implicit hexadecimal)
    parseInt( "010", 10 ) = 10 // (explicit decimal)
    parseInt( "11", 2 ) = 3 // (explicit binary)
    parseFloat( "10.10" ) = 10.1
Numbers to Strings

When appending numbers to string, the result is always a string. The operator is the same, so be careful: If you want to add numbers and then append them to a string, put parentheses around the numbers:

    "" + 1 + 2; // "12"
    "" + ( 1 + 2 ); // "3"
    "" + 0.0000001; // "1e-7"
    parseInt( 0.0000001 ); // 1 (!)
Or you use the String class provided by javascript, which try to parse a value as string:

    String( 1 ) + String( 2 ); // "12"
    String( 1 + 2 ); // "3"
    NaN and Infinity

Parsing something that isn't a number results in NaN. isNaN helps to detect those cases:


    parseInt( "hello", 10 ) // NaN
    isNaN( parseInt("hello", 10) ) // true
Division by zero results in Infinity:

    1 / 0 // Infinity
Both NaN and Infinity are of type "number":


    typeof NaN // "number"
    typeof Infinity // "number"
Note that NaN compares in a strange way:


    NaN === NaN // false (!)
But:


    Infinity === Infinity // true
Integer

An integer is a plain Number type, but whenever explicitly mentioned, indicates that a non-floating-point number is expected.

Float

A float is a plain Number type, just as Integer, but whenever explicitly mentioned, indicates that a floating-point number is expected.


Boolean
A boolean in JavaScript can be either true or false:

    if ( true ) console.log( "always!" );
    if ( false ) console.log( "never!" );
Object
Everything in JavaScript is an object, though some are more objective (haha). The easiest way to create an object is the object literal:

    var x = {};
    var y = {
      name: "Pete",
      age: 15
    };
The type of an object is "object":

    typeof {} // "object"
Dot Notation

You can write and read properties of an object using the dot notation:

    y.name // "Pete"
    y.age // 15
    x.name = y.name + " Pan" // "Pete Pan"
    x.age = y.age + 1 // 16
    Array Notation

Or you write and read properties using the array notation, which allows you to dynamically choose the property:

    var operations = {
      increase: "++",
      decrease: "--"
    };
    var operation = "increase";
    operations[ operation ] // "++"
    operations[ "multiply" ] = "*"; // "*"
Iteration

Iterating over objects is easy with the for-in-loop:

    var obj = {
      name: "Pete",
      age: 15
    };
    for( key in obj ) {
      alert( "key is " + [ key ] + ", value is " + obj[ key ] );
    }
Note that for-in-loop can be spoiled by extending Object.prototype (see Object.prototype is verboten) so take care when using other libraries.

jQuery provides a generic each function to iterate over properties of objects, as well as elements of arrays:

    jQuery.each( obj, function( key, value ) {
      console.log( "key", key, "value", value );
    });
The drawback is that the callback is called in the context of each value and you therefore lose the context of your own object if applicable. More on this below at Functions.

Boolean default

An object, no matter if it has properties or not, never defaults to false:

    !{} // false
    !!{} // true
Prototype

All objects have a prototype property. Whenever the interpreter looks for a property, it also checks in the object's prototype if the property is not found on the object itself. jQuery uses the prototype extensively to add methods to jQuery instances. Internally, jQuery makes jQuery.fn an alias of jQuery.prototype so you can use either one (though plugin developers have standardized on fn).

    var form = $("#myform");
    console.log( form.clearForm ); // undefined
     
    // jQuery.fn === jQuery.prototype
    jQuery.fn.clearForm = function() {
      return this.find( ":input" ).each(function() {
        this.value = "";
      }).end();
    };
     
    // works for all instances of jQuery objects, because
    // the new method was added to the prototype
    console.log( form.clearForm ); // function
    form.clearForm();
Array
Arrays in JavaScript are mutable lists with a few built-in methods. You can define arrays using the array literal:

    var x = [];
    var y = [ 1, 2, 3 ];
The type of an array is "object":

    typeof []; // "object"
    typeof [ 1, 2, 3 ]; // "object"
Reading and writing elements to an array uses the array-notation:

    x[ 0 ] = 1;
    y[ 2 ] // 3
Iteration

An array has a length property that is useful for iteration:

    for ( var i = 0; i < a.length; i++ ) {
      // Do something with a[i]
    }
When performance is critical, reading the length property only once can help to speed things up. This should be used only when a performance bottleneck was discovered:

    for ( var i = 0, j = a.length; i < j; i++ ) {
      // Do something with a[i]
    }
Another variation defines a variable that is filled for each iteration, removing the array-notation from the loop-body. It does not work when the array contains 0 or empty strings!

    for ( var i = 0, item; item = a[i]; i++ ) {
      // Do something with item
    }
jQuery provides a generic each function to iterate over element of arrays, as well as properties of objects:

    var x = [ 1, 2, 3 ];
    jQuery.each( x, function( index, value ) {
      console.log( "index", index, "value", value );
    });
    
The drawback is that the callback is called in the context of each value and you therefore lose the context of your own object if applicable. More on this below at Functions.

The length property can also be used to add elements to the end of an array. That is equivalent to using the push-method:

    var x = [];
    x.push( 1 );
    x[ x.length ] = 2;
    x // [ 1, 2 ]
You'll see both variations a lot when looking through JavaScript library code.

Other built-in methods are reverse, join, shift, unshift, pop, slice, splice and sort:

    var x = [ 0, 3, 1, 2 ];
    x.reverse()      // [ 2, 1, 3, 0 ]
    x.join(" – ")    // "2 - 1 - 3 - 0"
    x.pop()          // [ 2, 1, 3 ]
    x.unshift( -1 )  // [ -1, 2, 1, 3 ]
    x.shift()        // [ 2, 1, 3 ]
    x.sort()         // [ 1, 2, 3 ]
    x.splice( 1, 2 ) // [ 2, 3 ]
    
Note: .unshift() method does not return a length property in Internet Explorer.

Boolean Default

An array, no matter if it has elements or not, never defaults to false:

    ![] // false
    !![] // true
Array<Type> Notation

In the jQuery API you'll often find the notation of Array<Type>:

dragPrevention    Array<String>
This indicates that the method doesn't only expect an array as the argument, but also specifies the expected type. The notation is borrowed from Java 5's generics notation (or C++ templates).

Array-Like Object
Either a true JavaScript Array or a JavaScript Object that contains a nonnegative integer length property and index properties from 0 up to length - 1. This latter case includes array-like objects commonly encountered in web-based code such as the arguments object and the NodeList object returned by many DOM methods.

When a jQuery API accepts either plain Objects or Array-Like objects, a plain Object with a numeric length property will trigger the Array-Like behavior.

PlainObject
The PlainObject type is a JavaScript object containing zero or more key-value pairs. The plain object is, in other words, an Object object. It is designated "plain" in jQuery documentation to distinguish it from other kinds of JavaScript objects: for example, null, user-defined arrays, and host objects such as document, all of which have a typeof value of "object." The jQuery.isPlainObject() method identifies whether the passed argument is a plain object or not, as demonstrated below:

      var a = [];
      var d = document;
      var o = {};
     
      typeof a; // object
      typeof d; // object
      typeof o; // object
     
      jQuery.isPlainObject( a ); // false
      jQuery.isPlainObject( d ); // false
      jQuery.isPlainObject( o ); // true
Null
The null keyword is a JavaScript literal that is commonly used to express the absence of an intentional value.

Date
The Date type is a JavaScript object that represents a single moment in time. Date objects are instantiated using their constructor function, which by default creates an object that represents the current date and time.


    new Date();
To create a Date object for an alternative date and time, pass numeric arguments in the following order: year, month, day, hour, minute, second, millisecond — although note that the month is zero-based, whereas the other arguments are one-based. The following creates a Date object representing January 1st, 2014, at 8:15.

    new Date( 2014, 0, 1, 8, 15 );
Function
A function in JavaScript can be either named or anonymous. Any function can be assigned to a variable or passed to a method, but passing member functions this way can cause them to be called in the context of another object (i.e. with a different "this" object).


    function named() {}
    var handler = function() {}
You see a lot of anonymous functions in jQuery code:

    $( document ).ready(function() {});
    $( "a" ).click(function() {});
    $.ajax({
      url: "someurl.php",
      success: function() {}
    });
    The type of a function is "function".

Arguments

Inside a function a special variable "arguments" is always available. It's similar to an array in that it has a length property, but it lacks the built-in methods of an array. The elements of the pseudo-array are the argument of the function call.

    function log( x ) {
      console.log( typeof x, arguments.length );
    }
    log(); // "undefined", 0
    log( 1 ); // "number", 1
    log( "1", "2", "3" ); // "string", 3
    
The arguments object also has a callee property, which refers to the function you're inside of. For instance:


    var awesome = function() { return arguments.callee; }
    awesome() === awesome // true
    
Context, Call and Apply

In JavaScript, the variable "this" always refers to the current context. By default, "this" refers to the window object. Within a function this context can change, depending on how the function is called.

All event handlers in jQuery are called with the handling element as the context.

    $( document ).ready(function() {
      // this refers to window.document
    });
    $( "a" ).click(function() {
      // this refers to an anchor DOM element
    });
    
You can specify the context for a function call using the function-built-in methods call and apply. The difference between them is how they pass arguments. Call passes all arguments through as arguments to the function, while apply accepts an array as the arguments.


    function scope() {
      console.log( this, arguments.length );
    }
    scope() // window, 0
    scope.call( "foobar", [ 1, 2 ] ); // "foobar", 1
    scope.apply( "foobar", [ 1, 2 ] ); // "foobar", 2
    
Scope

In JavaScript, all variables defined inside a function are only visible inside that function scope. Consider the following example:

    // global
    var x = 0;
    (function() {
      // private
      var x = 1;
      console.log( x ); // 1
    })();
    console.log( x ); // 0
    
It defines a variable x in the global scope, then defines an anonymous function and executes it immediately (the additional parentheses are required for immediate execution). Inside the function another variable x is defined with a different value. It is only visible within that function and doesn't overwrite the global variable.

Closures

Closures are created whenever a variable that is defined outside the current scope is accessed from within some inner scope. In the following example, the variable counter is visible within the create, increment, and print functions, but not outside of them.

    function create() {
      var counter = 0;
      return {
        increment: function() {
          counter++;
        },
        print: function() {
          console.log( counter );
        }
      }
    }
    var c = create();
    c.increment();
    c.print(); // 1
    
The pattern allows you to create objects with methods that operate on data that isn't visible to the outside—the very basis of object-oriented programming.

Proxy Pattern

Combining the above knowledge gives you as a JavaScript developer quite a lot of power. One way to combine that is to implement a proxy pattern in JavaScript, enabling the basics of aspect-oriented programming (AOP):

    (function() {
      // log all calls to setArray
      var proxied = jQuery.fn.setArray;
      jQuery.fn.setArray = function() {
        console.log( this, arguments );
        return proxied.apply( this, arguments );
      };
    })();
    
The above wraps its code in a function to hide the "proxied"-variable. It saves jQuery's setArray-method in a closure and overwrites it. The proxy then logs all calls to the method and delegates the call to the original. Using apply(this, arguments) guarantees that the caller won't be able to notice the difference between the original and the proxied method.

Callback
A callback is a plain JavaScript function passed to some method as an argument or option. Some callbacks are just events, called to give the user a chance to react when a certain state is triggered. jQuery's event system uses such callbacks everywhere:

    $( "body" ).click(function( event ) {
      console.log( "clicked: " + event.target );
    });
    
Most callbacks provide arguments and a context. In the event-handler example, the callback is called with one argument, an Event. The context is set to the handling element, in the above example, document.body.

Some callbacks are required to return something, others make that return value optional. To prevent a form submission, a submit event handler can return false:

    $( "#myform" ).submit(function() {
      return false;
    });
    
Instead of always returning false, the callback could check fields of the form for validity, and return false only when the form is invalid.


Selector
A selector is used in jQuery to select DOM elements from a DOM document. That document is, in most cases, the DOM document present in all browsers, but can also be an XML document received via Ajax.

The selectors are a composition of CSS and custom additions. All selectors available in jQuery are documented on the Selectors API page.

There are lot of plugins that leverage jQuery's selectors in other ways. The validation plugin accepts a selector to specify a dependency, whether an input is required or not:

    emailrules: {
      required: "#email:filled"
    }
    
This would make a checkbox with name "emailrules" required only if the user entered an email address in the email field, selected via its id, filtered via a custom selector ":filled" that the validation plugin provides.

If Selector is specified as the type of an argument, it accepts everything that the jQuery constructor accepts, eg. Strings, Elements, Lists of Elements.

Event
jQuery's event system normalizes the event object according to W3C standards. The event object is guaranteed to be passed to the event handler (no checks for window.event required). It normalizes the target, relatedTarget, which, metaKey and pageX/Y properties and provides both stopPropagation() and preventDefault() methods.

Those properties are all documented, and accompanied by examples, on the Event object page.

The standard events in the Document Object Model are: blur, focus, load, resize, scroll, unload, beforeunload, click, dblclick, mousedown, mouseup, mousemove, mouseover, mouseout, mouseenter, mouseleave, change, select, submit, keydown, keypress, and keyup. Since the DOM event names have predefined meanings for some elements, using them for other purposes is not recommended. jQuery's event model can trigger an event by any name on an element, and it is propagated up the DOM tree to which that element belongs, if any.

Element
An element in the Document Object Model (DOM) can have attributes, text, and children. It provides methods to traverse the parent and children and to get access to its attributes. Due to inconsistencies in DOM API specifications and implementations, however, those methods can be a challenge to use. jQuery provides a "wrapper" around those elements to help interacting with the DOM. But sometimes you will be working directly with DOM elements, or see methods that (also) accept DOM elements as arguments.

Whenever you call jQuery's .each() method or one of its event methods on a jQuery collection, the context of the callback function — this — is set to a DOM element.

Some properties of DOM elements are quite consistent among browsers. Consider this example of a simple onblur validation:

    $( "input[type='text']" ).on( "blur", function() {
      if( !this.value ) {
        alert( "Please enter some text!" );
      }
    });
    
You could replace this.value with $(this).val() to access the value of the text input via jQuery, but in that case you wouldn't gain anything.

Text
Text is a node of the Document Object Model (DOM) that represents the textual content of an element or an attribute. Consider the following code:


    <p id="target"><b>Hello</b> world</p>
If you retrieve the children of the paragraph of the example as follows:


    var children = document.getElementById( "target" ).childNodes;
you obtain two children. The first one is the element representing the b tag. The second child is a text node containing the string " world".

jQuery
A jQuery object contains a collection of Document Object Model (DOM) elements that have been created from an HTML string or selected from a document. Since jQuery methods often use CSS selectors to match elements from a document, the set of elements in a jQuery object is often called a set of "matched elements" or "selected elements".

The jQuery object itself behaves much like an array; it has a length property and the elements in the object can be accessed by their numeric indices [0] to [length-1]. Note that a jQuery object is not actually a Javascript Array object, so it does not have all the methods of a true Array object such as join().

Most frequently, you will use the jQuery() function to create a jQuery object. jQuery() can also be accessed by its familiar single-character alias of $(), unless you have called jQuery.noConflict() to disable this option. Many jQuery methods return the jQuery object itself, so that method calls can be chained:

In API calls that return jQuery, the value returned will be the original jQuery object unless otherwise documented by that API. API methods such as .filter() or .not() modify their incoming set and thus return a new jQuery object.


    $( "p" ).css( "color", "red" ).find( ".special" ).css( "color", "green" );
    
Whenever you use a "destructive" jQuery method that potentially changes the set of elements in the jQuery object, such as .filter() or .find(), that method actually returns a new jQuery object with the resulting elements. To return to the previous jQuery object, you use the .end() method.

A jQuery object may be empty, containing no DOM elements. You can create an empty jQuery object with $() (that is, passing no arguments at all). A jQuery object may also be empty if a selector doesn't select any elements, or if a chained method filters out all the elements. It is not an error; any further methods called on that jQuery object simply have no effect since they have no elements to act upon. So, in this example if there are no bad entries on the page then no elements will be colored red:

    $( ".badEntry" ).css({ color: "red" });