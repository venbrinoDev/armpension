
import 'package:flutter/material.dart';

abstract class BaseModel extends ChangeNotifier{
bool _isBusy = false;
String _message;
String _errorMessage;

bool get loading =>_isBusy;
String get errorMessage =>_errorMessage;
String  get message =>_message;

setBusy(bool value ){
  _isBusy = value;
  notifyListeners();
}

setErrorMessage(String value){
  _errorMessage = value;
  notifyListeners();
}

setMessage(String value){
  _message=value;
  notifyListeners();
}

}