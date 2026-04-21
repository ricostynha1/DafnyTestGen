// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Clover_two_sum__833-843_SDL.dfy
// Method: twoSum
// Generated: 2026-04-08 16:43:13

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  nums.Length > 1
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST: 0 <= i < j < nums.Length
  //   POST: nums[i] + nums[j] == target
  //   POST: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   POST: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  //   ENSURES: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   ENSURES: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   ENSURES: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  {
    var nums := new int[2] [2437, 30093];
    var target := 32530;
    var i, j := twoSum(nums, target);
    expect i == 0;
    expect j == 1;
  }

  // Test case for combination {1}/Bnums=2,target=0:
  //   PRE:  nums.Length > 1
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST: 0 <= i < j < nums.Length
  //   POST: nums[i] + nums[j] == target
  //   POST: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   POST: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  //   ENSURES: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   ENSURES: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   ENSURES: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  {
    var nums := new int[2] [-39, 39];
    var target := 0;
    var i, j := twoSum(nums, target);
    expect i == 0;
    expect j == 1;
  }

  // Test case for combination {1}/Bnums=2,target=1:
  //   PRE:  nums.Length > 1
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST: 0 <= i < j < nums.Length
  //   POST: nums[i] + nums[j] == target
  //   POST: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   POST: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  //   ENSURES: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   ENSURES: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   ENSURES: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  {
    var nums := new int[2] [-38, 39];
    var target := 1;
    var i, j := twoSum(nums, target);
    expect i == 0;
    expect j == 1;
  }

  // Test case for combination {1}/Bnums=3,target=0:
  //   PRE:  nums.Length > 1
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST: 0 <= i < j < nums.Length
  //   POST: nums[i] + nums[j] == target
  //   POST: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   POST: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  //   ENSURES: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   ENSURES: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   ENSURES: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  {
    var nums := new int[3] [-7720, 7719, 7720];
    var target := 0;
    var i, j := twoSum(nums, target);
    expect i == 0;
    expect j == 2;
  }

  // Test case for combination {1}/Oi=0:
  //   PRE:  nums.Length > 1
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST: 0 <= i < j < nums.Length
  //   POST: nums[i] + nums[j] == target
  //   POST: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   POST: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  //   ENSURES: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   ENSURES: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   ENSURES: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  {
    var nums := new int[2] [-1, 0];
    var target := -1;
    var i, j := twoSum(nums, target);
    expect i == 0;
    expect j == 1;
  }

  // Test case for combination {1}/Oj>0:
  //   PRE:  nums.Length > 1
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST: 0 <= i < j < nums.Length
  //   POST: nums[i] + nums[j] == target
  //   POST: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   POST: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  //   ENSURES: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   ENSURES: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   ENSURES: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  {
    var nums := new int[2] [0, 21240];
    var target := 21240;
    var i, j := twoSum(nums, target);
    expect i == 0;
    expect j == 1;
  }

}

method Failing()
{
  // Test case for combination {1}/Oi>0:
  //   PRE:  nums.Length > 1
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST: 0 <= i < j < nums.Length
  //   POST: nums[i] + nums[j] == target
  //   POST: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   POST: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  //   ENSURES: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   ENSURES: forall ii: int, jj: int {:trigger nums[jj], nums[ii]} :: 0 <= ii < i && ii < jj < nums.Length ==> nums[ii] + nums[jj] != target
  //   ENSURES: forall jj: int {:trigger nums[jj]} :: i < jj < j ==> nums[i] + nums[jj] != target
  {
    var nums := new int[4] [20655, 20651, 20652, 20653];
    var target := 41305;
    var i, j := twoSum(nums, target);
    // expect i == 2;
    // expect j == 3;
  }

}

method Main()
{
  Passing();
  Failing();
}
