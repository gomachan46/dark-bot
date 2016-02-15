var slackAPI = require('slackbotapi');
var token = process.env.WEB_SLACK_TOKEN;

if (!token) {
    console.error("slack web api token is not set");
    console.error("please `export WEB_SLACK_TOKEN`");
    process.exit(1);
}
var slack = new slackAPI({
    'token': token,
    'logging': true,
    'autoReconnect': true
});

slack.on('message', function (data) {
    console.dir(data);
//    slack.reqAPI("chat.postMessage",data);
});

