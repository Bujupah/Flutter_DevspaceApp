import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  final Widget child;

  Notifications({Key key, this.child}) : super(key: key);

  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: widget.child,
    );
  }
}