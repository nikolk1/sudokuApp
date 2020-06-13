import 'package:flutter/material.dart';
import 'sudokuGeneratorService.dart';

class SharedStateWidget extends InheritedWidget
{
  final SudokuGeneratorService sudokuGenerator = SudokuGeneratorService();

  SharedStateWidget({key, child}) : super(key: key, child: child);

  static SharedStateWidget of(BuildContext context)
  {
    return context.dependOnInheritedWidgetOfExactType<SharedStateWidget>();
  }

  @override
  bool updateShouldNotify(SharedStateWidget old) => sudokuGenerator != old.sudokuGenerator;
}