// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_from dafny main repo_dafny2_COST-verif-comp-2011-3-TwoDuplicates__5074_VER_q.dfy
// Method: Search
// Generated: 2026-04-24 22:41:41

// Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_from dafny main repo_dafny2_COST-verif-comp-2011-3-TwoDuplicates.dfy

predicate IsDuplicate(a: array<int>, p: int)
  reads a
  decreases {a}, a, p
{
  IsPrefixDuplicate(a, a.Length, p)
}

predicate IsPrefixDuplicate(a: array<int>, k: int, p: int)
  requires 0 <= k <= a.Length
  reads a
  decreases {a}, a, k, p
{
  exists i: int, j: int {:trigger a[j], a[i]} :: 
    0 <= i < j < k &&
    a[i] == a[j] &&
    a[j] == p
}

method Search(a: array<int>) returns (p: int, q: int)
  requires 4 <= a.Length
  requires exists p: int, q: int {:trigger IsDuplicate(a, q), IsDuplicate(a, p)} :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  requires forall i: int {:trigger a[i]} :: (0 <= i < a.Length ==> 0 <= a[i]) && (0 <= i < a.Length ==> a[i] < a.Length - 2)
  ensures p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  decreases a
{
  var d := new int[a.Length - 2];
  var i := 0;
  while i < d.Length
    invariant 0 <= i <= d.Length && forall j: int {:trigger d[j]} :: 0 <= j < i ==> d[j] == -1
    decreases d.Length - i
  {
    d[i], i := -1, i + 1;
  }
  i, p, q := 0, 0, 1;
  while true
    invariant 0 <= i < a.Length
    invariant forall j: int {:trigger d[j]} :: 0 <= j < d.Length ==> (d[j] == -1 && forall k: int {:trigger a[k]} :: 0 <= k < i ==> a[k] != j) || (0 <= d[j] < i && a[d[j]] == j)
    invariant p == q ==> IsDuplicate(a, p)
    invariant forall k: int {:trigger old(a[k])} :: (0 <= k < i && IsPrefixDuplicate(a, i, a[k]) ==> p == q) && (0 <= k < i && IsPrefixDuplicate(a, i, a[k]) ==> q == a[k])
    decreases a.Length - i
  {
    var k := d[a[i]];
    assert k < i;
    if k == -1 {
      d[a[i]] := i;
    } else {
      assert a[i] == a[k] && IsDuplicate(a, a[i]);
      if p != q {
        p, q := a[i], a[i];
      } else if p == a[q] {
      } else {
        q := a[i];
        return;
      }
    }
    i := i + 1;
  }
}


method TestsForSearch()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  4 <= a.Length
  //   PRE:  exists p: int, q: int {:trigger IsDuplicate(a, q), IsDuplicate(a, p)} :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  //   PRE:  forall i: int {:trigger a[i]} :: (0 <= i < a.Length ==> 0 <= a[i]) && (0 <= i < a.Length ==> a[i] < a.Length - 2)
  //   POST Q1: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  {
    var a := new int[4] [0, 0, 1, 1];
    var p, q := Search(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.Search(BigInteger[] a, BigInteger& p, BigInteger& q) in C:\cygwin64\tmp\DafnyCBT_zhjasxwmnvi\runner.cs:line 5850
    // runtime error: at _module.__default.TestCase__0() in C:\cygwin64\tmp\DafnyCBT_zhjasxwmnvi\runner.cs:line 5898
    // expect p != q && IsDuplicate(a, p) && IsDuplicate(a, q);
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Op>0:
  //   PRE:  4 <= a.Length
  //   PRE:  exists p: int, q: int {:trigger IsDuplicate(a, q), IsDuplicate(a, p)} :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  //   PRE:  forall i: int {:trigger a[i]} :: (0 <= i < a.Length ==> 0 <= a[i]) && (0 <= i < a.Length ==> a[i] < a.Length - 2)
  //   POST Q1: p != q
  //   POST Q2: IsDuplicate(a, p)
  //   POST Q3: IsDuplicate(a, q)
  {
    var a := new int[4] [1, 1, 0, 0];
    var p, q := Search(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.Search(BigInteger[] a, BigInteger& p, BigInteger& q) in C:\cygwin64\tmp\DafnyCBT_zhjasxwmnvi\runner.cs:line 5850
    // runtime error: at _module.__default.TestCase__1() in C:\cygwin64\tmp\DafnyCBT_zhjasxwmnvi\runner.cs:line 5929
    // expect p == 1 || p == 0;
    // expect q == 0 || q == 1;
  }

}

method Main()
{
  TestsForSearch();
  print "TestsForSearch: all non-failing tests passed!\n";
}
