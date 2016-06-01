'use strict';

/**
 * @ngdoc function
 * @name dockerusptoApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the dockerusptoApp
 */
 angular.module('dockerusptoApp')
   .controller('MainCtrl', function ($scope,$rootScope) {
   $scope.$on('$routeChangeSuccess', function (event, data) {
     $rootScope.pageTitle = data.title;
   });
   });
