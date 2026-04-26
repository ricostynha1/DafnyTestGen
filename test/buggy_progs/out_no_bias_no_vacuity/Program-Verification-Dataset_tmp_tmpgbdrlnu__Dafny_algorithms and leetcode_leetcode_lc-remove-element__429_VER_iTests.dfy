// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_algorithms and leetcode_leetcode_lc-remove-element__429_VER_i.dfy
// Method: removeElement
// Generated: 2026-04-24 22:40:59

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
    var nums := new int[0] [];
    var val := 9;
    var i := removeElement(nums, val);
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
    expect i == 0; // observed from implementation
  }

  // Test case for combination {1}/Bi=nums_pre_len-1:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[1] [31];
    var val := 0;
    var i := removeElement(nums, val);
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
    expect i == 1; // observed from implementation
  }

  // Test case for combination {1}/O|nums|>=2:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[2] [32, 30];
    var val := 10;
    var i := removeElement(nums, val);
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
    expect i == 2; // observed from implementation
  }

  // Test case for combination {1}/Oval<0:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[0] [];
    var val := -1;
    var i := removeElement(nums, val);
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
    expect i == 0; // observed from implementation
  }

  // Test case for combination {1}/Oi>0:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[0] [];
    var val := 11;
    var i := removeElement(nums, val);
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
    expect i == 0; // observed from implementation
  }

  // Test case for combination {1}/Oi<0:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[0] [];
    var val := 12;
    var i := removeElement(nums, val);
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
    expect i == 0; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[0] [];
    var val := 13;
    var i := removeElement(nums, val);
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
    expect i == 0; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[1] [28];
    var val := 14;
    var i := removeElement(nums, val);
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
    expect i == 1; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[0] [];
    var val := 15;
    var i := removeElement(nums, val);
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
    expect i == 0; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[0] [];
    var val := 16;
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
