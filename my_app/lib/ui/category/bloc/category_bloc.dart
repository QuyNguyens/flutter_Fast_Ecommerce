import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent,CategoryState>{
  CategoryBloc() : super(CategoryStateDisplay()){
    on<CategoryEventDisplay> (onCategoryEventDisplay,
    transformer: sequential(), );
  }

  FutureOr<void> onCategoryEventDisplay(CategoryEventDisplay event, Emitter<CategoryState> emit) {
    emit(CategoryStateDisplay());
  }
}