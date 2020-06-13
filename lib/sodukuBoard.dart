import 'package:flutter/material.dart';
import 'sharedStateWidget.dart';

class SodukuBoard extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    return Table(
      border: TableBorder.all(width: 1.0, color: Colors.black),
      children: _getTableRows(),
    );
  }

  List<TableRow> _getTableRows()
  {
    return List.generate(9, (int row)
    {
      return TableRow(children: _getRow(row));
    });
  }

  List<SodukuCell> _getRow(int row)
  {
    return List.generate(9, (int col)
    {
      return SodukuCell(row, col);
    });
  }
}

class SodukuCell extends StatefulWidget {
  final int row;
  final int col;

  SodukuCell(this.row, this.col);

  @override
  _SodukuCellState createState() => _SodukuCellState();
}

class _SodukuCellState extends State<SodukuCell>
{
  @override
  Widget build(BuildContext context)
  {
    return InkResponse(
      enableFeedback: true,
      onTap: ()
      {
        setState(() {
           SharedStateWidget.of(context).sudokuGenerator.setBoardCell(this.widget.row, this.widget.col);
        });
      },
      child: SizedBox(
        width: 35,
        height: 45,
        child: Container(
          child: Center(
            child: Text(
              SharedStateWidget.of(context).sudokuGenerator.getBoardCell(this.widget.row, this.widget.col)
            ),
          )
        ),
      )
    );
  }
}