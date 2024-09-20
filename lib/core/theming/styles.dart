import 'package:dashboard/core/theming/colors.dart';
import 'package:dashboard/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle cardDetailsDarkMode = TextStyle(
    fontSize: 5.sp,
    fontFamily: 'Circular Std',
    color: Colors.white,
  );
  static TextStyle cardDetailsLightMode =
      cardDetailsDarkMode.copyWith(color: Colors.black);

  static TextStyle cardSmallLabelDarkMode = TextStyle(
    fontSize: 5.sp,
    fontFamily: 'Circular Std',
    fontWeight: FontWeightHelper.medium,
    color: Colors.white,
  );
  static TextStyle cardSmallLabelLightMode =
      cardSmallLabelDarkMode.copyWith(color: Colors.black);

  static TextStyle titleLargeDarkMode = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: 'Circular Std',
    color: Colors.white,
  );
  static TextStyle titleLargeLightMode =
      titleLargeDarkMode.copyWith(color: Colors.black);

  static TextStyle buttonTextWhite = TextStyle(
    fontSize: 5.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: 'Circular Std',
    color: Colors.white,
  );
  static TextStyle font14darkrBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );
  static TextStyle hintTextLightMode = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: 'Circular Std',
    color: Colors.black,
  );
  static TextStyle hintTextDarkMode =
      hintTextLightMode.copyWith(color: Colors.white);

  static TextStyle cartDetailsLightMode = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: 'Circular Std',
    color: ColorsManager.cartDetailsLightColor,
  );
  static TextStyle cartDetailsDarkMode =
      cartDetailsLightMode.copyWith(color: ColorsManager.cartDetailsDarkColor);
}
