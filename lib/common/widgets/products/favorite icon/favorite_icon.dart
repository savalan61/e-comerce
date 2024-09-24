import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/controllers/wishList%20controller/wishlist_controller.dart';

import '../../icons/t_circular_icon.dart';

class TFavoriteIcon extends StatelessWidget {
  const TFavoriteIcon({
    super.key,
    required this.prodId,
  });

  final String prodId;

  @override
  Widget build(BuildContext context) {
    final favoriteCtrl = Get.put(FavoriteController());
    return Obx(() {
      return GestureDetector(
          onTap: () {
            favoriteCtrl.toggleProduct(prodId);
          },
          child: TCircularIcon(
            icon: favoriteCtrl.isFavorite(prodId) ? Iconsax.heart5 : Iconsax.heart_add,
            color: Colors.red,
          ));
    });
  }
}
