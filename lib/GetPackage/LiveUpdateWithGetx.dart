import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveUpdateWithGetx extends StatelessWidget {
  TextEditingController tec1 = TextEditingController();
  TextEditingController tec2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    calc cc = Get.put(calc());
    return Scaffold(
      appBar: AppBar(title: Text("LIVE VALUE CHANGES"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 45,
          ),
          Text("SUM OF TWO NUMBER", style: TextStyle(fontSize: 20)),
          SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black38,
            ),
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: tec1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  label: Text("VALUE OF NUMBER 1"),
                  prefixIcon: Icon(Icons.looks_one),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Icon(Icons.add),
          SizedBox(
            height: 25,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black38,
            ),
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: tec2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.looks_two),
                  label: Text("VALUE OF NUMBER 2"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
              onPressed: () {
                cc.calculate(tec1.text, tec2.text);
              },
              child: Text("Calculate"),
              style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(50),
                  shape: MaterialStatePropertyAll(BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  textStyle: MaterialStatePropertyAll(TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2)),
                  backgroundColor: MaterialStatePropertyAll(Colors.white24),
                  iconSize: MaterialStatePropertyAll(20),
                  minimumSize: MaterialStatePropertyAll(Size.square(50)))),
          SizedBox(
            height: 50,
          ),
          Icon(Icons.arrow_circle_down_rounded),
          SizedBox(
            height: 25,
          ),
          Obx(
            () {
              return Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black38,
                  ),
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "RESULT : ${cc.Result.value}",
                    style: TextStyle(fontSize: 20),
                  ));
            },
          ),
          SizedBox(
            height: 50,
          ),
        ]),
      ),
    );
  }
}

class calc extends GetxController {
  double num1 = 0;
  double num2 = 0;
  double ans = 0;
  RxString Result = "0".obs;

  void calculate(String text1, String text2) {
    if (text1.isNotEmpty) {
      num1 = double.parse(text1);
    } else {
      num1 = 0;
    }
    if (text2.isNotEmpty) {
      num2 = double.parse(text2);
    } else {
      num2 = 0;
    }

    ans = num1 + num2;
    Result.value = ans.toString();
  }
}
