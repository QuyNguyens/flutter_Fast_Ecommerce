import 'package:flutter/material.dart';
import 'package:my_app/app.dart';
import 'package:my_app/ui/category/view/widget/category_feature_item.dart';
import 'package:my_app/ui/category/view/widget/category_list.dart';

class CategoryFeature extends StatefulWidget{
  final String title;
  const CategoryFeature({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _CategoryFeatureState();
}

class _CategoryFeatureState extends State<CategoryFeature>{

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Row(
                children: [
                  Text(
                    "View More",
                    style: TextStyle(
                      color: App.seedColor,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_outlined,
                    color: App.seedColor,
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (1 / 1.2),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: Categories.categories.map((category) {
                return CategoryFeatureItem(categories: category);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }


}