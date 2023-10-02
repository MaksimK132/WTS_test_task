import 'package:flutter/material.dart';
import 'package:online_shop_app/model/category.dart';
import 'package:online_shop_app/model/product.dart';
import 'package:online_shop_app/model/repositories/product_api.dart';

class CategoryDetailScreen extends StatefulWidget {
  final Category category;

  CategoryDetailScreen({required this.category});

  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetailScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  bool _hasMore = true;
  int _page = 1;
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (!_isLoading && _hasMore) {
        _loadProducts();
      }
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
      final List<Product> newProducts = await fetchProducts(
        widget.category.categoryId,
        page: _page,
      );

      if (newProducts.isEmpty) {
        _hasMore = false;
      } else {
        _products.addAll(newProducts);
        _page++;
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
            return ListTile(
              title: Text(product.title),
              subtitle: Text('Price: ${product.price}'),
              trailing: Image.network(
                  'https://www.jtcrussia.ru/product_pictures/clean/ba8/248941.jpg'),
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
