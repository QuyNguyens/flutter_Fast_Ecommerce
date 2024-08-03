import 'dart:io';
import 'package:my_app/app.dart';
import 'package:platform_detector/platform_detector.dart' as detector;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = MainBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  if(detector.isWeb() == false)
  {
    HttpOverrides.global = MyHttpOverrides();
  }
  
  runApp(App());
}

class MainBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint('${bloc.runtimeType}, $error');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('${bloc.runtimeType}, $change');
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}