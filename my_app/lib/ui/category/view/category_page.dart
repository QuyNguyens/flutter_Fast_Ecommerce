
import 'package:flutter/material.dart';
import 'package:my_app/ui/category/view/widget/category_app_bar.dart';
import 'package:my_app/ui/category/view/widget/category_feature.dart';
import 'package:my_app/ui/category/view/widget/category_list.dart';
import 'package:my_app/ui/category/view/widget/category_list_detail.dart';
import 'package:my_app/ui/category/view/widget/image_slider.dart';

class CategoryPage extends StatefulWidget{
  const CategoryPage({super.key});

  @override
  State<StatefulWidget> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>{

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CategoryAppBar(),
            const ImageSlider(heightImage: 170,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Categories",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CategoryListDetail()),
                    );
                  },
                  child: const Row(
                    children: [
                      Text(
                        "View More",
                        style: TextStyle(
                          color: Color.fromARGB(255, 231, 15, 116),
                          fontSize: 14,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        color: Color.fromARGB(255, 231, 15, 116),
                      ),
                    ],
                  ),
                ),
              ],
            )

            ),
            const CategoryList(),
            const CategoryFeature(title: "Most Popular Items"),
            const CategoryFeature(title: "Best Seller Items"),
            const CategoryFeature(title: "Hot Items"),
          ],
        ),
      ),
    );
  }
}