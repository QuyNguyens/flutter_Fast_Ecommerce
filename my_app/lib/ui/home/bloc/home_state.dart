part of 'home_bloc.dart';

// The enum contains all state of Image Uplad Widget.
enum HomePages { categoryPage, orderPage, cartPage, profilePage}

@immutable
abstract class HomeState{
  const HomeState();
}

class HomeStateCategory extends HomeState{
  const HomeStateCategory(): super();
}

class HomeStateOrder extends HomeState{
  const HomeStateOrder(): super();
}

class HomeStateCart extends HomeState{
  const HomeStateCart(): super();
}

class HomeStateProfile extends HomeState{
  const HomeStateProfile(): super();
}