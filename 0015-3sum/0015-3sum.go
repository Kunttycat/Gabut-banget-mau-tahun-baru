func threeSum(nums []int) [][]int {
    sort.Ints(nums)  // Sort the array first
    result := [][]int{}
    
    for i := 0; i < len(nums)-2; i++ {
        // Skip duplicate elements for the first element
        if i > 0 && nums[i] == nums[i-1] {
            continue
        }
        
        left, right := i+1, len(nums)-1
        
        for left < right {
            sum := nums[i] + nums[left] + nums[right]
            
            if sum == 0 {
                result = append(result, []int{nums[i], nums[left], nums[right]})
                
                // Skip duplicates for the second and third elements
                for left < right && nums[left] == nums[left+1] {
                    left++
                }
                for left < right && nums[right] == nums[right-1] {
                    right--
                }
                
                left++
                right--
            } else if sum < 0 {
                left++
            } else {
                right--
            }
        }
    }
    
    return result
}