# attach 'shiftSelectable' to jquery
do ($, _)->

  augmentedSelectedCallback = (selected, $element, event, ui)->
    if $element.length
      $element.addClass('ui-selected')
      # keep original "ui.selectable" callback with new selected element
      ui = _.extend({}, ui, {selected: $element.get(0)})
      _.isFunction(selected) and selected(event, ui)

    return


  methods =
    init: (options)->
      settings = _.extend({}, options)
      selected = settings.selected
      unselected = settings.unselected
      $lastSelected = null

      settings.selected = (event, ui)->
        $selected = $(ui.selected)
        isShiftSelect = false

        # enable shift+click if something already selected
        # OR not unselected the last item clicked
        if event.shiftKey && $lastSelected
          # apply on all selectable elements based on container
          $selected.parents(".ui-selectable:first").find('.ui-selectee').andSelf().each ()->
            $element = $(@)
            # apply shift+click up/down the list, and deal with already
            # selected itens based on direction
            if $element.is($selected) or $element.is($lastSelected)
              isShiftSelect = !isShiftSelect
              augmentedSelectedCallback(selected, $element, event, ui)
            else if isShiftSelect
              augmentedSelectedCallback(selected, $element, event, ui)

            return


        # otherwise just treat click like a normal click, which can be
        # shift+click without last selected
        else
          $lastSelected = $selected
          # keep original "ui.selectable" callback
          _.isFunction(selected) and selected(event, ui)

        return

      settings.unselected = (event, ui)->
        # remove shift+click if unselecting $lastSelected
        if !event.shiftKey and $(ui.unselected).is($lastSelected)
          $lastSelected = undefined

        # keep original "ui.selectable" callback
        _.isFunction(unselected) and unselected(event, ui)
        return

      # init $.selectable
      @selectable(settings)


  $.fn.shiftSelectable = (options)->
    opts = options or {}
    # wrapped selectable methods passed on, like 'create or destroy'
    if _.isString(opts)
      return @selectable.apply(@, arguments)
    else if _.isObject(opts)
      return methods.init.apply(@, arguments)
    # treat dummy elements if called with a number != 0 or regex...
    else
      $.error("#{opts} not supported by shiftSelectable")
      return
  return