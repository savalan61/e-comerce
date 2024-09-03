import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../custome_shimmer/custome_shimmer.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    required this.isDark,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.sm,
    this.backGroundColor,
    this.overlyColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
  });

  final bool isDark;
  final double width, height, padding;
  final Color? backGroundColor, overlyColor;
  final String image;
  final BoxFit? fit;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backGroundColor ?? (isDark ? TColors.black : TColors.white), borderRadius: BorderRadius.circular(100)),
      child: isNetworkImage
          ? ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: fit,
                  color: overlyColor,
                  progressIndicatorBuilder: (context, url, progress) => const TShimmerEffect(
                    width: 55,
                    height: 55,
                    radius: 100,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            )
          : Image(
              fit: fit,
              image: AssetImage(image),
              color: overlyColor,
            ),
    );
  }
}
