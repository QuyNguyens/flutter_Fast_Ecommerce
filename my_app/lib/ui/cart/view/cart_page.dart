import 'package:flutter/material.dart';

class CartPage extends StatefulWidget{
  const CartPage({super.key});

  State<StatefulWidget> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>{

  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      body: Padding(
          padding: EdgeInsets.all(20.0), // Padding cho toàn bộ GridView
          child: Text("this is cart page")
    ));
  }
}