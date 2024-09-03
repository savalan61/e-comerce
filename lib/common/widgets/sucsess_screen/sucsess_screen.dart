// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:t_store/common/styles/spacing_style.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.img,
      required this.title,
      required this.subTitle,
      required this.onPressed});
  final String img, title, subTitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: TSpacingStyle.paddingWithAppbarHeight * 2,
        child: Column(
          children: [
            Image(image: AssetImage(img), width: THelperFunctions.screenWidth() * .6),

            ///Title andSubtitle
            SizedBox(height: TSizes.spaceBtwSections),
            Text(title,
                style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
            SizedBox(height: TSizes.spaceBtwItems),
            Text(subTitle,
                style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
            SizedBox(height: TSizes.spaceBtwSections),

            ///Buttons
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: onPressed, child: Text(TTexts.tContinue))),
            SizedBox(height: TSizes.spaceBtwItems),
          ],
        ),
      ),
    ));
  }
}
