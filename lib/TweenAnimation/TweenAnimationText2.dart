import 'package:firebase/TweenAnimation/TweenAnimation.dart';
import 'package:flutter/material.dart';

class TweenAnimationText2 extends StatefulWidget {
  const TweenAnimationText2({Key? key}) : super(key: key);

  @override
  State<TweenAnimationText2> createState() => _TweenAnimationText2State();
}

class _TweenAnimationText2State extends State<TweenAnimationText2>     with TickerProviderStateMixin {
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
      appBar: AppBar(title: Text("TWEEN ANIMATION ON TEXT 2"),centerTitle:true),
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
