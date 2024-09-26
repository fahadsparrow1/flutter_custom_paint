import 'dart:math' as math;

import 'package:flutter/material.dart';

class MyArc extends StatelessWidget {
  final double diameter;
  final IconData? icon;
  final Color iconColor;
  final double iconSize;
  final Color circleColor;

  const MyArc({
    super.key,
    this.diameter = 200,
    this.icon = Icons.question_mark,
    this.iconColor = Colors.white,
    this.iconSize = 66.0,
    this.circleColor = Colors.blueAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 240,
        width: 300,
        decoration: BoxDecoration(color: Colors.white,
            border: Border.all(color: Theme.of(context).colorScheme.secondary,)),
        child: Stack(
          children:[
            Positioned(
              top: 20, // Adjust position to ensure no overlap
              left: 0,
              child: CustomPaint(
                painter: MyPainter(color: Colors.blueAccent.shade400),
                size: Size(diameter, diameter),
              ),
            ),
            // Medium Arc
            Positioned(
              top: 10, // Adjust position to ensure no overlap
              left: 0,
              child: CustomPaint(
                painter: MyPainter(color: Colors.blueAccent),
                size: Size(diameter - 40, diameter -40),
              ),
            ),
            // Small Arc
            Positioned(
              top: 5,
              left: 0,
              child: CustomPaint(
                painter: MyPainter(color: Colors.blue),
                size: Size(diameter - 80, diameter -80 ),
              ),
            ),
            Positioned(
              left: 100,
              top: diameter/2-100,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: circleColor,
                child: Icon(
                  icon,
                  color: iconColor,
                  size: iconSize,
                )
              ),
            ),
          ]
        ),
      ),
    );
  }
}


// This is the Painter class
class MyPainter extends CustomPainter {
  final Color color;
  final Color shadowColor;
  final double shadowOffset;
  MyPainter ({
    required this.color,
     this.shadowColor = Colors.black12,
    this.shadowOffset = 8.0,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    Paint shadowPaint = Paint()
      ..color = shadowColor
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadowOffset);

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2 + shadowOffset, -30 + shadowOffset),
        width: size.width,
        height: size.height,
      ),
      0,
      math.pi,
      false,
      shadowPaint,
    );

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, -40),
        width: size.width,
        height: size.height,
      ),
      0,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}