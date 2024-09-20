import 'package:dashboard/core/networking/api_constants.dart';
import 'package:dashboard/features/main_screen/data/base_response.dart';
import 'package:dashboard/features/main_screen/data/categories.dart';
import 'package:dashboard/features/main_screen/data/product.dart';
import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.products)
  Future<BaseResponse> getAllProducts(
      @Query("limit") String limit, @Query("skip") String skip);

  @GET(ApiConstants.categories)
  Future<List<Categories>> getCategories();

  @GET("${ApiConstants.getCategory}{category}")
  Future<BaseResponse> getProductsbyCategory(@Path("category") String category,
      @Query("limit") String limit, @Query("skip") String skip);

  @POST(ApiConstants.addProduct)
  Future<Product> addProduct(@Body() Product product);
}
