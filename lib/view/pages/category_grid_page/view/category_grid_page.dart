import 'package:flutter/material.dart';
import 'package:online_shop_app/controller/category_api_controller.dart';
import 'package:online_shop_app/model/entity/category.dart';
import 'package:online_shop_app/model/repositories/category_api.dart';
import 'package:online_shop_app/view/pages/category_grid_page/widget/category_grid_tile.dart';
import 'package:online_shop_app/view/pages/product_grid_page/view/product_list_page.dart';

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
      body: const CategoryGrid(),
    );
  }
}

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({super.key});

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  final CategoryApiController categoryController = CategoryApiController(
    baseApiUrl: 'http://ostest.whitetigersoft.ru/api/common',
    appKey:
        'phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF',
  );
  late Future<List<Category>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = categoryController.fetchCategories().then((data) {
      return CategoryDataProcessor().processCategories(data);
    });
  }

  _navigateToCategoryDetail(Category category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProductListPage(category: category),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: futureCategories,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final categories = snapshot.data!;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return CategoryGridTile(
                title: category.title,
                subtitle: 'Category ID: ${category.categoryId}',
                onTap: () => _navigateToCategoryDetail(category),
                imageUrl: category.imageUrl,
              );
            },
          );
        }
      },
    );
  }
}
