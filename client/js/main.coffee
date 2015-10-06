angular.module('myApp', []) 
.controller('MyController', ($scope)->
  $scope.show = ->
  	console.log $scope.Myform.email.$$rawModelValue
).filter('capitalize',->
   return (input)->
     input[0].toUpperCase() + input.slice(1) if input?
)
 
	