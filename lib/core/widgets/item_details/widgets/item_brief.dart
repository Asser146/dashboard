import 'package:dashboard/core/theming/colors.dart';
import 'package:dashboard/features/main_screen/data/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemBrief extends StatelessWidget {
  const ItemBrief({
    super.key,
    required this.item,
  });

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),
            Text(
              item.description ?? 'No Description Available',
              // style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10.h),
            Row(
              children: List.generate(5, (i) {
                return Icon(
                  item.rating! >= i + 1 ? Icons.star : Icons.star_border,
                  color: item.rating! >= i + 1
                      ? ColorsManager.starColor
                      : Colors.grey[600],
                );
              }),
            ),
            SizedBox(height: 10.h),

            // Display reviews if available
            if (item.reviews != null && item.reviews!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: item.reviews!.map((review) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              review.reviewerName ?? 'No Name Available',
                              // style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              review.reviewerEmail ?? 'No Email Available',
                              // style: Theme.of(context).textTheme.bodySmall,
                            ),
                            SizedBox(width: 3.w),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          review.comment ?? 'No Comment Available',
                          // style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Row(
                          children: List.generate(5, (i) {
                            return Icon(
                              review.rating! >= i + 1
                                  ? Icons.star
                                  : Icons.star_border,
                              color: review.rating! >= i + 1
                                  ? ColorsManager.starColor
                                  : Colors.grey[600],
                              size: 5.sp,
                            );
                          }),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              )
            else
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: const Text('No reviews available.'),
              ),
          ],
        ),
      ),
    );
  }
}
