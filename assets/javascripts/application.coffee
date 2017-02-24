# Use the Yaffle EventSource polyfill to work around browser issues
#= require eventsource.min.js

# dashing.js is located in the dashing framework
# It includes jquery & batman for you.
#= require dashing.js

#= require_directory .
#= require_tree ../../widgets

console.log("Yeah! The dashboard has started!")

Dashing.on 'ready', ->
  Dashing.widget_margins ||= [1, 1]
  Dashing.widget_base_dimensions ||= [120, 120]
  Dashing.numColumns ||= 8

  contentWidth = (Dashing.widget_base_dimensions[0] + Dashing.widget_margins[0] * 2) * Dashing.numColumns - Dashing.widget_margins[0]

  Batman.setImmediate ->
    $('.gridster').width(contentWidth)
    $('.gridster > ul').gridster
      widget_margins: Dashing.widget_margins
      widget_base_dimensions: Dashing.widget_base_dimensions
      avoid_overlapped_widgets: !Dashing.customGridsterLayout
      max_size_x: Dashing.numColumns
    $('.gridster > ul').each ->
      $(@).gridster().data('gridster').draggable().disable()
    Dashing.cycleDashboards({timeInSeconds: 0, stagger: true, page: 1})
