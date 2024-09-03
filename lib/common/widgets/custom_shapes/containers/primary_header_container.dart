// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curver_edges/curved_edhes_widget.dart';
import 'circular_container.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.primary,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: TCircularContainer(backGroundColor: TColors.textWhite.withOpacity(.1)),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: TCircularContainer(backGroundColor: TColors.textWhite.withOpacity(.1)),
            ),
            child
          ],
        ),
      ),
    );
  }
}
