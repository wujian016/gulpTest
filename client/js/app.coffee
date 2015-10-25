angular.module('myApp',['ngResource'])
.controller('ServiceController',['$scope','$resource','$log',($scope,$resource,$log)->
	$scope.events = [
		{actor:{login:'wujian'},repo:{name:'sinae'}}
		{actor:{login:'feiei'},repo:{name:'mama'}}
	]
	User = $resource('https://api.github.com/users/:userId/events?callback=JSON_CALLBACK',
		{
			userId:'@id'
		},{
			queryUsers:{
				method:'JSONP'
			},
			getUsers:{
				method:'JSONP'
			}
		}
	)
	$scope.getUsername = ()->
		User.getUsers({userId: $scope.username},(resp)->
				if resp.data?.length?
					$scope.events = resp.data
				else
					$log.warn resp.data.message
			,(err)->
				alert(err)
		)
])