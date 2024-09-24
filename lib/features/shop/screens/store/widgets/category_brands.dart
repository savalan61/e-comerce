import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brands/brand_show_case.dart';
import 'package:t_store/common/widgets/shimmer/boxes_shimmer.dart';
import 'package:t_store/common/widgets/shimmer/list_tile_shimmer.dart';
import 'package:t_store/features/shop/controllers/brand%20controller/brands_controller.dart';
import 'package:t_store/features/shop/models/category_mode.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);
    final controller = BrandsController.instance;

    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          var loader = const Column(
            children: [
              TListTileShimmer(),
              SizedBox(height: TSizes.spaceBtwItems),
              TBoxesShimmer(),
              SizedBox(height: TSizes.spaceBtwItems)
            ],
          );
          final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          final brands = snapshot.data!;
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: brands.length,
              itemBuilder: (context, index) {
                final brand = brands[index];
                return FutureBuilder(
                    future: controller.getBrandProducts(brandId: brand.id, limit: 3),
                    builder: (context, snapshot) {
                      final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                      if (widget != null) return widget;
                      final products = snapshot.data!;
                      return TBrandShowCase(
                          isDark: isDark, brandModel: brand, images: products.map((e) => e.thumbnail).toList());
                    });
              });
        });
  }
}
