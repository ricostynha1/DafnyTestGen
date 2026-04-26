// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_from dafny main repo_dafny2_Classics__3477_VER_N.dfy
// Method: AdditiveFactorial
// Generated: 2026-04-25 00:23:38

// Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_from dafny main repo_dafny2_Classics.dfy

function Factorial(n: nat): nat
  decreases n
{
  if n == 0 then
    1
  else
    n * Factorial(n - 1)
}

method AdditiveFactorial(n: nat) returns (u: nat)
  ensures u == Factorial(n)
  decreases n
{
  u := 1;
  var r := 0;
  while r < n
    invariant 0 <= r <= n
    invariant u == Factorial(r)
    decreases n - r
  {
    var v := u;
    var s := 1;
    while s <= r
      invariant 1 <= s <= r + 1
      invariant u == s * Factorial(r)
      decreases r - s
    {
      u := u + v;
      s := s + 1;
    }
    r := r + 1;
  }
}

method FIND(A: array<int>, N: int, f: int)
  requires A.Length == N
  requires 0 <= f < N
  modifies A
  ensures forall p: int, q: int {:trigger A[q], A[p]} :: 0 <= p <= f <= q < N ==> A[p] <= A[q]
  decreases A, N, f
{
  var m, n := 0, N - 1;
  while m < n
    invariant 0 <= m <= f <= n < N
    invariant forall p: int, q: int {:trigger A[q], A[p]} :: 0 <= p < m <= q < N ==> A[p] <= A[q]
    invariant forall p: int, q: int {:trigger A[q], A[p]} :: 0 <= p <= n < q < N ==> A[p] <= A[q]
    decreases n - m
  {
    var r, i, j := A[f], m, n;
    while i <= j
      invariant m <= i && j <= n
      invariant -1 <= j && i <= N
      invariant i <= j ==> exists g: int {:trigger A[g]} :: i <= g < N && r <= A[g]
      invariant i <= j ==> exists g: int {:trigger A[g]} :: 0 <= g <= j && A[g] <= r
      invariant forall p: int {:trigger A[p]} :: 0 <= p < i ==> A[p] <= r
      invariant forall q: int {:trigger A[q]} :: j < q < N ==> r <= A[q]
      invariant forall p: int, q: int {:trigger A[q], A[p]} :: 0 <= p < m <= q < N ==> A[p] <= A[q]
      invariant forall p: int, q: int {:trigger A[q], A[p]} :: 0 <= p <= n < q < N ==> A[p] <= A[q]
      invariant (i == m && j == n && r == A[f]) || (m < i && j < n)
      decreases j - i
    {
      var firstIteration := i == m && j == n;
      while A[i] < r
        invariant m <= i <= N && (firstIteration ==> i <= f)
        invariant exists g: int {:trigger A[g]} :: i <= g < N && r <= A[g]
        invariant exists g: int {:trigger A[g]} :: 0 <= g <= j && A[g] <= r
        invariant forall p: int {:trigger A[p]} :: 0 <= p < i ==> A[p] <= r
        decreases j - i
      {
        i := i + 1;
      }
      while r < A[j]
        invariant 0 <= j <= n && (firstIteration ==> f <= j)
        invariant exists g: int {:trigger A[g]} :: i <= g < N && r <= A[g]
        invariant exists g: int {:trigger A[g]} :: 0 <= g <= j && A[g] <= r
        invariant forall q: int {:trigger A[q]} :: j < q < N ==> r <= A[q]
        decreases j
      {
        j := j - 1;
      }
      assert A[j] <= r <= A[i];
      if i <= j {
        var w := A[i];
        A[i] := A[j];
        A[j] := w;
        assert A[i] <= r <= A[j];
        i, j := i + 1, j - 1;
      }
    }
    if f <= j {
      n := j;
    } else if N <= f {
      m := i;
    } else {
      break;
    }
  }
}


method TestsForAdditiveFactorial()
{
  // Test case for combination {1}:
  //   POST Q1: u == Factorial(n)
  {
    var n := 0;
    var u := AdditiveFactorial(n);
    expect u == 1;
  }

  // Test case for combination {2}:
  //   POST Q1: u == Factorial(n)
  {
    var n := 10;
    var u := AdditiveFactorial(n);
    expect u == 3628800;
  }

  // Test case for combination {2}/Bn=1:
  //   POST Q1: u == Factorial(n)
  {
    var n := 1;
    var u := AdditiveFactorial(n);
    expect u == 1;
  }

  // Test case for combination {2}/Bn=2:
  //   POST Q1: u == Factorial(n)
  {
    var n := 2;
    var u := AdditiveFactorial(n);
    expect u == 2;
  }

  // Test case for combination {2}/R4:
  //   POST Q1: u == Factorial(n)
  {
    var n := 9;
    var u := AdditiveFactorial(n);
    expect u == 362880;
  }

  // Test case for combination {2}/R5:
  //   POST Q1: u == Factorial(n)
  {
    var n := 8;
    var u := AdditiveFactorial(n);
    expect u == 40320;
  }

  // Test case for combination {2}/R6:
  //   POST Q1: u == Factorial(n)
  {
    var n := 7;
    var u := AdditiveFactorial(n);
    expect u == 5040;
  }

  // Test case for combination {2}/R7:
  //   POST Q1: u == Factorial(n)
  {
    var n := 3;
    var u := AdditiveFactorial(n);
    expect u == 6;
  }

  // Test case for combination {2}/R8:
  //   POST Q1: u == Factorial(n)
  {
    var n := 4;
    var u := AdditiveFactorial(n);
    expect u == 24;
  }

  // Test case for combination {2}/R9:
  //   POST Q1: u == Factorial(n)
  {
    var n := 6;
    var u := AdditiveFactorial(n);
    expect u == 720;
  }

}

method TestsForFIND()
{
  // Test case for combination {1}:
  //   PRE:  A.Length == N
  //   PRE:  0 <= f < N
  //   POST Q1: forall p: int, q: int {:trigger A[q], A[p]} :: 0 <= p <= f <= q < N ==> A[p] <= A[q]
  {
    var A := new int[3] [-10, 9, 7];
    var N := 3;
    var f := 2;
    FIND(A, N, f);
    expect forall p: int, q: int :: 0 <= p <= f <= q < N ==> A[p] <= A[q];
    expect A[..] == [-10, 7, 9]; // observed from implementation
  }

  // Test case for combination {1}/Bf=0:
  //   PRE:  A.Length == N
  //   PRE:  0 <= f < N
  //   POST Q1: forall p: int, q: int {:trigger A[q], A[p]} :: 0 <= p <= f <= q < N ==> A[p] <= A[q]
  {
    var A := new int[2] [7, -1];
    var N := 2;
    var f := 0;
    FIND(A, N, f);
    expect forall p: int, q: int :: 0 <= p <= f <= q < N ==> A[p] <= A[q];
    expect A[..] == [-1, 7]; // observed from implementation
  }

  // Test case for combination {1}/Bf=1:
  //   PRE:  A.Length == N
  //   PRE:  0 <= f < N
  //   POST Q1: forall p: int, q: int {:trigger A[q], A[p]} :: 0 <= p <= f <= q < N ==> A[p] <= A[q]
  {
    var A := new int[2] [9, -1];
    var N := 2;
    var f := 1;
    FIND(A, N, f);
    expect forall p: int, q: int :: 0 <= p <= f <= q < N ==> A[p] <= A[q];
    expect A[..] == [-1, 9]; // observed from implementation
  }

  // Test case for combination {1}/O|A|=1:
  //   PRE:  A.Length == N
  //   PRE:  0 <= f < N
  //   POST Q1: forall p: int, q: int {:trigger A[q], A[p]} :: 0 <= p <= f <= q < N ==> A[p] <= A[q]
  {
    var A := new int[1] [-10];
    var N := 1;
    var f := 0;
    FIND(A, N, f);
    expect forall p: int, q: int :: 0 <= p <= f <= q < N ==> A[p] <= A[q];
  }

  // Test case for combination {1}/R5:
  //   PRE:  A.Length == N
  //   PRE:  0 <= f < N
  //   POST Q1: forall p: int, q: int {:trigger A[q], A[p]} :: 0 <= p <= f <= q < N ==> A[p] <= A[q]
  {
    var A := new int[3] [-1, -3, -6];
    var N := 3;
    var f := 2;
    FIND(A, N, f);
    expect forall p: int, q: int :: 0 <= p <= f <= q < N ==> A[p] <= A[q];
    expect A[..] == [-6, -3, -1]; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  A.Length == N
  //   PRE:  0 <= f < N
  //   POST Q1: forall p: int, q: int {:trigger A[q], A[p]} :: 0 <= p <= f <= q < N ==> A[p] <= A[q]
  {
    var A := new int[3] [-9, -4, 9];
    var N := 3;
    var f := 2;
    FIND(A, N, f);
    expect forall p: int, q: int :: 0 <= p <= f <= q < N ==> A[p] <= A[q];
  }

  // Test case for combination {1}/R7:
  //   PRE:  A.Length == N
  //   PRE:  0 <= f < N
  //   POST Q1: forall p: int, q: int {:trigger A[q], A[p]} :: 0 <= p <= f <= q < N ==> A[p] <= A[q]
  {
    var A := new int[3] [-3, 8, 2];
    var N := 3;
    var f := 2;
    FIND(A, N, f);
    expect forall p: int, q: int :: 0 <= p <= f <= q < N ==> A[p] <= A[q];
    expect A[..] == [-3, 2, 8]; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  A.Length == N
  //   PRE:  0 <= f < N
  //   POST Q1: forall p: int, q: int {:trigger A[q], A[p]} :: 0 <= p <= f <= q < N ==> A[p] <= A[q]
  {
    var A := new int[3] [-8, -5, 8];
    var N := 3;
    var f := 2;
    FIND(A, N, f);
    expect forall p: int, q: int :: 0 <= p <= f <= q < N ==> A[p] <= A[q];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  A.Length == N
  //   PRE:  0 <= f < N
  //   POST Q1: forall p: int, q: int {:trigger A[q], A[p]} :: 0 <= p <= f <= q < N ==> A[p] <= A[q]
  {
    var A := new int[3] [-2, 7, -5];
    var N := 3;
    var f := 2;
    FIND(A, N, f);
    // actual runtime state: A=[-5, 7, -2]
    // expect forall p: int, q: int :: 0 <= p <= f <= q < N ==> A[p] <= A[q]; // got false
  }

  // Test case for combination {1}/R10:
  //   PRE:  A.Length == N
  //   PRE:  0 <= f < N
  //   POST Q1: forall p: int, q: int {:trigger A[q], A[p]} :: 0 <= p <= f <= q < N ==> A[p] <= A[q]
  {
    var A := new int[3] [-7, -2, -1];
    var N := 3;
    var f := 2;
    FIND(A, N, f);
    expect forall p: int, q: int :: 0 <= p <= f <= q < N ==> A[p] <= A[q];
  }

}

method Main()
{
  TestsForAdditiveFactorial();
  print "TestsForAdditiveFactorial: all non-failing tests passed!\n";
  TestsForFIND();
  print "TestsForFIND: all non-failing tests passed!\n";
}
