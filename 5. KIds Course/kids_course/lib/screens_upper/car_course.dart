import 'package:flutter/material.dart';
import 'package:kids_course/screens_Page1_2_3/mapView.dart';

class car_courseless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 리본 제거
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: car_course(),
    );
  }
}

class car_course extends StatefulWidget {
  @override
  _car_courseState createState() => _car_courseState();
}

class _car_courseState extends State<car_course> {
  int current_step = 0;
  bool isSwitched = false;
  List<Step> my_steps = [
    Step(
      // Title of the Step
        title: Text("주소 1"),
        // Content, it can be any widget here. Using basic Text for this example
        content: Text("아이들 이름"),
        isActive: true),
    Step(
        title: Text("주소 2"),
        content: Text("아이들 이름"),
        // You can change the style of the step icon i.e number, editing, etc.
        state: StepState.editing,
        isActive: true),
    Step(
        title: Text("주소 3"),
        content: Text("아이들 이름"),
        isActive: true),
    Step(
        title: Text("주소 4"),
        content: Text("아이들 이름"),
        isActive: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('차량 지도',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        backgroundColor: Colors.orange,
      ),
      // Body
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("   등원",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.orange),),
                Switch(
                  inactiveThumbColor: Colors.orange,
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeTrackColor: Colors.grey,
                  activeColor: Colors.indigoAccent,
                ),

                Text("   하원",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.indigoAccent),),

              ],
            ),

            Stepper(
              currentStep: this.current_step,
              steps: my_steps,
              type: StepperType.vertical,
              onStepTapped: (step) {
                setState(() {
                  current_step = step;
                });
                print("onStepTapped : " + step.toString());
              },
              onStepCancel: () {
                setState(() {
                  if (current_step > 0) {
                    current_step = current_step - 1;
                  } else {
                    current_step = 0;
                  }
                });
                print("onStepCancel : " + current_step.toString());
              },
              onStepContinue: () {
                setState(() {
                  if (current_step < my_steps.length - 1) {
                    current_step = current_step + 1;
                  } else {
                    current_step = 0;
                  }
                });
                print("onStepContinue : " + current_step.toString());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orange,
        onPressed: (){
          setState(() {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => mapview()),
            );
          });
        },
        tooltip: '주소지 추가',
        label: Text('주소지 추가',
            style: TextStyle(fontSize: 17,
                fontWeight: FontWeight.bold)),
        icon: Icon(Icons.add,),
      ),
    );
  }
}
