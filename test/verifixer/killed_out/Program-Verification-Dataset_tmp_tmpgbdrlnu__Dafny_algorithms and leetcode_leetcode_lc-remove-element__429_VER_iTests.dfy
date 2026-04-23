// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_algorithms and leetcode_leetcode_lc-remove-element__429_VER_i.dfy
// Method: removeElement
// Generated: 2026-04-22 21:52:27

// Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_algorithms and leetcode_leetcode_lc-remove-element.dfy

method removeElement(nums: array<int>, val: int) returns (i: int)
  modifies nums
  ensures forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  decreases nums, val
{
  i := 0;
  var end := nums.Length - 1;
  while i <= end
    invariant 0 <= i <= nums.Length
    invariant end < nums.Length
    invariant forall k: int {:trigger nums[k]} :: 0 <= k < i ==> nums[k] != val
    decreases end - i
  {
    if nums[i] == i {
      if nums[end] == val {
        end := end - 1;
      } else {
        nums[i], nums[end] := nums[end], nums[i];
        i := i + 1;
        end := end - 1;
      }
    } else {
      i := i + 1;
    }
  }
}

method OriginalMain()
{
  var elems := new int[5] [1, 2, 3, 4, 5];
  var res := removeElement(elems, 5);
  print res, "\n", elems;
}


method TestsForremoveElement()
{
  // Test case for combination {1}:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[1] [5];
    var val := -10;
    var i := removeElement(nums, val);
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
    expect i == 1; // observed from implementation
  }

  // Test case for combination {1}/Bi=nums_pre_len:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[1] [6];
    var val := -9;
    var i := removeElement(nums, val);
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
    expect i == 1; // observed from implementation
  }

  // Test case for combination {1}/Bi=nums_pre_len-1:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[1] [7];
    var val := -8;
    var i := removeElement(nums, val);
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
    expect i == 1; // observed from implementation
  }

  // Test case for combination {1}/O|nums|=0:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[0] [];
    var val := -10;
    var i := removeElement(nums, val);
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
    expect i == 0; // observed from implementation
  }

}

method Main()
{
  TestsForremoveElement();
  print "TestsForremoveElement: all non-failing tests passed!\n";
}
