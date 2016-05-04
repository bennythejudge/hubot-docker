# Description
#   Get a student ID.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot sid get
#
# Notes:
#   None
#
# Author:
#   Sean P. Kane

module.exports = (robot) ->

  sidKey = parseInt(0)

  robot.respond /sid reset ([0-9\.]+)/i, (msg) ->
    if robot.alias isnt "0"
      msg.send "This is not the correct bot. Ensure you are in the instructor roomi and type '0 sid get'."
    else
      sidKey = parseInt(msg.match[1])
      msg.send "Student ID base reset to #{sidKey}"

  robot.respond /sid get/i, (msg) ->
    if robot.alias isnt "0"
      msg.send "This is not the correct bot. Ensure you are in the instructor room and type '0 sid get'."
    else
      sidKey = sidKey + 1
      msg.send "#{msg.message.user.name}, your Student ID is #{sidKey}"

  robot.respond /sid help/i, (msg) ->
    msg.send "sid get"
