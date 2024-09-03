// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/products/ratings/rating_indicator.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(TImages.userProfileImage2),
                ),
                SizedBox(width: TSizes.spaceBtwItems),
                Text("Arsen Ali pour", style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems),

        ///Review
        Row(
          children: [
            TRatingBarIndicator(rating: 4),
            SizedBox(width: TSizes.spaceBtwItems),
            Text(
              "04 Nov 2024",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        ReadMoreText(
          "Reloaded 21 of 1523 libraries in 1,115ms (compile: 41 ms, reload: 337 ms, reassemble: 654 ms).DEGL_emulation( 5427): app_time_stats: 3306.52ms count=1",
          trimMode: TrimMode.Line,
          trimLines: 2,
          trimExpandedText: "  Show less...",
          trimCollapsedText: "  Show more...",
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
        ),
        SizedBox(height: TSizes.spaceBtwItems),

        ///  Company Review
        TRoundedContainer(
          backGroundColor: isDark ? TColors.darkGrey : TColors.grey,
          child: Padding(
            padding: EdgeInsets.all(TSizes.md),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Admin", style: Theme.of(context).textTheme.titleMedium),
                  Text("10 Nov 2024", style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              SizedBox(height: TSizes.spaceBtwItems),
              ReadMoreText(
                "Reloaded 21 of 1523 libraries in 1,115ms (compile: 41 ms, reload: 337 ms, reassemble: 654 ms).DEGL_emulation( 5427): app_time_stats: 3306.52ms count=1",
                trimMode: TrimMode.Line,
                trimLines: 2,
                trimExpandedText: "  Show less...",
                trimCollapsedText: "  Show more...",
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
              ),
            ]),
          ),
        ),
        SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
