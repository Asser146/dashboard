import 'package:dashboard/core/theming/colors.dart';
import 'package:dashboard/features/main_screen/data/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TopBody extends StatelessWidget {
  const TopBody({
    super.key,
    required this.item,
  });

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r)),
        color: Colors.white,
      ),
      child: Center(
        child: Image.network(
          item.images![0],
          height: 250.r,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
