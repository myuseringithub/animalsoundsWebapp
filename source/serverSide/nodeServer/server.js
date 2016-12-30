var express = require('express');
var app = express();
app.use('/', express.static(__dirname + '/../../clientSide/'));
app.listen(80, function() { console.log('SZN - nodejs sever listening.')});
