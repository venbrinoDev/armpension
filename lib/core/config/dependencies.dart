
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';



final locator = GetIt.instance;

void setUpLocator(){
  locator.registerSingleton(Dio());

}


Dio dioConfig(){

}