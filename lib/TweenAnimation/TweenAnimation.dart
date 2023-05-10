import 'package:firebase/GetPackage/demo.dart';
import 'package:firebase/TweenAnimation/BounceInAnimation.dart';
import 'package:firebase/TweenAnimation/BounceInOutAnimation.dart';
import 'package:firebase/TweenAnimation/BounceOutAnimation.dart';
import 'package:firebase/TweenAnimation/CurvedAnimationContainer.dart';
import 'package:firebase/TweenAnimation/TweenAnimationContainer.dart';
import 'package:firebase/TweenAnimation/TweenAnimationContainer2.dart';
import 'package:firebase/TweenAnimation/TweenAnimationText.dart';
import 'package:firebase/TweenAnimation/TweenAnimationText2.dart';
import 'package:firebase/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({Key? key}) : super(key: key);

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("TWEEN ANIMATION"))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return home();
            },
          ));
        },
        elevation: 50,
        child: Icon(Icons.home),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            InkWell(
              onTap: () {
                Get.to(TweenAnimationContainer());
              },
              child: Card(
                margin: EdgeInsets.all(20),
                elevation: 20,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                      child: Text(
                    "Tween Animation On Container",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(TweenAnimationContainer2());
              },
              child: Card(
                margin: EdgeInsets.all(20),
                elevation: 20,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                      child: Text(
                    "Tween Animation On Container 2",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(TweenAnimationText());
              },
              child: Card(
                margin: EdgeInsets.all(20),
                elevation: 20,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                      child: Text(
                    "Tween Animation On Text",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(TweenAnimationText2());
              },
              child: Card(
                margin: EdgeInsets.all(20),
                elevation: 20,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                      child: Text(
                    "Tween Animation On Text 2",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(CurvedAnimationContainer());
              },
              child: Card(
                margin: EdgeInsets.all(20),
                elevation: 20,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                      child: Text(
                    "Tween CurvedAnimation On Container",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(BounceInAnimation());
              },
              child: Card(
                margin: EdgeInsets.all(20),
                elevation: 20,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                      child: Text(
                    "Bounce In Animation",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(BounceOutAnimation());
              },
              child: Card(
                margin: EdgeInsets.all(20),
                elevation: 20,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                      child: Text(
                    "Bounce Out Animation",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(BounceInOutAnimation());
              },
              child: Card(
                margin: EdgeInsets.all(20),
                elevation: 20,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                      child: Text(
                    "Bounce InOut Animation",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
