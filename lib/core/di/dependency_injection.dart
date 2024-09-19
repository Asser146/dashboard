import 'package:dashboard/core/networking/api_service.dart';
import 'package:dashboard/core/networking/dio_factory.dart';
import 'package:dashboard/features/main_screen/domain/hive_services.dart';
import 'package:dashboard/features/main_screen/domain/product_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepository());
  // getIt.registerLazySingleton<HiveServices>(() => HiveServices());
}
