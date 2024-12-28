class Solution {
  int strStr(String haystack, String needle) {
     
    if(needle.length > haystack.length){
        return -1;
     }
    var result = -1;

    for (int i = 0; i < haystack.length; i++){

      if (haystack[i] == needle[0]){
        var index = i;
        var j = 0;
        if (haystack.length - i >= needle.length){

        while (haystack[index] == needle[j]){
          if (j == needle.length - 1){
            return i;
          }
        index++;
        j++;
        }
        }
        
      }
}
    return result;
  }
}