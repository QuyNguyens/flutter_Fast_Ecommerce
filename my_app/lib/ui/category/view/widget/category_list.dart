import 'package:flutter/material.dart';
import 'package:my_app/ui/category/view/widget/category_list_items.dart';

class CategoryList extends StatefulWidget{
  const CategoryList({super.key});

  @override
  State<StatefulWidget> createState() => _CategoryListState();
}

class Categories{
  late String image;
  late String title;

  Categories(this.image,this.title);

  static List<Categories> categories = <Categories>[
    Categories("assets/images/laptop1.jpg", "Laptop"),
    Categories("assets/images/laptop1.jpg", "Mouse"),
    Categories("assets/images/laptop1.jpg", "Keyboard"),
    Categories("assets/images/laptop1.jpg", "Monitor"),
  ];
}
class _CategoryListState extends State<CategoryList>{

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(25)
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: Categories.categories.map((category){
          return GestureDetector(
            onTap: (){
               Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CategoryListItems(categories: category,)),
                    );
            },
            child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  category.image,
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,),
              ),
              const SizedBox(height: 5,),
              Text(category.title, style: const TextStyle( fontSize: 13),)
            ],
          ));
        }).toList(),
      ),
    );
  }
}