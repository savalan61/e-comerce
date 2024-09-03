import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/loaders.dart';
import 'package:t_store/features/personalzation/controllers/user_controller.dart';
import 'package:t_store/features/personalzation/screens/profile/profile.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';

import '../../../utils/popups/full_screen_loader.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final userCtrl = Get.put(UserController());
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    firstName.text = userCtrl.user.value.firstName;
    lastName.text = userCtrl.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      TFullScreenLoader.openLoadingDialog("We are updating your information...", TImages.docerAnimation);
      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!key.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      userCtrl.updateUserName(firstName.text.trim(), lastName.text.trim());
      userCtrl.user.value.firstName = firstName.text.trim();
      userCtrl.user.value.lastName = lastName.text.trim();
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: "Congratulations", message: "Your name hase been changes successfully.");

      Get.off(const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh snap", message: e.toString());
    }
  }
}
