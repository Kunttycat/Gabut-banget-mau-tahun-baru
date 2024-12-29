class Solution {
  void nextPermutation(List<int> nums) {
    int n = nums.length;

    int i = n - 2;
    while (i >= 0 && nums[i] >= nums[i + 1]) {
      i--;
    }

    if (i >= 0) {
      int j = n - 1;
      while (nums[j] <= nums[i]) {
        j--;
      }

      _swap(nums, i, j);
    }

    _reverse(nums, i + 1);
  }

  void _swap(List<int> nums, int i, int j) {
    int temp = nums[i];
    nums[i] = nums[j];
    nums[j] = temp;
  }

  void _reverse(List<int> nums, int i) {
    int left = i, right = nums.length - 1;
    while (left < right) {
      _swap(nums, left, right);
      left++;
      right--;
    }
  }
}
