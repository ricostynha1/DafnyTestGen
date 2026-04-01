// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Dafny_tmp_tmpv_d3qi10_2_min__340-340_EVR_int.dfy
// Method: minMethod
// Generated: 2026-04-01 13:54:34

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


method Passing()
{
  // Test case for combination {1}:
  //   POST: c <= a
  //   POST: c <= b
  //   POST: c == a
  //   POST: c == min(a, b)
  {
    var a := 0;
    var b := 1;
    var c := minMethod(a, b);
    expect c == 0;
  }

  // Test case for combination {2}:
  //   POST: c <= a
  //   POST: c <= b
  //   POST: c == b
  //   POST: c == min(a, b)
  {
    var a := 0;
    var b := -1;
    var c := minMethod(a, b);
    expect c == -1;
  }

  // Test case for combination {1,2}:
  //   POST: c <= a
  //   POST: c <= b
  //   POST: c == a
  //   POST: c == min(a, b)
  //   POST: c == b
  {
    var a := 0;
    var b := 0;
    var c := minMethod(a, b);
    expect c == 0;
  }

  // Test case for combination {2}/Ba=1,b=0:
  //   POST: c <= a
  //   POST: c <= b
  //   POST: c == b
  //   POST: c == min(a, b)
  {
    var a := 1;
    var b := 0;
    var c := minMethod(a, b);
    expect c == 0;
  }

  // Test case for combination {1}:
  //   PRE:  a != null && a.Length > 0
  //   POST: forall k: int {:trigger a[k]} | 0 <= k < a.Length :: m <= a[k]
  //   POST: exists k: int {:trigger a[k]} | 0 <= k < a.Length :: m == a[k]
  {
    var a := new int[1] [0];
    expect a != null && a.Length > 0; // PRE-CHECK
    var m := minArray(a);
    expect m == 0;
  }

  // Test case for combination {1}/Ba=2:
  //   PRE:  a != null && a.Length > 0
  //   POST: forall k: int {:trigger a[k]} | 0 <= k < a.Length :: m <= a[k]
  //   POST: exists k: int {:trigger a[k]} | 0 <= k < a.Length :: m == a[k]
  {
    var a := new int[2] [0, 39];
    expect a != null && a.Length > 0; // PRE-CHECK
    var m := minArray(a);
    expect m == 0;
  }

  // Test case for combination {1}/Ba=3:
  //   PRE:  a != null && a.Length > 0
  //   POST: forall k: int {:trigger a[k]} | 0 <= k < a.Length :: m <= a[k]
  //   POST: exists k: int {:trigger a[k]} | 0 <= k < a.Length :: m == a[k]
  {
    var a := new int[3] [7718, 7719, 7720];
    expect a != null && a.Length > 0; // PRE-CHECK
    var m := minArray(a);
    expect m == 7718;
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
