var request = require('request');
var lib = require("xml2js");
var parser = new lib.Parser();
var moment = require('moment');

request('https://www.google.com/calendar/feeds/h2j0hj6rh0kadoi561c03amv84%40group.calendar.google.com/public/basic', function(error, response, body) {
    parser.parseString(body, function(err, res) {
        var entries = res.feed.entry;
        var thisMonth = entries.filter(function(e) {
            var day = e.summary[0]._.match(/\d+\/\d+\/\d+/)[0].replace(/\//g,"-");
                return moment(day).format("MM") === moment().format("MM");
        });
        for (var i=0; i < thisMonth.length; ++i) {
            console.log(thisMonth[i].title);
        }
    });

});

