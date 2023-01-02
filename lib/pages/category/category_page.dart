import 'package:flutter/material.dart';
import 'package:flutter_prj_1/pages/category/widgets/category_widget.dart';

// pure ui widget, so no ValueListenableBuilder wrapper

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    print('[CategoryPage] build');
    return const Scaffold(
      body: CategoryWidget(),
    );
  }
}
