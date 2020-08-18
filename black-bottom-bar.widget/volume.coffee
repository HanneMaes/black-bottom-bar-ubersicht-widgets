# This is a simple example Widget, written in CoffeeScript, to get you started
# with Übersicht. For the full documentation please visit:
#
# https://github.com/felixhageloh/uebersicht
#
# You can modify this widget as you see fit, or simply delete this file to
# remove it.

# this is the shell command that gets executed every time this widget refreshes
command: "osascript -e 'output muted of (get volume settings)'" # get muted state
# command: "osascript -e 'output volume of (get volume settings)'" # get volume

# the refresh frequency in milliseconds
refreshFrequency: 500 # every half second

# render gets called after the shell command has executed. The command's output
# is passed in as a string. Whatever it returns will get rendered as HTML.
render: -> """
  <span id='volume'></span>
"""

update: (output, domEl) ->

  # update HTML elements
  div = $(domEl)

  # muted or not
  displayText = "O"
  if output == true
    displayText = "X"

  # draw HTML
  div.find('#volume').html(displayText) 

#################################
# CSS
#################################

# the CSS style for this widget, written using Stylus
# (http://learnboost.github.io/stylus/)
style: """
  // background
  box-sizing: border-box
  background-color: rgb(0, 0, 0)

  // position
  right: 42px // same as battery.coffee width
  bottom: 0%
  width: calc(50% - 42px) // same as battery.coffee width
  height: 36px

  // typography
  color: white
  text-shadow: 0px 0px 10px black;
  font-size: 10px
  line-height: 1.5
  font-family: Futura,Trebuchet MS,Arial,sans-serif; 
  padding: 10px
  letter-spacing: 2px

  // elements
  display: flex
  flex-direction: row
  justify-content: flex-end
  align-items: center
"""