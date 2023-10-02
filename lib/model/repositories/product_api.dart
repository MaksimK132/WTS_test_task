import 'dart:convert';
import 'package:online_shop_app/model/product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProducts(int categoryId, {int page = 1}) async {
  final response = await http.get(Uri.parse(
      'http://ostest.whitetigersoft.ru/api/common/product/list?categoryId=$categoryId&page=$page&appKey=phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);

    final List<dynamic> productList = data['data'];

    return productList.map((product) {
      return Product(
          title: product['title'],
          price: product['price'],
          imageUrl: product['imageUrl'] ??
              'https://cdn.trinixy.ru/pics6/20220926/231781_1_trinixy_ru.jpg');
    }).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
