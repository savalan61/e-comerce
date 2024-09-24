import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/products/favorite%20icon/favorite_icon.dart';
import 'package:t_store/features/shop/controllers/product%20controller/product_image_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curver_edges/curved_edhes_widget.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);
    final imgCrl = Get.put(ProdImgController());
    final allImages = imgCrl.getAllProductImages(product);

    return Obx(() {
      return TCurvedEdgeWidget(
        child: Container(
          color: isDark ? TColors.darkGrey : TColors.light,
          child: Stack(
            children: [
              SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        imgCrl.showEnlargedImage(imgCrl.selectedProdImg.value);
                      },
                      child: CachedNetworkImage(
                        imageUrl: imgCrl.selectedProdImg.value,
                        progressIndicatorBuilder: (context, url, progress) =>
                            CircularProgressIndicator(value: progress.progress, color: TColors.primary),
                      ),
                    ),
                  ),
                ),
              ),

              if (allImages.isNotEmpty)

                /// Image Slider
                Positioned(
                  right: 0,
                  bottom: 30,
                  left: TSizes.defaultSpace,
                  child: SizedBox(
                    height: 80,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (_, index) => TRoundedImage(
                              isNetworkImage: true,
                              imageUrl: (allImages[index]),
                              width: 80,
                              bgColor: isDark ? TColors.dark : TColors.white,
                              border: Border.all(
                                  color: imgCrl.selectedProdImg.value == allImages[index]
                                      ? TColors.secondary
                                      : Colors.transparent),
                              padding: const EdgeInsets.all(TSizes.sm),
                              onPressed: () => imgCrl.selectedProdImg(allImages[index]),
                            ),
                        separatorBuilder: (__, _) => const SizedBox(
                              width: TSizes.spaceBtwItems,
                            ),
                        itemCount: allImages.length),
                  ),
                ),

              /// Appbar items
              TAppbar(
                showBackArrow: true,
                actions: [
                  TFavoriteIcon(
                    prodId: product.id,
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
