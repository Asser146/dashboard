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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBody(item: item),
          const Spacer(),
          BottomBody(item: item),
        ],
      ),
    );
  }
}
