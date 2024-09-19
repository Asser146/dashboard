import 'package:dashboard/core/routing/routes.dart';
import 'package:dashboard/core/widgets/item_card_list/item_card.dart';
import 'package:dashboard/features/main_screen/data/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemsCardsList extends StatelessWidget {
  const ItemsCardsList({
    super.key,
    required this.params,
  });

  final List<Product> params;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 15.h,
            childAspectRatio: 0.91,
          ),
          itemCount: params.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => Navigator.of(context, rootNavigator: true)
                  .pushNamed(Routes.details, arguments: params[index]),
              child: ItemCard(
                item: params[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
