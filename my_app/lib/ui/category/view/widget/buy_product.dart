import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:my_app/app.dart';
import 'package:my_app/ui/category/view/models/address.dart';
import 'package:my_app/ui/category/view/widget/address_list.dart';
import 'package:my_app/ui/category/view/widget/category_list.dart';
import 'package:my_app/ui/category/view/widget/payment_selection_page.dart';

class BuyProduct extends StatefulWidget{

  final Categories categories;

  const BuyProduct({super.key, required this.categories});

  @override
  State<StatefulWidget> createState() => _BuyProductState();
}

class _BuyProductState extends State<BuyProduct>{

  final bool address = true;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(7),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              SizedBox(
                                width: 30,
                                child: Icon(Icons.location_on_outlined, color: App.seedColor),
                              ),
                              SizedBox(width: 5),
                              Text("Delivery Address", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          GestureDetector(
                            onTap: address ? (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddressList(addresss: Address.addressList))
                              );
                            } : null,
                            child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              address ? const SizedBox(width: 35) : const SizedBox(),
                              Expanded(
                                child: address ? const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nguyễn Công Quý | (+84) 123 456 789'),
                                    Text('Số 123, Cù Chánh Lan'),
                                    Text('Hòa Bắc Nam, Quận Hải Châu, Đà Nẵng'),
                                  ],
                                ): GestureDetector(
                                    onTap: null,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: DottedBorder(
                                        color: App.seedColor,
                                        strokeWidth: 1,
                                        dashPattern: const [6, 3],
                                        borderType: BorderType.RRect,
                                        radius: const Radius.circular(20),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), 
                                          child:const Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("Add Address", style: TextStyle(color: App.seedColor, fontSize: 16)),
                                              SizedBox(width: 8),
                                              Icon(Icons.add_outlined, color: App.seedColor),
                                            ],
                                          ),
                                        )),
                                    ))
                                ),
                              address ? const Icon(Icons.chevron_right_outlined) : const SizedBox(),
                            ],
                          ),
                      )],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      padding: const EdgeInsets.all(7),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 30,
                                child: Icon(Icons.subtitles_outlined, color: Colors.grey[600]),
                              ),
                              const SizedBox(width: 5),
                              const Expanded(
                                child: Text(
                                  "Product Title",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: Image.asset(
                                  widget.categories.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 5),
                                    const Text(
                                      "Set Bộ Áo Thun Nữ Form Rộng Tay Lỡ + Quần Short Ống Rộng Ulzzang",
                                      style: TextStyle(fontSize: 14),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 7),
                                    Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        border: Border.all(
                                          color: App.seedColor,
                                          width: 1,
                                        ),
                                      ),
                                      child: const Text(
                                        "Free change",
                                        style: TextStyle(color: App.seedColor, fontSize: 10),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Type: Grey, XL",
                                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "\$6.5",
                                          style: TextStyle(color: Colors.grey[600]),
                                        ),
                                        Text(
                                          "x1",
                                          style: TextStyle(color: Colors.grey[600], fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      color: Colors.white,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 120,
                        child: const TextField(
                          maxLines: null,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Write here any additional info',
                            hintStyle: TextStyle(
                              fontSize: 16,
                            ),
                            contentPadding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(7),
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      color: Colors.white,
                      child: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 30,
                                    child: Icon(Icons.paid_outlined),
                                  ),
                                  SizedBox(width: 5),
                                  Text("To be Paid", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                ],
                              ),
                              Text(
                                "\$6.5",
                                style: TextStyle(color: App.seedColor, fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          PaymentSelectionPage(), // Gọi PaymentSelectionPage ở đây
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                minimumSize: const Size(double.infinity, 50), // Set width to match the container
              ),
              child: const Text(
                "Place Order",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              onPressed: () {},
            ),
          )

        ],
      ),
    );
  }
}