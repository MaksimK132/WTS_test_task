import 'package:flutter/material.dart';

class AppConfig {
  final String baseApiUrl;
  final String appKey;

  AppConfig({required this.baseApiUrl, required this.appKey});
}

class AppTheme {
  final ThemeData theme;

  AppTheme({required this.theme});
}

class AppData {
  final AppConfig config;
  final AppTheme theme;

  AppData({required this.config, required this.theme});
}
