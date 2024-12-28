

/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
    
  int findInsertionIndex(List<List<int>> sortedList, int valueToInsert) {
    int left = 0;
    int right = sortedList.length - 1;

    while (left <= right) {
      int mid = left + ((right - left) ~/ 2);

      if (sortedList[mid] == valueToInsert) {
        return mid;
      } else if (sortedList[mid][1] <= valueToInsert) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }

    return left;
  }

  ListNode? mergeKLists(List<ListNode?> lists) {

    var best_list = <List<int>>[];
    for (int n = 0; n < lists.length; ++n) {
      if (lists[n] == null)
        continue;
      best_list.add([n, lists[n]!.val]);
    }
    if (best_list.isEmpty)
      return null;

    ListNode? start = ListNode();
    ListNode? cur_node = start;
    List<ListNode?> lists_copy = List<ListNode?>.from(lists);
    best_list.sort((a, b) => a[1] - b[1]);

    while(true) {

      List<int> smallest = best_list[0];
      cur_node!.val = smallest[1];

      var smallest_node = lists_copy[smallest[0]];
      smallest_node = smallest_node!.next;
      if (smallest_node != null) {

        smallest[1] = smallest_node.val;
        lists_copy[smallest[0]] = smallest_node;
        var index = findInsertionIndex(best_list, smallest[1]);
        
        best_list.insert(index, smallest);
      }
      best_list.removeAt(0);

      if (!best_list.isEmpty) {
        cur_node.next = ListNode();
        cur_node = cur_node.next;
      }
      else
        break;
    }

    return start;
  }
}