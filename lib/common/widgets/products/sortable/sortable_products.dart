import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cart/product_cart_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: ["Name", "Higher price", "Lower price", "Sale", "Newest", "Popularity"]
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          onChanged: (value) {},
        ),
        SizedBox(height: TSizes.spaceBtwSections),
        TGridLayout(
          itemCount: 4,
          itemBuilder: (p0, index) => TProductCartVertical(),
        )
      ],
    );
  }
}
