import 'package:online_shop_app/controller/base_controller.dart';

class ProductApiController extends BaseController {
  ProductApiController({
    required String baseApiUrl,
    required String appKey,
  }) : super(baseApiUrl: baseApiUrl, appKey: appKey);

  Future<Map<String, dynamic>> fetchProducts(int categoryId,
      {int offset = 1}) async {
    final apiUrl =
        '$baseApiUrl/product/list?categoryId=$categoryId&offset=$offset&appKey=$appKey';
    return fetchData(apiUrl);
  }
}
