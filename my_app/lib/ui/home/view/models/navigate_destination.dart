import 'package:flutter/material.dart';

class NavigateDestination {
  late String label;
  late Widget icon;

 NavigateDestination(this.label, this.icon);
 static List<NavigateDestination> destinations = <NavigateDestination>[
    NavigateDestination(
        'Category', const Icon(Icons.category_outlined)),
    NavigateDestination(
        'Order',const Icon(Icons.list_outlined)),
    NavigateDestination(
        'Cart', const Icon(Icons.add_shopping_cart_outlined)),
    NavigateDestination(
        'Profile', const Icon(Icons.person_outline))
];

}
