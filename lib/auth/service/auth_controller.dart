
import 'package:armpension/auth/model/auth_model.dart';
import 'package:armpension/auth/model/login_request.dart';
import 'package:armpension/auth/model/register_request.dart';
import 'package:armpension/core/data/firebase_respond.dart';
import 'package:armpension/core/exception/firebaseException.dart';
import 'package:armpension/core/service/base_controller.dart';
import 'package:armpension/core/util/util.dart';

import 'auth_service.dart';

class AuthController extends BaseModel{
  AuthService authService;

  AuthController(this.authService);

  Future<bool> login(LoginRequest loginRequest) async{
    setBusy(true);
    try{
      FirebaseRespond respond = await this.authService.login(loginRequest);
      setBusy(false);

      if(isNotEmpty(respond.errorMessage)){
        showError(respond.errorMessage);
        return false;
      }

      AuthModel authModel = respond.payload as AuthModel;
       saveUserDetails(authModel);
      return true;

    }on FirebaseStoreException catch (e){
         setBusy(false);
         showError(e.toString());
         return false;
    }
  }


  Future<bool> signIn(RegisterRequest registerRequest) async{
    setBusy(true);
    try{

      FirebaseRespond respond = await this.authService.signIn(registerRequest);
      setBusy(false);

      if(isNotEmpty(respond.errorMessage)){
        showError(respond.errorMessage);
        return false;
      }

      AuthModel authModel = respond.payload as AuthModel;
      saveUserDetails(authModel);
      return true;


    } on FirebaseStoreException catch(e){
      setBusy(false);
      showError(e.toString());
      return false;
    }
  }
  void saveUserDetails(AuthModel authModel){}


}