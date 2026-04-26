// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_from dafny main repo_dafny2_COST-verif-comp-2011-3-TwoDuplicates__3952_LVR_0.dfy
// Method: Search
// Generated: 2026-04-25 00:23:46

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


method TestsForSearch()
{
  // Test case for combination {1}:
  //   PRE:  4 <= a.Length
  //   PRE:  exists p: int, q: int {:trigger IsDuplicate(a, q), IsDuplicate(a, p)} :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  //   PRE:  forall i: int {:trigger a[i]} :: (0 <= i < a.Length ==> 0 <= a[i]) && (0 <= i < a.Length ==> a[i] < a.Length - 2)
  //   POST Q1: p != q
  //   POST Q2: IsDuplicate(a, p)
  //   POST Q3: IsDuplicate(a, q)
  {
    var a := new int[8] [5, 5, 3, 5, 5, 3, 5, 5];
    var p, q := Search(a);
    expect p == 3 || p == 5;
    expect q == 5 || q == 3;
    expect p == 5; // observed from implementation
    expect q == 3; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Op=0:
  //   PRE:  4 <= a.Length
  //   PRE:  exists p: int, q: int {:trigger IsDuplicate(a, q), IsDuplicate(a, p)} :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  //   PRE:  forall i: int {:trigger a[i]} :: (0 <= i < a.Length ==> 0 <= a[i]) && (0 <= i < a.Length ==> a[i] < a.Length - 2)
  //   POST Q1: p != q
  //   POST Q2: IsDuplicate(a, p)
  //   POST Q3: IsDuplicate(a, q)
  {
    var a := new int[8] [2, 4, 4, 1, 0, 5, 0, 0];
    var p, q := Search(a);
    // actual runtime state: p=2, q=4
    // expect p == 0 || p == 4; // got false
    // expect q == 4 || q == 0; // got true
  }

  // Test case for combination {1}/Oq=0:
  //   PRE:  4 <= a.Length
  //   PRE:  exists p: int, q: int {:trigger IsDuplicate(a, q), IsDuplicate(a, p)} :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  //   PRE:  forall i: int {:trigger a[i]} :: (0 <= i < a.Length ==> 0 <= a[i]) && (0 <= i < a.Length ==> a[i] < a.Length - 2)
  //   POST Q1: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  {
    var a := new int[8] [3, 2, 3, 4, 0, 3, 2, 0];
    var p, q := Search(a);
    expect p != q && IsDuplicate(a, p) && IsDuplicate(a, q);
    expect p == 3; // observed from implementation
    expect q == 2; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  4 <= a.Length
  //   PRE:  exists p: int, q: int {:trigger IsDuplicate(a, q), IsDuplicate(a, p)} :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  //   PRE:  forall i: int {:trigger a[i]} :: (0 <= i < a.Length ==> 0 <= a[i]) && (0 <= i < a.Length ==> a[i] < a.Length - 2)
  //   POST Q1: p != q
  //   POST Q2: IsDuplicate(a, p)
  //   POST Q3: IsDuplicate(a, q)
  {
    var a := new int[8] [2, 5, 2, 5, 5, 5, 5, 5];
    var p, q := Search(a);
    expect p == 2 || p == 5;
    expect q == 5 || q == 2;
    expect p == 2; // observed from implementation
    expect q == 5; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  4 <= a.Length
  //   PRE:  exists p: int, q: int {:trigger IsDuplicate(a, q), IsDuplicate(a, p)} :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  //   PRE:  forall i: int {:trigger a[i]} :: (0 <= i < a.Length ==> 0 <= a[i]) && (0 <= i < a.Length ==> a[i] < a.Length - 2)
  //   POST Q1: p != q
  //   POST Q2: IsDuplicate(a, p)
  //   POST Q3: IsDuplicate(a, q)
  {
    var a := new int[8] [4, 3, 4, 3, 3, 3, 3, 3];
    var p, q := Search(a);
    expect p == 4 || p == 3;
    expect q == 3 || q == 4;
    expect p == 4; // observed from implementation
    expect q == 3; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  4 <= a.Length
  //   PRE:  exists p: int, q: int {:trigger IsDuplicate(a, q), IsDuplicate(a, p)} :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  //   PRE:  forall i: int {:trigger a[i]} :: (0 <= i < a.Length ==> 0 <= a[i]) && (0 <= i < a.Length ==> a[i] < a.Length - 2)
  //   POST Q1: p != q
  //   POST Q2: IsDuplicate(a, p)
  //   POST Q3: IsDuplicate(a, q)
  {
    var a := new int[8] [2, 2, 3, 2, 2, 2, 3, 2];
    var p, q := Search(a);
    expect p == 3 || p == 2;
    expect q == 2 || q == 3;
    expect p == 2; // observed from implementation
    expect q == 3; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  4 <= a.Length
  //   PRE:  exists p: int, q: int {:trigger IsDuplicate(a, q), IsDuplicate(a, p)} :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  //   PRE:  forall i: int {:trigger a[i]} :: (0 <= i < a.Length ==> 0 <= a[i]) && (0 <= i < a.Length ==> a[i] < a.Length - 2)
  //   POST Q1: p != q
  //   POST Q2: IsDuplicate(a, p)
  //   POST Q3: IsDuplicate(a, q)
  {
    var a := new int[8] [3, 2, 3, 3, 3, 3, 3, 2];
    var p, q := Search(a);
    expect p == 2 || p == 3;
    expect q == 3 || q == 2;
    expect p == 3; // observed from implementation
    expect q == 2; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  4 <= a.Length
  //   PRE:  exists p: int, q: int {:trigger IsDuplicate(a, q), IsDuplicate(a, p)} :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  //   PRE:  forall i: int {:trigger a[i]} :: (0 <= i < a.Length ==> 0 <= a[i]) && (0 <= i < a.Length ==> a[i] < a.Length - 2)
  //   POST Q1: p != q
  //   POST Q2: IsDuplicate(a, p)
  //   POST Q3: IsDuplicate(a, q)
  {
    var a := new int[8] [3, 5, 3, 3, 3, 3, 3, 5];
    var p, q := Search(a);
    expect p == 5 || p == 3;
    expect q == 3 || q == 5;
    expect p == 3; // observed from implementation
    expect q == 5; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  4 <= a.Length
  //   PRE:  exists p: int, q: int {:trigger IsDuplicate(a, q), IsDuplicate(a, p)} :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  //   PRE:  forall i: int {:trigger a[i]} :: (0 <= i < a.Length ==> 0 <= a[i]) && (0 <= i < a.Length ==> a[i] < a.Length - 2)
  //   POST Q1: p != q
  //   POST Q2: IsDuplicate(a, p)
  //   POST Q3: IsDuplicate(a, q)
  {
    var a := new int[8] [3, 4, 3, 3, 3, 3, 3, 4];
    var p, q := Search(a);
    expect p == 4 || p == 3;
    expect q == 3 || q == 4;
    expect p == 3; // observed from implementation
    expect q == 4; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  4 <= a.Length
  //   PRE:  exists p: int, q: int {:trigger IsDuplicate(a, q), IsDuplicate(a, p)} :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q)
  //   PRE:  forall i: int {:trigger a[i]} :: (0 <= i < a.Length ==> 0 <= a[i]) && (0 <= i < a.Length ==> a[i] < a.Length - 2)
  //   POST Q1: p != q
  //   POST Q2: IsDuplicate(a, p)
  //   POST Q3: IsDuplicate(a, q)
  {
    var a := new int[8] [5, 5, 5, 5, 5, 1, 5, 1];
    var p, q := Search(a);
    expect p == 1 || p == 5;
    expect q == 5 || q == 1;
    expect p == 5; // observed from implementation
    expect q == 1; // observed from implementation
  }

}

method Main()
{
  TestsForSearch();
  print "TestsForSearch: all non-failing tests passed!\n";
}
