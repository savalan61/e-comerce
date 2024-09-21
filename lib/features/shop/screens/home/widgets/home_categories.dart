// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/shimmer/category_shimmer.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/subCategories/sub_categories.dart';

import '../../../../../common/widgets/img_text_widget/vertical_image_text.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final catCtrl = Get.put(CategoryController());
    final featuredCategories = catCtrl.featuredCategories;
    return Obx(() {
      if (catCtrl.isLoadingCats.value) return CategoryShimmer();
      if (featuredCategories.isEmpty) {
        return Text("No Data Found", style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white));
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return TVerticalImageText(
              img: featuredCategories[index].image,
              title: featuredCategories[index].name,
              onPress: () {
                // catCtrl.getSubCategories(featuredCategories[index].parentId);
                Get.to(() => SubCategoriesScreen(
                      parentId: featuredCategories[index].id,
                    ));
              },
            );
          },
        ),
      );
    });
  }
}
