import 'package:dashboard/core/theming/colors.dart';
import 'package:dashboard/features/main_screen/data/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({
    super.key,
    required this.item,
  });

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title!,
                // style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  for (int i = 0; i < 5; i++)
                    Icon(
                      item.rating! >= i + 1 ? Icons.star : Icons.star_border,
                      color: item.rating! >= i + 1
                          ? ColorsManager.starColor
                          : Colors.grey[600],
                    ),
                ],
              ),
              SizedBox(height: 15.h),
              Text(
                item.description!,
                // style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
