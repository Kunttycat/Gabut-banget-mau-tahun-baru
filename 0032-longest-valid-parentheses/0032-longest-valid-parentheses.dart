class Solution {
  int longestValidParentheses(String s) {
    List<int> stack = [-1]; 
    int maxLength = 0;
    
    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        stack.add(i); 
      } else {
        stack.removeLast(); 
        
        if (stack.isEmpty) {
          stack.add(i); 
        } else {

          maxLength = max(maxLength, i - stack.last);
        }
      }
    }
    
    return maxLength;
  }

  int max(int a, int b) {
    return a > b ? a : b;
  }
}
