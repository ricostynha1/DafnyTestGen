// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\HATRA-2022-Paper_tmp_tmp5texxy8l_copilot_verification_Two Sum_two_sum__1042_VER_i.dfy
// Method: twoSum
// Generated: 2026-04-24 12:20:00

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
  // Test case for combination {1}/Rel:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: index1 != index2
  //   POST Q2: 0 <= index1 < nums.Length
  //   POST Q3: 0 <= index2 < nums.Length
  //   POST Q4: nums[index1] + nums[index2] == target
  {
    var nums := new int[4] [58680, 58679, 58679, 58680];
    var target := 117358;
    var index1, index2 := twoSum(nums, target);
    expect index1 != index2;
    expect 0 <= index1 < nums.Length;
    expect 0 <= index2 < nums.Length;
    expect nums[index1] + nums[index2] == target;
    expect index1 == 1; // observed from implementation
    expect index2 == 2; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/V1:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: index1 != index2  // VACUOUS (forced true by other literals for this ins)
  //   POST Q2: 0 <= index1 < nums.Length
  //   POST Q3: 0 <= index2 < nums.Length
  //   POST Q4: nums[index1] + nums[index2] == target
  {
    var nums := new int[2] [30057, 17870];
    var target := 47927;
    var index1, index2 := twoSum(nums, target);
    // actual runtime state: index1=0, index2=0
    // expect index1 != index2; // got false
    // expect 0 <= index1 < nums.Length; // got true
    // expect 0 <= index2 < nums.Length; // got true
    // expect nums[index1] + nums[index2] == target; // LHS=60114, RHS=47927
  }

  // Test case for combination {1}/Bindex1=nums_len-1:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: index1 != index2
  //   POST Q2: 0 <= index1
  //   POST Q3: index1 < nums.Length
  //   POST Q4: 0 <= index2
  //   POST Q5: index2 < nums.Length
  //   POST Q6: nums[index1] + nums[index2] == target
  {
    var nums := new int[2] [0, 0];
    var target := 0;
    var index1, index2 := twoSum(nums, target);
    expect index1 == 1 || index1 == 0;
    expect index2 == 0 || index2 == 1;
    expect index1 == 0; // observed from implementation
    expect index2 == 1; // observed from implementation
  }

  // Test case for combination {1}/Otarget<0:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: index1 != index2
  //   POST Q2: 0 <= index1
  //   POST Q3: index1 < nums.Length
  //   POST Q4: 0 <= index2
  //   POST Q5: index2 < nums.Length
  //   POST Q6: nums[index1] + nums[index2] == target
  {
    var nums := new int[2] [47925, -47926];
    var target := -1;
    var index1, index2 := twoSum(nums, target);
    expect index1 == 0 || index1 == 1;
    expect index2 == 1 || index2 == 0;
    expect index1 == 0; // observed from implementation
    expect index2 == 0; // observed from implementation
  }

  // Test case for combination {1}/R3:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: index1 != index2
  //   POST Q2: 0 <= index1
  //   POST Q3: index1 < nums.Length
  //   POST Q4: 0 <= index2
  //   POST Q5: index2 < nums.Length
  //   POST Q6: nums[index1] + nums[index2] == target
  {
    var nums := new int[2] [30055, -30057];
    var target := -2;
    var index1, index2 := twoSum(nums, target);
    expect index1 == 0 || index1 == 1;
    expect index2 == 1 || index2 == 0;
    expect index1 == 0; // observed from implementation
    expect index2 == 0; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  2 <= nums.Length
  //   PRE:  exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length && nums[i] + nums[j] == target
  //   POST Q1: index1 != index2
  //   POST Q2: 0 <= index1
  //   POST Q3: index1 < nums.Length
  //   POST Q4: 0 <= index2
  //   POST Q5: index2 < nums.Length
  //   POST Q6: nums[index1] + nums[index2] == target
  {
    var nums := new int[2] [16081, -16084];
    var target := -3;
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
    var nums := new int[2] [13970, -13974];
    var target := -4;
    var index1, index2 := twoSum(nums, target);
    expect index1 == 0 || index1 == 1;
    expect index2 == 1 || index2 == 0;
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
    var nums := new int[2] [11854, -11853];
    var target := 1;
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
    var nums := new int[2] [11855, -11857];
    var target := -2;
    var index1, index2 := twoSum(nums, target);
    expect index1 == 0 || index1 == 1;
    expect index2 == 1 || index2 == 0;
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
    var nums := new int[2] [11853, -11858];
    var target := -5;
    var index1, index2 := twoSum(nums, target);
    expect index1 == 0 || index1 == 1;
    expect index2 == 1 || index2 == 0;
    expect index1 == 0; // observed from implementation
    expect index2 == 0; // observed from implementation
  }

}

method Main()
{
  TestsFortwoSum();
  print "TestsFortwoSum: all non-failing tests passed!\n";
}
