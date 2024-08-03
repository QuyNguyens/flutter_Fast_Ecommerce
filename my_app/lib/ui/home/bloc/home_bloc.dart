import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  
  HomeBloc() : super(const HomeStateOrder()){
    on<HomeEventSwitchPage>((event, emit) async {
      switch(event.homePage){
        case HomePages.categoryPage:{
          emit(const HomeStateCategory());
        } break;
        case HomePages.orderPage:{
          emit(const HomeStateOrder());
        } break;

        case HomePages.cartPage:{
          emit(const HomeStateCart());
        } break;

        case HomePages.profilePage:{
          emit(const HomeStateProfile());
        } break;
      }

    },
    transformer: sequential(),);
  }

}
