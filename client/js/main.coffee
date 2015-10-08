angular.module('myApp', []) 
.controller('MyController', ($scope)->
		$scope.show = ->
				console.log $scope.Myform.email.$$rawModelValue
).filter('capitalize',->
		return (input)->
				input[0].toUpperCase() + input.slice(1) if input?
).directive('oneToTen',($filter)->
	require:'?ngModel'
	link:(scope, ele, attrs, ngModel)->
		if ngModel?
			ngModel.$parsers.unshift	(viewValue)-> 
				i = parseInt viewValue
				if 0 <= i < 10
					ngModel.$setValidity 'oneToTen', true
					return viewValue
				else
					ngModel.$setValidity 'oneToTen', false
					return undefined
			ngModel.$formatters.unshift (v=0)->
					return $filter('number')(v)
)
 
		