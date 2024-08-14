import 'package:flutter/material.dart';

class SelectCashDelivery{

  late String label;
  late Widget icon;
  late bool isSelected;

  SelectCashDelivery(this.label,this.icon,this.isSelected);

  static List<SelectCashDelivery> selectedCategories = <SelectCashDelivery> [
    SelectCashDelivery("Cash on Delivery", Icon(Icons.handshake, color: Colors.blue[400],), true),
    SelectCashDelivery("Credit or Debit Card", Icon(Icons.handshake, color: Colors.blue[400]), false),
  ];
}