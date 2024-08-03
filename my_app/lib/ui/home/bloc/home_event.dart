part of 'home_bloc.dart';

abstract class HomeEvent {
   HomePages homePage =  HomePages.orderPage;
}

class HomeEventSwitchPage extends HomeEvent {
  HomeEventSwitchPage(HomePages homePage){
    this.homePage = homePage;
  }
}