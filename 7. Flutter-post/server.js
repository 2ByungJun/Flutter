var express = require('express'); // express를 import(적용)
var app = express(); // express를 실행시키고 별칭으로 app

app.use(express.json()); // json 요청을 받겠다.

app.get('/', function(req,res){
    console.log('---get방식이 구동되었습니다.---');
    var text = 'get으로 나타나는 데이터!';
    console.log("전송데이터 : " + text)
    res.send(text);
});

app.post('/data', function(req,res){
    var data  = req.body;

    console.log('---post방식이 구동되었습니다.---');
    console.log(data);
    var text = data.id + ' ' + data.name + ' ' + data.age + '살';
    console.log("전송데이터 : " + text)
    res.send(text);
});

app.listen(3000); // 3000 포트