var express = require('express'); // flutter import와 같음
var app = express(); // express를 실행해서 app에 적용
var Airtable = require('airtable');
const { randomBytes } = require('crypto');
var base = new Airtable({apiKey: 'keyjV7S0oqAxwBNzT'}).base('app5cMx6ooOssqpDj');

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
    console.log(data);

    base('Baby').create({
            "BabyName": data.BabyName,
            "ParentsName": data.ParentsName,
            "Phone": data.Phone,
            "attend": "미출석",
            "attendImage": "images/kidOff.PNG",
            "serialKey": "123",
            "AddressIdx": data.AddressIdx,
            "Address": data.Address,
            "AddressDetail": data.AddressDetail
        }, 
        function(err, records) { 
            if (err) return res.json(false);
        return res.json(true);
    });
    return;
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

app.post('/courseCreate', (req, res) => {
var data = req.body;
console.log(data);

base('Course').create({
        "Name": `${data.Name}`,
        "Address": `${data.Address}`
    }, 
    function(err, records) { 
        if (err) return res.json(false);
    return res.json(true);
    });
});

app.listen(3000);