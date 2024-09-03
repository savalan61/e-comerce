// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/products/product_cart/product_cart_horizontal.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(title: Text("Sports"), showBackArrow: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Banner

            TRoundedImage(imageUrl: TImages.promoBanner1, width: double.infinity, applyImageRadius: true),
            SizedBox(height: TSizes.spaceBtwSections),

            /// Sub- Categories
            Column(
              children: [
                TSectionHeading(title: "Sports shirts"),
                SizedBox(height: TSizes.spaceBtwItems / 2),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => TProductCartHorizontal(),
                    separatorBuilder: (context, index) => SizedBox(width: TSizes.spaceBtwItems),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
