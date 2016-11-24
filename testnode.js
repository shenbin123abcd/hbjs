var http = require('http');
var url = require('url');
server = http.createServer(function(req, res) {
    var params = url.parse(req.url, true);
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Request-Method', '*');
    res.setHeader('Access-Control-Allow-Headers', 'Authorization');
    if (req.method === 'OPTIONS') {
        res.writeHead(200);
        res.end();
        return;
    }
    res.writeHead(200, {
        'Content-Type': 'text/plain; charset=utf-8'
    });
    var data={
        data: '',
        iRet: 1,
        info: "success"
    };
    setTimeout(function() {
        if (params.query && params.query.callback) {
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
        } else {
            res.write(JSON.stringify(data));
        }
        return res.end();
    }, 2000);

}).listen(1234);

