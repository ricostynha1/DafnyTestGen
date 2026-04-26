// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_tmp_tmpv_d3qi10_2_min__340-340_EVR_int.dfy
// Method: minMethod
// Generated: 2026-04-24 13:17:38

// Dafny_tmp_tmpv_d3qi10_2_min.dfy

function min(a: int, b: int): int
  ensures min(a, b) <= a && min(a, b) <= b
  ensures min(a, b) == a || min(a, b) == b
  decreases a, b
{
  if a < b then
    a
  else
    b
}

method minMethod(a: int, b: int) returns (c: int)
  ensures c <= a && c <= b
  ensures c == a || c == b
  ensures c == min(a, b)
  decreases a, b
{
  if a < b {
    c := 0;
  } else {
    c := b;
  }
}

function minFunction(a: int, b: int): int
  ensures minFunction(a, b) <= a && minFunction(a, b) <= b
  ensures minFunction(a, b) == a || minFunction(a, b) == b
  decreases a, b
{
  if a < b then
    a
  else
    b
}

method minArray(a: array<int>) returns (m: int)
  requires a != null && a.Length > 0
  ensures forall k: int {:trigger a[k]} | 0 <= k < a.Length :: m <= a[k]
  ensures exists k: int {:trigger a[k]} | 0 <= k < a.Length :: m == a[k]
  decreases a
{
  m := a[0];
  var i := 1;
  while i < a.Length
    invariant 0 <= i <= a.Length
    invariant forall k: int {:trigger a[k]} | 0 <= k < i :: m <= a[k]
    invariant exists k: int {:trigger a[k]} | 0 <= k < i :: m == a[k]
    decreases a.Length - i
  {
    if a[i] < m {
      m := a[i];
    }
    i := i + 1;
  }
}

method OriginalMain()
{
  var integer := min(1, 2);
  print integer;
}


method TestsForminMethod()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   POST Q1: c < a
  //   POST Q2: c <= b
  //   POST Q3: c == min(a, b)
  {
    var a := -10;
    var b := 2;
    var c := minMethod(a, b);
    // expect c == -10; // got 0
  }

  // Test case for combination {2}:
  //   POST Q1: c < a
  //   POST Q2: c == b
  //   POST Q3: c == min(a, b)
  {
    var a := 2;
    var b := 2;
    var c := minMethod(a, b);
    expect c == 2;
  }

  // Test case for combination {3}:
  //   POST Q1: c < a
  //   POST Q2: c == b
  //   POST Q3: c == min(a, b)
  {
    var a := 10;
    var b := 2;
    var c := minMethod(a, b);
    expect c == 2;
  }

  // Test case for combination {1}/Oa=0:
  //   POST Q1: c < a
  //   POST Q2: c <= b
  //   POST Q3: c == min(a, b)
  {
    var a := 0;
    var b := 10;
    var c := minMethod(a, b);
    expect c == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Oa>0:
  //   POST Q1: c < a
  //   POST Q2: c <= b
  //   POST Q3: c == min(a, b)
  {
    var a := 9;
    var b := 10;
    var c := minMethod(a, b);
    // expect c == 9; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Ob=0:
  //   POST Q1: c < a
  //   POST Q2: c <= b
  //   POST Q3: c == min(a, b)
  {
    var a := -10;
    var b := 0;
    var c := minMethod(a, b);
    // expect c == -10; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Ob<0:
  //   POST Q1: c < a
  //   POST Q2: c <= b
  //   POST Q3: c == min(a, b)
  {
    var a := -2;
    var b := -1;
    var c := minMethod(a, b);
    // expect c == -2; // got 0
  }

  // Test case for combination {2}/Oa=0:
  //   POST Q1: c < a
  //   POST Q2: c == b
  //   POST Q3: c == min(a, b)
  {
    var a := 0;
    var b := 0;
    var c := minMethod(a, b);
    expect c == 0;
  }

  // Test case for combination {2}/Oa<0:
  //   POST Q1: c < a
  //   POST Q2: c == b
  //   POST Q3: c == min(a, b)
  {
    var a := -10;
    var b := -10;
    var c := minMethod(a, b);
    expect c == -10;
  }

  // Test case for combination {3}/Oa=0:
  //   POST Q1: c < a
  //   POST Q2: c == b
  //   POST Q3: c == min(a, b)
  {
    var a := 0;
    var b := -10;
    var c := minMethod(a, b);
    expect c == -10;
  }

}

method TestsForminArray()
{
  // Test case for combination {1}:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: forall k: int {:trigger a[k]} | 0 <= k < a.Length :: m <= a[k]
  //   POST Q2: exists k: int {:trigger a[k]} | 0 <= k < a.Length :: m == a[k]
  {
    var a := new int[1] [-10];
    var m := minArray(a);
    expect m == -10;
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: forall k: int {:trigger a[k]} | 0 <= k < a.Length :: m <= a[k]
  //   POST Q2: exists k: int {:trigger a[k]} | 0 <= k < a.Length :: m == a[k]
  {
    var a := new int[2] [10, 9];
    var m := minArray(a);
    expect m == 9;
  }

  // Test case for combination {1}/Om=0:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: forall k: int {:trigger a[k]} | 0 <= k < a.Length :: m <= a[k]
  //   POST Q2: exists k: int {:trigger a[k]} | 0 <= k < a.Length :: m == a[k]
  {
    var a := new int[4] [3, 2, 7, 0];
    var m := minArray(a);
    expect m == 0;
  }

  // Test case for combination {1}/R4:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: forall k: int {:trigger a[k]} | 0 <= k < a.Length :: m <= a[k]
  //   POST Q2: exists k: int {:trigger a[k]} | 0 <= k < a.Length :: m == a[k]
  {
    var a := new int[1] [9];
    var m := minArray(a);
    expect m == 9;
  }

  // Test case for combination {1}/R5:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: forall k: int {:trigger a[k]} | 0 <= k < a.Length :: m <= a[k]
  //   POST Q2: exists k: int {:trigger a[k]} | 0 <= k < a.Length :: m == a[k]
  {
    var a := new int[1] [-9];
    var m := minArray(a);
    expect m == -9;
  }

  // Test case for combination {1}/R6:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: forall k: int {:trigger a[k]} | 0 <= k < a.Length :: m <= a[k]
  //   POST Q2: exists k: int {:trigger a[k]} | 0 <= k < a.Length :: m == a[k]
  {
    var a := new int[1] [-1];
    var m := minArray(a);
    expect m == -1;
  }

  // Test case for combination {1}/R7:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: forall k: int {:trigger a[k]} | 0 <= k < a.Length :: m <= a[k]
  //   POST Q2: exists k: int {:trigger a[k]} | 0 <= k < a.Length :: m == a[k]
  {
    var a := new int[1] [-8];
    var m := minArray(a);
    expect m == -8;
  }

  // Test case for combination {1}/R8:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: forall k: int {:trigger a[k]} | 0 <= k < a.Length :: m <= a[k]
  //   POST Q2: exists k: int {:trigger a[k]} | 0 <= k < a.Length :: m == a[k]
  {
    var a := new int[1] [-7];
    var m := minArray(a);
    expect m == -7;
  }

  // Test case for combination {1}/R9:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: forall k: int {:trigger a[k]} | 0 <= k < a.Length :: m <= a[k]
  //   POST Q2: exists k: int {:trigger a[k]} | 0 <= k < a.Length :: m == a[k]
  {
    var a := new int[1] [-6];
    var m := minArray(a);
    expect m == -6;
  }

  // Test case for combination {1}/R10:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: forall k: int {:trigger a[k]} | 0 <= k < a.Length :: m <= a[k]
  //   POST Q2: exists k: int {:trigger a[k]} | 0 <= k < a.Length :: m == a[k]
  {
    var a := new int[1] [-5];
    var m := minArray(a);
    expect m == -5;
  }

}

method Main()
{
  TestsForminMethod();
  print "TestsForminMethod: all non-failing tests passed!\n";
  TestsForminArray();
  print "TestsForminArray: all non-failing tests passed!\n";
}
