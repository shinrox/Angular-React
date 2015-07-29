'use strict'

# =============================================
# Module
# =============================================
angular.module 'HolmesAngularReact'

  # =============================================
  # Route Auth Runner
  # =============================================
  .run ($rootScope, $window, $timeout) ->
    $rootScope.user = $window.HolmesAngularReactEnv?.user



