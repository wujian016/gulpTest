angular.module('myApp', [])
.run ($rootScope)->
  $rootScope.rootProperty = 'root scope'
.controller('ParentController',($scope)->
  $scope.parentProperty = 'parent scope')
.controller('ChildController',($scope)->
    $scope.childProperty = 'child scope'
    $scope.fullSentenceFromChild = 'Same $scope: We can access: ' +
     $scope.rootProperty + ' and ' +
     $scope.parentProperty + ' and ' +
     $scope.childProperty
) 
 
	