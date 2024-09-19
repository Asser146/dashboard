import 'package:dashboard/core/widgets/item_card_list/bottom_body.dart';
import 'package:dashboard/core/widgets/item_card_list/top_body.dart';
import 'package:dashboard/features/main_screen/data/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCard extends StatelessWidget {
  final Product item;

  const ItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15.r),
        ),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TopBody(item: item),
          SizedBox(height: 3.w),
          Center(
            child: Text(
              item.title!,
              style: Theme.of(context).textTheme.labelMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${item.price!.toStringAsFixed(2)} \$",
                  style: Theme.of(context).textTheme.labelSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                const Icon(Icons.star, color: Colors.orangeAccent),
                SizedBox(width: 1.w),
                Text(
                  "${item.rating!}",
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
