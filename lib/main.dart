import 'package:flutter/material.dart';
import 'package:online_shop_app/view/pages/category_grid_page/view/category_page_screen.dart';
import 'package:online_shop_app/view/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online shop app',
      theme: theme,
      home: const CategoryGridPage(),
    );
  }
}
