import 'package:flutter/material.dart';
import 'sodukuNumPad.dart';
import 'actionsBar.dart';
import 'sodukuBoard.dart';

class SodukuBoardPage extends StatefulWidget
{
  @override
  _SodukuBoardPageState createState() => _SodukuBoardPageState();
}

class _SodukuBoardPageState extends State<SodukuBoardPage> 
{
  @override
  Widget build(BuildContext context)
  {
    return Column(
            children: [
              SodukuBoard(),
              Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: ActionsBar(),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0, top: 10.0),
                child: NumbersPad(),
              )]
          );
  }
}