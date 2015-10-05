angular.module('myApp', []) 
.controller('EmailController', ($scope)->
	$scope.sendEmail (email)->
		alert(email)
).directive('nwEmailer', ()-> 
	return {
		restrict: 'A',
		scope: {
			ngModel:'=',
			onSend: '&',
			fromName:'@'
		}, 
		replace:true
		template: '<div>\
			<textarea ngModel={{body}}></textarea>
			<button ng-click="onSend()">send email</button>
			</div>'
	}
) 