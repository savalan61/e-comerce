// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:t_store/utils/device/device_utility.dart';

import '../../../utils/constants/colors.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({
    super.key,
    required this.isDark,
    required this.tabs,
  });

  final bool isDark;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isDark ? TColors.black : TColors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
        labelColor: isDark ? TColors.white : TColors.primary,
        tabs: tabs,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight() - 8);
}
