import 'dart:core';
import 'dart:developer';

int _direction = -1;

List<int> x = [
  // -1 /*0 DBTL */,
  // -1 /*1 BTT */,
  -1 /* 2 DBTTR */,
  // 0 /*3 RTL */,
  0 /* 4 LTR */,
  // 1 /* 5 DTTBL */,
  1 /* 6 TTB */,
  // 1 /* 7 DTTBR */,
];
// List<int> x = [-1, -1, -1, 0, 0, 1, 1, 1];
// List<int> y = [-1, 0, 1, -1, 1, -1, 0, 1];
List<int> y = [
  // -1,
  // 0,
  1,
  // -1,
  1,
  // -1,
  0,
  // 1, /* */
];

List<int> patternSearch(List<List> grid, int m, int n, String word) {
  // Consider every point as starting
  // point and search given word
  List<int> solution = [];
  int x = 1;
  for (int row = 0; row < n; row++) {
    for (int col = 0; col < m; col++) {
      if (search2D(grid, row, col, word, m, n)) {
        solution.add((row * m) + col);
        switch (_direction) {
          case 0:
            for (int i = solution[0]; i >= 0; i -= m) {
              if (!solution.contains(i) && solution.length < word.length) {
                solution.add(i + x);
                x += 1;
              }
            }
            break;
          case 1:
            for (int i = solution[0]; i < solution[0] + word.length; i++) {
              if (!solution.contains(i) && solution.length < word.length) {
                solution.add(i);
              }
            }
            break;
          case 2:
            for (int i = solution[0]; i < m * n; i += m) {
              if (!solution.contains(i) && solution.length < word.length) {
                solution.add(i);
              }
            }
            break;
          default:
        }
        log("pattern found at  $row  $col ");
        for (var element in solution) {
          log(element.toString());
        }
      }
    }
  }
  return solution;
}

bool search2D(List<List> grid, int row, int col, String word, int m, int n) {
  // If first character of word doesn't match
  // with given starting point in grid.
  /* log(grid[row == 0
      ? row
      : col == 0
          ? row
          : row % col]); */
  if (grid[row][col] != word[0]) {
    return false;
  }

  int len = word.length;

  // Search word in all 8 directions
  // starting from (row, col)
  for (int dir = 0; dir < 3; dir++) {
    // Initialize starting point
    // for current direction
    int k, rd = row + x[dir], cd = col + y[dir];

    // First character is already checked,
    // match remaining characters
    for (k = 1; k < len; k++) {
      // If out of bound break
      if (rd >= n || rd < 0 || cd >= m || cd < 0) {
        break;
      }
      /* log(grid[rd == 0
          ? rd
          : cd == 0
              ? rd
              : rd % cd]); */
      // If not matched, break
      if (grid[rd][cd] != word[k]) {
        break;
      }

      // Moving in particular direction
      rd += x[dir];
      cd += y[dir];
    }

    // If all character matched, then value of k
    // must be equal to length of word
    log('$k is $len  when $dir');
    if (k == len) {
      _direction = dir;
      return true;
    }
  }
  return false;
}
