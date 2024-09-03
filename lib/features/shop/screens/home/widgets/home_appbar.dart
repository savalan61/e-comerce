import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalzation/controllers/user_controller.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class THomeAppbar extends StatelessWidget {
  const THomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.put(UserController());
    return TAppbar(
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey),
          ),
          Obx(() {
            return Text(
              userCtrl.user.value.fullName,
              style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),
            );
          }),
        ],
      ),
      actions: const [
        TCartCounterIcon(
          iconColor: TColors.white,
          counterBgColor: TColors.black,
          counterTextColor: TColors.white,
        )
      ],
    );
  }
}
