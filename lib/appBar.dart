import 'package:flutter/material.dart';

class SodukuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soduku!'),
        backgroundColor: Color.fromRGBO(86, 169, 243, 25),
        ),
        body: Text('another test'),
      );
  }
}