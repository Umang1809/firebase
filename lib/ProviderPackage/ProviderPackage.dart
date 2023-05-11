import 'package:firebase/GetPackage/demo.dart';
import 'package:firebase/ProviderPackage/LiveUpdateWithProvider.dart';
import 'package:firebase/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProviderPackage extends StatefulWidget {
  const ProviderPackage({Key? key}) : super(key: key);

  @override
  State<ProviderPackage> createState() => _ProviderPackageState();
}

class _ProviderPackageState extends State<ProviderPackage> {
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
              Get.to(LiveUpdateWithProvider());
            },
            child: Card(
              margin: EdgeInsets.all(20),
              elevation: 20,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Center(
                    child: Text(
                      "Live Value Changes Using PROVIDER",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )),
              ),
            ),
          ),

        ]),
      ),
    );
  }
}

