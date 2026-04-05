// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_algorithms and leetcode_leetcode_lc-remove-element__429_VER_i.dfy
// Method: removeElement
// Generated: 2026-04-05 23:55:28

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


method Passing()
{
  // Test case for combination {1}:
  //   POST: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[0] [];
    var val := 9;
    var i := removeElement(nums, val);
    // expect i == 0; // (actual runtime value — not uniquely determined by spec)
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
  }

  // Test case for combination {1}/Bnums=0,val=0:
  //   POST: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[0] [];
    var val := 0;
    var i := removeElement(nums, val);
    // expect i == 0; // (actual runtime value — not uniquely determined by spec)
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
  }

  // Test case for combination {1}/Bnums=0,val=1:
  //   POST: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[0] [];
    var val := 1;
    var i := removeElement(nums, val);
    // expect i == 0; // (actual runtime value — not uniquely determined by spec)
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
  }

  // Test case for combination {1}/Bnums=1,val=0:
  //   POST: forall k: int {:trigger nums[k]} :: 0 < k < i < nums.Length ==> nums[k] != val
  {
    var nums := new int[1] [16];
    var val := 0;
    var i := removeElement(nums, val);
    // expect i == 1; // (actual runtime value — not uniquely determined by spec)
    expect forall k: int :: 0 < k < i < nums.Length ==> nums[k] != val;
  }

}

method Failing()
{
  // (no failing tests)
}

method Main()
{
  Passing();
  Failing();
}
