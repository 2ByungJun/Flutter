var express = require('express'); // flutter import와 같음
var app = express(); // express를 실행해서 app에 적용
var Airtable = require('airtable');
const { randomBytes } = require('crypto');
var base = new Airtable({apiKey: 'keyjV7S0oqAxwBNzT'}).base('app5cMx6ooOssqpDj');

var admin = require("firebase-admin");
var serviceAccount = require("./kidscourse-flutter-firebase-adminsdk-savid-33f2dcbddf.json");
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://kidscourse-flutter.firebaseio.com"
});

app.use(express.json());
app.use(express.urlencoded({extended:false}));

/**
 * 로그인
 */
app.post('/login', (req, res) => {
    var chk = 0;
    var data = req.body;
    console.log(data.serialKey);

    if(data.serialKey == ''){
        chk++;
    }

    base('Teacher').select({
        maxRecords: 50,
        view: "Grid view"
    }).eachPage(function page(records, fetchNextPage) {
        records.forEach(function(record) {
            if( data.serialKey != record.get('serialKey')){
                chk++;
            }
        });
        fetchNextPage();
    });

    if(chk == 0){
        console.log("true");
        return res.json(true);
    }else{
        return res.json(false);
    }
});


/**
 * 시리얼키 받기
 */
var home = "";
var name = "";
var phone = "";
var serialKey = "";
var check = "0";
app.post('/teacherCreate', (req, res)=>{
    var data = req.body;
    if(data.home != null){
        home = data.home;
    }else if(data.name != null){
        name = data.name;
    }else if(data.phone != null){
        phone = data.phone;
        serialKey = "k" + phone;
    }else if(data.check != null){
        check = data.check;
    }
    console.log(data);

    if(check == 1){
        base('Teacher').create({
            "home": home,
            "name": name,
            "phone": phone,
            "serialKey": serialKey,
            "check": check
        }, 
        function(err, records) { 
            if (err) return res.json(false);
        });
    return res.json(true);
    }
});


/**
 * 아이 리스트
 */
app.get('/baby', (req, res) => {
    base('Baby')
        .select({maxRecords: 50, view: "Grid view"})
        .eachPage(function page(records, fetchNextPage) {
                return res.json(records);
        }, function done(err) {
            if (err) {
                return res.json([]);
            }
        });
});

app.get('/babyCourseList', (req, res) =>{
    base('Course')
        .select({maxRecords: 50, view: "Grid view"})
        .eachPage(function page(records, fetchNextPage) {
                return res.json(records);
        }, function done(err) {
            if (err) {
                return res.json([]);
            }
        });
});

app.post('/babyCourseSelect', (req, res) => {
    var data = req.body;
    console.log(data);

    base('Course').select({
        maxRecords: 50,
        view: "Grid view"
    }).eachPage(function page(records, fetchNextPage) {
        records.forEach(function(record) {
            base('Course').update([{
                'id':record.id,
                "fields": {
                    "Select": 'N'
                }
            }]);
            console.log(record.id + " : N");
        });
        fetchNextPage();
        base('Course').update([
            {
                'id':data.id,
                "fields": {
                    "Select": 'Y'
                }
            }
        ], function(err, records) {
            if (err) {
            console.error(err);
            return res.json(false);
            }
            return res.json(true);
            }
        )
    });
});


app.post('/babyCreate', (req, res) => {
    var data = req.body;
    var idx = 0;
    console.log(data);

    base('Baby').select({
        // Selecting the first 3 records in Grid view:
        maxRecords: 50,
        view: "Grid view"
    }).eachPage(function page(records, fetchNextPage) {
        records.forEach(function(record) {
            idx++;
        });

        idx++;
        base('Baby').create({
            "BabyName": data.BabyName,
            "ParentsName": data.ParentsName,
            "Phone": data.Phone,
            "attend": "미출석",
            "attendImage": "images/kidOff.PNG",
            "serialKey": "123",
            "AddressIdx": data.AddressIdx,
            "Address": data.Address,
            "AddressDetail": data.AddressDetail,
            "key": "123" + idx.toString()
        }, 
        function(err, records) { 
            if (err) return res.json(false);
        return res.json(true);
        });
        fetchNextPage();
    }, function done(err) {
        if (err) { console.error(err); return; }
    });
});

app.post('/babyAttend', (req, res) =>{
    var data = req.body;
    var attend = '';
    var attendImage = ''; 
    console.log(data);

    if(data.attend == '출석'){
        attend = '미출석'
        attendImage = 'images/kidOff.PNG';
    }else{
        attend = '출석'
        attendImage = 'images/kidOn.PNG'
    }

    base('Baby').update([
        {
            'id':data.id,
            "fields": {
                "attend": attend,
                "attendImage": attendImage
            }
        }
    ], function(err, records) {
        if (err) {
        console.error(err);
        return res.json(false);
        }
        return res.json(true);
        }
    );
});

app.post('/babyDelete', (req, res) => {
    var data = req.body;
    console.log(data.id);

    base('Baby').destroy(data.id, 
        function(err, deletedRecords) {
        if (err) res.json(false);
        return res.json(true);
        });
});

app.post('/babySelect', (req, res) =>{
    var data = req.body;
    var temp;
    console.log(data);

    base('Baby').select({
        maxRecords: 50,
        view: "Grid view"
    }).eachPage(function page(records, fetchNextPage) {
        records.forEach(function(record) {
            if(data.id == record._rawJson.id){
                temp = record._rawJson;
            }
        });
        fetchNextPage();
        console.log(temp);
        return res.json(temp);
    });
});

app.post('/babyUpdate', (req, res) =>{
    var data = req.body;
    console.log(data);

    base('Baby').update([
        {
          "id": data.id,
          "fields": {
            "AddressDetail": data.AddressDetail,
            "AddressIdx": data.AddressIdx,
            "Address": data.Address
          }
        }
      ], 
      function(err, records) { 
          if (err) return res.json(false);
      return res.json(true);
      });
});

/**
 * 코스 리스트
 */
app.get('/course', (req, res) => {
base('Course')
    .select({maxRecords: 50, view: "Grid view"})
    .eachPage(function page(records, fetchNextPage) {
            return res.json(records);
    }, function done(err) {
        if (err) {
            return res.json([]);
        }
    });
});

app.post('/courseBaby', (req, res) =>{
var data = req.body;
var temp = [];
var i = 0;
console.log(data);

base('Baby').select({
    maxRecords: 50,
    view: "Grid view"
}).eachPage(function page(records, fetchNextPage) {
    records.forEach(function(record) {
         if( data.idx == record.fields.AddressIdx){
             if( '출석' == record.fields.attend){
                temp[i] = JSON.stringify(record._rawJson.fields.BabyName);
                i++;
             }
         }
    });
    fetchNextPage();
    console.log(temp);
    return res.json(temp);
}, function done(err) {
    if (err) { console.error(err); return res.json([]); }
});



});

app.post('/courseCreate', (req, res) => {
    var data = req.body;
    var idx = 0;
    console.log(data);

    base('Course').select({
        // Selecting the first 3 records in Grid view:
        maxRecords: 50,
        view: "Grid view"
    }).eachPage(function page(records, fetchNextPage) {
        records.forEach(function(record) {
            console.log('Retrieved', record.get('Name'));
            idx++;
        });
        fetchNextPage();

        idx++;
        base('Course').create({
            "Name": `${data.Name}`,
            "Address": `${data.Address}`,
            "Idx": `${data.Idx}`,
            "SerialKey": `${data.SerialKey}`,
            "Select": `${data.Select}`
        }, 
        function(err, records) { 
            if (err) return res.json(false);
        return res.json(true);
        });


    }, function done(err) {
        if (err) { console.error(err); return; }
    });
});

app.post('/courseDelete', (req, res) => {
    var data = req.body;
    console.log(data.id);

    base('Course').destroy(data.id, 
        function(err, deletedRecords) {
        if (err) res.json(false);
        return res.json(true);
        });
});

app.post('/target', (req, res)=> {
    console.log('---target실행---')
    var req = req.body;
    var fcm_message = {
        notification : {
            title : '👩‍👩‍👧‍👦' + req.name.replace(/\"/g,"") +' 도착 메세지',
            body : '"' + req.name.replace(/\"/g,"") + ' 원아가 도착하였습니다!"'
        }
    }

    base('Baby').select({
        maxRecords: 50,
        view: "Grid view"
    }).eachPage(function page(records, fetchNextPage) {
        records.forEach(function(record) {
            if( record.get('BabyName') == req.name.replace(/\"/g,"")){
                fcm_message.token = record.get('token');
                admin.messaging().send(fcm_message).then(function(response){
                    console.log("성공 : " + record.get('token'))
                }).catch(function(error){
                    console.log("실패")
                });
            }
        });
        fetchNextPage();
    }, function done(err) {
        if (err) { console.error(err); return; }
    });
});

app.post('/login2', (req, res) => {
    var data = req.body;
    console.log(data.serialKey);

    base('Baby').select({
        // Selecting the first 3 records in Grid view:
        maxRecords: 50,
        view: "Grid view"
    }).eachPage(function page(records, fetchNextPage) {
        records.forEach(function(record) {
            if(record.get('key') == data.serialKey){
                return res.json(true);
            }
        });
        fetchNextPage();
        return res.json(false);
    }, function done(err) {
        if (err) { console.error(err); return; }
    });
});

app.post('/message1', (req, res)=> {
    var req = req.body;
    var fcm_message = {
        notification : {
            title : '🚘❌' + req.name.replace(/\"/g,"") +'원아 차량제외 메세지',
            body : '"' + req.name.replace(/\"/g,"") + ' 원아는 직접 데리러 오십니다!"'
        },
        token : 'dO_x8uOORfSVIdDPn2wBNK:APA91bFpol773_FAM6lgFhLEfMFPz8zNNS9dFtHDfQCIUlffw6Wr7hdBTZbXfejUIW90noz1QtJd0wzGLJooV90x3qAgtYqZQ3Dj5V2sMWYZTJp15epxc83oS5jOik6QCb73h95MU_MH'
    }

    admin.messaging().send(fcm_message).then(function(response){
        console.log("성공 : " + response)
    }).catch(function(error){
        console.log("실패")
    });
});

app.post('/message2', (req, res)=> {
    var req = req.body;
    var fcm_message = {
        notification : {
            title : '😷' + req.name.replace(/\"/g,"") +'원아 결근 메세지',
            body : '"' + req.name.replace(/\"/g,"") + ' 원아는 오늘 등원을 못합니다!"'
        },
        token : 'dO_x8uOORfSVIdDPn2wBNK:APA91bFpol773_FAM6lgFhLEfMFPz8zNNS9dFtHDfQCIUlffw6Wr7hdBTZbXfejUIW90noz1QtJd0wzGLJooV90x3qAgtYqZQ3Dj5V2sMWYZTJp15epxc83oS5jOik6QCb73h95MU_MH'
    }

    admin.messaging().send(fcm_message).then(function(response){
        console.log("성공 : " + response)
    }).catch(function(error){
        console.log("실패")
    });
});

app.post('/message3', (req, res)=> {
    var req = req.body;
    var fcm_message = {
        notification : {
            title : '📞' + req.name.replace(/\"/g,"") +'원아 연락 메세지',
            body : '"' + req.name.replace(/\"/g,"") + ' 원아의 학부모님이 따로 연락을 원하십니다!"'
        },
        token : 'dO_x8uOORfSVIdDPn2wBNK:APA91bFpol773_FAM6lgFhLEfMFPz8zNNS9dFtHDfQCIUlffw6Wr7hdBTZbXfejUIW90noz1QtJd0wzGLJooV90x3qAgtYqZQ3Dj5V2sMWYZTJp15epxc83oS5jOik6QCb73h95MU_MH'
    }

    admin.messaging().send(fcm_message).then(function(response){
        console.log("성공 : " + response)
    }).catch(function(error){
        console.log("실패")
    });
});

app.get('/fcmList', (req, res)=> {
    base('FCM')
    .select({maxRecords: 50, view: "Grid view"})
    .eachPage(function page(records, fetchNextPage) {
            return res.json(records);
    }, function done(err) {
        if (err) {
            return res.json([]);
        }
    });
});


app.listen(3000);