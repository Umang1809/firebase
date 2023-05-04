import 'package:firebase/TweenAnimation/TweenAnimation.dart';
import 'package:flutter/material.dart';

class TweenAnimationContainer extends StatefulWidget {
  const TweenAnimationContainer({Key? key}) : super(key: key);

  @override
  State<TweenAnimationContainer> createState() =>
      _TweenAnimationContainerState();
}

class _TweenAnimationContainerState extends State<TweenAnimationContainer>
    with TickerProviderStateMixin {
  late AnimationController ac;
  late Animation widthAnimation;
  late Animation heightAnimation;
  late Animation colorAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ac = AnimationController(vsync: this, duration: Duration(seconds: 7));
    widthAnimation = Tween(begin: 0.00, end: 300.00).animate(ac);
    heightAnimation = Tween(begin: 0.00, end: 200.00).animate(ac);
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
        height: heightAnimation.value,
        width: widthAnimation.value,
        color: colorAnimation.value,
      )),
    );
  }
}
