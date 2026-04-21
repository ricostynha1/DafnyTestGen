// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny_examples_tmp_tmp8qotd4ez_leetcode_0001-two-sum__753_ROR_Gt.dfy
// Method: TwoSum
// Generated: 2026-04-08 16:45:09

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
  // (no passing tests)
}

method Failing()
{
  // Test case for combination {3}:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: !(r.0 == -1)
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[0] [];
    var target := 0;
    var r := TwoSum(nums, target);
    // expect 0 <= r.0 < r.1 < nums.Length;
    // expect nums[r.0] + nums[r.1] == target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect !(r.0 == -1);
    // expect forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
  }

  // Test case for combination {4}:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: !(r.0 == -1)
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[2] [0, 0];
    var target := 0;
    var r := TwoSum(nums, target);
    // expect 0 <= r.0 < r.1 < nums.Length;
    // expect nums[r.0] + nums[r.1] == target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect !(r.0 == -1);
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
  }

  // Test case for combination {5}:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: !(r.0 == -1)
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[0] [];
    var target := 50008;
    var r := TwoSum(nums, target);
    // expect 0 <= r.0 < r.1 < nums.Length;
    // expect nums[r.0] + nums[r.1] == target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect !(r.0 == -1);
    // expect forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
  }

  // Test case for combination {9}:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[0] [];
    var target := -4625;
    var r := TwoSum(nums, target);
    // expect 0 <= r.0 < r.1 < nums.Length;
    // expect nums[r.0] + nums[r.1] == target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
  }

  // Test case for combination {10}:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[2] [-1146, -1144];
    var target := -2290;
    var r := TwoSum(nums, target);
    // expect 0 <= r.0 < r.1 < nums.Length;
    // expect nums[r.0] + nums[r.1] == target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
  }

  // Test case for combination {11}:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[0] [];
    var target := 42781;
    var r := TwoSum(nums, target);
    // expect 0 <= r.0 < r.1 < nums.Length;
    // expect nums[r.0] + nums[r.1] == target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
  }

  // Test case for combination {18}:
  //   POST: 0 <= r.0
  //   POST: !(r.0 == -1)
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[2] [88812, 77100];
    var target := 165912;
    var r := TwoSum(nums, target);
    // expect r == (0, 1);
  }

  // Test case for combination {3}/Or.1>0:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: !(r.0 == -1)
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[1] [21];
    var target := -2438;
    var r := TwoSum(nums, target);
    // expect 0 <= r.0 < r.1 < nums.Length;
    // expect nums[r.0] + nums[r.1] == target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect !(r.0 == -1);
    // expect forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
  }

  // Test case for combination {4}/Or.1>0:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: !(r.0 == -1)
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[2] [-32286, 32285];
    var target := -1;
    var r := TwoSum(nums, target);
    // expect 0 <= r.0 < r.1 < nums.Length;
    // expect nums[r.0] + nums[r.1] == target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect !(r.0 == -1);
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
  }

  // Test case for combination {5}/Or.1>0:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: !(r.0 == -1)
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[1] [-12124];
    var target := -42735;
    var r := TwoSum(nums, target);
    // expect 0 <= r.0 < r.1 < nums.Length;
    // expect nums[r.0] + nums[r.1] == target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect !(r.0 == -1);
    // expect forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
  }

  // Test case for combination {6}/Or.1>0:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: !(r.0 == -1)
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[2] [8365, -8366];
    var target := -1;
    var r := TwoSum(nums, target);
    // expect 0 <= r.0 < r.1 < nums.Length;
    // expect nums[r.0] + nums[r.1] == target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect !(r.0 == -1);
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
  }

  // Test case for combination {9}/Or.1>0:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[1] [8855];
    var target := -4626;
    var r := TwoSum(nums, target);
    // expect 0 <= r.0 < r.1 < nums.Length;
    // expect nums[r.0] + nums[r.1] == target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
  }

  // Test case for combination {9}/Or.1<0:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[0] [];
    var target := -4627;
    var r := TwoSum(nums, target);
    // expect 0 <= r.0 < r.1 < nums.Length;
    // expect nums[r.0] + nums[r.1] == target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
  }

  // Test case for combination {9}/Or.1=0:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[0] [];
    var target := -4628;
    var r := TwoSum(nums, target);
    // expect r == (-1, 0);
  }

  // Test case for combination {10}/Or.1>0:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[2] [3431, -5722];
    var target := -2291;
    var r := TwoSum(nums, target);
    // expect 0 <= r.0 < r.1 < nums.Length;
    // expect nums[r.0] + nums[r.1] == target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
  }

  // Test case for combination {10}/Or.1<0:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[2] [-4729, 2437];
    var target := -2292;
    var r := TwoSum(nums, target);
    // expect 0 <= r.0 < r.1 < nums.Length;
    // expect nums[r.0] + nums[r.1] == target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
  }

  // Test case for combination {10}/Or.1=0:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[2] [38, -2331];
    var target := -2293;
    var r := TwoSum(nums, target);
    // expect 0 <= r.0 < r.1 < nums.Length;
    // expect nums[r.0] + nums[r.1] == target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
  }

  // Test case for combination {11}/Or.1>0:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[1] [-41344];
    var target := -41062;
    var r := TwoSum(nums, target);
    // expect 0 <= r.0 < r.1 < nums.Length;
    // expect nums[r.0] + nums[r.1] == target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
  }

  // Test case for combination {11}/Or.1<0:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[0] [];
    var target := -41063;
    var r := TwoSum(nums, target);
    // expect 0 <= r.0 < r.1 < nums.Length;
    // expect nums[r.0] + nums[r.1] == target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
  }

  // Test case for combination {11}/Or.1=0:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[0] [];
    var target := -41064;
    var r := TwoSum(nums, target);
    // expect r == (-1, 0);
  }

  // Test case for combination {12}/Or.1>0:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[2] [20161, -20162];
    var target := -1;
    var r := TwoSum(nums, target);
    // expect 0 <= r.0 < r.1 < nums.Length;
    // expect nums[r.0] + nums[r.1] == target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
  }

  // Test case for combination {12}/Or.1<0:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[2] [11797, -11799];
    var target := -2;
    var r := TwoSum(nums, target);
    // expect 0 <= r.0 < r.1 < nums.Length;
    // expect nums[r.0] + nums[r.1] == target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
  }

  // Test case for combination {12}/Or.1=0:
  //   POST: 0 <= r.0 < r.1 < nums.Length
  //   POST: nums[r.0] + nums[r.1] == target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[2] [7719, -7722];
    var target := -3;
    var r := TwoSum(nums, target);
    // expect 0 <= r.0 < r.1 < nums.Length;
    // expect nums[r.0] + nums[r.1] == target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect forall i: int, j: int :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
    // expect !forall i: int, j: int :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target;
  }

  // Test case for combination {18}/Or.0>0:
  //   POST: 0 <= r.0
  //   POST: !(r.0 == -1)
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[3] [2437, -8855, 2438];
    var target := -6417;
    var r := TwoSum(nums, target);
    // expect r == (1, 2);
  }

  // Test case for combination {18}/Or.0=0:
  //   POST: 0 <= r.0
  //   POST: !(r.0 == -1)
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   POST: !forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  //   ENSURES: 0 <= r.0 ==> 0 <= r.0 < r.1 < nums.Length && nums[r.0] + nums[r.1] == target && forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < r.1 ==> nums[i] + nums[j] != target
  //   ENSURES: r.0 == -1 <==> forall i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < nums.Length ==> nums[i] + nums[j] != target
  {
    var nums := new int[2] [19, 7719];
    var target := 7738;
    var r := TwoSum(nums, target);
    // expect r == (0, 1);
  }

}

method Main()
{
  Passing();
  Failing();
}
