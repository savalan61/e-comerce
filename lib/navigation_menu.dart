// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalzation/screens/settings/settings.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/features/shop/screens/store/store.dart';
import 'package:t_store/features/shop/screens/wishList/wishlist.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final navigationController = Get.put(NavigationController());
    return Scaffold(bottomNavigationBar: Obx(() {
      return NavigationBar(
        backgroundColor: isDark ? TColors.black : TColors.white,
        indicatorColor: isDark ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
        height: 80,
        selectedIndex: navigationController.selectedIndex.value,
        onDestinationSelected: (value) => navigationController.selectedIndex.value = value,
        elevation: 0,
        destinations: [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
          NavigationDestination(icon: Icon(Iconsax.heart), label: 'WishList'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
        ],
      );
    }), body: Obx(() {
      return navigationController.screens[navigationController.selectedIndex.value];
    }));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomeScreen(),
    StoreScreen(),
    WishlistScreen(),
    SettingsScreen(),
  ];
}
