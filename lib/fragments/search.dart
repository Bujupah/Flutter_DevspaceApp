import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final Widget child;

  Search({Key key, this.child}) : super(key: key);

  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: widget.child,
    );
  }
}