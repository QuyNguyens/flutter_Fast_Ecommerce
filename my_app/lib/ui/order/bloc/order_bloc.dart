import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'order_state.dart';
part 'order_event.dart';

class OrderBloc extends Bloc<OrderEvent,OrderState>{
  
  OrderBloc() : super (const OrderStatePickOrder()){
    on<OrderEventPickOrder>(onOrderEventPickOrder,
    transformer: sequential(),);

    on<OrderEventHistory>(onOrderEventHistory,
    transformer: sequential(),);
    
  }

  FutureOr<void> onOrderEventPickOrder(OrderEventPickOrder event, Emitter<OrderState> emit) {    
      emit(const OrderStatePickOrder());
  }

  FutureOr<void> onOrderEventHistory(OrderEventHistory event, Emitter<OrderState> emit) {
    emit(const OrderStateHistory());
  }
}