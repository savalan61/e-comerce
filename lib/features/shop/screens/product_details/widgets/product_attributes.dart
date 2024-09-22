import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
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
    // final prodCtrl = ProductController.instance;
    final attCtrl = Get.put(VariationController());
    final bool isDark = THelperFunctions.isDarkMode(context);

    return Obx(() {
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
                              if (attCtrl.selectedVariation.value.salePrice > 0)
                                Text(
                                  '\$${attCtrl.selectedVariation.value.price}',
                                  style: Theme.of(context).textTheme.titleSmall!.apply(
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                ),
                              const SizedBox(width: TSizes.spaceBtwItems),
                              TProductPriceText(price: attCtrl.getVariationPrice()),
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
                  TProductTitleText(
                    title: attCtrl.selectedVariation.value.description ?? "",
                    maxLine: 4,
                    smallSize: true,
                  ),
                ],
              ),
            ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TSectionHeading(
                        title: attribute.name!,
                        showActionButton: false,
                      ),
                      Wrap(
                        spacing: 8,
                        children: attribute.values!.map((value) {
                          final isSelected = attCtrl.selectedAttributes[attribute.name!] == value;
                          final available = attCtrl
                              .getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!)
                              .contains(value);

                          return TChoiceChip(
                            label: value,
                            selected: isSelected,
                            onSelected: available
                                ? (selected) {
                                    attCtrl.onAttributeSelected(
                                      product,
                                      attribute.name!,
                                      value,
                                    );
                                  }
                                : null,
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                    ],
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
        ],
      );
    });
  }
}
