import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/ui/cart/bloc/cart_bloc.dart';
import 'package:my_app/ui/cart/view/cart_page.dart';
import 'package:my_app/ui/category/view/category_page.dart';
import 'package:my_app/ui/home/bloc/home_bloc.dart';
import 'package:my_app/ui/home/view/home_page.dart';
import 'package:my_app/ui/order/bloc/order_bloc.dart';
import 'package:my_app/ui/order/view/order_page.dart';
import 'package:my_app/ui/profile/view/profile_page.dart';

class App extends MaterialApp {
  
  static const Color seedColor = Color(0xAAC32361);

    App({super.key}) : super(
    title: "Cross Pic",
    debugShowCheckedModeBanner: false,
    routes: {
      '/category':(context) => const CategoryPage(),
      '/order':(context) => const OrderPage(),
      '/cart':(context) => const CartPage(),
      '/profile':(context) => const ProfilePage(),
      
    },
    theme: ThemeData(
      useMaterial3: true,
      fontFamily: 'RobotoSerif',
      // Define the default brightness and colors.
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        secondaryContainer: seedColor,
        brightness: Brightness.light,
      )))
      {
        //initializeFirebase();
      }
  
  @override // TODO: implement home
  Widget? get home => MultiBlocProvider(
                        providers: [
                          BlocProvider<HomeBloc>(
                          create: (_) => HomeBloc()..add(HomeEventSwitchPage(HomePages.categoryPage)),
                          ),
                          BlocProvider<OrderBloc>(
                          create: (_) => OrderBloc(),
                          ),
                          BlocProvider<CartBloc>(
                            create: (_) => CartBloc(),
                          ),
                        ],
                        child: const HomePage());

}
