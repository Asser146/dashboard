import 'package:dashboard/core/widgets/item_card_list/items_cards_list.dart';
import 'package:dashboard/features/main_screen/presentation/search_tab/cubit/search_cubit.dart';
import 'package:dashboard/features/main_screen/presentation/search_tab/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          SizedBox(height: 10.h),
          const SearchTextField(),
          SizedBox(height: 15.h),
          context.watch<SearchCubit>().filteredItems.isEmpty
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/search 1.png',
                        width: 150.w,
                        height: 100.h,
                      ),
                      SizedBox(height: 10.h),
                      BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, state) {
                          if (state is SearchInitial) {
                            return Text("Search for products",
                                style: Theme.of(context).textTheme.bodyMedium);
                          } else if (state is SearchEmpty) {
                            return Text("No Result Found",
                                style: Theme.of(context).textTheme.bodyMedium);
                          } else {
                            return Text("Loading...",
                                style: Theme.of(context).textTheme.bodyMedium);
                          }
                        },
                      )
                    ],
                  ),
                )
              : ItemsCardsList(
                  list: context.watch<SearchCubit>().filteredItems,
                  controller: context.watch<SearchCubit>().scrollController)
        ],
      ),
    );
  }
}
