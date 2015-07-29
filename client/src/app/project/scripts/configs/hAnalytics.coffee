
# =============================================
# Main Module
# =============================================
angular.module 'HolmesAngularReact'

  # =============================================
  # Config Twain
  # =============================================
  .config (hAnalyticsTrackersProvider, APP_ENV) ->
    hAnalyticsTrackersProvider.set {
      main:
        versionDimension: APP_ENV.GA.VERSION_DIMENSION
        UA: APP_ENV.GA.MAIN
    }