angular.module('app',[]).controller(
	'FirstController'
	($scope) ->
		$scope.counter = 0;
		$scope.add = (amount)-> $scope.counter += amount
		$scope.subtract = (amount)->$scope.counter -= amount
	)
	