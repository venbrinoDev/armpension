
import 'package:armpension/auth/service/auth_controller.dart';
import 'package:armpension/auth/service/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';



final locator = GetIt.instance;

void setUpLocator(){
  locator.registerSingleton(Dio());

  locator.registerLazySingleton(() => AuthService());

  locator.registerSingleton(AuthController(locator.get<AuthService>()));
}


Dio dioConfig(){

}