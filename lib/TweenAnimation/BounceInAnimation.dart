import 'package:flutter/material.dart';

class BounceInAnimation extends StatefulWidget {
  const BounceInAnimation({Key? key}) : super(key: key);

  @override
  State<BounceInAnimation> createState() => _BounceInAnimationState();
}

class _BounceInAnimationState extends State<BounceInAnimation>   with TickerProviderStateMixin {
  late AnimationController ac;
  late Animation sizeAnimation;
  late Animation colorAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ac = AnimationController(vsync: this, duration: Duration(seconds: 7));
    sizeAnimation = Tween(begin: 50.00, end: 200.00)
        .animate(CurvedAnimation(parent: ac, curve: Curves.bounceIn));
    ac.forward();
    ac.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: Center(child: Text("Bounce In Animation"))),
      body: Center(
          child: Container(
            height: sizeAnimation.value,
            width: sizeAnimation.value,
            color: Colors.deepOrange,
          )),
    );
  }
}
