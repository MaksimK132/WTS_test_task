class Product {
  final String title;
  final int price;
  final String imageUrl;
  final String? productDescription;
  final double? rating;
  final int isAvailableForSale;

  Product({
    required this.title,
    required this.price,
    required this.imageUrl,
    this.productDescription,
    this.rating,
    required this.isAvailableForSale,
  });
}
