import 'package:flutter/material.dart';
import 'package:online_shop_app/model/category.dart';
import 'package:online_shop_app/model/repositories/category_api.dart';
import 'package:online_shop_app/view/pages/product_grid_page/view/product_page_screen.dart';

class CategoryGridWidgetPage extends StatefulWidget {
  const CategoryGridWidgetPage({Key? key}) : super(key: key);

  @override
  _CategoryGridWidgetPageState createState() => _CategoryGridWidgetPageState();
}

class _CategoryGridWidgetPageState extends State<CategoryGridWidgetPage> {
  late Future<List<Category>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = fetchCategories();
  }

  _navigateToCategoryDetail(Category category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CategoryDetailScreen(category: category),
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
              return GestureDetector(
                onTap: () => _navigateToCategoryDetail(category),
                child: GridTile(
                  footer: GridTileBar(
                    title: Text(category.title),
                    backgroundColor: Colors.black54,
                  ),
                  child: Image.network(
                    'https://www.jtcrussia.ru/product_pictures/clean/ba8/248941.jpg',
                    width: 100,
                    height: 100,
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
