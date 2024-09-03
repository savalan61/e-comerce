// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: "Shipping Address", buttonTitle: "Change", onPressed: () {}),
        Text("Coding with Arsen", style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            Icon(Icons.phone, size: 16, color: Colors.grey),
            SizedBox(width: TSizes.spaceBtwItems),
            Text("01 553 864 7865", style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            Icon(Icons.location_history, size: 16, color: Colors.grey),
            SizedBox(width: TSizes.spaceBtwItems),
            Text("kurtkoy istanbul pendik 15/1", style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}
