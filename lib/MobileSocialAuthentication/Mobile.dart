import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../main.dart';

class Mobile extends StatefulWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  TextEditingController number = TextEditingController();
  bool otps = false;
  String otp = "";
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("MOBILE AUTHENTICATION"))),
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
                    controller: number,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    style: TextStyle(
                        fontSize: 20, letterSpacing: 1, color: Colors.white70),
                    decoration: InputDecoration(
                        labelText: "ENETER MOBILE NUMBER",
                        prefixText: "+91",
                        counterText: "",
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ))),
          ElevatedButton(
            onPressed: () {
              String Number = number.text.trim();
              sendOTP(Number).then((value) {
                number.clear();
              });
              // otps?
              showDialog(
                useSafeArea: true,
                context: context,
                builder: (context) {
                  return Material(
                    color: Colors.transparent,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 200, 20, 350),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                        // boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 10,spreadRadius: 10)],
                      ),
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Text(
                                "ENTER YOUR OTP HERE :)",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    letterSpacing: 1),
                              )),
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 30, 15, 30),
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Directionality(
                                    // Specify direction if desired
                                    textDirection: TextDirection.ltr,
                                    child: Pinput(
                                      length: 6,
                                      controller: pinController,
                                      focusNode: focusNode,
                                      androidSmsAutofillMethod:
                                          AndroidSmsAutofillMethod
                                              .smsUserConsentApi,
                                      listenForMultipleSmsOnAndroid: true,
                                      validator: (value) {
                                        return value == '2222'
                                            ? null
                                            : 'Pin is incorrect';
                                      },
                                      // onClipboardFound: (value) {
                                      //   debugPrint('onClipboardFound: $value');
                                      //   pinController.setText(value);
                                      // },
                                      hapticFeedbackType:
                                          HapticFeedbackType.lightImpact,
                                      onCompleted: (pin) {
                                        debugPrint('onCompleted: $pin');
                                      },
                                      onChanged: (value) {
                                        debugPrint('onChanged: $value');
                                      },
                                      cursor: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 9),
                                            width: 22,
                                            height: 1,
                                            color: focusedBorderColor,
                                          ),
                                        ],
                                      ),
                                      focusedPinTheme: defaultPinTheme.copyWith(
                                        decoration: defaultPinTheme.decoration!
                                            .copyWith(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: focusedBorderColor),
                                        ),
                                      ),
                                      submittedPinTheme:
                                          defaultPinTheme.copyWith(
                                        decoration: defaultPinTheme.decoration!
                                            .copyWith(
                                          color: fillColor,
                                          borderRadius:
                                              BorderRadius.circular(19),
                                          border: Border.all(
                                              color: focusedBorderColor),
                                        ),
                                      ),
                                      errorPinTheme:
                                          defaultPinTheme.copyBorderWith(
                                        border:
                                            Border.all(color: Colors.redAccent),
                                      ),
                                    ),
                                  ),
                                  // TextButton(
                                  //   onPressed: () {
                                  //     focusNode.unfocus();
                                  //     formKey.currentState!.validate();
                                  //   },
                                  //   child: const Text('Validate'),
                                  // ),
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        focusNode.unfocus();
                                        // formKey.currentState!.validate();
                                        verifyOTP();
                                      },
                                      child: Text("Validate"),
                                      style: ButtonStyle(
                                          elevation:
                                              MaterialStatePropertyAll(50),
                                          shape: MaterialStatePropertyAll(
                                              BeveledRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          textStyle: MaterialStatePropertyAll(
                                              TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white70,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 2)),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.white24),
                                          iconSize:
                                              MaterialStatePropertyAll(20),
                                          minimumSize: MaterialStatePropertyAll(
                                              Size.square(50))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
              // :Text("");
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

  Future<void> sendOTP(String number) async {
    print("*************+91$number");
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91$number',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        print("99999999999999$e");
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          otp = verificationId;
          print("123$otp");
          otps = true;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> verifyOTP() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: otp, smsCode: pinController.text.trim());
    credential.smsCode == pinController.text
        ? ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("OTP SUCCESS")))
        : ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("OTP WRONG")));
    // Sign the user in (or link) with the credential
    await auth.signInWithCredential(credential).then((value) {});

    print("**/******/**/**${credential.smsCode}");
  }
}
