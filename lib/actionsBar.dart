import 'package:flutter/material.dart';
import 'package:soduku_app/sharedStateWidget.dart';

class ActionsBar extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Table(
      children: _getActions()
    );
  }

  List<TableRow> _getActions()
  {
    return List.generate(1, (int i) {
      return TableRow(children: _getActionsRow());
    });
  }

  List<Widget> _getActionsRow()
  {
    return List.generate(3, (int index)
    {
      return Padding(
        padding: const EdgeInsets.only(top: 1, bottom: 1, left: 0, right: 0),
        child: Action(index)
      );
    });
  }
}

class Action extends StatelessWidget
{
  final int index;
  var actions = ['Undo', 'Erase', 'Notes'];

  Action(this.index);

  @override
  Widget build(BuildContext context)
  {
    return FlatButton(
      onPressed: () 
      {
        switch (actions[this.index]) {
          case 'Undo':
            bool flag = SharedStateWidget.of(context).sudokuGenerator.undo();
            if(!flag)
            {
              SnackBar(content: Text('Cannot Undo'));
            }
            break;
        }
      },
      child: Text(actions[this.index])
    );
  }
}