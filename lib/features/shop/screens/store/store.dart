// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/shimmer/brand_shimmer.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/brand%20controller/brands_controller.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/brands/brand_product.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/t_tabBar.dart';
import '../../../../common/widgets/brands/t_brand_cart.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../brands/all_brands.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);
    final catCtrl = CategoryController.instance;
    final brandCtrl = Get.put(BrandsController());
    return DefaultTabController(
      length: catCtrl.featuredCategories.length,
      child: Scaffold(
        appBar: TAppbar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: const [
            TCartCounterIcon(
              iconColor: TColors.white,
              counterBgColor: TColors.black,
              counterTextColor: TColors.white,
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                automaticallyImplyLeading: false,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      /// Search Bar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                        text: "Search in store...",
                        showBorder: true,
                        padding: EdgeInsets.zero,
                        showBackground: false,
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      /// Featured Brands
                      TSectionHeading(
                          title: "Featured Brands",
                          onPressed: () {
                            Get.to(() => AllBrandsScreen());
                            // Get.to(() => const ProfileScreen());
                          }),
                      SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      /// Brand Grid
                      Obx(() {
                        if (brandCtrl.isLoading.value) return TBrandsShimmer();
                        if (brandCtrl.featuredBrands.isEmpty) {
                          return Center(
                              child: Text(
                            "No Data Found",
                            style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
                          ));
                        }

                        return TGridLayout(
                          mainAxisExtent: 80,
                          itemCount: brandCtrl.featuredBrands.length,
                          itemBuilder: (p0, index) {
                            return TBrandCard(
                              onTap: () {
                                Get.to(() => BrandProduct(brandModel: brandCtrl.featuredBrands[index]));
                              },
                              isDark: isDark,
                              showBorder: false,
                              brandModel: brandCtrl.featuredBrands[index],
                            );
                          },
                        );
                      }),
                    ],
                  ),
                ),

                /// Tabs
                bottom: TTabBar(
                    isDark: isDark,
                    tabs: List.generate(
                      catCtrl.featuredCategories.length,
                      (index) => Tab(child: Text(catCtrl.featuredCategories[index].name)),
                    )),
              )
            ];
          },
          body: TabBarView(
              children: List.generate(
                  catCtrl.featuredCategories.length,
                  (index) => TCategoryTab(
                        isDark: isDark,
                        categoryModel: catCtrl.featuredCategories[index],
                      ))),
          // body: Container(),
        ),
      ),
    );
  }
}

//25:00
