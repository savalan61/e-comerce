import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/product%20controller/product_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/chips/choise_chip.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../controllers/product controller/variation_controller.dart';
import '../../../models/product_model.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final prodCtrl = ProductController.instance;
    final attCtrl = Get.put(VariationController());
    final bool isDark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        if (attCtrl.selectedVariation.value.id.isNotEmpty)
          TRoundedContainer(
            padding: const EdgeInsets.all(TSizes.md),
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
                            if (product.productType == ProductType.single)
                              Text(
                                '\$${product.price}',
                                style: Theme.of(context).textTheme.titleSmall!.apply(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                              ),
                            const SizedBox(width: TSizes.spaceBtwItems),
                            TProductPriceText(price: prodCtrl.getProductPrice(product)),
                          ],
                        ),
                        Row(
                          children: [
                            const TProductTitleText(title: 'Stock : ', smallSize: true),
                            Text(
                              attCtrl.variationStockStatus.value,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const TProductTitleText(
                  title: "This is the description of this product max is 4 and not more be carry and happy.",
                  maxLine: 4,
                  smallSize: true,
                )
              ],
            ),
          ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              product.productAttributes!.length,
              (index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TSectionHeading(
                        title: product.productAttributes![index].name!,
                        showActionButton: false,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      Obx(() {
                        return Wrap(
                          spacing: 8,
                          children: List.generate(product.productAttributes![index].values!.length, (i) {
                            final isSelected = attCtrl.selectedAttributes[product.productAttributes![index].name!] ==
                                product.productAttributes![index].values![i];
                            final available = attCtrl
                                .getAttributesAvailabilityInVariation(
                                    product.productVariations!, product.productAttributes![index].name!)
                                .contains(product.productAttributes![index].values![i]);

                            return TChoiceChip(
                              label: product.productAttributes![index].values![i],
                              selected: isSelected,
                              onSelected: available
                                  ? (selected) {
                                      attCtrl.onAttributeSelected(
                                        product,
                                        product.productAttributes![index].name!,
                                        product.productAttributes![index].values![i],
                                      );
                                    }
                                  : null,
                            );
                          }),
                        );
                      }),
                    ],
                  )),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
