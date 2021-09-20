import 'package:armpension/auth/model/login_request.dart';
import 'package:armpension/auth/service/auth_controller.dart';
import 'package:armpension/auth/view/signin.dart';
import 'package:armpension/core/util/color_util.dart';
import 'package:armpension/core/util/util.dart';
import 'package:armpension/feautures/dashboard/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validate/validate.dart';
import 'package:provider/provider.dart';

class LoginApp extends StatefulWidget {
  @override
  _MyPageState createState() => new _MyPageState();
}

class _LoginData {
  String email = '';
  String password = '';
}

class _MyPageState extends State<LoginApp> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  _LoginData _data = new _LoginData();
  final map = Map();
  String errorMessage;
  bool loginPressed = false;

  String _validateEmail(String value) {
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'The E-mail Address must be a valid email address.';
    }

    return null;
  }

  String _validatePassword(String value) {
    if (value.length < 8) {
      return 'The Password must be at least 5 characters.';
    }

    return null;
  }

  void submit() async{
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      final authController = context.read<AuthController>();
      bool proceed = await authController.login(LoginRequest(email:_data.email,password:_data.password));
      if(proceed){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
      }
    }

  }


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(

        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              verticalSpacing(spacing: 5),
              context.watch<AuthController>().loading?LinearProgressIndicator(minHeight: 5,color: Theme.of(context).primaryColor,backgroundColor: ColorUtils.WHITE_COLOR,):SizedBox(height: 0.1,),
             verticalSpacing(spacing: 50),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Arm",
                        style: GoogleFonts.roboto(
                            fontSize: 34, color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      Text(
                        "Pension",
                        style: GoogleFonts.roboto(
                            fontSize: 34, color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  )
                ],
              ),

              verticalSpacing(spacing: 30),
              Padding(
                padding: const EdgeInsets.only(left: 52, bottom: 8),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email ID',
                      style:
                      GoogleFonts.roboto(fontSize: 12, color: Colors.black),
                    )),
              ),
              Container(
                width: 311,
                height: 50,
                child: new TextFormField(
                    keyboardType: TextInputType.emailAddress, // Us
                    enableSuggestions: true,
                    style: TextStyle(
                        color: Colors.black), // e// email input type for emails.
                    decoration: new InputDecoration(
                        labelText: 'Email ID',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle:
                        GoogleFonts.roboto(fontSize: 14, color: Color(0xff4A4A4A)),
                        suffixIcon: Icon(
                          Icons.account_circle_outlined,
                          size: 24,
                          color: Color(0xFFBDBDBD),
                        ),
                        alignLabelWithHint: false,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff000000))),
                        fillColor: Colors.white),
                    validator: this._validateEmail,
                    onSaved: (String value) {
                      this._data.email = value;
                    }),
              ),
              verticalSpacing(spacing: 30),
              Padding(
                padding: const EdgeInsets.only(left: 52, bottom: 8),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style:
                      GoogleFonts.roboto(fontSize: 12, color: Colors.black),
                    )),
              ),
              Container(
                width: 311,
                height: 50,
                child: new TextFormField(
                    obscureText: true,
                    enableSuggestions: true,
                    style: TextStyle(
                        color: Colors.black), // e// email input type for emails.
                    decoration: new InputDecoration(
                        labelText: '• • • • • • • •',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle:
                        GoogleFonts.roboto(fontSize: 24, color: Color(0xff4A4A4A)),
                        suffixIcon: Icon(
                          Icons.lock_outline_rounded,
                          size: 24,
                          color: Color(0xFFBDBDBD),
                        ),
                        alignLabelWithHint: false,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff000000))),
                        fillColor: Colors.white),
                    validator: this._validatePassword,
                    onSaved: (String value) {
                      this._data.password = value;
                    }),
              ),
              verticalSpacing(spacing: 20),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: 311,
                  height: 45,
                  child: new RaisedButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    child: new Text(
                      'Login',
                      style: GoogleFonts.roboto(fontSize: 16,color: ColorUtils.WHITE_COLOR,fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      if (_data.email != null || _data.password != null) {
                        this.submit();
                      }
                    },
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Not registered yet?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(fontSize: 14,color:Color(0xff4A4A4A)),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterApp()));
                      },
                      child: Text(
                        ' Create an Account',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(fontSize: 14,color: Color(0xff388E3C)),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

}
