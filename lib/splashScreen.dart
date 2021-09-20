import 'dart:async';

import 'package:armpension/auth/view/login.dart';
import 'package:armpension/core/util/util.dart';
import 'package:armpension/feautures/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {




    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("ArmPension",style:Theme.of(context).textTheme.title.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold
              )),
              verticalSpacing(spacing: 20),
             SpinKitFadingGrid(
               size: 32,
               color: Theme.of(context).primaryColor,
             )
            ],
          ),
        ),
      ),
    );


  }

  navigate(){

    if(FirebaseAuth.instance.currentUser!=null){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    }else{
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginApp()));
    }
  }

  void startCounter(int time){
    var duration = Duration(seconds: time);
    Timer(duration, (){
      navigate();
    });
  }
  @override
  void initState() {
    startCounter(5);
  }
}
