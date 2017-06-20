express = require('express');
app = express();
util = require('util')
fs   = require('fs-extra');
qs=require('querystring');
uuid = require('node-uuid');
_ = require('lodash');
url = require('url');
http = require('http');

delayTime=0




server = http.createServer (req, res) ->

  params = url.parse(req.url, true);

  #  console.log('request headers...');
  console.log(req.headers);
  #  console.log('urlll',params);
  delayTime=1000
  #res.writeHead(200, {'Content-Type': 'application/javascript;charset=utf-8'});
  #  switch req.url
  switch params.pathname
    when "/"
      do->
        setTimeout ->
          res.write('var http')
          res.end(JSON.stringify req.headers);
        ,delayTime
    else
      do->
        data=
          "code":"404"
          "message":"连接未找到"
          "data":""
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime

#  res.end();

.listen(1112);


console.log('server running on port 1112');