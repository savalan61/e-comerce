import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalzation/screens/address/address.dart';
import 'package:t_store/features/personalzation/screens/profile/profile.dart';
import 'package:t_store/features/shop/screens/order/order.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../data/dummy_data.dart';
import '../../../../data/repositories/product/product_repository.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);
    final authRepo = AuthenticationRepository.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                /// Appbar
                TAppbar(
                    title: Text(
                  "Account",
                  style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),
                )),

                ///User Profile Card
                TUserProfileTile(
                  isDark: isDark,
                  onPressed: () => Get.to(() => const ProfileScreen()),
                ),
                const SizedBox(height: TSizes.spaceBtwSections)
              ],
            )),

            /// -- Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Settings
                  const TSectionHeading(title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subTitle: 'Set shopping delivery address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  const TSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout'),
                  TSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress and Completed Orders',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  const TSettingsMenuTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subTitle: 'Withdraw balance to registered bank account'),
                  const TSettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subTitle: 'List of all the discounted coupons'),
                  const TSettingsMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subTitle: 'Set any kind of notification message'),
                  const TSettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage and connected accounts'),

                  /// -- App Settings
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(title: 'App Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload Data to your Cloud Firebase',
                    onTap: () {
                      ///TODO
                      uploadProducts();

                      ///***************************************888888877777777774444444445555
                    },
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ), // TSettingsMenuTile
                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ), // TSettingsMenuTile
                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ), // TSettingsMenuTile

                  /// Log Out Button
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () {
                            authRepo.logout();
                          },
                          child: const Text("Logout"))),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void uploadProducts() async {
  if (kDebugMode) {}
  try {
    await uploadDummyData(TDummyData.products);
    // await uploadBrandsData(TDummyData.dummyBrands);
    if (kDebugMode) {
      print("Products uploaded successfully!");
    }
  } catch (e) {
    if (kDebugMode) {
      print("Error uploading products: $e");
    }
  }
}

//
// Future<void> sendToFirebase(List<ProductModel> dummyData) async {
//   CollectionReference brandCategoriesRef = FirebaseFirestore.instance.collection('Products');
//
//   for (var brandCategory in dummyData) {
//     try {
//       await brandCategoriesRef.add(brandCategory.toJson());
//     } catch (e) {
//       print(' ************* Error:$e');
//     }
//   }
// }

// Future<void> uploadProducts(List<ProductModel> products) async {
//   final db = FirebaseFirestore.instance;
//   final storage = Get.put(TFirebaseStorageService());
//
//   try {
//     for (var product in products) {
//       // دریافت URL تصویر thumbnail
//       final file = await storage.getImageDataFromAssets(product.thumbnail);
//       final thumbnailUrl = await storage.uploadImageData("Products", file, product.title);
//
//       // به‌روزرسانی thumbnail به URL
//       product.thumbnail = thumbnailUrl;
//
//       // برای هر تصویر در product.images
//       List<String> imageUrls = [];
//       for (var image in product.images ?? []) {
//         final imageFile = await storage.getImageDataFromAssets(image);
//         final imageUrl = await storage.uploadImageData("Products", imageFile, product.title);
//         imageUrls.add(imageUrl);
//       }
//
//       // به‌روزرسانی لیست تصاویر
//       product.images = imageUrls;
//
//       // افزودن محصول به Firestore
//       await db.collection("Products").add(product.toJson());
//     }
//   } on FirebaseException catch (e) {
//     throw TFirebaseException(e.code).message;
//   } on PlatformException catch (e) {
//     throw TPlatformException(e.code).message;
//   } catch (e) {
//     throw 'Error uploading products: $e';
//   }
// }
