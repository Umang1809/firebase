import 'package:firebase/TweenAnimation/TweenAnimation.dart';
import 'package:flutter/material.dart';

class CurvedAnimationContainer extends StatefulWidget {
  const CurvedAnimationContainer({Key? key}) : super(key: key);

  @override
  State<CurvedAnimationContainer> createState() =>
      _CurvedAnimationContainerState();
}

class _CurvedAnimationContainerState extends State<CurvedAnimationContainer>
    with TickerProviderStateMixin {
  late AnimationController ac;
  late Animation sizeAnimation;
  late Animation colorAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ac = AnimationController(vsync: this, duration: Duration(seconds: 4));
    sizeAnimation = Tween(begin: 50.00, end: 200.00)
        .animate(CurvedAnimation(parent: ac, curve: Curves.linear));
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
      appBar:
          AppBar(title: Center(child: Text("TWEEN ANIMATION ON CONTAINER"))),
      body: Center(
          child: Container(
        height: sizeAnimation.value,
        width: sizeAnimation.value,
        color: colorAnimation.value,
      )),
    );
  }
}
