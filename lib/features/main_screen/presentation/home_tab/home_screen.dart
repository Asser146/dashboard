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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: const Text(
              "Categories",
              // style: Theme.of(context).textTheme.titleLarge
            ),
          ),
          SizedBox(height: 8.h),
          TabsList(categories: context.read<HomeCubit>().categories),
          SizedBox(height: 8.h),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeStateInitial || state is HomeStateLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is HomeStateItems) {
                return ItemsCardsList(params: state.items); // Show products
              } else if (state is HomeStateError) {
                return Center(
                    child: Text('Error: ${state.error}')); // Show error
              } else {
                return SizedBox.shrink(); // Fallback
              }
            },
          )
        ],
      ),
    );
  }
}
