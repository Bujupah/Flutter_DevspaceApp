import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';

import 'package:sample/fragments/home.dart';
import 'package:sample/fragments/notification.dart';
import 'package:sample/fragments/search.dart';

class HomeController extends StatefulWidget {
  final Widget child;

  HomeController({Key key, this.child}) : super(key: key);

  _HomeControllerState createState() => _HomeControllerState();
}
int currentIndex = 0;
class _HomeControllerState extends State<HomeController> {
   CircularBottomNavigationController _navigationController = new CircularBottomNavigationController(currentIndex);
  String _swipeDirection="";
  double percent=0;
  
  List<TabItem> tabItems = List.of([
    new TabItem(Icons.home, "Home", Colors.blue),
    new TabItem(Icons.search, "Search", Colors.orange),
    new TabItem(Icons.layers, "Reports", Colors.red),
    new TabItem(Icons.notifications, "Notifications", Colors.cyan),
  ]);

  Widget setScreen(int i){
    switch (i) {
      case 0:
        return Home();
      case 1:
        return Search();
      case 2:
        return Notifications();
      default:
        return Home();
    }
  }
  @override
  Widget build(BuildContext context) {
    return SwipeDetector(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(tabItems[_navigationController.value].title),
            backgroundColor: tabItems[_navigationController.value].color,
          ),
          body: setScreen(_navigationController.value),
          backgroundColor: tabItems[_navigationController.value].color,
          bottomNavigationBar: CircularBottomNavigation(
            tabItems,
            normalIconColor: tabItems[_navigationController.value].color,
            barHeight: 45,
            controller: _navigationController,
            
            selectedCallback: (int selectedPos) {
              setState(() {
              _navigationController.value = selectedPos;
              currentIndex = selectedPos;
              });
            },
          ),
        ),
        onSwipeUp: () {
          setState(() {
            _swipeDirection = "Swipe Up";
            print(_swipeDirection);
          });
        },
        onSwipeDown: () {
          setState(() {
            _swipeDirection = "Swipe Down";
            print(_swipeDirection);
         });
        },
        onSwipeLeft: () {
          setState(() {
            _swipeDirection = "Swipe Left";
            if(_navigationController.value < 3){
              _navigationController.value++;
            }
          });
        },
        onSwipeRight: () {
          setState(() {
            _swipeDirection = "Swipe Right";
            if(_navigationController.value > 0){
              _navigationController.value--;
            }
          });
        },
        swipeConfiguration: SwipeConfiguration(
          verticalSwipeMinVelocity: 100.0,
          verticalSwipeMinDisplacement: 50.0,
          verticalSwipeMaxWidthThreshold:100.0,
          horizontalSwipeMaxHeightThreshold: 50.0,
          horizontalSwipeMinDisplacement: 100.0,
          horizontalSwipeMinVelocity: 200.0),
    );
  }
}