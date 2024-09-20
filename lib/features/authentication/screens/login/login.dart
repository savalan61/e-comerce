// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/styles/spacing_style.dart';
import 'package:t_store/common/widgets/login_signup/form_divider.dart';
import 'package:t_store/common/widgets/login_signup/social_buttons.dart';
import 'package:t_store/features/authentication/screens/login/widgets/Logine_header.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppbarHeight,
          child: Column(
            children: [
              TLoginHeader(),

              TLoginForm(),

              /// Divider
              // TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),

              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Footer
              // TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
