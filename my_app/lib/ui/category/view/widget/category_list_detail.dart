import 'package:flutter/material.dart';
import 'package:my_app/ui/category/view/widget/category_list.dart';
import 'package:my_app/ui/category/view/widget/category_list_items.dart';

class CategoryListDetail extends StatefulWidget{
  const CategoryListDetail({super.key});

  @override
  State<StatefulWidget> createState() => _CategoryListDetailState();
}

class _CategoryListDetailState extends State<CategoryListDetail>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Categories"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 239, 233, 233),
          borderRadius: BorderRadius.circular(15)
        ),
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: (1 / 1.2),
          children: Categories.categories.map((category){
              return GestureDetector(
                onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CategoryListItems(categories: category,)),
                    );
                  },
                child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                    color: const Color.fromARGB(255, 218, 3, 103),
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.all(5),
                child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      height: 71,
                      child: Image.asset(category.image, fit: BoxFit.cover)),
                  ),
                  const SizedBox(height: 5,),
                  Text(category.title),
                ],
              ),
              ));
          }).toList(),
        ),
      )
    );
  }
}