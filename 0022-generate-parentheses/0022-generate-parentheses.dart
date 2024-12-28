class Solution {
  List<String> generateParenthesis(int n) {
    List<String> result = [];
    _generateParenthesisHelper(n, n, '', result);
    return result;
  }

  void _generateParenthesisHelper(int open, int close, String current, List<String> result) {
    if (open == 0 && close == 0) {
      result.add(current);
      return;
    }

    if (open > 0) {
      _generateParenthesisHelper(open - 1, close, current + '(', result);
    }
    if (close > open) {
      _generateParenthesisHelper(open, close - 1, current + ')', result);
    }
  }
}
