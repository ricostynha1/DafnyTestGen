// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_798.dfy
// Method: CalcArraySum
// Generated: 2026-04-06 23:28:21

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

method Passing()
{
  // Test case for combination {1}:
  //   PRE:  0 <= n <= a.Length
  //   POST: sum == ArraySum(a, 0, n)
  {
    var a := new int[0] [];
    var n := 0;
    var sum := CalcArraySum(a, n);
    expect sum == 0;
  }

  // Test case for combination {1}/Ba=1,n=0:
  //   PRE:  0 <= n <= a.Length
  //   POST: sum == ArraySum(a, 0, n)
  {
    var a := new int[1] [2];
    var n := 0;
    var sum := CalcArraySum(a, n);
    expect sum == 0;
  }

  // Test case for combination {1}/Ba=1,n=1:
  //   PRE:  0 <= n <= a.Length
  //   POST: sum == ArraySum(a, 0, n)
  {
    var a := new int[1] [2];
    var n := 1;
    var sum := CalcArraySum(a, n);
    expect sum == 2;
  }

  // Test case for combination {1}/Ba=2,n=0:
  //   PRE:  0 <= n <= a.Length
  //   POST: sum == ArraySum(a, 0, n)
  {
    var a := new int[2] [4, 3];
    var n := 0;
    var sum := CalcArraySum(a, n);
    expect sum == 0;
  }

  // Test case for combination {1}/Osum>0:
  //   PRE:  0 <= n <= a.Length
  //   POST: sum == ArraySum(a, 0, n)
  {
    var a := new int[2] [7, 6];
    var n := 2;
    var sum := CalcArraySum(a, n);
    expect sum == 13;
  }

  // Test case for combination {1}/Osum<0:
  //   PRE:  0 <= n <= a.Length
  //   POST: sum == ArraySum(a, 0, n)
  {
    var a := new int[2] [7, 6];
    var n := 1;
    var sum := CalcArraySum(a, n);
    expect sum == 7;
  }

  // Test case for combination {1}/Osum=0:
  //   PRE:  0 <= n <= a.Length
  //   POST: sum == ArraySum(a, 0, n)
  {
    var a := new int[3] [7, 8, 9];
    var n := 3;
    var sum := CalcArraySum(a, n);
    expect sum == 24;
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
