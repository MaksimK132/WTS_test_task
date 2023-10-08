import 'package:flutter/material.dart';
import 'package:online_shop_app/controller/product_api_controller.dart';
import 'package:online_shop_app/model/entity/category.dart';
import 'package:online_shop_app/model/entity/product.dart';
import 'package:online_shop_app/model/repositories/product_api.dart';
import 'package:online_shop_app/view/pages/product_grid_page/widget/product_list_tile.dart';

class ProductListPage extends StatefulWidget {
  final Category category;

  ProductListPage({required this.category});

  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<ProductListPage> {
  final ProductApiController productController = ProductApiController(
    baseApiUrl: 'http://ostest.whitetigersoft.ru/api/common',
    appKey:
        'phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF',
  );

  late ScrollController _scrollController;
  bool _isLoading = false;
  bool _hasMore = true;
  int _offset = 1;
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _loadProducts();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    final screenHeight = MediaQuery.of(context).size.height;
    final currentPosition = _scrollController.position.pixels;
    final maxScroll = _scrollController.position.maxScrollExtent;

    if (maxScroll - currentPosition <= screenHeight &&
        !_isLoading &&
        _hasMore) {
      _loadProducts();
    }
  }

  Future<void> _loadProducts() async {
    if (_isLoading || !_hasMore) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final Map<String, dynamic> data = await productController.fetchProducts(
        widget.category.categoryId,
        offset: _offset,
      );

      final List<Product> newProducts =
          ProductDataProcessor().processProducts(data);

      if (newProducts.isEmpty) {
        _hasMore = false;
      } else {
        _products.addAll(newProducts);
        _offset++;
      }
    } catch (e) {
      debugPrint('Error loading products: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.title),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _products.length + (_isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < _products.length) {
            final product = _products[index];
            return ProductListTile(
              title: product.title,
              price: product.price,
              imageUrl: product.imageUrl,
            );
          } else if (_hasMore) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Center(child: CircularProgressIndicator()),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
