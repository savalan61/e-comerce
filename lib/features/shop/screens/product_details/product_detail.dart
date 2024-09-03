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

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1- product Image slider
            TProductImageSlider(),

            /// 2 - Product Details
            Padding(
              padding:
                  EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  ///Rating and share
                  TRatingAndShare(),

                  ///Price, title, stock, brand
                  TProductMetadata(),

                  ///Attributes
                  TProductAttributes(),

                  ///Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: Text("Checkout"))),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///Description
                  TSectionHeading(title: "Description", showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    "About Amara Properties: Amara Properties is a professional real estate company assisting clients in finding their ideal home. For the past 8 years, we have been providing consultancy services for Real Estate, Investment, Residence, and Citizenship. We are dedicated to assisting foreign buyers with suitable housing options in Turkey and identifying profitable investment opportunities.Job Title: Property Consultant Location: Istanbul, Turkey Position Type: Full-Time",
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
