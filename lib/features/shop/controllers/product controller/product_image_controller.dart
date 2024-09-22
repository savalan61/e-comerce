import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/product_model.dart';

import '../../../../utils/constants/sizes.dart';

class ProdImgController extends GetxController {
  static ProdImgController get instance => Get.find();

  RxString selectedProdImg = ''.obs;

  List<String> getAllProductImages(ProductModel product) {
    Set<String> images = {};
    images.add(product.thumbnail);
    selectedProdImg.value = product.thumbnail;
    if (product.images != null && product.images!.isNotEmpty) {
      images.addAll(product.images!);
    }
    if (product.productVariations != null && product.productVariations!.isNotEmpty) {
      images.addAll(product.productVariations!.map((variation) => variation.image));
    }
    return images.toList();
  }

  void showEnlargedImage(String image) {
    Get.to(
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: TSizes.defaultSpace * 2,
                horizontal: TSizes.defaultSpace,
              ),
              child: CachedNetworkImage(
                imageUrl: image,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ), // Padding
            const SizedBox(height: TSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  child: const Text('Close'),
                ),
              ), // SizedBox
            ), // Align
          ], // Column children
        ), // Column
      ), // Dialog.fullscreen
      fullscreenDialog: true,
    );
  }
}
