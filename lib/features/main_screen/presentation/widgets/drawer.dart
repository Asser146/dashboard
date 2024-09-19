import 'package:dashboard/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class OptionsDrawer extends StatelessWidget {
  const OptionsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsManager.darkPrimaryColor,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 6.w),
        children: [...buildsupportListTiles()],
      ),
    );
  }

  buildsupportListTiles() {
    List<Widget> supportWidgets = [
      Text(
        "Add Product",
        style: TextStyles.cardDetailsDarkMode,
      ),
      Text(
        "Delete Product",
        style: TextStyles.cardDetailsDarkMode,
      ),
      Text(
        "Update Product",
        style: TextStyles.cardDetailsDarkMode,
      ),
      //   DrawerListTile(
      //     onTap: () {},
      //     iconPath: 'assets/icons/asset 10.svg',
      //     title: AppStrings.support.tr(),
      //   ),
      //   DrawerListTile(
      //     onTap: () {},
      //     iconPath: 'assets/icons/asset 11.svg',
      //     title: AppStrings.tellAFriend.tr(),
      //   ),
      //   DrawerListTile(
      //     onTap: () {},
      //     iconPath: 'assets/icons/asset 12.svg',
      //     title: AppStrings.feedback.tr(),
      //   ),
      //   DrawerListTile(
      //     onTap: () {},
      //     iconPath: 'assets/icons/asset 13.svg',
      //     title: AppStrings.termsOfUse.tr(),
      //   ),
    ];
    return supportWidgets;
  }
}
