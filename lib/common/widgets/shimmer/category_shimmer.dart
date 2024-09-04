import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custome_shimmer/custome_shimmer.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TShimmerEffect(
                width: 55,
                height: 55,
                radius: 55,
              ),
              SizedBox(height: TSizes.spaceBtwItems / 2),
              TShimmerEffect(
                width: 55,
                height: 8,
              ),
            ]);
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
          itemCount: itemCount),
    );
  }
}
