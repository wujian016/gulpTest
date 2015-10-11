angular.module('myApp', ['ngMessages'])
.controller('signupController',['$http','$scope','$rootScope',($http,$scope,$rootScope)->
	$rootScope.testFiled = "wujian"
	$scope.submitted = false
	$scope.signupForm = ->
		if $scope.signup_form.$valid is true
			 $scope.signup_form.submitted = true
])
.directive('ensureUnique', ['$http', ($http)->
	require: 'ngModel'
	link: (scope, ele, attrs, c)->
		scope.$watch(attrs.ngModel, ()->
			$http({
				method: 'POST'
				url: '/api/check/' + attrs.ensureUnique
				data: {'field': attrs.ensureUnique}
				}).success((data, status, headers, cfg)->
					c.$setValidity('unique', data.isUnique)
				).error((data, status, headers, cfg)->
						c.$setValidity('unique', false)
				)
			)
])