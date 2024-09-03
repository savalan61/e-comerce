// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../../../../common/widgets/chips/choise_chip.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TRoundedContainer(
          padding: EdgeInsets.all(TSizes.md),
          backGroundColor: isDark ? TColors.darkGrey : TColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const TSectionHeading(title: 'Variation', showActionButton: false),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(title: 'Price : ', smallSize: true),

                          // Actual Price
                          Text(
                            '\$25',
                            style: Theme.of(context).textTheme.titleSmall!.apply(
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                          SizedBox(width: TSizes.spaceBtwItems),

                          // Sale Price
                          const TProductPriceText(price: '20'),
                        ],
                      ),
                      // Stock
                      Row(
                        children: [
                          const TProductTitleText(title: 'Stock : ', smallSize: true),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              TProductTitleText(
                title:
                    "This is the description of this product max is 4 and not more be carry and happy.",
                maxLine: 4,
                smallSize: true,
              )
            ],
          ),
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TSectionHeading(
            title: "Colors",
            showActionButton: false,
          ),
          SizedBox(height: TSizes.spaceBtwItems / 2),
          Wrap(
            spacing: 8,
            children: [
              TChoiceChip(label: 'Red', selected: true, onSelected: (value) {}),
              TChoiceChip(label: 'Blue', selected: false, onSelected: (value) {}),
              TChoiceChip(label: 'Purple', selected: false, onSelected: (value) {}),
              TChoiceChip(label: 'Teal', selected: false, onSelected: (value) {}),
              TChoiceChip(label: 'Orange', selected: false, onSelected: (value) {}),
            ],
          ),
        ]),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TSectionHeading(
            title: "Sizes",
            showActionButton: false,
          ),
          SizedBox(height: TSizes.spaceBtwItems / 2),
          Wrap(
            spacing: 8,
            children: [
              TChoiceChip(label: 'EU 34', selected: true, onSelected: (value) {}),
              TChoiceChip(label: 'EU 36', selected: false, onSelected: (value) {}),
              TChoiceChip(label: 'EU 40', selected: false, onSelected: (value) {}),
              TChoiceChip(label: 'EU 36', selected: false, onSelected: (value) {}),
              TChoiceChip(label: 'EU 42', selected: false, onSelected: (value) {}),
            ],
          ),
        ]),
        SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
