import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/loaders.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/personalzation/controllers/user_controller.dart';
import 'package:t_store/features/personalzation/screens/settings/re_auth_for_deleting_screen.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';

class DeleteAccountController extends GetxController {
  static DeleteAccountController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final RxBool showPass = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final userCtrl = Get.put(UserController());

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: "Delete Account",
        middleText:
            "Are you sure you want to delete your account permanently? Thi action is not reversible and all off your data will be removed! ",
        confirm: ElevatedButton(
          onPressed: () async => deleteAccount(),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: Text("Delete"),
          ),
        ),
        cancel: OutlinedButton(onPressed: () => Navigator.of(Get.overlayContext!).pop(), child: const Text("Cancel")));
  }

  Future<void> deleteAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog("We are deleting your account...", TImages.docerAnimation);

      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == "google.com") {
          await auth.signInWithGoogle();
          await userCtrl.deleteUser();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == "password") {
          TFullScreenLoader.stopLoading();

          Get.to(() => const ReAuthLoginFormScreen());
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(title: "Oh Snaps", message: e.toString());
      TFullScreenLoader.stopLoading();
    }
  }

  Future<void> deleteReAuthenticatedUser() async {
    try {
      TFullScreenLoader.openLoadingDialog("Processing", TImages.docerAnimation);
      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.reAuthenticateWithEmailPassword(email.text.trim(), password.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
