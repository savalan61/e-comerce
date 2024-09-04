import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/product_cart/product_cart_horizontal.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/category_mode.dart';

class SubCategorySlider extends StatelessWidget {
  const SubCategorySlider({
    super.key,
    required this.subCats,
  });

  final CategoryModel subCats;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSectionHeading(title: subCats.name),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        SizedBox(
          height: 120,
          child: ListView.separated(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => TProductCartHorizontal(img: subCats.image),
            separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems),
          ),
        ),
      ],
    );
  }
}
