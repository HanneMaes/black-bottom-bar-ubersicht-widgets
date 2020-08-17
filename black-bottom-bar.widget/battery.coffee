# This is a simple example Widget, written in CoffeeScript, to get you started
# with Übersicht. For the full documentation please visit:
#
# https://github.com/felixhageloh/uebersicht
#
# You can modify this widget as you see fit, or simply delete this file to
# remove it.

# this is the shell command that gets executed every time this widget refreshes
command: "pmset -g batt | grep -o '[0-9]*%; [a-z]*'"

# the refresh frequency in milliseconds
refreshFrequency: 500 # every half second

# render gets called after the shell command has executed. The command's output
# is passed in as a string. Whatever it returns will get rendered as HTML.
render: -> """
  <span id='charging' class='green'></span>
  <span id='battery'></span>
"""

update: (output, domEl) ->
  #console.log('----------------------')

  values = output.split(";")
  #console.log(values: values)

  # percentage
  percent = values[0]
  #console.log(percent: percent)

  status = values[1] # 'charging' or 'discharging'
  # console.log(status: status)

  # update HTML elements
  div = $(domEl)

  # percentage
  div.find('#battery').html(percent) 

  # if 'discharg' in status 
  console.log(findbattery: div.find('#battery'))
  if status.match(/disc/g)
    div.find('#charging').html('') 
  else 
    div.find('#charging').html('+') # charging

  # manage glows
  percentInt = parseInt(percent, 10)

  if percentInt <= 10
    $('#black-bottom-bar-widgets-black-bottom-bar-widget-battery-coffee').css('box-shadow', 'inset -110px 0 70px -50px rgba(255, 0, 0,' + (1 - (percentInt/10)) + ')')
  else if percentInt >= 90
    $('#black-bottom-bar-widgets-black-bottom-bar-widget-battery-coffee').css('box-shadow', 'inset -110px 0 70px -50px rgba(0, 255, 186,' + (1 - ((100 - percentInt) / 10)) + ')')

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
  right: 0%
  bottom: 0%
  width: 50%
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

  // colors
  .green
    color: rgb(0, 255, 186)
"""