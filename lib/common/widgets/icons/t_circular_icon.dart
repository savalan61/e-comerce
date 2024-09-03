// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    this.width,
    this.height,
    this.iconSize = TSizes.lg,
    required this.icon,
    this.color,
    this.bgColor,
    this.onPress,
  });

  final double? width, height, iconSize;
  final IconData icon;
  final Color? color;
  final Color? bgColor;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: bgColor != null
              ? bgColor!
              : isDark
                  ? TColors.black.withOpacity(0.9)
                  : TColors.white.withOpacity(.9)),
      child: IconButton(
        icon: Icon(icon, color: color, size: iconSize),
        onPressed: onPress,
      ),
    );
  }
}
