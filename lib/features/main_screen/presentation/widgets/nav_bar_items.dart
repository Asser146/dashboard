import 'package:dashboard/core/theming/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

List<PersistentBottomNavBarItem> navBarsItems(Color hintColor) {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.home),
      title: "Home",
      iconSize: 7.sp,
      activeColorPrimary: ColorsManager.secondaryColor,
      inactiveColorPrimary: hintColor,
    ),
    // PersistentBottomNavBarItem(
    //   icon: const Icon(CupertinoIcons.search),
    //   title: "Search",
    //   activeColorPrimary: ColorsManager.secondaryColor,
    //   inactiveColorPrimary: hintColor,
    // ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.person),
      title: "Profile",
      iconSize: 7.sp,
      activeColorPrimary: ColorsManager.secondaryColor,
      inactiveColorPrimary: hintColor,
    ),
  ];
}
