import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/loaders/animation_loader.dart';
import 'package:t_store/common/widgets/products/product_cart/product_cart_vertical.dart';
import 'package:t_store/features/shop/controllers/wishList%20controller/wishlist_controller.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/shimmer/vertical_product_shimmer.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../models/product_model.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favCtrl = FavoriteController.instance;
    final navigationController = Get.put(NavigationController());

    return Scaffold(
      appBar: TAppbar(
        title: Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPress: () {
              Get.to(() => const HomeScreen());
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(() {
            return Column(
              children: [
                FutureBuilder<List<ProductModel>>(
                  builder: (context, snapshot) {
                    final emptyWidget = TAnimationLoaderWidget(
                      text: "Whoops!  wishlist is empty...",
                      animation: TImages.docerAnimation,
                      showAction: true,
                      actionText: r"Let's add spme",
                      onActionPressed: () {
                        navigationController.selectedIndex.value = 0;
                        Get.to(() => const NavigationMenu());
                      },
                    );
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: const TVerticalProductShimmer(), nothingFound: emptyWidget);
                    if (widget != null) return widget;

                    return TGridLayout(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => TProductCartVertical(
                        product: snapshot.data![index],
                      ),
                    );
                  },
                  future: favCtrl.fetchFavoriteProduct(),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
