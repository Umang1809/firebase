import 'package:firebase/EmailPassword/EmailPasseord2.dart';
import 'package:firebase/EmailPassword/EmailPassword.dart';
import 'package:firebase/GetPackage/GetPackage.dart';
import 'package:firebase/MobileSocialAuthentication/Mobile.dart';
import 'package:firebase/ProviderPackage/ProviderPackage.dart';
import 'package:firebase/RealTimeDatabase/RealTimeDB.dart';
import 'package:firebase/TweenAnimation/TweenAnimation.dart';
import 'package:firebase/WhatsAppUI/WhatsAppUI.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'MobileSocialAuthentication/SocialAuth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    home: home(),
    theme: ThemeData.dark(),
  ));
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<String> title = [
    "Firebase Email/Password Authentication",
    "Firebase Email/Password Authentication",
    "Firebase Mobile Authentication",
    "Firebase Social Authentication",
    "Firebase Real Time DataBase",
    "WHATSAPP",
    "GET PACKAGE",
    "TWEEN ANIMATION",
    "PROVIDER PACKAGE"
  ];
  List<String> subtitle = [
    "Registration",
    "Sign-Up",
    "OTP",
    "Google/FaceBook",
    "Real Time DataBase",
    "Whats App UI",
    "Get Package",
    "TickerProviderStateMixin",
    "ProviderStateManagement"
  ];
  List<Widget> Page = [
    EmailPassword(),
    EmailPasseord2(),
    Mobile(),
    SocialAuth(),
    RealTimeDB(),
    WhatsAppUI(),
    GetPackage(),
    TweenAnimation(),
    ProviderPackage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("FIREBASE"))),
      body: ListView.builder(
        itemCount: title.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(15),
            child: ListTile(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return Page[index];
                  },
                ));
              },
              title: Center(
                  child: Text(
                "${title[index]}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
              subtitle: Center(
                  child: Text("${subtitle[index]}",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ))),
              tileColor: Colors.white12,
            ),
          );
        },
      ),
    );
  }
}
