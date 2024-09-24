import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custome_shimmer/custome_shimmer.dart';
import 'package:t_store/features/shop/screens/brands/brand_product.dart';

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
    required this.brandModel,
  });

  final bool isDark;
  final List<String> images;
  final BrandModel brandModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProduct(brandModel: brandModel)),
      child: TRoundedContainer(
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
              brandModel: brandModel,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Row(
              children: images.map((e) => brandTopProductImageWidget(e, context)).toList(),
            )
          ],
        ),
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
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.contain,
            progressIndicatorBuilder: (context, url, progress) => TShimmerEffect(width: 100, height: 100),
            errorWidget: (context, url, error) => Icon(Icons.error),
          )),
    );
  }
}
