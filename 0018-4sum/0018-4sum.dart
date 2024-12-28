class Solution {
  List<List<int>> fourSum(List<int> nums, int target) {
    // Urutkan nums terlebih dahulu
    nums.sort();
    List<List<int>> result = [];
    
    for (int i = 0; i < nums.length - 3; i++) {
      // Hindari duplikat untuk elemen pertama
      if (i > 0 && nums[i] == nums[i - 1]) continue;

      for (int j = i + 1; j < nums.length - 2; j++) {
        // Hindari duplikat untuk elemen kedua
        if (j > i + 1 && nums[j] == nums[j - 1]) continue;

        int left = j + 1;
        int right = nums.length - 1;

        while (left < right) {
          int sum = nums[i] + nums[j] + nums[left] + nums[right];

          if (sum == target) {
            result.add([nums[i], nums[j], nums[left], nums[right]]);
            // Hindari duplikat untuk elemen ketiga
            while (left < right && nums[left] == nums[left + 1]) left++;
            // Hindari duplikat untuk elemen keempat
            while (left < right && nums[right] == nums[right - 1]) right--;

            left++;
            right--;
          } else if (sum < target) {
            left++;
          } else {
            right--;
          }
        }
      }
    }
    return result;
  }
}
