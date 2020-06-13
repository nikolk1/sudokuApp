import 'dart:ffi';
import 'package:flutter/material.dart';

class SudokuGeneratorService
{
  List<List<int>> board = List.generate(9, (_) => List.generate(9, (_) => 0));
  var last_cell = {'row': -1, 'col': -1};
  int last_value = -1;
  int number = 0;

  // final generator = SudokuGenerator();

  String getBoardCell(int row, int col)
  {
    return this.board[row][col].toString();
  }

  void setBoardCell(int row, int col)
  {
    this.last_cell = {'row': row, 'col': col};
    this.last_value = this.board[row][col];
    this.board[row][col] = this.number;
  }

  void setNumber(int value)
  {
    this.number = value;
  }

  void init_undo()
  {
    this.last_cell = {'row': -1, 'col': -1};
    this.last_value = -1;
  }

  bool undo()
  {
    if (this.last_value == -1 || this.last_cell['row'] == -1 || this.last_cell['col'] == -1)
    {
      return false;
    }
    this.board[this.last_cell['row']][this.last_cell['col']] = this.last_value;
    this.init_undo();
    return true;
  }
}
