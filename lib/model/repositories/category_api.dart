import 'package:online_shop_app/model/entity/category.dart';
import 'package:online_shop_app/model/repositories/base_api.dart';

class CategoryDataProcessor extends BaseApi {
  List<Category> processCategories(Map<String, dynamic> data) {
    final List<dynamic> categoryList = data['data']['categories'];
    return categoryList.map((category) {
      return Category(
        categoryId: category['categoryId'],
        title: category['title'],
        imageUrl: category['imageUrl'],
        hasSubcategories: category['hasSubcategories'],
        fullName: category['fullName'],
        categoryDescription: category['categoryDescription'],
      );
    }).toList();
  }
}
