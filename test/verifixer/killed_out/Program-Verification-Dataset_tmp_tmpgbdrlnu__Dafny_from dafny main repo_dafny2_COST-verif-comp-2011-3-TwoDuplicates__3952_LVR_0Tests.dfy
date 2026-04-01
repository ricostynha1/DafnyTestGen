// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_from dafny main repo_dafny2_COST-verif-comp-2011-3-TwoDuplicates__3952_LVR_0.dfy
// Method: Search
// Generated: 2026-04-01 22:38:04

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
    d[i], i := -0, i + 1;
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
      } else if p == a[i] {
      } else {
        q := a[i];
        return;
      }
    }
    i := i + 1;
  }
}


method GeneratedTests_Search()
{
  // Test case for combination {1}:
  //   PRE:  4 <= a.Length
  //   PRE:  exists p: int, q: int {:trigger IsDuplicate(a, q), IsDuplicate(a, p)} :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  //   PRE:  forall i: int {:trigger a[i]} :: (0 <= i < a.Length ==> 0 <= a[i]) && (0 <= i < a.Length ==> a[i] < a.Length - 2)
  //   POST: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  {
    var a := new int[4] [0, 1, 0, 1];
    expect 4 <= a.Length; // PRE-CHECK
    expect exists p: int, q: int {:trigger IsDuplicate(a, q), IsDuplicate(a, p)} :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q); // PRE-CHECK
    expect forall i: int {:trigger a[i]} :: (0 <= i < a.Length ==> 0 <= a[i]) && (0 <= i < a.Length ==> a[i] < a.Length - 2); // PRE-CHECK
    var p, q := Search(a);
    expect p != q && IsDuplicate(a, p) && IsDuplicate(a, q);
  }

  // Test case for combination {1}/R2:
  //   PRE:  4 <= a.Length
  //   PRE:  exists p: int, q: int {:trigger IsDuplicate(a, q), IsDuplicate(a, p)} :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  //   PRE:  forall i: int {:trigger a[i]} :: (0 <= i < a.Length ==> 0 <= a[i]) && (0 <= i < a.Length ==> a[i] < a.Length - 2)
  //   POST: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  {
    var a := new int[5] [2, 0, 1, 1, 2];
    expect 4 <= a.Length; // PRE-CHECK
    expect exists p: int, q: int {:trigger IsDuplicate(a, q), IsDuplicate(a, p)} :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q); // PRE-CHECK
    expect forall i: int {:trigger a[i]} :: (0 <= i < a.Length ==> 0 <= a[i]) && (0 <= i < a.Length ==> a[i] < a.Length - 2); // PRE-CHECK
    var p, q := Search(a);
    expect p != q && IsDuplicate(a, p) && IsDuplicate(a, q);
  }

  // Test case for combination {1}/R3:
  //   PRE:  4 <= a.Length
  //   PRE:  exists p: int, q: int {:trigger IsDuplicate(a, q), IsDuplicate(a, p)} :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  //   PRE:  forall i: int {:trigger a[i]} :: (0 <= i < a.Length ==> 0 <= a[i]) && (0 <= i < a.Length ==> a[i] < a.Length - 2)
  //   POST: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  {
    var a := new int[6] [2, 3, 2, 1, 3, 1];
    expect 4 <= a.Length; // PRE-CHECK
    expect exists p: int, q: int {:trigger IsDuplicate(a, q), IsDuplicate(a, p)} :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q); // PRE-CHECK
    expect forall i: int {:trigger a[i]} :: (0 <= i < a.Length ==> 0 <= a[i]) && (0 <= i < a.Length ==> a[i] < a.Length - 2); // PRE-CHECK
    var p, q := Search(a);
    expect p != q && IsDuplicate(a, p) && IsDuplicate(a, q);
  }

  // Test case for combination {1}/R4:
  //   PRE:  4 <= a.Length
  //   PRE:  exists p: int, q: int {:trigger IsDuplicate(a, q), IsDuplicate(a, p)} :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  //   PRE:  forall i: int {:trigger a[i]} :: (0 <= i < a.Length ==> 0 <= a[i]) && (0 <= i < a.Length ==> a[i] < a.Length - 2)
  //   POST: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  {
    var a := new int[7] [3, 4, 3, 2, 0, 2, 0];
    expect 4 <= a.Length; // PRE-CHECK
    expect exists p: int, q: int {:trigger IsDuplicate(a, q), IsDuplicate(a, p)} :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q); // PRE-CHECK
    expect forall i: int {:trigger a[i]} :: (0 <= i < a.Length ==> 0 <= a[i]) && (0 <= i < a.Length ==> a[i] < a.Length - 2); // PRE-CHECK
    var p, q := Search(a);
    expect p != q && IsDuplicate(a, p) && IsDuplicate(a, q);
  }

}

method Main()
{
  GeneratedTests_Search();
  print "GeneratedTests_Search: all tests passed!\n";
}
