import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const JobSlateApp());
}

class JobSlateApp extends StatelessWidget {
  const JobSlateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'JobSlate',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
    );
  }
}
