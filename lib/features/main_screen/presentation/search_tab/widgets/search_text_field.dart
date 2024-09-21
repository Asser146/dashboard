import 'package:dashboard/core/theming/colors.dart';
import 'package:dashboard/features/main_screen/presentation/search_tab/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 100.w),
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextField(
              cursorColor: ColorsManager.addColor,
              onChanged: (query) {
                context.read<SearchCubit>().search(query); // Only pass query
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Type to Search ...',
                hintStyle: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
