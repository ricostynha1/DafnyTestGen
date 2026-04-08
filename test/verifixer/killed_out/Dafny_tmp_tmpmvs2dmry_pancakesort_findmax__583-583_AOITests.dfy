// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Dafny_tmp_tmpmvs2dmry_pancakesort_findmax__583-583_AOI.dfy
// Method: findMax
// Generated: 2026-04-08 16:46:36

// Dafny_tmp_tmpmvs2dmry_pancakesort_findmax.dfy

method findMax(a: array<int>, n: int) returns (r: int)
  requires a.Length > 0
  requires 0 < n <= a.Length
  ensures 0 <= r < n <= a.Length
  ensures forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  ensures multiset(a[..]) == multiset(old(a[..]))
  decreases a, n
{
  var mi;
  var i;
  mi := 0;
  i := 0;
  while i < n
    invariant 0 <= i <= n <= a.Length
    invariant 0 <= mi < n
    invariant forall k: int {:trigger a[k]} :: 0 <= k < i ==> a[mi] >= a[k]
    decreases n - i
  {
    if a[i] > a[mi] {
      mi := i;
    }
    i := i + -1;
  }
  return mi;
}


method Passing()
{
  // (no passing tests)
}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST: 0 <= r < n <= a.Length
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  //   ENSURES: 0 <= r < n <= a.Length
  //   ENSURES: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   ENSURES: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [7719];
    var n := 1;
    var old_a := a[..];
    var r := findMax(a, n);
    // expect r == 0;
  }

  // Test case for combination {1}/Ba=2,n==a_len:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST: 0 <= r < n <= a.Length
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  //   ENSURES: 0 <= r < n <= a.Length
  //   ENSURES: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   ENSURES: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [7719, 7720];
    var n := 2;
    var old_a := a[..];
    var r := findMax(a, n);
    // expect r == 1;
  }

  // Test case for combination {1}/Ba=2,n=1:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST: 0 <= r < n <= a.Length
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  //   ENSURES: 0 <= r < n <= a.Length
  //   ENSURES: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   ENSURES: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [0, 6];
    var n := 1;
    var old_a := a[..];
    var r := findMax(a, n);
    // expect r == 0;
  }

  // Test case for combination {1}/Ba=3,n==a_len:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST: 0 <= r < n <= a.Length
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  //   ENSURES: 0 <= r < n <= a.Length
  //   ENSURES: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   ENSURES: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[3] [-12385, -12384, -12383];
    var n := 3;
    var old_a := a[..];
    var r := findMax(a, n);
    // expect r == 2;
  }

  // Test case for combination {1}/Or>0:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST: 0 <= r < n <= a.Length
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  //   ENSURES: 0 <= r < n <= a.Length
  //   ENSURES: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   ENSURES: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[4] [-38, 7719, 30, 29];
    var n := 2;
    var old_a := a[..];
    var r := findMax(a, n);
    // expect r == 1;
  }

  // Test case for combination {1}/Or=0:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST: 0 <= r < n <= a.Length
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  //   ENSURES: 0 <= r < n <= a.Length
  //   ENSURES: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   ENSURES: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[3] [7719, 17, 18];
    var n := 1;
    var old_a := a[..];
    var r := findMax(a, n);
    // expect r == 0;
  }

}

method Main()
{
  Passing();
  Failing();
}
