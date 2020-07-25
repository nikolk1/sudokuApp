import 'package:flutter/material.dart';
import 'package:soduku_app/menu_screen.dart';
import 'appBar.dart';

class SodukuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(title: 'Soduku', home: MenuScreen());
  }
}