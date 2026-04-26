// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Clover_two_sum__833-843_SDL.dfy
// Method: twoSum
// Generated: 2026-04-24 12:56:30

// Clover_two_sum.dfy

method twoSum(nums: array<int>, target: int)
    returns (i: int, j: int)
  requires nums.Length > 1
  requires exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  ensures 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  ensures forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  ensures forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  decreases nums, target
{
  var n := nums.Length;
  i := 0;
  j := 1;
  while i < n - 1
    invariant 0 <= i < j <= n
    invariant forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < n ==> nums[ii] + nums[jj] != target
    decreases n - 1 - i
  {
    j := i + 1;
    while j < n
      invariant 0 <= i < j <= n
      invariant forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
      decreases n - j
    {
      if nums[i] + nums[j] == target {
        return;
      }
      j := j + 1;
    }
  }
}


method TestsFortwoSum()
{
  // Test case for combination {1}:
  //   PRE:  nums.Length > 1
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: 0 <= i
  //   POST Q2: i < j
  //   POST Q3: j < nums.Length
  //   POST Q4: nums[i] + nums[j] == target
  //   POST Q5: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   POST Q6: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  {
    var nums := new int[2] [-6, -4];
    var target := -10;
    var i, j := twoSum(nums, target);
    expect i == 0;
    expect j == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bi=1:
  //   PRE:  nums.Length > 1
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: 0 <= i
  //   POST Q2: i < j
  //   POST Q3: j < nums.Length
  //   POST Q4: nums[i] + nums[j] == target
  //   POST Q5: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   POST Q6: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  {
    var nums := new int[3] [-10, -8, -2];
    var target := -10;
    var i, j := twoSum(nums, target);
    // expect i == 1;
    // expect j == 2;
  }

  // Test case for combination {1}/Otarget=0:
  //   PRE:  nums.Length > 1
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: 0 <= i
  //   POST Q2: i < j
  //   POST Q3: j < nums.Length
  //   POST Q4: nums[i] + nums[j] == target
  //   POST Q5: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   POST Q6: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  {
    var nums := new int[2] [10, -10];
    var target := 0;
    var i, j := twoSum(nums, target);
    expect i == 0;
    expect j == 1;
  }

  // Test case for combination {1}/Otarget>0:
  //   PRE:  nums.Length > 1
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: 0 <= i
  //   POST Q2: i < j
  //   POST Q3: j < nums.Length
  //   POST Q4: nums[i] + nums[j] == target
  //   POST Q5: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   POST Q6: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  {
    var nums := new int[2] [9, -5];
    var target := 4;
    var i, j := twoSum(nums, target);
    expect i == 0;
    expect j == 1;
  }

  // Test case for combination {1}/R5:
  //   PRE:  nums.Length > 1
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: 0 <= i
  //   POST Q2: i < j
  //   POST Q3: j < nums.Length
  //   POST Q4: nums[i] + nums[j] == target
  //   POST Q5: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   POST Q6: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  {
    var nums := new int[2] [-7, -2];
    var target := -9;
    var i, j := twoSum(nums, target);
    expect i == 0;
    expect j == 1;
  }

  // Test case for combination {1}/R6:
  //   PRE:  nums.Length > 1
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: 0 <= i
  //   POST Q2: i < j
  //   POST Q3: j < nums.Length
  //   POST Q4: nums[i] + nums[j] == target
  //   POST Q5: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   POST Q6: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  {
    var nums := new int[2] [-7, -3];
    var target := -10;
    var i, j := twoSum(nums, target);
    expect i == 0;
    expect j == 1;
  }

  // Test case for combination {1}/R7:
  //   PRE:  nums.Length > 1
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: 0 <= i
  //   POST Q2: i < j
  //   POST Q3: j < nums.Length
  //   POST Q4: nums[i] + nums[j] == target
  //   POST Q5: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   POST Q6: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  {
    var nums := new int[2] [5, -10];
    var target := -5;
    var i, j := twoSum(nums, target);
    expect i == 0;
    expect j == 1;
  }

  // Test case for combination {1}/R8:
  //   PRE:  nums.Length > 1
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: 0 <= i
  //   POST Q2: i < j
  //   POST Q3: j < nums.Length
  //   POST Q4: nums[i] + nums[j] == target
  //   POST Q5: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   POST Q6: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  {
    var nums := new int[2] [-1, -9];
    var target := -10;
    var i, j := twoSum(nums, target);
    expect i == 0;
    expect j == 1;
  }

  // Test case for combination {1}/R9:
  //   PRE:  nums.Length > 1
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: 0 <= i
  //   POST Q2: i < j
  //   POST Q3: j < nums.Length
  //   POST Q4: nums[i] + nums[j] == target
  //   POST Q5: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   POST Q6: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  {
    var nums := new int[2] [-2, -8];
    var target := -10;
    var i, j := twoSum(nums, target);
    expect i == 0;
    expect j == 1;
  }

  // Test case for combination {1}/R10:
  //   PRE:  nums.Length > 1
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: 0 <= i
  //   POST Q2: i < j
  //   POST Q3: j < nums.Length
  //   POST Q4: nums[i] + nums[j] == target
  //   POST Q5: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   POST Q6: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  {
    var nums := new int[2] [3, -10];
    var target := -7;
    var i, j := twoSum(nums, target);
    expect i == 0;
    expect j == 1;
  }

}

method Main()
{
  TestsFortwoSum();
  print "TestsFortwoSum: all non-failing tests passed!\n";
}
