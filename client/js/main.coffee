angular.module('myApp', []).directive('myBetterVideo',->
  return {
	   restrict:'AECM'
	   replace:true
	   template:'<a href="http://81222.com">Click me to go to 81222.com</a>'
   }
) 
 
	