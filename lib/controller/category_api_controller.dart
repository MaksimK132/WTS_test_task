import 'package:online_shop_app/controller/base_controller.dart';

class CategoryApiController extends BaseController {
  CategoryApiController({
    required String baseApiUrl,
    required String appKey,
  }) : super(baseApiUrl: baseApiUrl, appKey: appKey);

  Future<Map<String, dynamic>> fetchCategories() async {
    final apiUrl = '$baseApiUrl/category/list?appKey=$appKey';
    return fetchData(apiUrl);
  }
}
