angular.module('myApp', ['ngRoute'])
.config(($routeProvider,$locationProvider)->
	$routeProvider.when('/',{
		controller: 'WelcomeController',
		templateUrl: 'views/welcome.html'
	}).when('/login',{
		controller: 'LoginController',
		templateUrl: 'views/login.html'
	}).when('/about/:name',{
		controller:'AboutController as ab',
		template:'<div><h1>{{ab.company}}</h1><p>{{ab.description}}</p><h2>Your input name is {{ab.name}}</h2></div>'
	}).otherwise({
		redirectTo: '/'
	})
	$locationProvider.html5Mode(false)
	$locationProvider.hashPrefix('!')
).config((ConnectionProvider)-> 
	ConnectionProvider.setApiKey('SOME_API_KEY')
).run(($rootScope,$location)->
	$rootScope.$on 'routeChangeStart',(evt, next, current)->
		console.log evt
		alert next
		console.log current
).provider('Connection', {
		xkey : 'unknow'
		setApiKey : (nkey)->
			@xkey = nkey
		$get : ()->
			that = this
			return { 
				showAlert : ()->
					window.alert(that.xkey)
			}
	}
).controller('WelcomeController',($scope,$location,$window,Connection)->
	$scope.test = ()->
		Connection.showAlert()
		return
	$scope.person = {name:'wujian',address:'cheng du'}
	$scope.showPath = ->
	##console.log $location.search({name:'john',year:38})
		##$location.search({name:'john',year:38})
		##$location.paramValue('name','wujian')
		##$window.location.href= '//81222.com'
		$location.url('/login')
).controller('LoginController',($scope)->
	$scope.user = {
		firstname : '',
		year:20
	}
	$scope.submit = ()->
		alert($scope.user.firstname)
		alert($scope.user.year)
).controller('AboutController',(Connection,$routeParams)->
	this.company = 'newegg company'
	this.description = 'This is bigest oneline ecommece company'
	this.name = $routeParams.name
).factory('UserService',($http)->
	currentUser = null
	return {
		getUser:()->return currentUser
		setUser:(user)-> currentUser = currentUser ? '' + user
	}
).controller('UserCtrl',($scope,UserService)->
	UserService.setUser('i love you')
	$scope.alert = ()-> alert UserService.getUser()
)