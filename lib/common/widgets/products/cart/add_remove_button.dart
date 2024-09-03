import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/t_circular_icon.dart';

class TProdQuantityAddRemoveButton extends StatelessWidget {
  const TProdQuantityAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          iconSize: TSizes.md,
          color: TColors.white,
          bgColor: TColors.primary,
        ),
        SizedBox(width: TSizes.spaceBtwItems),
        Text("2", style: Theme.of(context).textTheme.titleSmall),
        SizedBox(width: TSizes.spaceBtwItems),
        TCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          iconSize: TSizes.md,
          color: TColors.white,
          bgColor: TColors.primary,
        ),
      ],
    );
  }
}
