angular.module("myApp", [])
.controller('MyController'
  ($scope,$parse) ->
	  $scope.$watch('expr', (newVal, oldVal, scope)->
	   console.log newValue
	   console.log oldVal
	   if newVal isnt oldVal 
	    parseFun = $parse newVal
	    $scope.parsedValue = parseFun scope
	  )
)
###myApp = angular.module('myApp',[])
myApp.controller(
	'ParentController'
	($scope) ->
		$scope.person = greeted: false 
	)
myApp.controller(
	'ChildController'
	($scope) ->
		$scope.sayHello = -> $scope.person.name = '163.com'
	)
###
 
	