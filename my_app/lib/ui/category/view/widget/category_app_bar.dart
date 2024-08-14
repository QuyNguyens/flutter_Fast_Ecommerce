import 'package:flutter/material.dart';
import 'package:my_app/app.dart';
import 'package:my_app/ui/category/view/widget/search_bar.dart';

class CategoryAppBar extends StatefulWidget{
  const CategoryAppBar({super.key});

  @override
  State<StatefulWidget> createState() => _CategoryAppBarState();
}

class _CategoryAppBarState extends State<CategoryAppBar>{

   @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: App.seedColor, // Màu nền của CategoryAppBar
        borderRadius: BorderRadius.circular(20), // Bo góc với bán kính 5
      ),
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20), // Padding xung quanh nội dung
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset('assets/images/ecommerceIcon.jpg', fit: BoxFit.cover),
                    )
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Delivery to fast', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      Text("Welcome to my shop", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 218, 3, 103),
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: () {},
                icon: const Icon(Icons.add_shopping_cart_outlined, color: Colors.white),
              )
            ],
          ),
          const SizedBox(height: 10),
          const SearchAppBar(),
        ],
      ),
    );
  }
}