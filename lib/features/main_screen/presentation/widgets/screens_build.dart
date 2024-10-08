import 'package:dashboard/core/di/dependency_injection.dart';
import 'package:dashboard/features/main_screen/domain/product_repository.dart';
import 'package:dashboard/features/main_screen/presentation/home_tab/home_cubit/home_cubit.dart';
import 'package:dashboard/features/main_screen/presentation/home_tab/home_screen.dart';
import 'package:dashboard/features/main_screen/presentation/profile_tab/cubit/profile_cubit.dart';
import 'package:dashboard/features/main_screen/presentation/profile_tab/profile_screen.dart';
import 'package:dashboard/features/main_screen/presentation/search_tab/cubit/search_cubit.dart';
import 'package:dashboard/features/main_screen/presentation/search_tab/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<Widget> screenBuild() {
  return [
    BlocProvider(
      create: (context) => HomeCubit(getIt<ProductRepository>())..homeInit(),
      child: const HomeScreen(),
    ),
    BlocProvider(
      create: (context) => SearchCubit(getIt<ProductRepository>()),
      child: const SearchScreen(),
    ),
    BlocProvider(
      create: (context) => ProfileCubit(),
      child: const ProfileScreen(),
    ),
  ];
}
