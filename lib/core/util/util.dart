

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class Util{


}
EdgeInsetsGeometry get pagePadding => const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0);

EdgeInsetsGeometry horizontalPadding({double size})  =>  EdgeInsets.symmetric(horizontal:size);

EdgeInsetsGeometry verticalPadding({double size})  =>  EdgeInsets.symmetric(vertical:size);

double pageHeight(context)=>MediaQuery.of(context).size.height;

double pageWidth(context)=>MediaQuery.of(context).size.width;

SizedBox verticalSpacing({ double spacing}) =>SizedBox(height:spacing??24);

SizedBox horizontalSpacing({ double spacing}) =>SizedBox(width:spacing??24);

closeKeyPad(context){
  FocusScopeNode currentFocus = FocusScope.of(context);
  if(!currentFocus.hasPrimaryFocus){
    currentFocus.unfocus();
  }
}

showSuccess({String message}){
Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.lightGreen,
      textColor: Colors.white,
      fontSize: 16.0,

  );
}

showError(String message){
 Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.redAccent,
    textColor: Colors.white,
    fontSize: 16.0,

  );
}


isEmpty(String val) {
  return (val == null) || (val.trim().length == 0);
}

isNotEmpty(String val) {
  return !isEmpty(val);
}

isMap(dynamic val) {
  return (val is Map);
}

isNumber(String val) {
  return num.tryParse(val) != null;
}

isObjectEmpty(dynamic val) {
  if (val is Map) return val == null || val.isEmpty;
  if (val is List) return val == null || val.isEmpty;
  return (val == null);
}

getObjectOrNull(dynamic val) {
  return isObjectEmpty(val) ? null : val;
}

String trimValue(String val) {
  return isNotEmpty(val) ? val.trim() : null;
}

String capitalize(String s) =>
    s[0].toUpperCase() + s.substring(1).toLowerCase();



 handleException(String errorType) {

   switch(errorType){
       case 'weak-password':
       return 'The password provided is too weak.';
       break;

       case 'email-already-in-use':
       return 'The account already exists for that email.';
       break;

       case 'user-not-found':
       return 'No user found for that email.';
       break;

       case 'wrong-password' :
       return 'Wrong password provided for that user.';
       break;

     case 'network-request-failed':
       return 'Check network connection.';
       break;

      default :
       return null;
       break;
   }

}

String loremText='Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ut eleifend velit, ac malesuada mauris. Etiam condimentum sem laoreet sapien ultrices, a posuere erat sagittis. Vestibulum malesuada, massa nec maximus volutpat, arcu est maximus leo, ';