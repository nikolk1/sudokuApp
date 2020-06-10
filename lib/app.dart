import 'package:flutter/material.dart';
import 'appBar.dart';

class SodukuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(title: 'Soduku', home: SodukuBar());
  }
}