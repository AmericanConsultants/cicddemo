'use strict';

/**
 * @ngdoc function
 * @name dockerusptoApp.controller:ResultsCtrl
 * @description
 * # ResultsCtrl
 * Controller of the dockerusptoApp
 */
angular.module('dockerusptoApp')
  .controller('ResultsCtrl', function ($scope,$rootScope) {
  $scope.$on('$routeChangeSuccess', function (event, data) {
    $rootScope.pageTitle = data.title;
  });
});
