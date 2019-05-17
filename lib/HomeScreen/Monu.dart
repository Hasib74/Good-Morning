import 'package:flutter/material.dart';
import 'package:good_morning/Common/Common.dart';
import 'package:good_morning/Model/Content.dart';
class Monu extends StatefulWidget {

  final name;

  Monu({this.name});


  @override
  _MonuState createState() => _MonuState();
}


class _MonuState extends State<Monu> {
  Content content=Common.content;



  @override
  Widget build(BuildContext context) {
    return Center(
       child: Text(widget.name),
    );
  }
}
