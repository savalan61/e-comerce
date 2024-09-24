import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cart/product_cart_vertical.dart';
import 'package:t_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/models/category_mode.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_brands.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.isDark, required this.categoryModel});

  final bool isDark;
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              CategoryBrands(category: categoryModel),
              const SizedBox(height: TSizes.spaceBtwItems),
              FutureBuilder<List<ProductModel>>(
                  future: controller.getCategoryProduct(cateId: categoryModel.id),
                  builder: (context, snapshot) {
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: const TVerticalProductShimmer());
                    if (widget != null) return widget;
                    final prods = snapshot.data!;
                    return Column(
                      children: [
                        TSectionHeading(
                          title: "You might like",
                          showActionButton: true,
                          onPressed: () {
                            Get.to(() => AllProductsScreen(
                                  title: categoryModel.name,
                                  futureModel: controller.getCategoryProduct(cateId: categoryModel.id, limit: -1),
                                ));
                          },
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        TGridLayout(
                            itemCount: prods.length,
                            itemBuilder: (p0, index) => TProductCartVertical(product: prods[index]))
                      ],
                    );
                  }),
            ],
          ),
        )
      ],
    );
  }
}
