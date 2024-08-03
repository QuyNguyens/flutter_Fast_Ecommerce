
import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent,CartState>{
  CartBloc() : super (CartStatePurchaseOrder()){
    on<CartEventPurchaserOrder>(onCartEventPurchaserOrder,
    transformer: sequential(),);
  }

  FutureOr<void> onCartEventPurchaserOrder(CartEventPurchaserOrder event, Emitter<CartState> emit) {
    emit(CartStatePurchaseOrder());
  }
}