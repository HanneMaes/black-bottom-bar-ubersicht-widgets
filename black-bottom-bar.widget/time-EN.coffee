# This is a simple example Widget, written in CoffeeScript, to get you started
# with Übersicht. For the full documentation please visit:
#
# https://github.com/felixhageloh/uebersicht
#
# You can modify this widget as you see fit, or simply delete this file to
# remove it.

# this is the shell command that gets executed every time this widget refreshes
command: "date '+%H:%M %A %d %b(%m) %Y'"

# the refresh frequency in milliseconds
refreshFrequency: 500 # every half second

# render gets called after the shell command has executed. The command's output
# is passed in as a string. Whatever it returns will get rendered as HTML.
render: -> """
  <p>
    <span class='time'></span>
    <span class='date'></span>
  </p>
"""

update: (output, domEl) ->
  values = output.split(" ")
  console.log(values: values)

  time = values[0]
  date = values[1] + ' ' + values[2] + ' ' + values[3] + ' ' + values[4]

  # update HTML elements
  div = $(domEl)
  div.find('.time').html(time) 
  div.find('.date').html(date) 

# the CSS style for this widget, written using Stylus
# (http://learnboost.github.io/stylus/)
style: """

  // background
  box-sizing: border-box
  background-color: rgb(0, 0, 0)

  // position
  left: 0%
  bottom: 0%
  width: 50%
  height: 36px

  // typography
  color: white
  font-size: 10px
  line-height: 1.5
  font-family: Futura,Trebuchet MS,Arial,sans-serif; 
  padding: 10px
  letter-spacing: 2px

  // elements
  display: flex
  flex-direction: row
  justify-content: flex-start
  align-items: center

  // date
  .date
    padding-left: 10px
    font-size: 1em
    opacity: 0.4
    &:hover
      opacity: 1
"""