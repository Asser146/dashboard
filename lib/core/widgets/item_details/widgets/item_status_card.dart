import 'package:dashboard/core/theming/colors.dart';
import 'package:dashboard/core/theming/styles.dart';
import 'package:dashboard/core/widgets/item_details/item_details_cubit/item_details_cubit.dart';
import 'package:dashboard/features/main_screen/data/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemStatusCard extends StatelessWidget {
  const ItemStatusCard({
    super.key,
    required this.item,
  });

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: ColorsManager.secondaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
        ),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${item.price!}", style: TextStyles.buttonTextWhite),
              Text("Add to Cart", style: TextStyles.buttonTextWhite),
            ],
          ),
        ),
      ),
    );
  }
}
