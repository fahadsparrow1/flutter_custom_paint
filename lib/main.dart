import 'package:dummy_for_smartlearn/my_arc.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'dart:math';



void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'CurvedShape',
      theme: ThemeData(primarySwatch: Colors.blue),
      home:  Scaffold(
        appBar: AppBar(

        ),
        body: MyArc(diameter: 300,)
      )
    );
  }
}


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
//     return new MaterialApp(
//       title: 'CurvedShape',
//       theme: new ThemeData(primarySwatch: Colors.blue),
//       home:  MyHomePage(title: 'CurvedShape'),
//     );
//   }
// }


//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({required this.title, super.key});
//   final String title;
//
//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: new Stack(
//         children: [
//           _buildContent(),
//           CurvedShape(),
//           Container(
//               margin: EdgeInsets.only(top: CURVE_HEIGHT - AVATAR_DIAMETER),
//               width: double.infinity,
//               height: AVATAR_DIAMETER,
//               padding: EdgeInsets.all(8),
//               child: Container(
//                 decoration: new BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.deepOrangeAccent[400],
//                 ),
//                 child: new Icon(
//                   Icons.mood,
//                   color: Colors.deepOrangeAccent[100],
//                   size: AVATAR_RADIUS,
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
//
//   Widget _buildContent() {
//     return Container(
//       child: SingleChildScrollView(
//           padding: EdgeInsets.fromLTRB(16, CURVE_HEIGHT, 16, 16),
//           child: Text(
//             "There are many variations of passages of Lorem Ipsum available, but the majority have suffered "
//                 "alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."
//                 "There are many variations of passages of Lorem Ipsum available, but the majority have suffered "
//                 "alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
//             style: TextStyle(fontSize: 18),
//           )),
//     );
//   }
// }
//
// class CurvedShape extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: CURVE_HEIGHT,
//       child: CustomPaint(
//         painter: _MyPainter(),
//       ),
//     );
//   }
// }
//
// class _MyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = new Paint()
//       ..style = PaintingStyle.fill
//       ..isAntiAlias = true
//       ..color = Colors.purple[700]!;
//
//     Offset circleCenter = Offset(size.width / 2, size.height - AVATAR_RADIUS);
//
//     Offset topLeft = Offset(0, 0);
//     Offset bottomLeft = Offset(0, size.height * 0.25);
//     Offset topRight = Offset(size.width, 0);
//     Offset bottomRight = Offset(size.width, size.height * 0.5);
//
//     Offset leftCurveControlPoint = Offset(circleCenter.dx * 0.5, size.height - AVATAR_RADIUS * 1.5);
//     Offset rightCurveControlPoint = Offset(circleCenter.dx * 1.6, size.height - AVATAR_RADIUS);
//
//     final arcStartAngle = 200 / 180 * pi;
//     final avatarLeftPointX = circleCenter.dx + AVATAR_RADIUS * cos(arcStartAngle);
//     final avatarLeftPointY = circleCenter.dy + AVATAR_RADIUS * sin(arcStartAngle);
//     Offset avatarLeftPoint = Offset(avatarLeftPointX, avatarLeftPointY); // the left point of the arc
//
//     final arcEndAngle = -5 / 180 * pi;
//     final avatarRightPointX = circleCenter.dx + AVATAR_RADIUS * cos(arcEndAngle);
//     final avatarRightPointY = circleCenter.dy + AVATAR_RADIUS * sin(arcEndAngle);
//     Offset avatarRightPoint = Offset(avatarRightPointX, avatarRightPointY); // the right point of the arc
//
//     Path path = Path()
//       ..moveTo(topLeft.dx, topLeft.dy) // this move isn't required since the start point is (0,0)
//       ..lineTo(bottomLeft.dx, bottomLeft.dy)
//       ..quadraticBezierTo(leftCurveControlPoint.dx, leftCurveControlPoint.dy, bottomRight.dx, bottomRight.dy)
//      // ..arcToPoint(avatarRightPoint, radius: Radius.circular(AVATAR_RADIUS))
//      // ..quadraticBezierTo(rightCurveControlPoint.dx, rightCurveControlPoint.dy, bottomRight.dx, bottomRight.dy)
//       ..lineTo(topRight.dx, topRight.dy)
//       ..close();
//
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }