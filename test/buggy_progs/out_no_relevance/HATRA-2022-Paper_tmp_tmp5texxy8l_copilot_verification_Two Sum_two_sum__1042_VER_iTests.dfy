// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\HATRA-2022-Paper_tmp_tmp5texxy8l_copilot_verification_Two Sum_two_sum__1042_VER_i.dfy
// Method: twoSum
// Generated: 2026-04-24 14:05:42

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


method TestsFortwoSum()
{
  // Test case for combination {1}:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: index1 != index2
  //   POST Q2: 0 <= index1
  //   POST Q3: index1 < nums.Length
  //   POST Q4: 0 <= index2
  //   POST Q5: index2 < nums.Length
  //   POST Q6: nums[index1] + nums[index2] == target
  {
    var nums := new int[2] [-8, -2];
    var target := -10;
    var index1, index2 := twoSum(nums, target);
    expect index1 == 0 || index1 == 1;
    expect index2 == 1 || index2 == 0;
    expect index1 == 0; // observed from implementation
    expect index2 == 0; // observed from implementation
  }

  // Test case for combination {1}/Bindex1=1:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: index1 != index2
  //   POST Q2: 0 <= index1
  //   POST Q3: index1 < nums.Length
  //   POST Q4: 0 <= index2
  //   POST Q5: index2 < nums.Length
  //   POST Q6: nums[index1] + nums[index2] == target
  {
    var nums := new int[2] [-8, -1];
    var target := -9;
    var index1, index2 := twoSum(nums, target);
    expect index1 == 1 || index1 == 0;
    expect index2 == 0 || index2 == 1;
    expect index1 == 0; // observed from implementation
    expect index2 == 0; // observed from implementation
  }

  // Test case for combination {1}/Otarget=0:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: index1 != index2
  //   POST Q2: 0 <= index1
  //   POST Q3: index1 < nums.Length
  //   POST Q4: 0 <= index2
  //   POST Q5: index2 < nums.Length
  //   POST Q6: nums[index1] + nums[index2] == target
  {
    var nums := new int[2] [10, -10];
    var target := 0;
    var index1, index2 := twoSum(nums, target);
    expect index1 == 1 || index1 == 0;
    expect index2 == 0 || index2 == 1;
    expect index1 == 0; // observed from implementation
    expect index2 == 0; // observed from implementation
  }

  // Test case for combination {1}/Otarget>0:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: index1 != index2
  //   POST Q2: 0 <= index1
  //   POST Q3: index1 < nums.Length
  //   POST Q4: 0 <= index2
  //   POST Q5: index2 < nums.Length
  //   POST Q6: nums[index1] + nums[index2] == target
  {
    var nums := new int[2] [10, -8];
    var target := 2;
    var index1, index2 := twoSum(nums, target);
    expect index1 == 0 || index1 == 1;
    expect index2 == 1 || index2 == 0;
    expect index1 == 0; // observed from implementation
    expect index2 == 0; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: index1 != index2
  //   POST Q2: 0 <= index1
  //   POST Q3: index1 < nums.Length
  //   POST Q4: 0 <= index2
  //   POST Q5: index2 < nums.Length
  //   POST Q6: nums[index1] + nums[index2] == target
  {
    var nums := new int[2] [-1, -9];
    var target := -10;
    var index1, index2 := twoSum(nums, target);
    expect index1 == 1 || index1 == 0;
    expect index2 == 0 || index2 == 1;
    expect index1 == 0; // observed from implementation
    expect index2 == 0; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: index1 != index2
  //   POST Q2: 0 <= index1
  //   POST Q3: index1 < nums.Length
  //   POST Q4: 0 <= index2
  //   POST Q5: index2 < nums.Length
  //   POST Q6: nums[index1] + nums[index2] == target
  {
    var nums := new int[2] [2, -9];
    var target := -7;
    var index1, index2 := twoSum(nums, target);
    expect index1 == 0 || index1 == 1;
    expect index2 == 1 || index2 == 0;
    expect index1 == 0; // observed from implementation
    expect index2 == 0; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: index1 != index2
  //   POST Q2: 0 <= index1
  //   POST Q3: index1 < nums.Length
  //   POST Q4: 0 <= index2
  //   POST Q5: index2 < nums.Length
  //   POST Q6: nums[index1] + nums[index2] == target
  {
    var nums := new int[2] [-3, -7];
    var target := -10;
    var index1, index2 := twoSum(nums, target);
    expect index1 == 1 || index1 == 0;
    expect index2 == 0 || index2 == 1;
    expect index1 == 0; // observed from implementation
    expect index2 == 0; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: index1 != index2
  //   POST Q2: 0 <= index1
  //   POST Q3: index1 < nums.Length
  //   POST Q4: 0 <= index2
  //   POST Q5: index2 < nums.Length
  //   POST Q6: nums[index1] + nums[index2] == target
  {
    var nums := new int[2] [8, -10];
    var target := -2;
    var index1, index2 := twoSum(nums, target);
    expect index1 == 0 || index1 == 1;
    expect index2 == 1 || index2 == 0;
    expect index1 == 0; // observed from implementation
    expect index2 == 0; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: index1 != index2
  //   POST Q2: 0 <= index1
  //   POST Q3: index1 < nums.Length
  //   POST Q4: 0 <= index2
  //   POST Q5: index2 < nums.Length
  //   POST Q6: nums[index1] + nums[index2] == target
  {
    var nums := new int[2] [-9, -1];
    var target := -10;
    var index1, index2 := twoSum(nums, target);
    expect index1 == 0 || index1 == 1;
    expect index2 == 1 || index2 == 0;
    expect index1 == 0; // observed from implementation
    expect index2 == 0; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: index1 != index2
  //   POST Q2: 0 <= index1
  //   POST Q3: index1 < nums.Length
  //   POST Q4: 0 <= index2
  //   POST Q5: index2 < nums.Length
  //   POST Q6: nums[index1] + nums[index2] == target
  {
    var nums := new int[2] [9, -4];
    var target := 5;
    var index1, index2 := twoSum(nums, target);
    expect index1 == 1 || index1 == 0;
    expect index2 == 0 || index2 == 1;
    expect index1 == 0; // observed from implementation
    expect index2 == 0; // observed from implementation
  }

}

method Main()
{
  TestsFortwoSum();
  print "TestsFortwoSum: all non-failing tests passed!\n";
}
