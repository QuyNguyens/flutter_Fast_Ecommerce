part of 'order_bloc.dart';

abstract class OrderEvent{}

class OrderEventPickOrder extends OrderEvent{
   OrderEventPickOrder();
}

class OrderEventHistory extends OrderEvent{
  OrderEventHistory();
}
