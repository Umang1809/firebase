import 'package:flutter/material.dart';

class BounceInOutAnimation extends StatefulWidget {
  const BounceInOutAnimation({Key? key}) : super(key: key);

  @override
  State<BounceInOutAnimation> createState() => _BounceInOutAnimationState();
}

class _BounceInOutAnimationState extends State<BounceInOutAnimation> with TickerProviderStateMixin {
  late AnimationController ac;
  late Animation sizeAnimation;
  late Animation colorAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ac = AnimationController(vsync: this, duration: Duration(seconds: 7));
    sizeAnimation = Tween(begin: 50.00, end: 200.00)
        .animate(CurvedAnimation(parent: ac, curve: Curves.bounceInOut));
    ac.forward();
    ac.addListener(() {
      setState(() {});
    });
    ac.addStatusListener((status){
      if(status == AnimationStatus.completed){
        ac.reverse();
      } else if(status == AnimationStatus.dismissed) {
        ac.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: Text("Bounce InOut Animation"),centerTitle: true),
      body: Center(
          child: Container(
            height: sizeAnimation.value,
            width: sizeAnimation.value,
            color: Colors.deepOrange,
          )),
    );
  }
}
