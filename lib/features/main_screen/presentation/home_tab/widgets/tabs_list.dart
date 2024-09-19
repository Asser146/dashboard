import 'package:dashboard/core/theming/colors.dart';
import 'package:dashboard/features/main_screen/presentation/home_tab/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabsList extends StatelessWidget {
  const TabsList({
    super.key,
    required this.categories,
  });

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: TabBar(
        onTap: (index) {
          context.read<HomeCubit>().changeTab(index);
        },
        isScrollable: true,
        tabAlignment: TabAlignment.center,
        dividerColor: Colors.transparent, // Removes the default line indicator
        unselectedLabelColor: Theme.of(context).cardColor,
        indicator: const BoxDecoration(), // Removes the default indicator
        tabs: categories.map(
          (category) {
            final isSelected = categories.indexOf(category) ==
                context.watch<HomeCubit>().currentTabIndex;
            return Tab(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: isSelected
                      ? ColorsManager.secondaryColor
                      : Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    // fontSize: 16.sp,
                    color: isSelected
                        ? Colors.white
                        : Theme.of(context).disabledColor,
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
