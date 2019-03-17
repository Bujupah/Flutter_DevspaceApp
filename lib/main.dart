import 'package:flutter/material.dart';
//import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

int currentIndex = 0;
class _MyHomePageState extends State<MyHomePage> {

  List<TabItem> tabItems = List.of([
    new TabItem(Icons.home, "Home", Colors.blue),
    new TabItem(Icons.search, "Search", Colors.orange),
    new TabItem(Icons.layers, "Reports", Colors.red),
    new TabItem(Icons.notifications, "Notifications", Colors.cyan),
  ]);

  CircularBottomNavigationController _navigationController = new CircularBottomNavigationController(currentIndex);
  String _swipeDirection="";
  double percent=0;
  @override
  Widget build(BuildContext context) {

    return SwipeDetector(
        child: Scaffold(
          appBar: AppBar(
            title: new Text(tabItems[_navigationController.value].title),
            backgroundColor: tabItems[_navigationController.value].color,
          ),
          body: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(tabItems[currentIndex].title,style: TextStyle(color: Colors.white,fontSize: 30),),
                    new CircularPercentIndicator(
                      radius: 120.0,
                      lineWidth: 13.0,
                      percent: percent <= 1 ? percent : percent = 1,
                      animation: false,
                      animateFromLastPercent: true,
                      center: new Text(
                        "${(percent*100).toStringAsFixed(2)} %",
                        style:
                            new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      footer: new Text(
                        "Sales this week",
                        style:
                            new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: percent >= 0.8 ? Colors.red : percent >= 0.5 ? Colors.orange : Colors.white,
                    ),
                  ],
                ),
              ),
            
          ),//You Widget Tree here
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
            percent+=0.1;
          });
        },
        onSwipeDown: () {
          setState(() {
            _swipeDirection = "Swipe Down";
            print(_swipeDirection);
            percent+=0.1;
          });
        },
        onSwipeLeft: () {
          setState(() {
            _swipeDirection = "Swipe Left";
            if(_navigationController.value < 3){
              _navigationController.value++;
            }
            print(_swipeDirection);
            percent+=0.1;
          });
        },
        onSwipeRight: () {
          setState(() {
            _swipeDirection = "Swipe Right";
            if(_navigationController.value > 0){
              _navigationController.value--;
            }
            print(_swipeDirection);
            percent+=0.2;
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
