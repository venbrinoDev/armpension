import 'package:armpension/auth/model/auth_model.dart';
import 'package:armpension/auth/model/login_request.dart';
import 'package:armpension/auth/model/register_request.dart';
import 'package:armpension/core/data/firebase_respond.dart';
import 'package:armpension/core/exception/firebaseException.dart';
import 'package:armpension/core/util/util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<FirebaseRespond> login(LoginRequest loginRequest) async{
    try{

      await _auth.signInWithEmailAndPassword(email: loginRequest.email, password: loginRequest.password);
      User user = _auth.currentUser;
      return  FirebaseRespond.load(payload: AuthModel(email: user.email,name: user.displayName,uid: user.uid));

    }on FirebaseAuthException catch(e){

     return FirebaseStoreException.handle(e.code);
    }
  }

  Future<FirebaseRespond> signIn(RegisterRequest registerRequest) async{
    try{

      await _auth.createUserWithEmailAndPassword(email: registerRequest.emailID, password: registerRequest.password).then((value){
        registerUser(registerRequest: registerRequest,uid:value.user.uid);
      });

      User user = _auth.currentUser;

      return  FirebaseRespond.load(payload: AuthModel(email: user.email,name: user.displayName,uid: user.uid));

    } on FirebaseAuthException catch(e){
    return FirebaseStoreException.handle(e.code);
    }

  }

  Future<void> registerUser({RegisterRequest registerRequest, String uid}) async{
  await  _firestore
        .collection("Users")
        .doc(uid)
        .set({
      "surname": registerRequest.surname,
      "firstName": registerRequest.firstname,
      "email": registerRequest.emailID,
    });
  }





}