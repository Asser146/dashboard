import 'package:dashboard/core/routing/routes.dart';
import 'package:dashboard/core/widgets/item_card_list/item_card.dart';
import 'package:dashboard/features/main_screen/data/product.dart';
import 'package:dashboard/features/main_screen/presentation/home_tab/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          controller: context.watch<HomeCubit>().scrollController,
          itemBuilder: (BuildContext context, int index) {
            if (index < context.watch<HomeCubit>().allItems.length) {
              return GestureDetector(
                onTap: () => Navigator.of(context, rootNavigator: true)
                    .pushNamed(Routes.details, arguments: params[index]),
                child: ItemCard(
                  item: params[index],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
