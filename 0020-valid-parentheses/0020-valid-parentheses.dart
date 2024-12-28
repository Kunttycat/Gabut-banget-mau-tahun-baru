class Solution {
  bool isValid(String str) {
    final closingToOpening = {
      ')': '(',
      '}': '{',
      ']': '[',
    };

    final stack = <String>[];

    for (final ch in str.split('')) {
      if (closingToOpening.containsKey(ch)) {
        if (stack.isEmpty) {
          return false;
        }
        final lastOpening = stack.removeLast();
        if (lastOpening != closingToOpening[ch]) {
          return false;
        }
      } else {

        stack.add(ch);
      }
    }
    return stack.isEmpty;
  }
}
