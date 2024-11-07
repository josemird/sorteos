import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';


class CountdownWidget extends StatelessWidget {
  final int duration;
  final CountDownController controller;
  final Color ringColor;
  final Color fillColor;
  final Color backgroundColor;
  final double strokeWidth;
  final TextStyle textStyle;
  final bool isReverse;
  final bool isReverseAnimation;
  final VoidCallback onComplete;

  CountdownWidget({
    required this.duration,
    required this.controller,
    required this.ringColor,
    required this.fillColor,
    required this.backgroundColor,
    required this.strokeWidth,
    required this.textStyle,
    required this.isReverse,
    required this.isReverseAnimation,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {

    return CircularCountDownTimer(

      duration: duration,
      initialDuration: 0,
      controller: controller,
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2,
      ringColor: ringColor,
      fillColor: fillColor,
      backgroundColor: backgroundColor,
      strokeWidth: strokeWidth,
      strokeCap: StrokeCap.round,
      textStyle: textStyle,
      textAlign: TextAlign.center,
      textFormat: CountdownTextFormat.S,
      isReverse: isReverse,
      isReverseAnimation: isReverseAnimation,
      isTimerTextShown: true,
      autoStart: true,
      onComplete: onComplete,

    );
  }
}
