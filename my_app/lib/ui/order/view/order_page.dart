import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/ui/order/bloc/order_bloc.dart';

class OrderPage extends StatefulWidget{

  const OrderPage({super.key});
  
  @override
  State<StatefulWidget> createState() => _OrderPageState();

}

class _OrderPageState extends State<OrderPage>{

  @override
    void initState() {
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<OrderBloc,OrderState>(builder: OrderPageBuilder,)
    ));
  }

  // ignore: non_constant_identifier_names
  Widget OrderPageBuilder(BuildContext context, OrderState state){

      return const Text("this is Order page");
    
  }
  
}