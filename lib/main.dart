import 'package:dashboard/core/di/dependency_injection.dart';
import 'package:dashboard/core/routing/app_router.dart';
import 'package:dashboard/core/routing/routes.dart';
import 'package:dashboard/core/theming/theme_data.dart';
import 'package:dashboard/features/main_screen/data/product.dart';
import 'package:dashboard/features/main_screen/domain/hive_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();

  // await Hive.initFlutter();
  // Hive.registerAdapter(ProductAdapter());
  // HiveServices hiveServices = HiveServices();
  // await hiveServices.init();

  const storage = FlutterSecureStorage();

  // final String? token = await storage.read(key: "token");
  // final String initialRoute = token != null ? Routes.main : Routes.login;
  // Bloc.observer = CustomBlocObserver();

  runApp(MyApp(initialRoute: Routes.main));
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  final String initialRoute;

  MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          theme: lightThemeData,
          darkTheme: darkThemeData,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: _appRouter.generateRoute,
          initialRoute: Routes.main,
        );
      },
    );
  }
}
