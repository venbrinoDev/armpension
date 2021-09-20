

import 'package:armpension/core/data/firebase_respond.dart';
import 'package:armpension/core/util/util.dart';

class FirebaseStoreException implements Exception{

  final message;


  FirebaseStoreException([this.message]);

  String toString() {
    return "$message";
  }


  static FirebaseRespond handle(String code){
     String message = handleException(code);

     if(isNotEmpty(message)){
       return FirebaseRespond.load(error: message);
     }
         throw FirebaseStoreException(code);
  }

}

