import 'package:flutter/material.dart';
import 'package:online_shop_app/congif/config.dart';
import 'package:online_shop_app/view/pages/category_grid_page/view/category_grid_page.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = Provider.of<AppConfig>(context);
    final theme = Provider.of<AppTheme>(context);

    return MaterialApp(
      title: 'Online shop app',
      theme: theme.theme,
      home: const CategoryGridPage(),
    );
  }
}
