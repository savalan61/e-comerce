// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custome_shimmer/custome_shimmer.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalzation/controllers/delete_account_controller.dart';
import 'package:t_store/features/personalzation/controllers/user_controller.dart';
import 'package:t_store/features/personalzation/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../edit_profile/change_name_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final currentUser = UserController.instance.user;
    final deleteAccountController = Get.put(DeleteAccountController());
    final userCtrl = UserController.instance;
    return Scaffold(
        appBar: TAppbar(
          showBackArrow: true,
          title: Text("Profile"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Obx(() {
                        return userCtrl.imageUploading.value
                            ? TShimmerEffect(width: 80, height: 80, radius: 100)
                            : TCircularImage(
                                isDark: isDark,
                                image: currentUser.value.profilePicture.isNotEmpty
                                    ? currentUser.value.profilePicture
                                    : TImages.user,
                                isNetworkImage: currentUser.value.profilePicture.isNotEmpty,
                                width: 80,
                                height: 80);
                      }),
                      TextButton(
                          onPressed: () {
                            userCtrl.uploadUserProfileImage();
                          },
                          child: Text("Change profile picture")),
                    ],
                  ),
                ),

                /// -- Details
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// -- Heading Profile Info
                const TSectionHeading(title: 'Profile Information', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
                TProfileMenu(
                    title: 'Name',
                    value: currentUser.value.fullName,
                    onPressed: () => Get.to(() => ChangeNameScreen())),
                TProfileMenu(title: 'Username', value: currentUser.value.userName, onPressed: () {}),

                const SizedBox(height: TSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// -- Heading Personal Info
                const TSectionHeading(title: 'Personal Information', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
                //TProfileMenu(title: 'User ID', value: currentUser.id, onPressed: () {}),
                TProfileMenu(title: 'E-mail', value: currentUser.value.email, onPressed: () {}),
                TProfileMenu(title: 'Phone', value: currentUser.value.phoneNumber, onPressed: () {}),
                TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
                TProfileMenu(title: 'Date of Birth', value: '10 Oct, 1994', onPressed: () {}),
                Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
                Center(
                  child: TextButton(
                      // onPressed: () => Get.to(ReAuthLoginFormScreen()),
                      onPressed: () => deleteAccountController.deleteAccountWarningPopup(),
                      child: Text(
                        "Close account",
                        style: TextStyle(color: Colors.red),
                      )),
                )
              ],
            ),

            /// Details
          ),
        ));
  }
}
