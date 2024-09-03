// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:t_store/utils/validators/validation.dart';

import '../../../../../common/widgets/loaders/loaders.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signUpCtrl = Get.put(SignupController());
    return Form(
        key: signUpCtrl.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: signUpCtrl.firstName,
                  validator: (value) => TValidator.validateEmptyText("First Name", value),
                  expands: false,
                  decoration: InputDecoration(labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                )),
                SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    controller: signUpCtrl.lastName,
                    validator: (value) => TValidator.validateEmptyText("Last Name", value),
                    expands: false,
                    decoration: InputDecoration(labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwInputFields),

            ///User Name
            TextFormField(
              controller: signUpCtrl.userName,
              validator: (value) => TValidator.validateEmptyText("User Name", value),
              expands: false,
              decoration: InputDecoration(labelText: TTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields),

            ///Email
            TextFormField(
              controller: signUpCtrl.email,
              validator: (value) => TValidator.validateEmail(value),
              expands: false,
              decoration: InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields),

            ///Phone Number
            TextFormField(
              controller: signUpCtrl.phoneNumber,
              validator: (value) => TValidator.validatePhoneNumber(value),
              expands: false,
              decoration: InputDecoration(labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields),

            ///Password
            Obx(() {
              return TextFormField(
                controller: signUpCtrl.password,
                obscureText: signUpCtrl.isPassHide.value,
                validator: (value) => TValidator.validatePassword(value),
                expands: false,
                decoration: InputDecoration(
                    labelText: TTexts.password,
                    prefixIcon: Icon(Iconsax.password_check),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          signUpCtrl.isPassHide.value = !signUpCtrl.isPassHide.value;
                        },
                        child: signUpCtrl.isPassHide.value ? Icon(Iconsax.eye_slash) : Icon(Iconsax.eye))),
              );
            }),
            SizedBox(height: TSizes.spaceBtwInputFields),

            ///Terms and conditions
            TTermsAndConditionCheckbox(),
            SizedBox(height: TSizes.spaceBtwSections),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       signUpCtrl.signup();
            //     },
            //     child: Text(TTexts.createAccount),
            //   ),
            // ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (!signUpCtrl.signupFormKey.currentState!.validate()) {
                    TLoaders.errorSnackBar(title: "Invalid Form", message: "Please correct the errors in the form.");
                  } else if (!signUpCtrl.privacyPolicyCheckBox.value) {
                    TLoaders.errorSnackBar(
                        title: "Privacy Policy",
                        message: "You must accept the Privacy Policy & Terms of Use to create an account.");
                  } else {
                    signUpCtrl.signup();
                  }
                },
                child: Text(TTexts.createAccount),
              ),
            ),

            SizedBox(height: TSizes.spaceBtwSections),
          ],
        ));
  }
}
