angular.module('myApp', [])
.controller('MainCtrl',()->
	this.name = 'myControle test' 
).controller('OtherCtrl',($scope)->
	$scope.name = 'Other test' 
).controller('EmailController', ($scope)->
	$scope.sendEmail (email)->
		alert(email)
).directive('sidebox', ()->
	return {
		restrict: 'EA',
		scope: {
			title: '@'
		},
		transclude: true,
		template: '<div class="sidebox">\
			<div class="content">\
			<h2 class="header">{{ title }}</h2>\
			<span class="content" ng-transclude>\
			</span>\
			</div>\
			</div>'
	}
).directive('link', ()->
	return {
		restrict: 'EA',
		transclude: true,
		controller:($scope, $element, $transclude, $log)->
			$transclude (clone)->
				a = angular.element '<a>'
				a.attr 'href', clone.text()
				a.text clone.text()
				$log.info 'Created new a tag in link directive'
				$element.append a
	}
).directive('myDirective',()->
	return {
		restrict:'A',
		transclude: true,
		templates: '<h4>{{ myController.msg }}</h4>',
		controllerAs: 'myController',
		controller: ()->
			msg = "Hello World"
	}
).directive('ensureUnique',()->
	return {
		restrict:'A',
		require: 'ngModel',
		link:(scope, ele, attrs, c)->
			scope.$watch attrs.ngModel,()->
				obj = {filed : attrs.ensureUnique,value:c.$modelValue}
				if obj.value is 'wujian'
					c.$setValidity('unique',true) 
				else
					c.$setValidity('unique',false)
	}
)