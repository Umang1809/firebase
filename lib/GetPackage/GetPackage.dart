import 'package:firebase/GetPackage/PageAnimation.dart';
import 'package:firebase/GetPackage/demo.dart';
import 'package:firebase/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class GetPackage extends StatefulWidget {
  const GetPackage({Key? key}) : super(key: key);

  @override
  State<GetPackage> createState() => _GetPackageState();
}

class _GetPackageState extends State<GetPackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("GET PACKAGE"))),
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
        child: Column(children: [
          SizedBox(height: 50),
          InkWell(
            onTap: () {
              Get.to(demo());
            },
            child: Card(
              margin: EdgeInsets.all(20),
              elevation: 20,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Center(
                    child: Text(
                  "Navigation Using Get.to() as Navigator.push",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.off(demo());
            },
            child: Card(
              margin: EdgeInsets.all(20),
              elevation: 20,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Center(
                    child: Text(
                  "Navigation Using Get.off() as Navigator.pushReplacement",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.dialog(AlertDialog(
                title: Text("Now Use Get.back() as Navigator.pop()"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Get.back()")),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Navigator.pop()")),
                ],
              ));
            },
            child: Card(
              margin: EdgeInsets.all(20),
              elevation: 20,
              child: Container(
                padding: EdgeInsets.all(20),
                child: const Center(
                    child: Text(
                  "Navigation Using Get.dialog as showDailog()",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.off(
                PageAnimation(),
                transition: Transition.circularReveal,
                duration: Duration(
                  seconds: 7,
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(20),
              elevation: 20,
              child: Container(
                padding: EdgeInsets.all(20),
                child: const Center(
                    child: Text(
                  "Navigation Using Get.off() with Animation->circularReveal",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.off(
                PageAnimation(),
                transition: Transition.native,
                duration: Duration(
                  seconds: 7,
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(20),
              elevation: 20,
              child: Container(
                padding: EdgeInsets.all(20),
                child: const Center(
                    child: Text(
                  "Navigation Using Get.off() with Animation->native",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.off(
                PageAnimation(),
                transition: Transition.leftToRightWithFade,
                duration: Duration(
                  seconds: 7,
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(20),
              elevation: 20,
              child: Container(
                padding: EdgeInsets.all(20),
                child: const Center(
                    child: Text(
                  "Navigation Using Get.off() with Animation->leftToRightWithFade",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
