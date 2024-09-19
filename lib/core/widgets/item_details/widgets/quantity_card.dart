import 'package:dashboard/core/theming/styles.dart';
import 'package:dashboard/features/main_screen/data/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityCard extends StatelessWidget {
  final Product item;

  const QuantityCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              const Text(
                'Quantity',
                // style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              SizedBox(width: 20.w),
              Text(
                "10",
                style: TextStyles.buttonTextWhite,
              ),
              SizedBox(width: 20.w),
            ],
          ),
        ),
      ),
    );
  }
}
