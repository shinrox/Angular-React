angular.module 'HolmesAngularReact.directives'
.directive 'appVersion', ->
  restrict: 'AE'
  require: "^hNews"
  scope:
    open: "="
  templateUrl: "app/components/hNews/components/appVersion/template.html"
  controller: 'AppVersionCtrl'