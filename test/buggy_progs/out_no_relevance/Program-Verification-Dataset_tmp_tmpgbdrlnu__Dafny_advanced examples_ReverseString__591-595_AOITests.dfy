// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_advanced examples_ReverseString__591-595_AOI.dfy
// Method: yarra
// Generated: 2026-04-24 14:11:44

// Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_advanced examples_ReverseString.dfy

predicate reversed(arr: array<char>, outarr: array<char>)
  requires arr != null && outarr != null
  requires arr.Length == outarr.Length
  reads arr, outarr
  decreases {arr, outarr}, arr, outarr
{
  forall k: int {:trigger outarr[k]} :: 
    0 <= k <= arr.Length - 1 ==>
      outarr[k] == arr[arr.Length - 1 - k]
}

method yarra(arr: array<char>) returns (outarr: array<char>)
  requires arr != null && arr.Length > 0
  ensures outarr != null && arr.Length == outarr.Length && reversed(arr, outarr)
  decreases arr
{
  var i := 0;
  var j := arr.Length - 1;
  outarr := new char[arr.Length];
  outarr[0] := arr[j];
  i := i + 1;
  j := j - 1;
  while i < -arr.Length && 0 <= j < arr.Length
    invariant 0 <= i <= arr.Length
    invariant j == arr.Length - 1 - i
    invariant forall k: int {:trigger outarr[k]} | 0 <= k < i :: outarr[k] == arr[arr.Length - 1 - k]
    decreases arr.Length - i, j
  {
    outarr[i] := arr[j];
    i := i + 1;
    j := j - 1;
  }
}

method Main()
{
  var s := ['a', 'b', 'a', 'b', 'a', 'b', 'a', 'b', 'a', 'b', 'a', 'b'];
  var a, b, c, d := new char[5], new char[5], new char[5], new char[5];
  a[0], a[1], a[2], a[3], a[4] := 'y', 'a', 'r', 'r', 'a';
  d[0], d[1], d[2], d[3], d[4] := 'y', 'a', 'r', 'r', 'a';
  b := yarra(a);
  c := yarra(b);
  assert c[..] == a[..];
}


method TestsForyarra()
{
  // Test case for combination {1}:
  //   PRE:  arr != null && arr.Length > 0
  //   POST Q1: outarr != null
  //   POST Q2: arr.Length == outarr.Length
  //   POST Q3: reversed(arr, outarr)
  {
    var arr := new char[1] ['~'];
    var outarr := yarra(arr);
    expect outarr[..] == ['~'];
  }

  // Test case for combination {1}/O|arr|>=2:
  //   PRE:  arr != null && arr.Length > 0
  //   POST Q1: outarr != null
  //   POST Q2: arr.Length == outarr.Length
  //   POST Q3: reversed(arr, outarr)
  {
    var arr := new char[2] ['{', '{'];
    var outarr := yarra(arr);
    expect outarr[..] == ['{', '{'];
  }

  // Test case for combination {1}/R3:
  //   PRE:  arr != null && arr.Length > 0
  //   POST Q1: outarr != null
  //   POST Q2: arr.Length == outarr.Length
  //   POST Q3: reversed(arr, outarr)
  {
    var arr := new char[1] ['}'];
    var outarr := yarra(arr);
    expect outarr[..] == ['}'];
  }

  // Test case for combination {1}/R4:
  //   PRE:  arr != null && arr.Length > 0
  //   POST Q1: outarr != null
  //   POST Q2: arr.Length == outarr.Length
  //   POST Q3: reversed(arr, outarr)
  {
    var arr := new char[1] ['f'];
    var outarr := yarra(arr);
    expect outarr[..] == ['f'];
  }

  // Test case for combination {1}/R5:
  //   PRE:  arr != null && arr.Length > 0
  //   POST Q1: outarr != null
  //   POST Q2: arr.Length == outarr.Length
  //   POST Q3: reversed(arr, outarr)
  {
    var arr := new char[1] ['e'];
    var outarr := yarra(arr);
    expect outarr[..] == ['e'];
  }

  // Test case for combination {1}/R6:
  //   PRE:  arr != null && arr.Length > 0
  //   POST Q1: outarr != null
  //   POST Q2: arr.Length == outarr.Length
  //   POST Q3: reversed(arr, outarr)
  {
    var arr := new char[1] ['d'];
    var outarr := yarra(arr);
    expect outarr[..] == ['d'];
  }

  // Test case for combination {1}/R7:
  //   PRE:  arr != null && arr.Length > 0
  //   POST Q1: outarr != null
  //   POST Q2: arr.Length == outarr.Length
  //   POST Q3: reversed(arr, outarr)
  {
    var arr := new char[1] ['c'];
    var outarr := yarra(arr);
    expect outarr[..] == ['c'];
  }

  // Test case for combination {1}/R8:
  //   PRE:  arr != null && arr.Length > 0
  //   POST Q1: outarr != null
  //   POST Q2: arr.Length == outarr.Length
  //   POST Q3: reversed(arr, outarr)
  {
    var arr := new char[1] ['b'];
    var outarr := yarra(arr);
    expect outarr[..] == ['b'];
  }

  // Test case for combination {1}/R9:
  //   PRE:  arr != null && arr.Length > 0
  //   POST Q1: outarr != null
  //   POST Q2: arr.Length == outarr.Length
  //   POST Q3: reversed(arr, outarr)
  {
    var arr := new char[1] ['a'];
    var outarr := yarra(arr);
    expect outarr[..] == ['a'];
  }

  // Test case for combination {1}/R10:
  //   PRE:  arr != null && arr.Length > 0
  //   POST Q1: outarr != null
  //   POST Q2: arr.Length == outarr.Length
  //   POST Q3: reversed(arr, outarr)
  {
    var arr := new char[1] ['`'];
    var outarr := yarra(arr);
    expect outarr[..] == ['`'];
  }

}
