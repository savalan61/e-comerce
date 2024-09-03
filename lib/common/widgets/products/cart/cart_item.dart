// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../images/t_rounded_image.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_text_with_verified_icon.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(
          padding: EdgeInsets.all(TSizes.sm),
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          bgColor: isDark ? TColors.darkGrey : TColors.light,
        ),
        SizedBox(width: TSizes.spaceBtwItems),

        /// Title, price size
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTitleWithVerifiedIcon(title: "Nike"),
              TProductTitleText(title: "Black sport shoes ", maxLine: 1),
              Text.rich(TextSpan(children: [
                TextSpan(text: "Color ", style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: "Green ", style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(text: "Size ", style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: "UK 08 ", style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
