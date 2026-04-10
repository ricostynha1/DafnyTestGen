// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafl_tmp_tmp_r3_8w3y_dafny_examples_uiowa_binary-search.dfy
// Method: binSearch
// Generated: 2026-04-08 19:04:35

// dafl_tmp_tmp_r3_8w3y_dafny_examples_uiowa_binary-search.dfy

predicate isSorted(a: array<int>)
  reads a
  decreases {a}, a
{
  forall i: nat, j: nat {:trigger a[j], a[i]} :: 
    i <= j < a.Length ==>
      a[i] <= a[j]
}

method binSearch(a: array<int>, K: int) returns (b: bool)
  requires isSorted(a)
  ensures b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  decreases a, K
{
  var lo: nat := 0;
  var hi: nat := a.Length;
  while lo < hi
    invariant 0 <= lo <= hi <= a.Length
    invariant forall i: nat {:trigger a[i]} :: i < lo || hi <= i < a.Length ==> a[i] != K
    decreases hi - lo
  {
    var mid: nat := (lo + hi) / 2;
    assert lo <= mid <= hi;
    if a[mid] < K {
      assert a[lo] <= a[mid];
      assert a[mid] < K;
      lo := mid + 1;
      assert mid < lo <= hi;
    } else if a[mid] > K {
      assert K < a[mid];
      hi := mid;
      assert lo <= hi == mid;
    } else {
      return true;
      assert a[mid] == K;
    }
  }
  return false;
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  isSorted(a)
  //   POST: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  //   ENSURES: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  {
    var a := new int[0] [];
    var K := 0;
    var b := binSearch(a, K);
    expect b == false;
  }

  // Test case for combination {1}/Ba=0,K=1:
  //   PRE:  isSorted(a)
  //   POST: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  //   ENSURES: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  {
    var a := new int[0] [];
    var K := 1;
    var b := binSearch(a, K);
    expect b == false;
  }

  // Test case for combination {1}/Ba=1,K=0:
  //   PRE:  isSorted(a)
  //   POST: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  //   ENSURES: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  {
    var a := new int[1] [2];
    var K := 0;
    var b := binSearch(a, K);
    expect b == false;
  }

  // Test case for combination {1}/Ba=1,K=1:
  //   PRE:  isSorted(a)
  //   POST: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  //   ENSURES: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  {
    var a := new int[1] [2];
    var K := 1;
    var b := binSearch(a, K);
    expect b == false;
  }

  // Test case for combination {1}/Ob=true:
  //   PRE:  isSorted(a)
  //   POST: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  //   ENSURES: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  {
    var a := new int[1] [8];
    var K := 8;
    var b := binSearch(a, K);
    expect b == true;
  }

  // Test case for combination {1}/Ob=false:
  //   PRE:  isSorted(a)
  //   POST: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  //   ENSURES: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  {
    var a := new int[1] [11];
    var K := 9;
    var b := binSearch(a, K);
    expect b == false;
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
