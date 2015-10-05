angular.module('myApp', []) 
.controller('MyController',['$scope','$parse',($scope,$parse)->
	 $scope.person = name:'wujian',address:'cheng du'
	 $scope.$watch 'expr',(newVal,oldVal,scope)->
		 if newVal isnt oldVal
		    parseFun = $parse newVal
		    scope.parsedValue = parseFun scope
  ]
)
 
	