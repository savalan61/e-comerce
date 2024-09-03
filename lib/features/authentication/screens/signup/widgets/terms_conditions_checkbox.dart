// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:t_store/features/authentication/controllers/signup/signup_controller.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TTermsAndConditionCheckbox extends StatelessWidget {
  const TTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);
    final signupCtrl = SignupController.instance;
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(() {
            return Checkbox(
              value: signupCtrl.privacyPolicyCheckBox.value,
              onChanged: (value) {
                signupCtrl.privacyPolicyCheckBox.value = !signupCtrl.privacyPolicyCheckBox.value;
              },
            );
          }),
        ),
        SizedBox(width: TSizes.spaceBtwItems),
        Text.rich(TextSpan(children: [
          TextSpan(text: '${TTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: TTexts.privacyPolicy,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: isDark ? TColors.white : TColors.black,
                  decoration: TextDecoration.underline,
                  decorationColor: isDark ? TColors.white : TColors.black)),
          TextSpan(text: ' ${TTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: TTexts.termsOfUse,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: isDark ? TColors.white : TColors.black,
                  decoration: TextDecoration.underline,
                  decorationColor: isDark ? TColors.white : TColors.black)),
        ]))
      ],
    );
  }
}
