# Description
#   hubot scripts for diagnosing dark hubot
#
# Commands:
#   hubot ping - Reply with ...
#   hubot echo <text> - Reply back with <text>
#   hubot time - Reply with current time
#
config = require('config')

module.exports = (robot) ->
  robot.respond /PING$/i, (msg) ->
    msg.send config.images.ping
  robot.respond /ECHO (.*)$/i, (msg) ->
    msg.send msg.match[1]
  robot.respond /TIME$/i, (msg) ->
    msg.send "Server time is: #{new Date()}"
