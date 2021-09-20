import 'dart:async';

import 'package:armpension/core/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text("ArmPension",style:Theme.of(context).textTheme.title.copyWith(
                fontSize: 18
              )),
              verticalSpacing(spacing: 20),
             SpinKitFadingGrid(
               color: Theme.of(context).primaryColor,
             )
            ],
          ),
        ),
      ),
    );
  }

  void startCounter(int time){
   var duration = Duration(seconds: time);
   Timer(duration, (){
     navigate();
   });
  }

  navigate(){

  }
}
