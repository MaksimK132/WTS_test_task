import 'package:online_shop_app/model/entity/product.dart';
import 'package:online_shop_app/model/repositories/base_api.dart';

class ProductDataProcessor extends BaseApi {
  List<Product> processProducts(Map<String, dynamic> data) {
    final productList = processData(data);
    return productList.map((product) {
      return Product(
          title: product['title'],
          price: product['price'],
          imageUrl: product['imageUrl'] ??
              'https://cdn.trinixy.ru/pics6/20220926/231781_1_trinixy_ru.jpg',
          productDescription: product['productDescription'],
          rating: product['rating'],
          isAvailableForSale: product['isAvailableForSale']);
    }).toList();
  }
}
