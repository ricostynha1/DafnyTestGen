// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Software-Verification_tmp_tmpv4ueky2d_Longest Increasing Subsequence_longest_increasing_subsequence__852-852_AOI.dfy
// Method: longest_increasing_subsequence
// Generated: 2026-04-24 20:42:42

// Software-Verification_tmp_tmpv4ueky2d_Longest Increasing Subsequence_longest_increasing_subsequence.dfy

method longest_increasing_subsequence(nums: array<int>) returns (max: int)
  requires 1 <= nums.Length <= 2500
  requires forall i: int {:trigger nums[i]} :: (0 <= i < nums.Length ==> -10000 <= nums[i]) && (0 <= i < nums.Length ==> nums[i] <= 10000)
  ensures max >= 1
  decreases nums
{
  var length := nums.Length;
  if length == 1 {
    return 1;
  }
  max := 1;
  var dp := new int[length] ((_ /* _v0 */: nat) => 1);
  var i := 1;
  while i < length
    invariant 1 <= i <= length
    invariant max >= 1
    decreases length - i
    modifies dp
  {
    var j := 0;
    while j < i
      invariant 0 <= j <= i
      decreases i - j
    {
      if nums[j] < nums[i] {
        dp[i] := find_max(dp[i], dp[j] + 1);
      }
      j := j + 1;
    }
    max := find_max(max, dp[-i]);
    i := i + 1;
  }
}

function find_max(x: int, y: int): int
  decreases x, y
{
  if x > y then
    x
  else
    y
}


method TestsForlongest_increasing_subsequence()
{
  // Test case for combination {1}:
  //   PRE:  1 <= nums.Length <= 2500
  //   PRE:  forall i: int {:trigger nums[i]} :: (0 <= i < nums.Length ==> -10000 <= nums[i]) && (0 <= i < nums.Length ==> nums[i] <= 10000)
  //   POST Q1: max >= 1
  {
    var nums := new int[1] [-9825];
    var max := longest_increasing_subsequence(nums);
    expect max >= 1;
    expect max == 1; // observed from implementation
  }

  // Test case for combination {1}/Bmax=2:
  //   PRE:  1 <= nums.Length <= 2500
  //   PRE:  forall i: int {:trigger nums[i]} :: (0 <= i < nums.Length ==> -10000 <= nums[i]) && (0 <= i < nums.Length ==> nums[i] <= 10000)
  //   POST Q1: max >= 1
  {
    var nums := new int[1] [-9826];
    var max := longest_increasing_subsequence(nums);
    expect max >= 1;
    expect max == 1; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|nums|>=2:
  //   PRE:  1 <= nums.Length <= 2500
  //   PRE:  forall i: int {:trigger nums[i]} :: (0 <= i < nums.Length ==> -10000 <= nums[i]) && (0 <= i < nums.Length ==> nums[i] <= 10000)
  //   POST Q1: max >= 1
  {
    var nums := new int[2] [-9825, -9600];
    var max := longest_increasing_subsequence(nums);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.longest__increasing__subsequence(BigInteger[] nums) in C:\cygwin64\tmp\DafnyCBT_klolpt5xe05\runner.cs:line 5940
    // runtime error: at _module.__default.TestCase__2() in C:\cygwin64\tmp\DafnyCBT_klolpt5xe05\runner.cs:line 6028
    // expect max >= 1;
  }

  // Test case for combination {1}/R4:
  //   PRE:  1 <= nums.Length <= 2500
  //   PRE:  forall i: int {:trigger nums[i]} :: (0 <= i < nums.Length ==> -10000 <= nums[i]) && (0 <= i < nums.Length ==> nums[i] <= 10000)
  //   POST Q1: max >= 1
  {
    var nums := new int[1] [-9827];
    var max := longest_increasing_subsequence(nums);
    expect max >= 1;
    expect max == 1; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  1 <= nums.Length <= 2500
  //   PRE:  forall i: int {:trigger nums[i]} :: (0 <= i < nums.Length ==> -10000 <= nums[i]) && (0 <= i < nums.Length ==> nums[i] <= 10000)
  //   POST Q1: max >= 1
  {
    var nums := new int[1] [-9828];
    var max := longest_increasing_subsequence(nums);
    expect max >= 1;
    expect max == 1; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  1 <= nums.Length <= 2500
  //   PRE:  forall i: int {:trigger nums[i]} :: (0 <= i < nums.Length ==> -10000 <= nums[i]) && (0 <= i < nums.Length ==> nums[i] <= 10000)
  //   POST Q1: max >= 1
  {
    var nums := new int[1] [-9829];
    var max := longest_increasing_subsequence(nums);
    expect max >= 1;
    expect max == 1; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  1 <= nums.Length <= 2500
  //   PRE:  forall i: int {:trigger nums[i]} :: (0 <= i < nums.Length ==> -10000 <= nums[i]) && (0 <= i < nums.Length ==> nums[i] <= 10000)
  //   POST Q1: max >= 1
  {
    var nums := new int[1] [-9830];
    var max := longest_increasing_subsequence(nums);
    expect max >= 1;
    expect max == 1; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  1 <= nums.Length <= 2500
  //   PRE:  forall i: int {:trigger nums[i]} :: (0 <= i < nums.Length ==> -10000 <= nums[i]) && (0 <= i < nums.Length ==> nums[i] <= 10000)
  //   POST Q1: max >= 1
  {
    var nums := new int[1] [-9831];
    var max := longest_increasing_subsequence(nums);
    expect max >= 1;
    expect max == 1; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  1 <= nums.Length <= 2500
  //   PRE:  forall i: int {:trigger nums[i]} :: (0 <= i < nums.Length ==> -10000 <= nums[i]) && (0 <= i < nums.Length ==> nums[i] <= 10000)
  //   POST Q1: max >= 1
  {
    var nums := new int[1] [-9832];
    var max := longest_increasing_subsequence(nums);
    expect max >= 1;
    expect max == 1; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  1 <= nums.Length <= 2500
  //   PRE:  forall i: int {:trigger nums[i]} :: (0 <= i < nums.Length ==> -10000 <= nums[i]) && (0 <= i < nums.Length ==> nums[i] <= 10000)
  //   POST Q1: max >= 1
  {
    var nums := new int[1] [-9833];
    var max := longest_increasing_subsequence(nums);
    expect max >= 1;
    expect max == 1; // observed from implementation
  }

}

method Main()
{
  TestsForlongest_increasing_subsequence();
  print "TestsForlongest_increasing_subsequence: all non-failing tests passed!\n";
}
