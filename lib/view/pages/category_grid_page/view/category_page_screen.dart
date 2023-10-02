import 'package:flutter/material.dart';
import 'package:online_shop_app/view/pages/category_grid_page/widget/widgets.dart';

class CategoryGridPage extends StatefulWidget {
  const CategoryGridPage({super.key});

  @override
  State<CategoryGridPage> createState() => _CategoryGridPageState();
}

class _CategoryGridPageState extends State<CategoryGridPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
      ),
      body: const CategoryGridWidgetPage(),
    );
  }
}
