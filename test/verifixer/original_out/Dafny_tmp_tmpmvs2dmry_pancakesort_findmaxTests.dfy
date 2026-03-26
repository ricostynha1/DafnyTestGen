// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Dafny_tmp_tmpmvs2dmry_pancakesort_findmax.dfy
// Method: findMax
// Generated: 2026-03-26 14:55:59

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
    i := i + 1;
  }
  return mi;
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST: 0 <= r < n <= a.Length
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [7719];
    var n := 1;
    var old_a := a[..];
    var r := findMax(a, n);
    expect 0 <= r < n <= a.Length;
    expect forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k];
    expect multiset(a[..]) == multiset(old_a[..]);
  }

  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST: 0 <= r < n <= a.Length
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [-38, 7719];
    var n := 2;
    var old_a := a[..];
    var r := findMax(a, n);
    expect 0 <= r < n <= a.Length;
    expect forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k];
    expect multiset(a[..]) == multiset(old_a[..]);
  }

  // Test case for combination {1}/Ba=2,n=1:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST: 0 <= r < n <= a.Length
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [0, 6];
    var n := 1;
    var old_a := a[..];
    var r := findMax(a, n);
    expect 0 <= r < n <= a.Length;
    expect forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k];
    expect multiset(a[..]) == multiset(old_a[..]);
  }

  // Test case for combination {1}/Ba=3,n=1:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST: 0 <= r < n <= a.Length
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[3] [0, 7, 8];
    var n := 1;
    var old_a := a[..];
    var r := findMax(a, n);
    expect 0 <= r < n <= a.Length;
    expect forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k];
    expect multiset(a[..]) == multiset(old_a[..]);
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
