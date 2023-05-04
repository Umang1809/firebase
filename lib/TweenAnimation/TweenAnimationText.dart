import 'package:firebase/TweenAnimation/TweenAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TweenAnimationText extends StatefulWidget {
  const TweenAnimationText({Key? key}) : super(key: key);

  @override
  State<TweenAnimationText> createState() => _TweenAnimationTextState();
}

class _TweenAnimationTextState extends State<TweenAnimationText>
    with TickerProviderStateMixin {
  late AnimationController ac;
  late Animation sizeAnimation;
  late Animation colorAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ac = AnimationController(vsync: this, duration: Duration(seconds: 7));
    sizeAnimation = Tween(begin: 0.00, end: 40.00).animate(ac);
    colorAnimation =
        ColorTween(begin: Colors.amber, end: Colors.blue).animate(ac);
    ac.forward();
    ac.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("TWEEN ANIMATION ON TEXT"))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return TweenAnimation();
            },
          ));
        },
        elevation: 50,
        child: Icon(Icons.home),
      ),
      body: Center(
          child: Container(
        height: 200,
        width: 300,
        color: Colors.black,
        child: Center(
            child: Text(
          "HELLO FLUTTER",
          style: TextStyle(
              color: colorAnimation.value, fontSize: sizeAnimation.value,),
        )),
      )),
    );
  }
}
