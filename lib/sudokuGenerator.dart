import 'dart:math' as math;
import 'dart:core';


class SudokuSqaure
{
  num row;
  num col;

  SudokuSqaure.origin()
  {
    row = 0;
    col = 0;
  }

  SudokuSqaure(num row, num col)
  {
    this.row = row;
    this.col = col;
  }

  num getRow()
  {
    return row;
  }

  num getCol()
  {
    return col;
  }

}

class SudokuGenerator
{
  List<List<int>> _board;
  final num size = 9;

  SudokuGenerator()
  {
    // initialize board
    _board = new List<List<int>>(size);
    for(var i = 0; i < size; i++)
    {
      _board[i] = new List<int>(this.size);
    }
  }

  void createBoard_method1()
  {
    num MAX_ATTAMPTS = 8;
    var temp = '';
    // going over the rows
    for(var row = 0; row < size; row++)
    {
      // iterating on elements in row
      for(var col = 0; col < size; col++)
      {
        num attempts = 0;
        int randomNum;
        
        if (_board[row][col] != null)
        {
          temp += _board[row][col].toString() + ' ';
          continue;
        }

        do {
          if (attempts > MAX_ATTAMPTS)
          {
            col = (col + 9 - 1) % 9;
            _board[row][col] = null;
            attempts = 0;
          }
          randomNum = math.Random().nextInt(size) + 1;
          attempts += 1;
        } while (!(checkColumn(col, randomNum) && checkRow(row, randomNum) && checkCell(row, col, randomNum)));

        _board[row][col] = randomNum;
        temp += _board[row][col].toString() + ' ';
      }

      print(temp);
      temp = '';
    }
  }

  void createBoard2()
  {
    for(var i = 0; i < size; i+=3)
    {
      fillCell(i, i);
    }
    createBoard_method1();
  }

  void printBoard()
  {
    var line = '';
    for(var i = 0; i < size; i++)
    {
      for(var j = 0; j < size; j++)
      {
        line += _board[i][j].toString() + ' ';
      }
      print(line);
      line = '';
    }
  }

  void createBoard2_1()
  {
    for(var i = 0; i < size; i += 3)
    {
      fillCell(i, i);
    }

    fillCell(0, 3);
    fillCell(3, 6);
    fillCell(3, 0);
    fillCell(6, 3);
    fillCell(0, 6);
    fillCell(6, 0);
  }

  void fillCell(int startRow, int startCol)
  {
    for(var row = startRow; row < startRow + 3; row++)
    {
      for(var col = startCol; col < startCol + 3; col++)
      {
        int randomNum;
        do {
          randomNum = math.Random().nextInt(size) + 1;
        } while (!(checkColumn(col, randomNum) && checkRow(row, randomNum) && checkCell(row, col, randomNum)));

        _board[row][col] = randomNum;
      }
    }
  }

  bool checkRow(int rowNum, int number)
  {
    var row = _board[rowNum];
    for(var i = 0; i < size; i++)
    {
      if(number == row[i])
      {
        return false;
      }
    }
    return true;
  }

  bool checkColumn(int colNum, int number)
  {
    for(var i = 0; i < size; i++)
    {
      if(_board[i][colNum] == number)
      {
        return false;
      }
    }
    return true;
  }

  bool checkCell(int rowNum, int colNum, int number)
  {
    // go over rows of cells
    for(var row = 0; row < size; row += 3)
    {
      for(var col = 0; col < size; col += 3)
      {
        if((rowNum <= row + 2 && rowNum >= row) && (colNum <= col + 2 && colNum >= col))
        {
          return isValidCell(row, col, row, col, number, rowNum, colNum);
        }
      }
    } 
    throw('invalid cell');
  }

  bool isValidCell(int originRow, int originCol, int currRow, int currCol, int number, int pRow, int pCol)
  {
    bool result;
    if(originRow + 2 <= currRow && originCol + 2 <= currCol)
    {
      return true;
    }
    else if(_board[currRow][currCol] == number && (currCol != pCol && currRow != pRow))
    {
      result = false;
    }
    else
    {
      result = true;
    }

    if(originRow + 2 > currRow)
    {
      result = result && isValidCell(originRow, originCol, currRow + 1, currCol, number, pRow, pCol);
    }

    if(originCol + 2 > currCol)
    {
      result = result && isValidCell(originRow, originCol, currRow, currCol + 1, number, pRow, pCol);
    }
    return result;
  }

  void createBoard_3()
  {
    backtracking(0, 0);
  }

  bool backtracking(int row, int col)
  {
    if (row >= size) // the board is full
    {
      return true;
    }
    else if (_board[row][col] != null)
    {
      var res;
      if (col == 8)
      {
        res = backtracking(row + 1, (col + 1) % 9);
      }
      else
      {
        res = backtracking(row, (col + 1) % 9);
      }

      if(!res)
      {
        _board[row][col] = null;
      }
      return res;
    }
    else
    {
      for(var i = 1; i <= 9 ; i++)
      {
        var result = false;
        if (checkColumn(col, i) && checkRow(row, i) && checkCell(row, col, i))
        {
          _board[row][col] = i;
          var res;
          if (col == 8)
          {
            res = backtracking(row + 1, (col + 1) % 9);
          }
          else
          {
            res = backtracking(row, (col + 1) % 9);
          }

          if(!res)
          {
            _board[row][col] = null;
          }
          else
          {
            return true;
          }
        }
      }
      return false;
    }
  }
}

void main()
{
  var gen = SudokuGenerator();
  gen.createBoard_3();
  var a = 1;
}