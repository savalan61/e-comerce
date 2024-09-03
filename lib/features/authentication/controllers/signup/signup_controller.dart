import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/loaders.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// -------------------- Variables ------------------------------
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  final RxBool isPassHide = true.obs;
  final RxBool privacyPolicyCheckBox = false.obs;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// -------------------- Signup ---------------------------------
  Future<void> signup() async {
    try {
      TFullScreenLoader.openLoadingDialog("We are processing your information...", TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.warningSnackBar(title: "Internet problem!", message: "Check your internet connections.");
        TFullScreenLoader.stopLoading();
        return;
      }

      // if (!signupFormKey.currentState!.validate()) {
      //   TLoaders.errorSnackBar(title: "Invalid Form", message: "Please correct the errors in the form.");
      //
      // }

      // if (!privacyPolicyCheckBox.value) {
      //   TLoaders.warningSnackBar(
      //       title: "Accept privacy policy.",
      //       message: "In order to create account you must have to read and accept  the Privacy Policy & Terms of Use!");
      //   return;
      // }

      /// Now we can Register in Firebase
      final userCredential =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          userName: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: "");

      final userRepo = Get.put(UserRepository());
      await userRepo.saveUserRecord(newUser);

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: "Congratulations",
          message: "Your account has benn created successfully. Verify your email to continue");
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
