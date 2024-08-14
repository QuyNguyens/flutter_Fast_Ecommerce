import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget{
  
  const SearchAppBar({super.key});

  @override
  State<StatefulWidget> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar>{

  @override
  Widget build(BuildContext context) {
    
    return Container(
            height: 55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child:const Row(
              children: [
                Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.grey,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search product",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}