import 'package:flutter/material.dart';
import 'package:my_app/app.dart';
import 'package:my_app/ui/category/view/widget/buy_product.dart';
import 'package:my_app/ui/category/view/widget/category_list.dart';
import 'package:my_app/ui/category/view/widget/full_screen_image.dart';
import 'package:my_app/ui/category/view/widget/image_slider.dart';

class DetailProduct extends StatefulWidget{

  final Categories categories;
  const DetailProduct({super.key, required this.categories});

  @override
  State<StatefulWidget> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct>{

  late bool isFavorite = false;
  final List<String> colors = <String>["White","Black","Grey","Bea","Pink","Yellow","Brown","Green","Blue"];
  final List<String> sizes = <String>["Size S","Size L","Size M","Size XL","Size XXL","Size XXXL"];
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: null,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: const ImageSlider(heightImage: 280,),
          )),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10,10,10,0),
              child: Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                    child: Text("Tai Nghe Chụp Tai Không Dây, Chống Ồn Baseus Bowie D05 ANC, 3D",
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  ),
                  const SizedBox(height: 5,),
                  const SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Tai nghe Baseus Bowie D05 là một sản phẩm tai nghe không dây chụp tai chất lượng cao của thương hiệu Baseus. Với thiết kế tinh tế, âm thanh chất lượng cao và tính năng thông minh, tai nghe Baseus Bowie D05 đang trở thành một trong những sản phẩm tai nghe không dây được yêu thích nhất trên thị trường.",
                          softWrap: true,
                          style: TextStyle(fontSize: 16),
                          maxLines:  3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                  const SizedBox(height: 6,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 25,),
                          SizedBox(width: 5,),
                          Text("4.5", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                          SizedBox(width: 5,),
                          Text("(1.5K)", style: TextStyle(color: Color.fromARGB(66, 44, 53, 53), fontSize: 17),),
                          SizedBox(width: 15,),
                          Text("-",style: TextStyle(color: Color.fromARGB(66, 44, 53, 53), fontSize: 17)),
                          SizedBox(width: 15,),
                          Text("321",style: TextStyle(color: Color.fromARGB(66, 44, 53, 53), fontSize: 17)),
                          SizedBox(width: 5,),
                          Text("Sold",style: TextStyle(color: Color.fromARGB(66, 44, 53, 53), fontSize: 17)),
                        ],
                      ),
                      GestureDetector(
                        onTap: _handleFavorite,
                        child: Icon(Icons.favorite_outline, size: 30, color: isFavorite ? App.seedColor : Colors.black87,),
                      )
                    ],
                  ),
                  const SizedBox(height: 6,),
                  Row(
                    children: [
                      const Text("\$6.5", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      const SizedBox(width: 10,),
                      const Text("\$130", style: TextStyle(fontSize: 20, decoration: TextDecoration.lineThrough, color: Color.fromARGB(66, 44, 53, 53)),),
                      const SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                          color: App.seedColor,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        padding: const EdgeInsets.all(3),
                        child: const Text("-50%", style: TextStyle(fontSize: 14, color: Colors.white),),
                      )
                    ],
                  ),
                  const SizedBox(height: 6,),
                  const Divider(
                    color: Colors.black12,
                    thickness: 2,
                  ),
                  const SizedBox(height: 6,),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(width: 10),
                      Flexible(
                        flex: 2,
                        child: SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              _showBottomSheet(context,"Add to cart");
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: App.seedColor),
                              padding: const EdgeInsets.all(15) 
                            ),
                            child: const Text('Add to Cart', style: TextStyle(color: App.seedColor, fontWeight: FontWeight.bold, fontSize: 18)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15), // Add some space between the buttons
                      Flexible(
                        flex: 2,
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              _showBottomSheet(context,"Buy now");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              padding: const EdgeInsets.all(15)  
                            ),
                            child: const Text('Buy Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ))
          ],
        ),
      );
  }

  void _handleFavorite(){

    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void _showBottomSheet(BuildContext context, String nameBtn) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        int amount = 1;
        int selectedColorIndex = -1;
        int selectedSizeIndex = -1;

        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showFullScreenImage(context);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              widget.categories.image,
                              fit: BoxFit.cover,
                              height: 120,
                              width: 120,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text(
                              "\$6.5 - \$13.0",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: App.seedColor,
                                fontSize: 20),
                            ),
                            Text("Inventory: 113115"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    top: 140, // Adjust to match the height of the image + padding
                    bottom: 60, // Adjust to match the height of the button
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(
                            thickness: 2,
                            color: Colors.black12,
                          ),
                          const Text(
                            "Colors",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          const SizedBox(height: 5),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 2.4, // Adjust childAspectRatio to fit the height
                            ),
                            itemCount: colors.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: (){
                                  setState ((){
                                    selectedColorIndex = index;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 240, 236, 236),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: selectedColorIndex == index 
                                              ? App.seedColor
                                              : Colors.transparent,
                                      width: 1
                                    )
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 25,
                                        height: 25,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset(
                                            widget.categories.image, // Replace with the correct path to your image
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(colors[index],
                                          style: const TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ));
                              },
                            ),
                          const SizedBox(height: 5),
                          const Divider(
                            thickness: 2,
                            color: Colors.black12,
                          ),
                          const Text(
                            "Size",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          const SizedBox(height: 5),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 2.4, // Adjust childAspectRatio to fit the height
                            ),
                            itemCount: sizes.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: (){
                                  setState((){
                                    selectedSizeIndex = index;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: selectedSizeIndex == index
                                        ? App.seedColor
                                        : Colors.transparent,
                                      width: 1
                                    )
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(
                                      sizes[index],
                                      style: const TextStyle(fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ));
                            },
                          ),
                          const SizedBox(height: 5),
                          const Divider(
                            thickness: 2,
                            color: Colors.black12,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Amount",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: selectedColorIndex == -1 || selectedSizeIndex == -1 || amount == 1
                                                ? Colors.grey
                                                : const Color.fromARGB(255, 36, 33, 34),
                                            width: 1)),
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: const Icon(Icons.remove, size: 15),
                                      onPressed: selectedColorIndex == -1 || selectedSizeIndex == -1 || amount == 1
                                          ? null
                                          : () {
                                              setState(() {
                                                amount -= 1;
                                              });
                                            },
                                      color: selectedColorIndex == -1 || selectedSizeIndex == -1 || amount == 1
                                          ? Colors.grey
                                          : const Color.fromARGB(255, 8, 8, 8),
                                      iconSize: 15,
                                      constraints: const BoxConstraints(),
                                      splashRadius: 20,
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: selectedColorIndex == -1 || selectedSizeIndex == -1
                                                ? Colors.grey
                                                : const Color.fromARGB(255, 36, 33, 34),
                                            width: 1)),
                                    alignment: Alignment.center,
                                    child: Text(
                                      '$amount',
                                      style: TextStyle(
                                        color: selectedColorIndex == -1 || selectedSizeIndex == -1
                                            ? Colors.grey
                                            : Colors.pink, // Replace App.seedColor with a valid color
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: selectedColorIndex == -1 || selectedSizeIndex == -1
                                                ? Colors.grey
                                                : const Color.fromARGB(255, 36, 33, 34),
                                            width: 1)),
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: const Icon(Icons.add, size: 15),
                                      onPressed: selectedColorIndex == -1 || selectedSizeIndex == -1
                                          ? null
                                          : () {
                                              setState(() {
                                                amount += 1;
                                              });
                                            },
                                      color: selectedColorIndex == -1 || selectedSizeIndex == -1
                                          ? Colors.grey
                                          : const Color.fromARGB(255, 3, 3, 3),
                                      iconSize: 15,
                                      constraints: const BoxConstraints(),
                                      splashRadius: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ElevatedButton(
                      onPressed: selectedColorIndex == -1 || selectedSizeIndex == -1 ? null : () {
                        if(nameBtn == 'Add to cart'){
                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.pop(context);
                          });
                        }else{
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BuyProduct(categories: widget.categories))
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        padding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text(
                        nameBtn,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showFullScreenImage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImage(
          imageUrl: widget.categories.image,
        ),
      ),
    );
  }
}
