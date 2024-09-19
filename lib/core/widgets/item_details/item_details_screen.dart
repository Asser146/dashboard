import 'package:dashboard/core/widgets/item_details/widgets/item_description.dart';
import 'package:dashboard/core/widgets/my_app_bar.dart';
import 'package:dashboard/features/main_screen/data/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key, required this.item});
  final Product item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 300.h,
            width: double.infinity,
            child: Image.network(
              item.images![0],
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: ItemDescription(item: item),
          ),
        ],
      ),
    );
  }
}
