import 'package:dashboard/core/theming/styles.dart';
import 'package:dashboard/core/widgets/item_card_list/items_cards_list.dart';
import 'package:dashboard/features/main_screen/presentation/home_tab/home_cubit/home_cubit.dart';
import 'package:dashboard/features/main_screen/presentation/home_tab/widgets/tabs_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text("Categories", style: TextStyles.titleLargeDarkMode),
          ),
          SizedBox(height: 8.h),
          TabsList(categories: context.watch<HomeCubit>().categories),
          SizedBox(height: 8.h),
          ItemsCardsList(params: context.watch<HomeCubit>().categoryProducts),
          context.watch<HomeCubit>().isLoading
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: const CircularProgressIndicator(),
                )
              : const SizedBox.shrink(),
          context.watch<HomeCubit>().isDone
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Text("No More Products",
                      style: TextStyles.cardDetailsDarkMode),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
