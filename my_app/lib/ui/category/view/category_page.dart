
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget{
  const CategoryPage({super.key});

  State<StatefulWidget> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>{

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
          padding: EdgeInsets.all(20.0), // Padding cho toàn bộ GridView
          child: Text("this is category page")
    ));
  }
}