import 'package:dashboard/core/routing/routes.dart';
import 'package:dashboard/core/widgets/item_details/item_details_screen.dart';
import 'package:dashboard/features/auth/login_cubit/login_cubit.dart';
import 'package:dashboard/features/auth/login_screen.dart';
import 'package:dashboard/features/auth/register_screen.dart';
import 'package:dashboard/features/main_screen/data/product.dart';
import 'package:dashboard/features/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(),
                  child: const LoginScreen(),
                ));
      case Routes.register:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(),
                  child: const RegisterScreen(),
                ));
      case Routes.details:
        final Product item = settings.arguments as Product;
        return MaterialPageRoute(
            builder: (_) => ItemDetailsScreen(item: item), settings: settings);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
