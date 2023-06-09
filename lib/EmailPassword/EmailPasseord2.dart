import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class EmailPasseord2 extends StatefulWidget {
  const EmailPasseord2({Key? key}) : super(key: key);

  @override
  State<EmailPasseord2> createState() => _EmailPasseord2State();
}

class _EmailPasseord2State extends State<EmailPasseord2> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: Center(child: Text("EMAIL PASSWORD AUTHENTICATION"))),
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
              margin: EdgeInsets.only(top: 100, bottom: 100),
              child: Center(
                  child: Text(
                    "REGISTERATION",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ))),
          Container(
              margin: EdgeInsets.only(bottom: 50),
              padding: EdgeInsets.all(20),
              color: Colors.transparent,
              child: Card(
                  elevation: 20,
                  child: TextField(
                    controller: email,
                    style: TextStyle(
                        fontSize: 20, letterSpacing: 1, color: Colors.white70),
                    decoration: InputDecoration(
                        labelText: "ENETER EMAIL",
                        prefixIcon: Icon(Icons.email_outlined),
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
                    controller: password,
                    style: TextStyle(
                        fontSize: 20, letterSpacing: 1, color: Colors.white70),
                    decoration: InputDecoration(
                        labelText: "ENETER PASSWORD",
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ))),
          ElevatedButton(
            onPressed: () {
              String Email = email.text.toString();
              String Password = password.text.toString();

              sendDetailToFirebase(Email, Password).then((value) {
                email.clear();
                password.clear();
              });
            },
            child: Text("SEND"),
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
          )
        ]),
      ),
    );
  }

  Future<void> sendDetailToFirebase(String Email, String Password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: Email,
          password: Password
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Center(
            child: Text(
              "SIGN-UP SUCCESS",
              style: TextStyle(fontSize: 15),
            )),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 450, right: 100, left: 100),
        elevation: 50,
        showCloseIcon: true,
        duration: Duration(seconds: 2),
        animation: Animation.fromValueListenable(CurvedAnimation(
            parent: kAlwaysCompleteAnimation,
            curve: Curves.easeInOutCubicEmphasized)),
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Center(
              child: Text(
                "USER NOT FOUNDED",
                style: TextStyle(fontSize: 15),
              )),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: 450, right: 100, left: 100),
          elevation: 50,
          showCloseIcon: true,
          duration: Duration(seconds: 2),
          animation: Animation.fromValueListenable(CurvedAnimation(
              parent: kAlwaysCompleteAnimation,
              curve: Curves.easeInOutCubicEmphasized)),
        ));
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Center(
              child: Text(
                "WRONG PASSROD",
                style: TextStyle(fontSize: 15),
              )),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: 450, right: 100, left: 100),
          elevation: 50,
          showCloseIcon: true,
          duration: Duration(seconds: 2),
          animation: Animation.fromValueListenable(CurvedAnimation(
              parent: kAlwaysCompleteAnimation,
              curve: Curves.easeInOutCubicEmphasized)),
        ));
        print('Wrong password provided for that user.');
      }
    }
  }
}
