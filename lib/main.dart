import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'config.dart';
import 'package:sample/features/home_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: alternativeColor,
      ),
      home: new SplashScreen(
        title: appName,
        styleTextUnderTheLoader: appNameStyle,
        seconds: 5,
        image: devspaceLogo,
        photoSize: 40,
        loaderColor: primaryColor,
        backgroundColor: alternativeColor,
        onClick: () {},
        navigateAfterSeconds: HomeController(),
      ),
    );
  }
}