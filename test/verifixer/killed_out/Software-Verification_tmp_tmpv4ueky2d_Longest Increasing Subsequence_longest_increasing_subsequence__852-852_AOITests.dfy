// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Software-Verification_tmp_tmpv4ueky2d_Longest Increasing Subsequence_longest_increasing_subsequence__852-852_AOI.dfy
// Method: longest_increasing_subsequence
// Generated: 2026-03-26 15:07:54

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  1 <= nums.Length <= 2500
  //   PRE:  forall i: int {:trigger nums[i]} :: (0 <= i < nums.Length ==> -10000 <= nums[i]) && (0 <= i < nums.Length ==> nums[i] <= 10000)
  //   POST: max >= 1
  {
    var nums := new int[1] [-9962];
    var max := longest_increasing_subsequence(nums);
    expect max == 1;
  }

}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  1 <= nums.Length <= 2500
  //   PRE:  forall i: int {:trigger nums[i]} :: (0 <= i < nums.Length ==> -10000 <= nums[i]) && (0 <= i < nums.Length ==> nums[i] <= 10000)
  //   POST: max >= 1
  {
    var nums := new int[2] [-9962, -2281];
    var max := longest_increasing_subsequence(nums);
    // expect max == 1;
  }

  // Test case for combination {1}/Bnums=3:
  //   PRE:  1 <= nums.Length <= 2500
  //   PRE:  forall i: int {:trigger nums[i]} :: (0 <= i < nums.Length ==> -10000 <= nums[i]) && (0 <= i < nums.Length ==> nums[i] <= 10000)
  //   POST: max >= 1
  {
    var nums := new int[3] [-2281, -2280, -2279];
    var max := longest_increasing_subsequence(nums);
    // expect max == 1;
  }

}

method Main()
{
  Passing();
  Failing();
}
