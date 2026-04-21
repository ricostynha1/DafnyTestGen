// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_798.dfy
// Method: CalcArraySum
// Generated: 2026-04-21 23:17:46

// Recursive definition of the sum of the elements of an array 'a',
// from index 'i' (inclusive) to index 'j' (exclusive).
// The 'fuel' attribute helps checking the assertions in the test cases.
function ArraySum(a: array<int>, i: nat := 0, j: nat := a.Length) : int
  requires 0 <= i <= j <= a.Length
  reads a
{
  if j <= i then 0 else ArraySum(a, i, j-1) + a[j-1]
}

// Computes the sum of the first 'n' elements of an array 'a'.
method CalcArraySum(a: array<int>,  n: nat := a.Length) returns (sum: int)
  requires 0 <= n <= a.Length
  ensures sum == ArraySum(a, 0, n)
{
    sum := 0;
    for k := 0 to n
        invariant sum == ArraySum(a, 0, k)
    {
        sum := sum + a[k];
    }
    return sum;
}

// Test cases checked statically.
method ArraySumTest(){
  var a1 := new int[] [1, 2, 3];
  var s10 := CalcArraySum(a1, 1);
  assert s10 == 1;
  var s1 := CalcArraySum(a1);
  assert s1 == 6;

  var a2 := new int[] [15, 12, 13, 10];
  var s20 := CalcArraySum(a2, 1);
  assert s20 == 15;
  var s21 := CalcArraySum(a2, 2);
  assert s21 == 27;
  var s2 := CalcArraySum(a2);
  assert s2 == 50;

  var a3 := new int[] [];
  var s3 := CalcArraySum(a3);
  assert s3 == 0;
}

method TestsForCalcArraySum()
{
  // Test case for combination {1}:
  //   PRE:  0 <= n <= a.Length
  //   POST Q1: sum == ArraySum(a, 0, n)
  //   POST Q2: sum == 0
  {
    var a := new int[1] [10];
    var n := 0;
    var sum := CalcArraySum(a, n);
    expect sum == 0;
  }

  // Test case for combination {2}:
  //   PRE:  0 <= n <= a.Length
  //   POST Q1: n > 0
  //   POST Q2: sum == ArraySum(a, 0, n - 1) + a[n - 1]
  {
    var a := new int[2] [-1, 8];
    var n := 2;
    var sum := CalcArraySum(a, n);
    expect sum == 7;
  }

  // Test case for combination {1}/O|a|=0:
  //   PRE:  0 <= n <= a.Length
  //   POST Q1: sum == ArraySum(a, 0, n)
  //   POST Q2: sum == 0
  {
    var a := new int[0] [];
    var n := 0;
    var sum := CalcArraySum(a, n);
    expect sum == 0;
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  0 <= n <= a.Length
  //   POST Q1: sum == ArraySum(a, 0, n)
  //   POST Q2: sum == 0
  {
    var a := new int[2] [5, -1];
    var n := 0;
    var sum := CalcArraySum(a, n);
    expect sum == 0;
  }

}

method Main()
{
  TestsForCalcArraySum();
  print "TestsForCalcArraySum: all non-failing tests passed!\n";
}
