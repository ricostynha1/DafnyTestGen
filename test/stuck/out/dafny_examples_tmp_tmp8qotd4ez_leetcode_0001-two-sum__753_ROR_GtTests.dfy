// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\stuck\in\dafny_examples_tmp_tmp8qotd4ez_leetcode_0001-two-sum__753_ROR_Gt.dfy
// Method: TwoSum
// Generated: 2026-04-22 19:27:43

// dafny_examples_tmp_tmp8qotd4ez_leetcode_0001-two-sum.dfy

predicate InMap(nums: seq<int>, m: map<int, int>, t: int)
  decreases nums, m, t
{
  forall j: int {:trigger nums[j]} :: 
    0 <= j < |nums| ==>
      t - nums[j] in m
}

method TwoSum(nums: array<int>, target: int) returns (r: (int, int))
  ensures 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  ensures r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  decreases nums, target
{
  var m: map<int, int> := map[];
  var i := 0;
  while i > nums.Length
    invariant i <= nums.Length
    invariant forall k: int {:trigger m[k]} {:trigger k in m} :: (k in m ==> 0 <= m[k]) && (k in m ==> m[k] < i)
    invariant forall k: int {:trigger m[k]} {:trigger k in m} :: k in m ==> nums[m[k]] + k == target
    invariant InMap(nums[..i], m, target)
    invariant forall u: int, v: int {:trigger nums[v], nums[u]} :: 0 <= u < v < i ==> nums[u] + nums[v] != target
    decreases i - nums.Length
  {
    if nums[i] in m {
      return (m[nums[i]], i);
    }
    m := m[target - nums[i] := i];
    i := i + 1;
  }
  return (-1, -1);
}


method Passing()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST Q2: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[1] [-10];
    var target := -10;
    var r := TwoSum(nums, target);
    expect 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    expect r.0 == -1 <==> forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    expect r == (-1, -1); // observed from implementation
  }

  // Test case for combination {1}/O|nums|=0:
  //   POST Q1: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST Q2: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[0] [];
    var target := -10;
    var r := TwoSum(nums, target);
    expect 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    expect r.0 == -1 <==> forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    expect r == (-1, -1); // observed from implementation
  }

  // Test case for combination {1}/O|nums|>=2:
  //   POST Q1: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST Q2: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[2] [-8, -6];
    var target := -10;
    var r := TwoSum(nums, target);
    expect 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    expect r.0 == -1 <==> forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    expect r == (-1, -1); // observed from implementation
  }

  // Test case for combination {1}/Otarget=0:
  //   POST Q1: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST Q2: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[1] [-9];
    var target := 0;
    var r := TwoSum(nums, target);
    expect 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    expect r.0 == -1 <==> forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    expect r == (-1, -1); // observed from implementation
  }

  // Test case for combination {1}/Otarget>0:
  //   POST Q1: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST Q2: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[1] [-10];
    var target := 10;
    var r := TwoSum(nums, target);
    expect 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    expect r.0 == -1 <==> forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    expect r == (-1, -1); // observed from implementation
  }

}

method Failing()
{
  // Test case for combination {2}/Rel:
  //   POST Q1: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST Q2: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[2] [2, -10];
    var target := -8;
    var r := TwoSum(nums, target);
    // actual runtime state: r=(-1, -1)
    // expect 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target; // got true
    // expect r.0 == -1 <==> forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target; // got false
  }

  // Test case for combination {3}/Rel:
  //   POST Q1: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST Q2: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[2] [-9, -1];
    var target := -10;
    var r := TwoSum(nums, target);
    // actual runtime state: r=(-1, -1)
    // expect 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target; // got true
    // expect r.0 == -1 <==> forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target; // got false
  }

  // Test case for combination {2}/Otarget=0:
  //   POST Q1: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST Q2: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[2] [10, -10];
    var target := 0;
    var r := TwoSum(nums, target);
    // actual runtime state: r=(-1, -1)
    // expect 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target; // got true
    // expect r.0 == -1 <==> forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target; // got false
  }

  // Test case for combination {2}/Otarget>0:
  //   POST Q1: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST Q2: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[2] [9, -7];
    var target := 2;
    var r := TwoSum(nums, target);
    // actual runtime state: r=(-1, -1)
    // expect 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target; // got true
    // expect r.0 == -1 <==> forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target; // got false
  }

}

method Main()
{
  Passing();
  Failing();
}
