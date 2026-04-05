// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\HATRA-2022-Paper_tmp_tmp5texxy8l_copilot_verification_Two Sum_two_sum.dfy
// Method: twoSum
// Generated: 2026-04-05 23:40:31

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
      if nums[i] + nums[j] == target {
        return i, j;
      }
      j := j + 1;
    }
    i := i + 1;
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST: index1 != index2
  //   POST: 0 <= index1 < nums.Length
  //   POST: 0 <= index2 < nums.Length
  //   POST: nums[index1] + nums[index2] == target
  {
    var nums := new int[2] [0, 0];
    var target := 0;
    var index1, index2 := twoSum(nums, target);
    expect index1 != index2;
    expect 0 <= index1 < nums.Length;
    expect 0 <= index2 < nums.Length;
    expect nums[index1] + nums[index2] == target;
  }

  // Test case for combination {1}/Bnums=2,target=1:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST: index1 != index2
  //   POST: 0 <= index1 < nums.Length
  //   POST: 0 <= index2 < nums.Length
  //   POST: nums[index1] + nums[index2] == target
  {
    var nums := new int[2] [-8855, 8856];
    var target := 1;
    var index1, index2 := twoSum(nums, target);
    expect index1 != index2;
    expect 0 <= index1 < nums.Length;
    expect 0 <= index2 < nums.Length;
    expect nums[index1] + nums[index2] == target;
  }

  // Test case for combination {1}/Bnums=3,target=0:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST: index1 != index2
  //   POST: 0 <= index1 < nums.Length
  //   POST: 0 <= index2 < nums.Length
  //   POST: nums[index1] + nums[index2] == target
  {
    var nums := new int[3] [-21239, 21239, 21240];
    var target := 0;
    var index1, index2 := twoSum(nums, target);
    expect index1 != index2;
    expect 0 <= index1 < nums.Length;
    expect 0 <= index2 < nums.Length;
    expect nums[index1] + nums[index2] == target;
  }

  // Test case for combination {1}/Bnums=3,target=1:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST: index1 != index2
  //   POST: 0 <= index1 < nums.Length
  //   POST: 0 <= index2 < nums.Length
  //   POST: nums[index1] + nums[index2] == target
  {
    var nums := new int[3] [0, 1, 8367];
    var target := 1;
    var index1, index2 := twoSum(nums, target);
    expect index1 != index2;
    expect 0 <= index1 < nums.Length;
    expect 0 <= index2 < nums.Length;
    expect nums[index1] + nums[index2] == target;
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
