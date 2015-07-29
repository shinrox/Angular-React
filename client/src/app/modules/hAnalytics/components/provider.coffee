angular.module 'hAnalytics.providers'
.provider 'hAnalyticsTrackers', ()->
  trackers = {}

  methods =
    createTracker: (tracker)->
      try
        ga 'create', tracker.UA, {name: tracker.name, cookieDomain: 'none'}
      catch e
        console.log 'hAnalytics.createTracker error', e


    init: ()->
      count = 0
      for own key, tracker of trackers
        continue if !tracker.UA
        if !tracker.name?
          tracker.name = "#{key}"
        count++
        methods.createTracker tracker


  @set = (config)->
    trackers = $.extend true, trackers, config

    methods.init()

  @$get = [()->
    return trackers
  ]

  return