'use strict';

/**
 * @ngdoc function
 * @name dockerusptoApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the dockerusptoApp
 */
angular.module('dockerusptoApp')
  .controller('AboutCtrl', function ($scope,$rootScope) {
  $scope.$on('$routeChangeSuccess', function (event, data) {
    $rootScope.pageTitle = data.title;
  });
  });
