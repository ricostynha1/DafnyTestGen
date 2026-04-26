// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafl_tmp_tmp_r3_8w3y_dafny_examples_uiowa_binary-search__689_ROR_Eq.dfy
// Method: binSearch
// Generated: 2026-04-24 13:02:27

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
    if a[mid] == K {
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


method TestsForbinSearch()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  isSorted(a)
  //   POST Q1: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  {
    var a := new int[1] [-10];
    var K := -10;
    var b := binSearch(a, K);
    // expect b == true; // got false
  }

  // Test case for combination {1}/O|a|=0:
  //   PRE:  isSorted(a)
  //   POST Q1: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  {
    var a := new int[0] [];
    var K := 2;
    var b := binSearch(a, K);
    expect b == false;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   PRE:  isSorted(a)
  //   POST Q1: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  {
    var a := new int[2] [-10, -1];
    var K := -9;
    var b := binSearch(a, K);
    // expect b == false; // got true
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/OK=0:
  //   PRE:  isSorted(a)
  //   POST Q1: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  {
    var a := new int[1] [-10];
    var K := 0;
    var b := binSearch(a, K);
    // expect b == false; // got true
  }

  // Test case for combination {1}/R5:
  //   PRE:  isSorted(a)
  //   POST Q1: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  {
    var a := new int[1] [10];
    var K := -8;
    var b := binSearch(a, K);
    expect b == false;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  isSorted(a)
  //   POST Q1: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  {
    var a := new int[1] [-10];
    var K := -9;
    var b := binSearch(a, K);
    // expect b == false; // got true
  }

  // Test case for combination {1}/R7:
  //   PRE:  isSorted(a)
  //   POST Q1: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  {
    var a := new int[1] [-9];
    var K := -10;
    var b := binSearch(a, K);
    expect b == false;
  }

  // Test case for combination {1}/R8:
  //   PRE:  isSorted(a)
  //   POST Q1: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  {
    var a := new int[1] [-8];
    var K := -10;
    var b := binSearch(a, K);
    expect b == false;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  isSorted(a)
  //   POST Q1: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  {
    var a := new int[1] [-10];
    var K := -7;
    var b := binSearch(a, K);
    // expect b == false; // got true
  }

  // Test case for combination {1}/R10:
  //   PRE:  isSorted(a)
  //   POST Q1: b == exists i: nat {:trigger a[i]} :: i < a.Length && a[i] == K
  {
    var a := new int[1] [-7];
    var K := -10;
    var b := binSearch(a, K);
    expect b == false;
  }

}

method Main()
{
  TestsForbinSearch();
  print "TestsForbinSearch: all non-failing tests passed!\n";
}
