
import 'dart:math';

import 'package:flutter/material.dart';

class Indicator extends CustomPainter{
  Color indicatorColor;

  Indicator(this.indicatorColor);



  @override
  void paint(Canvas canvas, Size size) {
    var paint=Paint()
        ..isAntiAlias=true
        ..style=PaintingStyle.fill
        ..color=indicatorColor;

     Rect rect = Rect.fromCircle(center: Offset(size.width/2, - size.width + size.height), radius: size.width);
     canvas.drawArc(rect, 0.0, 2*pi, true, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {

    return true;
  }}