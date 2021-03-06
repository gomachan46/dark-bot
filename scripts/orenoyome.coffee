# Description:
#   は俺の嫁.com
#
# Commands:
#   hubot 小路綾 - 小路綾.は俺の嫁.com
#   hubot 小野寺小咲 - 小野寺小咲.は俺の嫁.com
#   hubot 筒隠月子 - 筒隠月子.は俺の嫁.com
#   hubot 流子|御船流子 - 御船流子.は俺の嫁.com
#   hubot エリオ|藤和エリオ - 藤和エリオ.は俺の嫁.com

punycode = require 'punycode'

random = (max) ->
  rand = 1 + Math.floor( Math.random() * max)
  ('00' + rand).slice(-3)

orenoyome = (msg, yome) ->
  msg.http("http://は俺の嫁.com/resource.json")
    .get() (err, res, body) ->
      unless err
        resources = JSON.parse body
        max       = resources[yome]
        encoded   = "xn--#{punycode.encode yome}"
        domain    = "#{encoded}.xn--u9jb933vm9i.com"
        url       = "http://#{ domain }/images/#{ random(max) }.jpg"
        msg.send url

module.exports = (robot) ->
  robot.respond /小路綾/i, (msg) ->
    orenoyome(msg, '小路綾')

  robot.respond /小野寺小咲/i, (msg) ->
    orenoyome(msg, '小野寺小咲')

  robot.respond /筒隠月子/i, (msg) ->
    orenoyome(msg, '筒隠月子')

  robot.respond /(流子|御船流子)/i, (msg) ->
    orenoyome(msg, '御船流子')

  robot.respond /(エリオ|藤和エリオ)/i, (msg) ->
    orenoyome(msg, '藤和エリオ')


  robot.respond /(orenoyome|俺の嫁) list/i, (msg) ->
    msg.http("http://は俺の嫁.com/resource.json")
      .get() (err, res, body) ->
        unless err
          resources = JSON.parse body
          helps = (Object.keys resources).map (name) ->
            "dark " + name
          msg.send helps.join("\n")
