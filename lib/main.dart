import 'package:flutter/material.dart';
import 'package:flutter_unsplash_api_getx/view/home_view.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter Unsplash API Testing',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
