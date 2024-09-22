import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:t_store/features/shop/controllers/product%20controller/product_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductMetadata extends StatelessWidget {
  const TProductMetadata({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final prodCtrl = ProductController.instance;
    final salePercentage = prodCtrl.calculateSalePrice(product.price, product.salePrice);
    final productPrice = prodCtrl.getProductPrice(product);

    final bool isDark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TRoundedContainer(
              radius: TSizes.sm,
              backGroundColor: TColors.secondary.withOpacity(.8),
              padding: const EdgeInsets.symmetric(vertical: TSizes.xs, horizontal: TSizes.sm),
              child:
                  Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            if (product.productType == ProductType.single && product.salePrice > 0)
              Text("\$${product.price}",
                  style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            if (product.productType == ProductType.single && product.salePrice > 0)
              const SizedBox(width: TSizes.spaceBtwItems),
            TProductPriceText(price: productPrice, isLarge: true)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        TProductTitleText(title: product.title),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const TProductTitleText(title: 'Status:'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(prodCtrl.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            TCircularImage(
              isNetworkImage: true,
              isDark: isDark,
              image: product.brand?.image ?? "",
              width: 32,
              height: 32,
              overlyColor: isDark ? TColors.white : TColors.black,
            ),
            TBrandTitleWithVerifiedIcon(title: "${product.brand?.name}", brandTextSize: TextSizes.medium),
          ],
        )
      ],
    );
  }
}
