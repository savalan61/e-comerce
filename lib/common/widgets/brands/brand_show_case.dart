import 'package:flutter/material.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 't_brand_cart.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key,
    required this.isDark,
    required this.images,
  });

  final bool isDark;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkerGrey,
      backGroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: const EdgeInsets.all(TSizes.sm),
      child: Column(
        children: [
          TBrandCard(
            isDark: isDark,
            showBorder: false,
            brandModel: BrandModel.empty(),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Row(
            children: images.map((e) => brandTopProductImageWidget(e, context)).toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backGroundColor: isDark ? TColors.darkGrey : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
