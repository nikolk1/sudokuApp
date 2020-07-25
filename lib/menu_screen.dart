import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soduku!'),
        backgroundColor: Color.fromRGBO(86, 169, 243, 25),
        ),
        body: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(child: Text("Game")),
            FlatButton(child: Text("Research"), onPressed: null)
          ],
        ),
      );
  }
}
