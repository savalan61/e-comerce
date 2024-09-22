// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_matedata.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/rating_share.dart';
import 'package:t_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/sizes.dart';
import '../../models/product_model.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1- product Image slider
            TProductImageSlider(product: product),

            /// 2 - Product Details
            Padding(
              padding:
                  EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  ///Rating and share
                  TRatingAndShare(),

                  ///Price, title, stock, brand
                  TProductMetadata(product: product),

                  ///Attributes
                  if (product.productType == ProductType.variable) TProductAttributes(product: product),

                  ///Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: Text("Checkout"))),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///Description
                  TSectionHeading(title: "Description", showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? "No Description.",
                    textAlign: TextAlign.left,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Show more...",
                    trimExpandedText: "Less",
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: TColors.primary),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: TColors.primary),
                  ),

                  ///Reviews
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems),
                  TSectionHeading(
                    title: "Reviews(234)",
                    onPressed: () {
                      Get.to(() => TProductReviewsScreen());
                    },
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
