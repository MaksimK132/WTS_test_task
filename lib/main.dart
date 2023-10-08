import 'package:flutter/material.dart';
import 'package:online_shop_app/congif/config.dart';
import 'package:online_shop_app/core.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<AppConfig>(
          create: (_) => AppConfig(
            baseApiUrl: 'http://ostest.whitetigersoft.ru/api/common',
            appKey:
                'phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF',
          ),
        ),
        Provider<AppTheme>(
          create: (_) => AppTheme(
            theme: ThemeData(
              primarySwatch: Colors.blueGrey,
              appBarTheme: const AppBarTheme(
                backgroundColor: Color.fromARGB(255, 23, 23, 23),
                centerTitle: true,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}
