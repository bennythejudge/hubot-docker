# Description:
#   test script
#
# Notes:
# This is mostly to test new things
#

module.exports = (robot) ->
  fs = require 'fs'

  robot.router.get '/status/check', (req, res) ->
    res.writeHead 200, {'Content-Type': 'text/plain'}
    res.end 'OK'

  robot.router.get '/thanks', (req, res) ->
    res.writeHead 200, {'Content-Type': 'text/plain'}
    res.end 'Your Welcome'

  robot.router.get '/ping', (req, res) ->
    res.end "PONG"

  robot.router.get '/adapter', (req, res) ->
    res.end robot.adapterName

  robot.router.get '/time', (req, res) ->
    res.end "Server time is: #{new Date()}"

  robot.respond /(qrcode) (.*)/i, (msg) ->
    url = encodeURIComponent(msg.match[2])
    q = "http://chart.apis.google.com/chart?cht=qr&chs=300x300&chl=#{url}"
    msg.send q

  robot.respond /log (.*)/i, (msg) ->
    log_message = msg.match[1]
    console.log "User Log: #{log_message}"
    msg.send "Recorded User Log: #{log_message}"

  robot.respond /brain record (.*)/i, (msg) ->
    robot.brain.set 'recorded' , msg.match[1]
    robot.brain.emit 'save'

  robot.respond /brain dump/i, (msg) ->
    msg.send robot.brain.get('recorded') or "My brain is empty"

