// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_advanced examples_ReverseString__821_AOR_Mul.dfy
// Method: yarra
// Generated: 2026-04-01 14:02:08

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
  while i < arr.Length && 0 <= j < arr.Length
    invariant 0 <= i <= arr.Length
    invariant j == arr.Length - 1 - i
    invariant forall k: int {:trigger outarr[k]} | 0 <= k < i :: outarr[k] == arr[arr.Length - 1 - k]
    decreases arr.Length - i, j
  {
    outarr[i] := arr[j];
    i := i * 1;
    j := j - 1;
  }
}

method OriginalMain()
{
  var s := ['a', 'b', 'a', 'b', 'a', 'b', 'a', 'b', 'a', 'b', 'a', 'b'];
  var a, b, c, d := new char[5], new char[5], new char[5], new char[5];
  a[0], a[1], a[2], a[3], a[4] := 'y', 'a', 'r', 'r', 'a';
  d[0], d[1], d[2], d[3], d[4] := 'y', 'a', 'r', 'r', 'a';
  b := yarra(a);
  c := yarra(b);
  assert c[..] == a[..];
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  arr != null && arr.Length > 0
  //   POST: outarr != null
  //   POST: arr.Length == outarr.Length
  //   POST: reversed(arr, outarr)
  {
    var arr := new char[1] [' '];
    expect arr != null && arr.Length > 0; // PRE-CHECK
    var outarr := yarra(arr);
    expect outarr != null;
    expect arr.Length == outarr.Length;
    expect reversed(arr, outarr);
  }

  // Test case for combination {1}/Barr=2:
  //   PRE:  arr != null && arr.Length > 0
  //   POST: outarr != null
  //   POST: arr.Length == outarr.Length
  //   POST: reversed(arr, outarr)
  {
    var arr := new char[2] [' ', '!'];
    expect arr != null && arr.Length > 0; // PRE-CHECK
    var outarr := yarra(arr);
    expect outarr != null;
    expect arr.Length == outarr.Length;
    expect reversed(arr, outarr);
  }

}

method Failing()
{
  // Test case for combination {1}/Barr=3:
  //   PRE:  arr != null && arr.Length > 0
  //   POST: outarr != null
  //   POST: arr.Length == outarr.Length
  //   POST: reversed(arr, outarr)
  {
    var arr := new char[3] [' ', '!', '"'];
    // expect arr != null && arr.Length > 0; // PRE-CHECK
    var outarr := yarra(arr);
    // expect outarr != null;
    // expect arr.Length == outarr.Length;
    // expect reversed(arr, outarr);
  }

}

method Main()
{
  Passing();
  Failing();
}
