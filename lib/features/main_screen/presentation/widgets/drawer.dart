import 'package:dashboard/core/routing/routes.dart';
import 'package:dashboard/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class OptionsDrawer extends StatelessWidget {
  const OptionsDrawer({super.key, required this.context});
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsManager.darkPrimaryColor,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
        children: [...buildsupportListTiles()],
      ),
    );
  }

  buildsupportListTiles() {
    List<Widget> supportWidgets = [
      GestureDetector(
        onTap: () async {
          Navigator.of(context).pushNamed(Routes.addProduct);
        },
        child: Text(
          "Add Product",
          style: TextStyles.cardDetailsDarkMode,
        ),
      ),
      SizedBox(height: 20.h),
      Text(
        "Delete Product",
        style: TextStyles.cardDetailsDarkMode,
      ),
      SizedBox(height: 20.h),
      Text(
        "Update Product",
        style: TextStyles.cardDetailsDarkMode,
      ),
      SizedBox(height: 20.h),
      Text(
        "Remove User",
        style: TextStyles.cardDetailsDarkMode,
      ),
      SizedBox(height: 20.h),
      Text(
        "Add Admin",
        style: TextStyles.cardDetailsDarkMode,
      ),
      SizedBox(height: 20.h),
      Text(
        "Remove Admin",
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
