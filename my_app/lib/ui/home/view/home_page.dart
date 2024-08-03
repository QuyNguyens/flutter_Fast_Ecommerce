
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/ui/cart/view/cart_page.dart';
import 'package:my_app/ui/category/view/category_page.dart';
import 'package:my_app/ui/home/bloc/home_bloc.dart';
import 'package:my_app/ui/home/view/models/navigate_destination.dart';
import 'package:my_app/ui/order/view/order_page.dart';
import 'package:my_app/ui/profile/view/profile_page.dart';


class HomePage extends StatefulWidget{

  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();

  // ignore: library_private_types_in_public_api
  static _HomePageState? of(BuildContext context) {
    final _HomePageState? result =
        context.findAncestorStateOfType<_HomePageState>();
    return result;
  }

}

class _HomePageState extends State<HomePage> {

  int currentPageIndex = 0;
  HomePages homePage = HomePages.categoryPage;
  bool isMobileLayout = false;

  void setCurrentPageIndex(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isMobileLayout = MediaQuery.of(context).orientation == Orientation.landscape;
  }

  @override
  Widget build(BuildContext context) {

      return AdaptiveScaffold(
                  useDrawer: false,
                  transitionDuration: const Duration(microseconds: 300),
                  destinations: NavigateDestination.destinations.map((e) => NavigationDestination(icon: e.icon, label: GetLabelNavigation(e.label))).toList(),
                  selectedIndex: currentPageIndex,
                  onSelectedIndexChange: (index) => switchPage(context, index),
                  body: buildBody);
  }

 // ignore: non_constant_identifier_names
 String GetLabelNavigation(String name){
  switch(name){
    case 'Order':
      return 'Order';
    case 'Profile':
      return 'Profile';
    case 'Category':
      return 'Category';
    case 'Cart':
      return 'Cart';
    default :
      return '';
  }
 }

 Widget buildBody(BuildContext context) {
  return  BlocBuilder<HomeBloc, HomeState>(builder: homePageBuilder);
  }

// Build the home page.
  Widget homePageBuilder(BuildContext context, HomeState state) {

    if(state is HomeStateCategory){
      return const CategoryPage();
    }

    if(state is HomeStateCart){
      return const CartPage();
    }

    if(state is HomeStateOrder){
      return const OrderPage();
    }

    if(state is HomeStateProfile){
      return const ProfilePage();
    }

    return const Center(child: Text('Hello World'));
  }

  // switch to another page
  void switchPage(BuildContext context, int index) {
    setState(() {
      currentPageIndex = index;
      homePage = HomePages.values[index];
      context.read<HomeBloc>().add(HomeEventSwitchPage(homePage));
    });
  }

}