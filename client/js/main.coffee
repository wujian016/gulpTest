angular.module('myApp', []) 
.filter('capitalize',->
   return (input)->
     input[0].toUpperCase() + input.slice(1) if input?
)
 
	