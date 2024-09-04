// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/data/repositories/categories/category_controller.dart';
import 'package:t_store/features/shop/screens/subCategories/widgets/sucCategory_slider_widgwt.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.parentId});

  final String parentId;

  @override
  Widget build(BuildContext context) {
    final catCtrl = CategoryController.instance;
    catCtrl.getSubCategories(parentId);
    final subCats = catCtrl.subCategories;
    return Scaffold(
      appBar: TAppbar(title: Text("Sports"), showBackArrow: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Banner

            TRoundedImage(imageUrl: TImages.promoBanner1, width: double.infinity, applyImageRadius: true),
            SizedBox(height: TSizes.spaceBtwSections),

            /// Sub- Categories
            Obx(() {
              if (catCtrl.isLoadingCats.value) {
                return Container();
              }
              return Column(
                children: List.generate(
                  subCats.length,
                  (index) => SubCategorySlider(subCats: subCats[index]),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
