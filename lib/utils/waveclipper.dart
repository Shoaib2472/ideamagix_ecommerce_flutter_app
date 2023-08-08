import 'package:flutter/cupertino.dart';

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint1 = Offset(50, size.height - 100);
    var controlPoint2 = Offset(size.width - 100, size.height);
    var endPoint = Offset(size.width / 1.2, 0);

    Path path = Path()
      //   ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height)
      ..cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx, controlPoint2.dy, endPoint.dx, endPoint.dy)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint1 = Offset(50, size.height - 100);
    var controlPoint2 = Offset(size.width - 100, size.height);
    var endPoint = Offset(size.width, 0);

    Path path = Path()
      ..moveTo(size.width, size.height)
      ..lineTo(size.width / 7, size.height)
      ..cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx, controlPoint2.dy, endPoint.dx, endPoint.dy)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}