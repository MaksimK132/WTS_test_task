import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_shop_app/model/category.dart';

Future<List<Category>> fetchCategories() async {
  final response = await http.get(Uri.parse(
      'http://ostest.whitetigersoft.ru/api/common/category/list?appKey=phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);

    final List<dynamic> categoryList = data['data']['categories'];

    return categoryList.map((category) {
      return Category(
        categoryId: category['categoryId'],
        title: category['title'],
        imageUrl: category['imageUrl'],
      );
    }).toList();
  } else {
    throw Exception('Failed to load categories');
  }
}
