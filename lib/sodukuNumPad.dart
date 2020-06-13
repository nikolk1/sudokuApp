import 'sharedStateWidget.dart';
import 'package:flutter/material.dart';

class NumbersPad extends StatelessWidget
{
  static const int numCols = 9;

  @override
  Widget build(BuildContext context) 
  {
    return Table(
      children: _getPad(),
    );
  }

  List<TableRow> _getPad()
  {
    return List.generate(1, (int i) {
      return TableRow(children: _getPadRow());
    });
  }

  List<Widget> _getPadRow()
  {
    return List.generate(9, (int index)
    {
      return Padding(
        padding: const EdgeInsets.only(top: 1, bottom: 1, left: 0, right: 0),
        child: NumbersPadCell(index + 1)
      );
    });
  }
}

class NumbersPadCell extends StatelessWidget
{
  final int number;

  NumbersPadCell(this.number);

  @override
  Widget build(BuildContext context)
  {
    return SizedBox(
      width: 30,
      height: 40,
      child: FlatButton(
        onPressed: () 
        {
          SharedStateWidget.of(context).sudokuGenerator.setNumber(this.number);
        },
        child: Text(
          '$number',
          style: TextStyle(
            fontSize: 24,

            ),
        )),
    );
  }
}