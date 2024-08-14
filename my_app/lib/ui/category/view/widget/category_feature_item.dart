import 'package:flutter/material.dart';
import 'package:my_app/app.dart';
import 'package:my_app/ui/category/view/widget/category_list.dart';
import 'package:my_app/ui/category/view/widget/detail_product.dart';

class CategoryFeatureItem extends StatefulWidget{
  final Categories categories;
  const CategoryFeatureItem({super.key, required this.categories});

   @override
  State<StatefulWidget> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryFeatureItem> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailProduct(categories: widget.categories,)),
        );
      },
      child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: App.seedColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: SizedBox(
              height: 155,
              width: double.infinity,
              child: Image.asset(
                widget.categories.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 5,
            left: 5,
            child: Container(
              decoration: BoxDecoration(
                color: App.seedColor,
                borderRadius: BorderRadius.circular(7),
              ),
              padding: const EdgeInsets.all(5),
              child: const Text(
                "50% Off",
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: GestureDetector(
              onTap: toggleFavorite,
              child: Icon(
                Icons.favorite_outline,
                size: 35,
                color: isFavorite ? App.seedColor : Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.categories.title, style: const TextStyle(fontSize: 14)),
                  const Row(
                    children: [
                      Text("\$15.00", style: TextStyle(color: App.seedColor)),
                      SizedBox(width: 5),
                      Text("\$26.00", style: TextStyle(color: App.subPriceColor, decoration: TextDecoration.lineThrough)),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, size: 15, color: Colors.amber),
                          SizedBox(width: 5),
                          Text("4.5", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 5),
                          Text("(1.5K)", style: TextStyle(color: App.subPriceColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text("321"),
                          SizedBox(width: 5),
                          Text("Sold", style: TextStyle(color: App.subPriceColor)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}