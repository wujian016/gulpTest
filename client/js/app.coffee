angular.module('myApp',['ngResource'])
.controller('DashboardController',['$scope','GithubService',($scope,GithubService)->
	 GithubService.getPullRequests()
			.then((data)->
				events = []
				events.push i for i in data 
				return events
			).then((events)->
				$scope.pullRequests = events
			)
	]
).factory('GithubService', ['$q', '$http','$log',($q, $http,$log)->
			getPullRequests = ()->
				deferred = $q.defer()
				$http.get('https://api.github.com/repos/angular/angular.js/pulls')
				.success((data)->
					deferred.resolve(data)
				).error((reason)->
					deferred.reject(reason)
				).catch((reason)->
					$log.warn reason
					deferred.reject(reason)
				)['finally'](()->
					$log.log 'end!'
				)
				return deferred.promise
			return {
				getPullRequests: getPullRequests
			}
	]
)