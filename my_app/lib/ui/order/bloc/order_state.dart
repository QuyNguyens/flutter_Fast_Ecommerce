part of 'order_bloc.dart';


enum HistoryStatus {init }
abstract class OrderState{
  const OrderState();
}

class OrderStatePickOrder extends OrderState{
  const OrderStatePickOrder();
}

class OrderStateHistory extends OrderState{
  const OrderStateHistory();
}