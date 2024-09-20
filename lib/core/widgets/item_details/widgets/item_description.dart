import 'package:dashboard/core/theming/colors.dart';
import 'package:dashboard/core/widgets/item_details/widgets/item_brief.dart';
import 'package:dashboard/core/widgets/item_details/widgets/quantity_card.dart';
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
        padding:
            EdgeInsets.only(left: 10.w, bottom: 10.h, top: 20.h, right: 10.w),
        child: Column(
          children: [
            Text(
              item.title ?? 'No Title',
              // style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              children: [
                Text(
                  "\$${item.price?.toStringAsFixed(2) ?? 'N/A'}",
                  style: const TextStyle(color: ColorsManager.secondaryColor),
                ),
              ],
            ),
            QuantityCard(stock: item.stock ?? 0),
            ItemBrief(item: item),
            // ItemStatusCard(item: item),
          ],
        ),
      ),
    );
  }
}
