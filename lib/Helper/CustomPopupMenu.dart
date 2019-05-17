import 'package:flutter/cupertino.dart';

 class CustomPopupMenu{
   final  title;
   final icon;
  CustomPopupMenu({this.title,this.icon});

   String getTitle() => title;
   Icon getIcon() => icon;

}