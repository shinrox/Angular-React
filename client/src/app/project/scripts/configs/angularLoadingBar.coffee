'use strict'

# =============================================
# Module
# =============================================
angular.module 'HolmesAngularReact.configs'

  # =============================================
  # App Config LoadingBar
  # =============================================
  .config [ 'cfpLoadingBarProvider', (cfpLoadingBarProvider) ->
    cfpLoadingBarProvider.includeSpinner = yes
    cfpLoadingBarProvider.latencyThreshold = 250
  ]
