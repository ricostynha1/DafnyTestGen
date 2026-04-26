// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_algorithms and leetcode_leetcode_lc-remove-element__257_ROR_Neq.dfy
// Method: removeElement
// Generated: 2026-04-24 10:45:59

// Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_algorithms and leetcode_leetcode_lc-remove-element.dfy

method removeElement(nums: array<int>, val: int) returns (i: int)
  modifies nums
  ensures forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  decreases nums, val
{
  i := 0;
  var end := nums.Length - 1;
  while i != end
    invariant 0 <= i <= nums.Length
    invariant end < nums.Length
    invariant forall k: int {:trigger nums[k]} :: 0 <= k < i ==> nums[k] != val
    decreases if i <= end then end - i else i - end
  {
    if nums[i] == val {
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
    var nums := new int[1] [-10];
    var val := -10;
    var i := removeElement(nums, val);
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
    expect i == 0; // observed from implementation
  }

  // Test case for combination {1}/Bi=nums_pre_len:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[1] [-9];
    var val := -9;
    var i := removeElement(nums, val);
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
    expect i == 0; // observed from implementation
  }

  // Test case for combination {1}/Bi=nums_pre_len-1:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[1] [6];
    var val := -8;
    var i := removeElement(nums, val);
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
    expect i == 0; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|nums|=0:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[0] [];
    var val := -10;
    var i := removeElement(nums, val);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.removeElement(BigInteger[] nums, BigInteger val) in C:\cygwin64\tmp\DafnyCBT_wuj1igaw35u\runner.cs:line 5925
    // runtime error: at _module.__default.TestCase__3() in C:\cygwin64\tmp\DafnyCBT_wuj1igaw35u\runner.cs:line 6097
    // expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
  }

  // Test case for combination {1}/O|nums|>=2:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[2] [7, 6];
    var val := -10;
    var i := removeElement(nums, val);
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
    expect i == 1; // observed from implementation
  }

  // Test case for combination {1}/Oval=0:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[1] [-10];
    var val := 0;
    var i := removeElement(nums, val);
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
    expect i == 0; // observed from implementation
  }

  // Test case for combination {1}/Oval>0:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[1] [-8];
    var val := 9;
    var i := removeElement(nums, val);
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
    expect i == 0; // observed from implementation
  }

  // Test case for combination {1}/Oi<0:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[1] [5];
    var val := -7;
    var i := removeElement(nums, val);
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
    expect i == 0; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[1] [3];
    var val := -6;
    var i := removeElement(nums, val);
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
    expect i == 0; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   POST Q1: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[1] [8];
    var val := -5;
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
