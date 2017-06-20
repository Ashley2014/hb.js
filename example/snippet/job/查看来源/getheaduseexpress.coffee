express = require('express');
app = express();
util = require('util')
fs   = require('fs-extra');
qs=require('querystring');
uuid = require('node-uuid');
_ = require('lodash');

delayTime=0

#currenData=JSON.parse fs.readFileSync('data/personList.txt','utf8')
#_.forEach(currenData,(n)->
#  n.gender='男'
#)
#fs.writeFileSync('data/personList.txt', JSON.stringify currenData)


app.all '/',  (req, res) ->
  data='hello'
  console.log(req)
  res.send(req.headers);



server = app.listen 1113,()->
  host = server.address().address;
  port = server.address().port;
  console.log('Example app listening at http://%s:%s', host, port);