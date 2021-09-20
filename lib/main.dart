import 'package:armpension/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'auth/service/auth_controller.dart';
import 'core/config/dependencies.dart';
import 'core/util/theme_util.dart';

void main()  async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
setUpLocator();

SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {

  runApp(
      MultiProvider(providers:[
        ChangeNotifierProvider(create:(_) =>locator.get<AuthController>()),
      ],
        child:MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:CustomThemeData.getThemeData(),
            home:SplashScreen()
        ),
      )

  );
});
}

