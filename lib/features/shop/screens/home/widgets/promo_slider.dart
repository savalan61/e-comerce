// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custome_shimmer/custome_shimmer.dart';
import 'package:t_store/features/shop/controllers/banner_controller.dart';
import 'package:t_store/features/shop/models/banner_model.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bannerController = Get.put(BannerController());
    final List<BannerModel> banners = bannerController.banners;
    return Obx(() {
      if (bannerController.isLoading.value) {
        return TShimmerEffect(width: double.infinity, height: 190);
      } else if (banners.isEmpty) {
        return Center(child: Text("Not found any data"));
      } else {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, reason) => bannerController.updatePageIndicator(index),
              ),
              items: banners
                  .map((e) => TRoundedImage(
                        imageUrl: e.imageURL,
                        isNetworkImage: true,
                        onPressed: () {
                          Get.toNamed(e.targetScreen);
                        },
                      ))
                  .toList(),
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            Obx(() {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < banners.length; i++)
                    (TCircularContainer(
                      width: 20,
                      height: 4,
                      margin: EdgeInsets.only(right: 10),
                      backGroundColor:
                          bannerController.carousalCurrentIndex.value == i ? TColors.primary : TColors.grey,
                    ))
                ],
              );
            }),
          ],
        );
      }
    });
  }
}
