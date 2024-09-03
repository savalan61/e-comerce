// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemove = true});
  final bool showAddRemove;
  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);

    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (__, _) => SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      itemCount: 2,
      itemBuilder: (context, index) => Column(
        children: [
          TCartItem(isDark: isDark),
          if (showAddRemove) SizedBox(height: TSizes.spaceBtwItems),

          /// Add Remove Buttons
          if (showAddRemove)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 70),
                    TProdQuantityAddRemoveButton(),
                  ],
                ),
                TProductPriceText(price: "265")
              ],
            )
        ],
      ),
    );
  }
}
