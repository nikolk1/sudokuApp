import 'package:flutter/material.dart';
import 'sharedStateWidget.dart';
import 'sodukuBoardPage.dart';

class SodukuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soduku!'),
        backgroundColor: Color.fromRGBO(86, 169, 243, 25),
        ),
        body: Container(
          child: SharedStateWidget(
            child: SodukuBoardPage()
            ),
        ),
      );
  }
}