import 'dart:io';

import 'package:firebase/RealTimeDatabase/RealTimeDBv.dart';
import 'package:firebase/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RealTimeDBu extends StatefulWidget {

  String datakey;

  RealTimeDBu(this.datakey);

  @override
  State<RealTimeDBu> createState() => _RealTimeDBuState();
}

class _RealTimeDBuState extends State<RealTimeDBu> {
  DatabaseReference? dbref;
  final picker = ImagePicker();
  String? ImagePath;
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();

  getImg() async {

    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);

    if (photo != null) {
      setState(() {
        ImagePath = photo.path;
      });
    }
  }

  getdata()
  async {
    var dd= await dbref!.child(widget.datakey).once();
    name.text=dd.snapshot.child('NAME').value.toString();
    phone.text=dd.snapshot.child('PHONE').value.toString();
    email.text=dd.snapshot.child('EMAIL').value.toString();
  }
  @override
  void initState() {
    super.initState();
    dbref= FirebaseDatabase.instance.ref().child('FLUTTERdb');
    getdata();
    print("123132131313");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("REAL TIME DATA BASE"))),
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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              margin: EdgeInsets.only(top: 100, bottom: 50),
              child: Center(
                  child: Text(
                    "REAL-TIME-DATABASE",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ))),
          ImagePath == null
              ? Container(
            margin: EdgeInsets.only(bottom: 50),
            color: Colors.white12,
            height: 250,
            width: 200,
            child: TextButton.icon(
                onPressed: () {
                  getImg();
                },
                icon: Icon(Icons.photo),
                label: Text("Add Image")),
          )
              : Container(
              margin: EdgeInsets.only(bottom: 50),
              color: Colors.white12,
              height: 250,
              width: 200,
              child: Image(image: FileImage(File(ImagePath!)))),
          Container(
              margin: EdgeInsets.only(bottom: 50),
              padding: EdgeInsets.all(20),
              color: Colors.transparent,
              child: Card(
                  elevation: 20,
                  child: TextField(
                    controller: name,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        fontSize: 20, letterSpacing: 1, color: Colors.white70),
                    decoration: InputDecoration(
                        labelText: "ENETER NAME",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ))),
          Container(
              margin: EdgeInsets.only(bottom: 50),
              padding: EdgeInsets.all(20),
              color: Colors.transparent,
              child: Card(
                  elevation: 20,
                  child: TextField(
                    controller: phone,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        fontSize: 20, letterSpacing: 1, color: Colors.white70),
                    decoration: InputDecoration(
                        labelText: "ENETER MOBILE NUMBER",
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ))),
          Container(
              margin: EdgeInsets.only(bottom: 50),
              padding: EdgeInsets.all(20),
              color: Colors.transparent,
              child: Card(
                  elevation: 20,
                  child: TextField(
                    controller: email,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        fontSize: 20, letterSpacing: 1, color: Colors.white70),
                    decoration: InputDecoration(
                        labelText: "ENETER EMAIL",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ))),
          ElevatedButton(
            onPressed: ()  async {
              String IN="RTDB${DateTime.now().day}:${DateTime.now().month}:${DateTime.now().year}:${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}:${DateTime.now().millisecond}.jpg";
              // final storageRef = FirebaseStorage.instance.ref();
              // await storageRef.putFile(File(ImagePath!));

              final storageRef = FirebaseStorage.instance.ref();
              Reference? imagesRef = storageRef.child("FLUTTER");

              final spaceRef = imagesRef.child(IN);

              await spaceRef.putFile(File(ImagePath!));

              await spaceRef.getDownloadURL().then((value) {

                String imgURL=value;
                var Update={
                  "NAME":name.text,
                  "PHONE":phone.text,
                  "EMAIL": email.text,
                  "IMAGE": imgURL,
                };

                dbref!.child(widget.datakey).update(Update).then((value) {

                  print("okokokokokokokokko");
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("DATA UPDATED")));

                });
              });


            },
            child: Text("UPDATE"),
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
                minimumSize: MaterialStatePropertyAll(Size.square(80))),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return RealTimeDBv();
            },));
          }, child: Text("VIEW"),style: ButtonStyle(
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
              minimumSize: MaterialStatePropertyAll(Size.square(50))),),
          SizedBox(
            height: 50,
          ),
        ]),
      ),
    );
  }
}
