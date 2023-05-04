import 'package:firebase/GetPackage/GetPackage.dart';
import 'package:firebase/main.dart';
import 'package:flutter/material.dart';

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("GET PACKAGE"))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return GetPackage();
              },
            ));
          },
          elevation: 50,
          child: Icon(Icons.arrow_back),
        ),
        body: Center(child: Text("This is Demo Screen",style: TextStyle(color: Colors.white,fontSize: 20)),)
    );
  }
}
