'use strict';

/**
 * @ngdoc overview
 * @name dockerusptoApp
 * @description
 * # dockerusptoApp
 *
 * Main module of the application.
 */
angular
  .module('dockerusptoApp', [
    'ngAnimate',
    'ngAria',
    'ngCookies',
    'ngMessages',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
  ])
  .config(function ($routeProvider,$locationProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl',
        controllerAs: 'main',
      title: 'USPTODocker'
      })
      .when('/about', {
        templateUrl: 'views/about.html',
        controller: 'AboutCtrl',
        controllerAs: 'about',
        title: 'About'
      });
    $locationProvider.html5Mode(true);
    $locationProvider.hashPrefix('!');
  });
