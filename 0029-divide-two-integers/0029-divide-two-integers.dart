class Solution {
  int divide(int dividend, int divisor) {

    if (dividend == -2147483648 && divisor == -1) {
      return 2147483647; 
    }

    bool negative = (dividend < 0) != (divisor < 0); 
    
    int absDividend = dividend.abs();
    int absDivisor = divisor.abs();
    
    int result = 0;
    
    while (absDividend >= absDivisor) {
      int tempDivisor = absDivisor;
      int numDivisions = 1;
      while (absDividend >= (tempDivisor << 1)) {
        tempDivisor <<= 1;
        numDivisions <<= 1;
      }
      absDividend -= tempDivisor;
      result += numDivisions;
    }
    return negative ? -result : result;
  }
}
