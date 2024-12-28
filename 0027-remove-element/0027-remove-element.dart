class Solution {
  int removeElement(List<int> nums, int val) {
    int j = 0;
    for (int n in nums){
        if(n != val){
            nums[j++] = n;
        }
    }
    return j;  
  }

}