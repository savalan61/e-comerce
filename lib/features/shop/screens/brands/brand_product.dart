import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brands/t_brand_cart.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../common/widgets/shimmer/vertical_product_shimmer.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/brand controller/brands_controller.dart';
import '../../models/brand_model.dart';

class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key, required this.brandModel});

  final BrandModel brandModel;

  @override
  Widget build(BuildContext context) {
    final brandCtrl = BrandsController.instance;

    final bool isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppbar(
        title: Text(brandModel.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCard(
                isDark: isDark,
                showBorder: true,
                brandModel: brandModel,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              FutureBuilder(
                  future: brandCtrl.getBrandProducts(brandId: brandModel.id),
                  builder: (context, snapshot) {
                    const loader = TVerticalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

                    if (widget != null) return widget;
                    return TSortableProducts(
                      products: snapshot.data!,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
