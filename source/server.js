var express = require('express');
let path = require('path')

var app = express();
app.use('/', express.static(path.join(__dirname, 'clientSide')));
app.listen(80, function() { console.log('• Nodejs sever listening.')});
