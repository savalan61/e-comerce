import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validation.dart';
import '../../controllers/delete_account_controller.dart';

class ReAuthLoginFormScreen extends StatelessWidget {
  const ReAuthLoginFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final deleteCtrl = DeleteAccountController.instance;
    final deleteCtrl = Get.put(DeleteAccountController());
    return Scaffold(
      appBar: const TAppbar(
        showBackArrow: true,
        title: Text("Re-Authentication User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Use real name for easy verification. This name will appear on several pages.",
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: TSizes.spaceBtwSections),
            Form(
                key: deleteCtrl.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: deleteCtrl.email,
                      validator: (value) => TValidator.validateEmptyText("Email", value),
                      expands: false,
                      decoration:
                          const InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    Obx(() {
                      return TextFormField(
                        controller: deleteCtrl.password,
                        obscureText: deleteCtrl.showPass.value,
                        validator: (value) => TValidator.validateEmptyText("Password", value),
                        expands: false,
                        decoration: InputDecoration(
                            labelText: TTexts.password,
                            prefixIcon: const Icon(Iconsax.key),
                            suffixIcon: IconButton(
                              icon: deleteCtrl.showPass.value ? const Icon(Iconsax.eye) : const Icon(Iconsax.eye_slash),
                              onPressed: () => deleteCtrl.showPass.value = !deleteCtrl.showPass.value,
                            )),
                      );
                    })
                  ],
                )),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    deleteCtrl.formKey.currentState!.validate() ? deleteCtrl.deleteReAuthenticatedUser() : null;
                  },
                  child: const Text("Delete Account")),
            )
          ],
        ),
      ),
    );
  }
}
