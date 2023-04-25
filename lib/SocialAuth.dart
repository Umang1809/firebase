import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'main.dart';
class SocialAuth extends StatefulWidget {
  const SocialAuth({Key? key}) : super(key: key);

  @override
  State<SocialAuth> createState() => _SocialAuthState();
}

class _SocialAuthState extends State<SocialAuth> {
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
                    "SIGN-UP USING ..",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ))),


          ElevatedButton(
            onPressed: () {
              signInWithGoogle().then((value) {
                print("xgvdfhgfgdfgbvdfgdfgdfgv");
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Center(
                      child: Text(
                        "SUCCESS",
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
              });

            },
            child: Text("GOOGLE"),
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
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () async {
            final GoogleSignInAccount? googleUser = await GoogleSignIn().signOut().then((value) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Center(
                    child: Text(
                      "DATA CLEARED",
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
            });

          }, child: Text("Clear Data From Google"),   style: ButtonStyle(
              elevation: MaterialStatePropertyAll(50),
              shape: MaterialStatePropertyAll(BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              textStyle: MaterialStatePropertyAll(TextStyle(
                  fontSize: 15,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2)),
              backgroundColor: MaterialStatePropertyAll(Colors.white24),
              iconSize: MaterialStatePropertyAll(10),
              minimumSize: MaterialStatePropertyAll(Size.square(30))),),

          SizedBox(height: 50,),
          ElevatedButton(
            onPressed: () {
              signInWithFacebook().then((value) {
                print("xgvdfhgfgdfgbvdfgdfgdfgv");
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Center(
                      child: Text(
                        "SUCCESS",
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
              });

            },
            child: Text("FACEBOOK"),
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
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);

}


Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}