#플러터(Flutter)

##플러터란

- Flutter 개요 : http://www.incodom.kr/Flutter
- Flutter 설치 : http://www.incodom.kr/Flutter/setting
- Flutter state(상태) :  http://www.incodom.kr/Flutter/state
- Flutter FCM(알림메세지) : http://www.incodom.kr/Flutter/FCM
- Flutter http : http://www.incodom.kr/Flutter/http

## post
1. Flutter - get/post code
2. Server - get/post code
3. Result
4. Full code

### Flutter - get/post code

* 선언

```
	import 'package:http/http.dart' as http;
```

* UI

![UI](https://images.velog.io/images/ieed0205/post/fac59c15-a1b9-40a2-af6d-b09cd1a10aff/UI.PNG)

* get : 해당 url에 요청/응답을 진행한다.

```
```

	Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            onPressed: () async {
              http.Response _res = await http.get("$_url/");
              print(_res.statusCode);
              print(_res.body);
              setState(() {
                _text = _res.body;
              });
            },
            child: Icon(Icons.chevron_left),
          ),
         ),   
         
```
```

* post : 해당 url에 데이터를 body에 담아 요청/응답을 진행한다.

```
```

	Align(
            alignment: Alignment.bottomRight,
            child:  FloatingActionButton(
              onPressed: () async {
                var data = {
                  "id" : "ID0205",
                  "name" : "이병준",
                  "age" : "25"
                };
                var body = json.encode(data);
                http.Response _res = await http.post("$_url/data", 
                	headers: {"Content-Type": "application/json"}, 
                    body: body
                    );
                print(_res.statusCode);
                print(_res.body);
                setState(() {
                  _text = _res.body;
                });
              },
              child: Icon(Icons.chevron_right),
            ),
          )
          
```
```

### Server - get/post code

get/post로 해당하는 url에 요청을 받아 res.send()로 응답하여 데이터를 res.body에 담아 전달한다.

```
```

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

```
```

### Result

* 구동

![GetPost](https://images.velog.io/images/ieed0205/post/ac6dfa7c-c4bd-446a-b92a-46bfbe18efb5/GetPost.gif)

* Flutter cmd

![FlutterCmd](https://images.velog.io/images/ieed0205/post/31574a66-e158-486f-bcba-ed727456e49e/1.PNG)

* Server cmd

![ServerCmd](https://images.velog.io/images/ieed0205/post/0d8ee751-24d3-4a24-b3bb-6b5fb23eaf7b/2.PNG)