// doesn't work like this, as recommended by shinyjs
// errors when running it like this:
//   Uncaught ReferenceError: shinyjs is not defined
//   Uncaught TypeError: shinyjs.pageCol is not a function
shinyjs.pageCol = function(params){$('body').css('background', params);}

// works like this, but JS console has warning:
//  Loading failed for the <script> with source “http://127.0.0.1:4089/jscode.js”

/*
$( document ).ready(function() {
 shinyjs.pageCol = function(params){$('body').css('background', params);}
});*/
 