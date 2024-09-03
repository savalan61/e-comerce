import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/common/widgets/loaders/loaders.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalzation/controllers/user_controller.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

import '../../../../utils/constants/image_strings.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final userCtrl = Get.put(UserController());

  /// Variables
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final RxBool isPassHide = true.obs;
  final RxBool rememberMe = false.obs;
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? '';
    password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? '';
    super.onInit();
  }

  /// -------- Sign In With Email and password ---------------------------
  Future<void> emailAndPasswordSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog("Logging you in ...", TImages.docerAnimation);

      /// Is Validated Form?
      if (!signInFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Is Net Connected?
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Remember me?
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      /// login
      final userCredential =
          await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      TFullScreenLoader.stopLoading();

      /// Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh snap", message: e.toString());
    }
  }

  /// -------- Sign In With Google ---------------------------
  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog("Logging you in ...", TImages.docerAnimation);

      /// Is Net Connected?
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// login
      final userCredential = await AuthenticationRepository.instance.signInWithGoogle();
      // final userCredential = await signInWithGoogle();

      /// save user
      await userCtrl.saveUserRecord(userCredential);
      TFullScreenLoader.stopLoading();

      /// Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh snap", message: e.toString());
    }
  }
}
