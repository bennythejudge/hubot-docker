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

  robot.hear /sid reset ([0-9\.]+)/i, (msg) ->
    sidKey = parseInt(msg.match[1])

    msg.send "Student ID count reset to #{sidKey}"

  robot.hear /sid get/i, (msg) ->
    sidKey = sidKey + 1

    msg.send "Your Student ID is #{sidKey}"

  robot.hear /sid help/i, (msg) ->
    msg.send "sid get"
