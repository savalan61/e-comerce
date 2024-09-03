import 'package:flutter/cupertino.dart';

class TCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCure = Offset(0, size.height - 20);
    final lastCure = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstCure.dx, firstCure.dy, lastCure.dx, lastCure.dy);

    final secondFirstCure = Offset(0, size.height - 20);
    final secondLastCure = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(secondFirstCure.dx, secondFirstCure.dy,
        secondLastCure.dx, secondLastCure.dy);

    final thirdFirstCure = Offset(size.width, size.height - 20);
    final thirdLastCure = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdFirstCure.dx, thirdFirstCure.dy,
        thirdLastCure.dx, thirdLastCure.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
