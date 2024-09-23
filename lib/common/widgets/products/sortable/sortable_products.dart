import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/controllers/product%20controller/all_products_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cart/product_cart_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final ctrl = AllProductsController.instance;
    ctrl.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          value: ctrl.selectedSortOption.value,
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: ["Name", "Higher price", "Lower price", "Sale", "Newest", "Popularity"]
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          onChanged: (value) {
            ctrl.sortProducts(value!);
          },
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        Obx(() {
          return TGridLayout(
            itemCount: ctrl.products.length,
            itemBuilder: (p0, index) => TProductCartVertical(
              product: ctrl.products[index],
            ),
          );
        })
      ],
    );
  }
}
