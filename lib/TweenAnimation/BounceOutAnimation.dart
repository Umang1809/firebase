import 'package:flutter/material.dart';

class BounceOutAnimation extends StatefulWidget {
  const BounceOutAnimation({Key? key}) : super(key: key);

  @override
  State<BounceOutAnimation> createState() => _BounceOutAnimationState();
}

class _BounceOutAnimationState extends State<BounceOutAnimation> with TickerProviderStateMixin {
  late AnimationController ac;
  late Animation sizeAnimation;
  late Animation colorAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ac = AnimationController(vsync: this, duration: Duration(seconds: 7));
    sizeAnimation = Tween(begin: 50.00, end: 200.00)
        .animate(CurvedAnimation(parent: ac, curve: Curves.bounceOut));
    ac.forward();
    ac.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: Center(child: Text("Bounce Out Animation"))),
      body: Center(
          child: Container(
            height: sizeAnimation.value,
            width: sizeAnimation.value,
            color: Colors.deepOrange,
          )),
    );
  }
}
