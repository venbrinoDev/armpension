import 'dart:ui';

import 'package:armpension/auth/model/register_request.dart';
import 'package:armpension/auth/service/auth_controller.dart';
import 'package:armpension/core/util/color_util.dart';
import 'package:armpension/feautures/dashboard/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validate/validate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'package:provider/provider.dart';

class RegisterApp extends StatefulWidget {
  @override
  _MyPageState createState() => new _MyPageState();
}

class _LoginData {
  String name = '';
  String lastName = '';
  String email = '';
  String contactNumber = "";
  String confirmPassword = '';
  String createPassword = '';
}

class _MyPageState extends State<RegisterApp> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _LoginData _data = new _LoginData();
  String errorMessage;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  bool loginPressed = false;

  String _validateName(String value) {
    if (value.length < 2) {
      return 'Name should be at least 3 characters long .';
    }

    return null;
  }

  String _validateLastName(String value) {
    if (value.length < 2) {
      return 'Last Name should be at least 3 characters long .';
    }

    return null;
  }

  String _validateNumber(String value) {
    if (value.length < 10) {
      return 'The Password must be at least 10 characters.';
    }

    return null;
  }



  String _validateEmail(String value) {
    // If empty value, the isEmail function throw a error.
    // So I changed this function with try and catch.
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'The E-mail Address must be a valid email address.';
    }
    return null;
  }

  String _validatePassword(String value) {
    if (value.length < 8) {
      print(value);
      return 'The Password must be at least 8 characters.';
    }
    return null;
  }

  String _validateConfirmPassword(String value) {
    if (value.length < 8) {
      return 'The Password must be at least 8 characters.';
    } else if (password.text != confirmpassword.text) {
      return 'Please make sure your passwords match.';
    }

    return null;
  }


  void register() async{
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.
      final auth = context.read<AuthController>();
      bool proceed = await auth.signIn(_registerObj());

      if(proceed)
      {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Dashboard()));
      }


    }
  }


  RegisterRequest _registerObj(){

    return RegisterRequest(surname: _data.name,firstname: _data.lastName,emailID: _data.email,password: _data.createPassword);

  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                context.watch<AuthController>().loading?LinearProgressIndicator(color: Colors.white,backgroundColor: Theme.of(context).primaryColor,):SizedBox(height: 0.1,),
                Padding(
                  padding: const EdgeInsets.only(left: 8,top: 8),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(icon:Icon(Icons.arrow_back,
                        color: Color(0xff212121), size: 32,) ,onPressed: () {
                        Navigator.pop(context);
                      },)),
                ),
                Text(
                  "Create Account",
                  style: GoogleFonts.roboto(
                      fontSize: 30, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 15,
                ),

                SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48, bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'SurName*',
                        style:
                        GoogleFonts.roboto(fontSize: 12, color: Colors.black),
                      )),
                ),
                Container(
                  width: 327,
                  height: 45,
                  child: new TextFormField(
                      keyboardType: TextInputType.name, // Us
                      enableSuggestions: true,
                      style: TextStyle(
                          color: Colors.black), // e// email input type for emails.
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff000000))),
                          fillColor: Colors.white),
                      validator: this._validateName,
                      onSaved: (String value) {
                        this._data.name = value;
                      }),
                ),
                SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48, bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'First Name*',
                        style:
                        GoogleFonts.roboto(fontSize: 12, color: Colors.black),
                      )),
                ),
                Container(
                  width: 327,
                  height: 45,
                  child: new TextFormField(
                      keyboardType: TextInputType.name, // Us
                      enableSuggestions: true,
                      style: TextStyle(
                          color:
                          Colors.black), // e// email input type for emails.
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(borderSide: BorderSide()),
                          fillColor: Colors.white),
                      validator: this._validateLastName,
                      onSaved: (String value) {
                        this._data.lastName = value;
                      }),
                ),
                SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48, bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email ID*',
                        style:
                        GoogleFonts.roboto(fontSize: 12, color: Colors.black),
                      )),
                ),
                Container(
                  width: 327,
                  height: 45,
                  child: new TextFormField(
                      keyboardType: TextInputType.emailAddress, // Us
                      enableSuggestions: true,
                      style: TextStyle(
                          color:
                          Colors.black), // e// email input type for emails.
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(borderSide: BorderSide()),
                          fillColor: Colors.white),
                      validator: this._validateEmail,
                      onSaved: (String value) {
                        this._data.email = value;
                      }),
                ),
                SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48, bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Create Password.*',
                        style:
                        GoogleFonts.roboto(fontSize: 12, color: Colors.black),
                      )),
                ),
                Container(
                  width: 327,
                  height: 45,
                  child: new TextFormField(
                      obscureText: true,
                      controller: password,
                      style: TextStyle(color: Colors.black),
                      decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(borderSide: BorderSide()),
                      ),
                      validator: this._validatePassword,
                      onSaved: (String value) {
                        this._data.createPassword = value;
                      }),
                ),
                SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48, bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Confirm Password.*',
                        style:
                        GoogleFonts.roboto(fontSize: 12, color: Colors.black),
                      )),
                ),
                Container(
                  width: 327,
                  height: 45,
                  child: new TextFormField(
                      obscureText: true,
                      controller: confirmpassword,
                      style: TextStyle(color: Colors.black),
                      decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(borderSide: BorderSide()),
                      ),
                      validator: this._validateConfirmPassword,
                      onSaved: (String value) {
                        this._data.confirmPassword = value;
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 311,
                  height: 45,
                  child: new RaisedButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: new Text(
                      'Sign Up',
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          color:ColorUtils.WHITE_COLOR,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      if (_data.email != null &&
                          _data.confirmPassword != null &&
                          _data.name != null &&
                          _data.lastName != null &&
                          _data.confirmPassword != null) {
                        this.register();
                      }
                    },
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
