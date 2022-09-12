import 'package:flutter/material.dart';

class CountResendCode extends AnimatedWidget {
  CountResendCode({Key? key, required this.animation}) : super(key: key, listenable:animation);
  Animation<int> animation;

  @override
  Widget build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);
    String timerText = '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2,'0')}';
   return Text(
     timerText,
     style: TextStyle(
       fontSize: 14,
       color:Theme.of(context).primaryColor,
     ),
   );
  }
}
