// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final brandCtrl = BrandsController.instance;
    // final bool isDark = THelperFunctions.isDarkMode(context);
    // final List<BrandModel> allBrands = brandCtrl.featuredBrands;

    return Scaffold(
      appBar: TAppbar(
        title: Text("All Brands"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TSectionHeading(title: "Brands:", showActionButton: false),
            SizedBox(height: TSizes.spaceBtwItems),
            // Obx(() {
            //   if (brandCtrl.isLoading.value) return TBrandsShimmer();
            //   if (allBrands.isEmpty) return Center(child: Text("Not Data Found."));
            //   return TGridLayout(
            //     itemCount: 0,
            //     mainAxisExtent: 80,
            //     itemBuilder: (p0, index) => TBrandCard(

            //       isDark: isDark,
            //       brandModel: allBrands[index],
            //       showBorder: true,
            //       onTap: () => Get.to(() => BrandProduct(
            //             brandModel: allBrands[0],
            //           )),
            //     ),
            //   );
            // })
          ],
        ),
      ),
    );
  }
}
