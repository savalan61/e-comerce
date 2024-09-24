// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/features/shop/controllers/product%20controller/product_controller.dart';
import 'package:t_store/features/shop/controllers/wishList%20controller/wishlist_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/product_details/product_detail.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/sizes.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_text_with_verified_icon.dart';
import '../favorite icon/favorite_icon.dart';

class TProductCartVertical extends StatelessWidget {
  const TProductCartVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);
    final productCtrl = ProductController.instance;
    final salePercentage = productCtrl.calculateSalePrice(product.price, product.salePrice);
    final wishCtrl = Get.put(FavoriteController());
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetail(product: product));
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        ),
        color: isDark ? TColors.darkerGrey : TColors.white,
        child: Container(
          width: 180,
          padding: EdgeInsets.all(1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Thumbnail  Wishlist Button Discount tag
              TRoundedContainer(
                height: 180,
                width: 180,
                padding: EdgeInsets.all(TSizes.sm),
                backGroundColor: isDark ? TColors.dark : TColors.light,
                child: Stack(
                  children: [
                    ///Image
                    Center(
                      child: TRoundedImage(
                        width: double.infinity,
                        isNetworkImage: true,
                        imageUrl: product.thumbnail,
                        applyImageRadius: true,
                      ),
                    ),

                    if (salePercentage != null)
                      Positioned(
                          top: 12,
                          child: TRoundedContainer(
                            radius: TSizes.sm,
                            backGroundColor: TColors.secondary.withOpacity(.8),
                            padding: EdgeInsets.symmetric(vertical: TSizes.xs, horizontal: TSizes.sm),
                            child: Text('$salePercentage%',
                                style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                          )),

                    /// Favorite Icon button
                    Positioned(
                      top: 0,
                      right: 0,
                      child: TFavoriteIcon(
                        prodId: product.id,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: TSizes.spaceBtwItems / 2),

              ///Details
              Padding(
                padding: EdgeInsets.only(left: TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TProductTitleText(title: product.title, smallSize: true, maxLine: 1),
                    SizedBox(height: TSizes.spaceBtwItems / 2),
                    TBrandTitleWithVerifiedIcon(
                      title: product.brand?.name ?? "",
                      brandTextSize: TextSizes.large,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        if (product.productType == ProductType.single && product.salePrice > 0)
                          Padding(
                            padding: const EdgeInsets.only(left: TSizes.sm),
                            child: Text(
                              product.price.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(decoration: TextDecoration.lineThrough),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(left: TSizes.sm),
                          child: TProductPriceText(price: productCtrl.getProductPrice(product)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: TColors.dark,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(TSizes.productImageRadius))),
                    child: SizedBox(
                      width: TSizes.iconLg * 1.2,
                      height: TSizes.iconLg * 1.2,
                      child: Icon(
                        Iconsax.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
