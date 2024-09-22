// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../custome_shimmer/custome_shimmer.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.img,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor,
    this.onPress,
  });

  final String img, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            ///Circular Icon
            Container(
              width: 56,
              height: 56,
              padding: EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? TColors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: img,
                  fit: BoxFit.cover,
                  // color: overlyColor,
                  progressIndicatorBuilder: (context, url, progress) => const TShimmerEffect(
                    width: 55,
                    height: 55,
                    radius: 100,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                // Image(
                //   image: AssetImage(img),
                //   fit: BoxFit.cover,
                //   color: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.black,
                // ),
              ),
            ),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
