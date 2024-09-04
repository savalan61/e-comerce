import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cart/product_cart_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/models/category_mode.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.isDark, required this.categoryModel});

  final bool isDark;
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandShowCase(
                isDark: isDark,
                images: const [
                  TImages.productImage1,
                  TImages.productImage3,
                  TImages.productImage2,
                ],
              ),
              TBrandShowCase(
                isDark: isDark,
                images: const [
                  TImages.productImage1,
                  TImages.productImage3,
                  TImages.productImage2,
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TSectionHeading(
                title: "You might like",
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TGridLayout(itemCount: 4, itemBuilder: (p0, index) => const TProductCartVertical())
            ],
          ),
        )
      ],
    );
  }
}
