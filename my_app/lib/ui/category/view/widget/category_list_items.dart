import 'package:flutter/material.dart';
import 'package:my_app/app.dart';
import 'package:my_app/ui/category/view/widget/category_list.dart';
import 'package:my_app/ui/category/view/widget/detail_product.dart';
import 'package:my_app/ui/category/view/widget/search_bar.dart';

// ignore: must_be_immutable
class CategoryListItems extends StatefulWidget{

  late Categories categories;
  CategoryListItems({super.key, required this.categories});

  @override
  State<StatefulWidget> createState() => _CategoryListItemsState();
}

class _CategoryListItemsState extends State<CategoryListItems>{

  late int selectedCategory = Categories.categories.indexOf(widget.categories);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categories.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: App.seedColor,
              borderRadius: BorderRadius.circular(15)
            ),
            padding:const EdgeInsets.all(10),
            child: const SearchAppBar(),
          ),
          const SizedBox(height: 5,),
          const Divider(
            color: Colors.black12,
            thickness: 2,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Categories.categories.length,
              itemBuilder: (context, index){
                return GestureDetector( 
                    onTap: () => _selectCategoryBorder(index),
                    child: Row( children: [ Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: selectedCategory == index ? const Color.fromARGB(255, 218, 3, 103) : const Color.fromARGB(255, 146, 134, 134),
                          width: selectedCategory == index ? 2 : 1,
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Center(
                      child: Text(Categories.categories[index].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: selectedCategory == index ? const Color.fromARGB(255, 218, 3, 103) : Colors.black87),),
                    ),
                  ),const SizedBox(width: 10,),]));
              },
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 244, 245, 241),
              ),
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 2.7,
                children: Categories.categories.map((category) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailProduct(categories: category,)),
                    );
                    },
                    child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:const EdgeInsets.all(10),
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 170,
                          child: Stack(
                            children: [
                              Image.asset(category.image),
                              Positioned(
                                left: 5,
                                top: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: App.seedColor,
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  padding: const EdgeInsets.all(3),
                                  child: const Text(
                                    "-50%",
                                    style: TextStyle(fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "Remex RB-S10 Bluetooth Music In-Ear Earphone",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  softWrap: true,
                                  maxLines: 2,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.star, size: 15, color: Colors.amber),
                                      SizedBox(width: 5),
                                      Text("4.5", style: TextStyle(fontWeight: FontWeight.bold)),
                                      SizedBox(width: 5),
                                      Text("(1.5K)", style: TextStyle(color: Color.fromARGB(255, 159, 245, 196))),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("321"),
                                      SizedBox(width: 5),
                                      Text("Sold", style: TextStyle(color: Color.fromARGB(255, 159, 245, 196))),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text("\$15.00", style: TextStyle(color: Color.fromARGB(255, 255, 7, 106))),
                                  SizedBox(width: 5),
                                  Text("\$26.00", style: TextStyle(color: Color.fromARGB(255, 149, 136, 141), decoration: TextDecoration.lineThrough)),
                                ],
                              ),
                            ],
                          )),
                      ],
                    ),
                  ));
                }).toList(),
              ),
            ),
          )
        ],
      )
    );
  }

  void _selectCategoryBorder(int index){
    Categories newCategories = Categories(Categories.categories[index].image, Categories.categories[index].title);
    setState(() {
      selectedCategory = index;
      widget.categories = newCategories;
    });
  }

}