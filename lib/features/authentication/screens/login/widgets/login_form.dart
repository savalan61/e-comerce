// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/login/login_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

import '../../password_configuration/forget_password.dart';
import '../../signup/signup.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginCtrl = Get.put(LoginController());

    return Form(
        key: loginCtrl.signInFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              ///email
              TextFormField(
                  controller: loginCtrl.email,
                  validator: (value) => TValidator.validateEmail(value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: TTexts.email)),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              ///password
              Obx(() {
                return TextFormField(
                    controller: loginCtrl.password,
                    validator: (value) => TValidator.validateEmptyText("Password", value),
                    obscureText: loginCtrl.isPassHide.value,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.password_check),
                        labelText: TTexts.password,
                        suffixIcon: GestureDetector(
                            onTap: () => loginCtrl.isPassHide.value = !loginCtrl.isPassHide.value,
                            child: Icon(loginCtrl.isPassHide.value ? Iconsax.eye_slash : Iconsax.eye))));
              }),
              const SizedBox(height: TSizes.spaceBtwInputFields / 2),

              /// Remember me - Forget Password
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                /// Remember me
                Obx(() {
                  return Row(children: [
                    Checkbox(
                        value: loginCtrl.rememberMe.value,
                        onChanged: (value) {
                          loginCtrl.rememberMe.value = !loginCtrl.rememberMe.value;
                        }),
                    Text(TTexts.rememberMe)
                  ]);
                }),

                ///Forget Pass

                TextButton(
                    onPressed: () {
                      Get.to(() => ForgetPasswordScreen());
                    },
                    child: Text(TTexts.forgetPassword))
              ]),
              SizedBox(height: TSizes.spaceBtwSections),

              //Sign in Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        loginCtrl.emailAndPasswordSignIn();
                      },
                      child: Text(TTexts.signIn))),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              //Create acc Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      Get.to(() => SignupScreen());
                    },
                    child: Text(TTexts.createAccount)),
              ),
              SizedBox(height: TSizes.defaultSpace / 5)
            ],
          ),
        ));
  }
}
