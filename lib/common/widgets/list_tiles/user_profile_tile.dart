import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalzation/controllers/user_controller.dart';
import 'package:t_store/utils/constants/image_strings.dart';

import '../../../utils/constants/colors.dart';
import '../images/t_circular_image.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.isDark,
    this.onPressed,
  });

  final bool isDark;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final userCtrl = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final profilePicture = userCtrl.user.value.profilePicture;

        return TCircularImage(
          isDark: isDark,
          image: profilePicture.isNotEmpty ? profilePicture : TImages.user,
          width: 50,
          height: 50,
          padding: 0,
          isNetworkImage: profilePicture.isNotEmpty,
        );
      }),
      title: Text(
        userCtrl.user.value.fullName,
        style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),
      ),
      subtitle: Text(
        userCtrl.user.value.email,
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: TColors.white)),
    );
  }
}
