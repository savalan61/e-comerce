import 'package:flutter/material.dart';
import 'package:t_store/features/shop/models/brand_model.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/t_circular_image.dart';
import '../texts/t_brand_title_text_with_verified_icon.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.isDark,
    required this.showBorder,
    this.onTap,
    required this.brandModel,
  });

  final bool isDark;
  final bool showBorder;
  final void Function()? onTap;
  final BrandModel brandModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backGroundColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: TCircularImage(
                isNetworkImage: true,
                backGroundColor: Colors.transparent,
                isDark: isDark,
                image: brandModel.image,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),

            ///Text
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleWithVerifiedIcon(
                    title: brandModel.name,
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    "${brandModel.productsCount ?? 0} Products",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
