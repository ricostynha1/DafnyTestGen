// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\HATRA-2022-Paper_tmp_tmp5texxy8l_copilot_verification_Two Sum_two_sum__1042_VER_i.dfy
// Method: twoSum
// Generated: 2026-04-01 22:35:15

// HATRA-2022-Paper_tmp_tmp5texxy8l_copilot_verification_Two Sum_two_sum.dfy

method twoSum(nums: array<int>, target: int)
    returns (index1: int, index2: int)
  requires 2 <= nums.Length
  requires exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  ensures index1 != index2
  ensures 0 <= index1 < nums.Length
  ensures 0 <= index2 < nums.Length
  ensures nums[index1] + nums[index2] == target
  decreases nums, target
{
  var i := 0;
  while i < nums.Length
    invariant 0 <= i < nums.Length
    invariant forall u: int, v: int {:trigger nums[v], nums[u]} :: 0 <= u < v < nums.Length && u < i ==> nums[u] + nums[v] != target
    invariant exists u: int, v: int {:trigger nums[v], nums[u]} :: i <= u < v < nums.Length && nums[u] + nums[v] == target
    decreases nums.Length - i
  {
    var j := i + 1;
    while j < nums.Length
      invariant 0 <= i < j <= nums.Length
      invariant forall u: int, v: int {:trigger nums[v], nums[u]} :: 0 <= u < v < nums.Length && u < i ==> nums[u] + nums[v] != target
      invariant exists u: int, v: int {:trigger nums[v], nums[u]} :: i <= u < v < nums.Length && nums[u] + nums[v] == target
      invariant forall u: int {:trigger nums[u]} :: i < u < j ==> nums[i] + nums[u] != target
      decreases nums.Length - j
    {
      if nums[i] + nums[i] == target {
        return i, j;
      }
      j := j + 1;
    }
    i := i + 1;
  }
}


method Passing()
{
  // (no passing tests)
}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST: index1 != index2
  //   POST: 0 <= index1 < nums.Length
  //   POST: 0 <= index2 < nums.Length
  //   POST: nums[index1] + nums[index2] == target
  {
    var nums := new int[2] [2437, 2282];
    var target := 4719;
    // expect 2 <= nums.Length; // PRE-CHECK
    // expect exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target; // PRE-CHECK
    var index1, index2 := twoSum(nums, target);
    // expect index1 != index2;
    // expect 0 <= index1 < nums.Length;
    // expect 0 <= index2 < nums.Length;
    // expect nums[index1] + nums[index2] == target;
  }

  // Test case for combination {1}/Bnums=2,target=0:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST: index1 != index2
  //   POST: 0 <= index1 < nums.Length
  //   POST: 0 <= index2 < nums.Length
  //   POST: nums[index1] + nums[index2] == target
  {
    var nums := new int[2] [975, -975];
    var target := 0;
    // expect 2 <= nums.Length; // PRE-CHECK
    // expect exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target; // PRE-CHECK
    var index1, index2 := twoSum(nums, target);
    // expect index1 != index2;
    // expect 0 <= index1 < nums.Length;
    // expect 0 <= index2 < nums.Length;
    // expect nums[index1] + nums[index2] == target;
  }

  // Test case for combination {1}/Bnums=2,target=1:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST: index1 != index2
  //   POST: 0 <= index1 < nums.Length
  //   POST: 0 <= index2 < nums.Length
  //   POST: nums[index1] + nums[index2] == target
  {
    var nums := new int[2] [-1795, 1796];
    var target := 1;
    // expect 2 <= nums.Length; // PRE-CHECK
    // expect exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target; // PRE-CHECK
    var index1, index2 := twoSum(nums, target);
    // expect index1 != index2;
    // expect 0 <= index1 < nums.Length;
    // expect 0 <= index2 < nums.Length;
    // expect nums[index1] + nums[index2] == target;
  }

  // Test case for combination {1}/Bnums=3,target=0:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST: index1 != index2
  //   POST: 0 <= index1 < nums.Length
  //   POST: 0 <= index2 < nums.Length
  //   POST: nums[index1] + nums[index2] == target
  {
    var nums := new int[3] [-281, 9, 281];
    var target := 0;
    // expect 2 <= nums.Length; // PRE-CHECK
    // expect exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target; // PRE-CHECK
    var index1, index2 := twoSum(nums, target);
    // expect index1 != index2;
    // expect 0 <= index1 < nums.Length;
    // expect 0 <= index2 < nums.Length;
    // expect nums[index1] + nums[index2] == target;
  }

}

method Main()
{
  Passing();
  Failing();
}
