import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color primaryColor = CupertinoColors.darkBackgroundGray;
Color secondaryColor = Colors.lightBlue[900];
Color alternativeColor = Colors.black;

Color dashboardColor = Colors.white;
Color homeColor;
Color settingColor;

String dashboardTitle = "Dashboard";
String homeTitle = "Home";
String settingTitle = "Setting";

Text appName = new Text("DevSpace");
TextStyle appNameStyle = new TextStyle(
                      color: primaryColor,
                      fontSize: 30,
                      wordSpacing: 1,
                    );
Image devspaceLogo = new Image.asset(
                      "devspace.png",
                      width: 50,
                      height: 50,
                      repeat: ImageRepeat.noRepeat,
                    );