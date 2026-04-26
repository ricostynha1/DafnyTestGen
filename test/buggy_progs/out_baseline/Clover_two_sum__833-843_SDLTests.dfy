// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Clover_two_sum__833-843_SDL.dfy
// Method: twoSum
// Generated: 2026-04-24 19:28:47

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
    var nums := new int[2] [28962, 15660];
    var target := 44622;
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
    var nums := new int[4] [-1, 400, 0, 0];
    var target := 400;
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
    var nums := new int[2] [0, 0];
    var target := 0;
    var i, j := twoSum(nums, target);
    expect i == 0;
    expect j == 1;
  }

  // Test case for combination {1}/Otarget<0:
  //   PRE:  nums.Length > 1
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: 0 <= i
  //   POST Q2: i < j
  //   POST Q3: j < nums.Length
  //   POST Q4: nums[i] + nums[j] == target
  //   POST Q5: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   POST Q6: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  {
    var nums := new int[2] [-30056, -1];
    var target := -30057;
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
    var nums := new int[2] [-29654, -2];
    var target := -29656;
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
    var nums := new int[2] [-44456, 14398];
    var target := -30058;
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
    var nums := new int[2] [-60116, 30057];
    var target := -30059;
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
    var nums := new int[2] [-45721, 15661];
    var target := -30060;
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
    var nums := new int[2] [-45722, 15661];
    var target := -30061;
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
    var nums := new int[2] [-30059, -3];
    var target := -30062;
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
