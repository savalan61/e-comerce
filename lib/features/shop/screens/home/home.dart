// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custome_shimmer/custome_shimmer.dart';
import 'package:t_store/features/shop/controllers/product%20controller/product_controller.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cart/product_cart_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productCtrl = Get.put(ProductController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                ///Appbar
                THomeAppbar(),
                SizedBox(height: TSizes.spaceBtwSections),

                /// Searchbar
                TSearchContainer(text: 'Search is Store..'),
                SizedBox(height: TSizes.spaceBtwSections),

                ///Categories
                Padding(
                  padding: EdgeInsets.only(left: TSizes.defaultSpace, bottom: TSizes.spaceBtwSections),
                  child: Column(
                    children: [
                      ///Heading
                      TSectionHeading(
                        title: 'Popular Categories',
                        showActionButton: false,
                        textColor: TColors.white,
                      ),
                      SizedBox(height: TSizes.spaceBtwItems),

                      ///Categories
                      THomeCategories()
                    ],
                  ),
                ),
              ],
            )),

            ///Body
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace / 2),
              child: Column(
                children: [
                  /// Slider
                  TPromoSlider(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  TSectionHeading(
                    title: 'Popular products',
                    onPressed: () => Get.to(() => AllProductsScreen(
                          title: 'Popular Products',
                          futureModel: productCtrl.fetchAllFeaturedProducts(),
                        )),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///popular products
                  Obx(() {
                    if (productCtrl.isLoading.value == true) {
                      return TShimmerEffect(width: double.infinity, height: 200);
                    }
                    if (productCtrl.allProducts.isEmpty) {
                      return Text("No Data Found!");
                    } else {
                      return TGridLayout(
                          itemCount: productCtrl.allProducts.length,
                          itemBuilder: (_, index) => TProductCartVertical(
                                product: productCtrl.allProducts[index],
                              ));
                    }
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
