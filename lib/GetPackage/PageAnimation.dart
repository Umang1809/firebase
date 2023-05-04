import 'package:firebase/GetPackage/GetPackage.dart';
import 'package:flutter/material.dart';

class PageAnimation extends StatefulWidget {
  const PageAnimation({Key? key}) : super(key: key);

  @override
  State<PageAnimation> createState() => _PageAnimationState();
}

class _PageAnimationState extends State<PageAnimation> {
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
        body: Center(child: Text("This is Demo Screen2",style: TextStyle(color: Colors.white,fontSize: 20)),)
    );
  }
}