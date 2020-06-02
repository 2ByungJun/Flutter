import 'package:flutter/material.dart';


import 'mapView.dart';

class fulpage2 extends StatefulWidget {
  @override
  _fulpage2State createState() => _fulpage2State();
}

class _fulpage2State extends State<fulpage2> {
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => mapview()),
          );
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
