import 'package:dashboard/core/theming/colors.dart';
import 'package:dashboard/core/widgets/item_details/item_details_cubit/item_details_cubit.dart';
import 'package:dashboard/features/main_screen/data/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityButton extends StatelessWidget {
  final int direction;
  final Product item;

  const QuantityButton({
    super.key,
    required this.direction,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.read<ItemDetailsCubit>().toggleQuantity(item, direction),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ColorsManager.secondaryColor,
        ),
        padding: EdgeInsets.all(5.r),
        child: Icon(
          direction > 0 ? Icons.add : Icons.remove,
          color: Theme.of(context).disabledColor,
          size: 25.sp,
        ),
      ),
    );
  }
}
