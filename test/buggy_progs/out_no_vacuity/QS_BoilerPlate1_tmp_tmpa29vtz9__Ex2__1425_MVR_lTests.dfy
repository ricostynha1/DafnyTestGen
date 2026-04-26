// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\QS_BoilerPlate1_tmp_tmpa29vtz9__Ex2__1425_MVR_l.dfy
// Method: copyArr
// Generated: 2026-04-24 17:00:32

// QS_BoilerPlate1_tmp_tmpa29vtz9__Ex2.dfy

function sorted(s: seq<int>): bool
  decreases s
{
  forall k1: int, k2: int {:trigger s[k2], s[k1]} :: 
    0 <= k1 <= k2 < |s| ==>
      s[k1] <= s[k2]
}

method copyArr(a: array<int>, l: int, r: int)
    returns (ret: array<int>)
  requires 0 <= l < r <= a.Length
  ensures ret[..] == a[l .. r]
  decreases a, l, r
{
  var size := r - l;
  ret := new int[size];
  var i := 0;
  while i < size
    invariant a[..] == old(a[..])
    invariant 0 <= i <= size
    invariant ret[..i] == a[l .. l + i]
    decreases size - i
  {
    ret[i] := a[i + l];
    i := i + 1;
  }
  return;
}

method mergeArr(a: array<int>, l: int, m: int, r: int)
  requires 0 <= l < m < r <= a.Length
  requires sorted(a[l .. m]) && sorted(a[m .. r])
  modifies a
  ensures sorted(a[l .. r])
  ensures a[..l] == old(a[..l])
  ensures a[r..] == old(a[r..])
  decreases a, l, m, r
{
  var left := copyArr(a, l, m);
  var right := copyArr(a, m, r);
  var i := 0;
  var j := 0;
  var cur := l;
  var old_arr := a[..];
  while cur < r
    invariant 0 <= i <= left.Length
    invariant 0 <= j <= right.Length
    invariant l <= cur <= r
    invariant cur == i + j + l
    invariant a[..l] == old_arr[..l]
    invariant a[r..] == old_arr[r..]
    invariant sorted(a[l .. cur])
    invariant sorted(left[..])
    invariant sorted(right[..])
    invariant i < left.Length && cur > l ==> a[cur - 1] <= left[i]
    invariant j < right.Length && cur > l ==> a[cur - 1] <= right[j]
    decreases a.Length - cur
  {
    if (i == l && j < right.Length) || (j != right.Length && left[i] > right[j]) {
      a[cur] := right[j];
      j := j + 1;
    } else if (j == right.Length && i < left.Length) || (i != left.Length && left[i] <= right[j]) {
      a[cur] := left[i];
      i := i + 1;
    }
    cur := cur + 1;
  }
  return;
}

method sort(a: array<int>)
  modifies a
  ensures sorted(a[..])
  decreases a
{
  if a.Length == 0 {
    return;
  } else {
    sortAux(a, 0, a.Length);
  }
}

method sortAux(a: array<int>, l: int, r: int)
  requires 0 <= l < r <= a.Length
  modifies a
  ensures sorted(a[l .. r])
  ensures a[..l] == old(a[..l])
  ensures a[r..] == old(a[r..])
  decreases r - l
{
  if l >= r - 1 {
    return;
  } else {
    var m := l + (r - l) / 2;
    sortAux(a, l, m);
    sortAux(a, m, r);
    mergeArr(a, l, m, r);
    return;
  }
}


method TestsForcopyArr()
{
  // Test case for combination {1}:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: ret[..] == a[l .. r]
  {
    var a := new int[4] [-1, 6, -10, 29];
    var l := 2;
    var r := 3;
    var ret := copyArr(a, l, r);
    expect ret[..] == [-10];
  }

  // Test case for combination {1}/Bl=0:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: ret[..] == a[l .. r]
  {
    var a := new int[2] [-10, 6];
    var l := 0;
    var r := 2;
    var ret := copyArr(a, l, r);
    expect ret[..] == [-10, 6];
  }

  // Test case for combination {1}/Bl=1:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: ret[..] == a[l .. r]
  {
    var a := new int[2] [-10, -1];
    var l := 1;
    var r := 2;
    var ret := copyArr(a, l, r);
    expect ret[..] == [-1];
  }

  // Test case for combination {1}/O|a|=1:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: ret[..] == a[l .. r]
  {
    var a := new int[1] [-1];
    var l := 0;
    var r := 1;
    var ret := copyArr(a, l, r);
    expect ret[..] == [-1];
  }

  // Test case for combination {1}/R5:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: ret[..] == a[l .. r]
  {
    var a := new int[3] [-9, -2, 6];
    var l := 2;
    var r := 3;
    var ret := copyArr(a, l, r);
    expect ret[..] == [6];
  }

  // Test case for combination {1}/R6:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: ret[..] == a[l .. r]
  {
    var a := new int[3] [-8, -3, -9];
    var l := 2;
    var r := 3;
    var ret := copyArr(a, l, r);
    expect ret[..] == [-9];
  }

  // Test case for combination {1}/R7:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: ret[..] == a[l .. r]
  {
    var a := new int[3] [-7, -4, 7];
    var l := 2;
    var r := 3;
    var ret := copyArr(a, l, r);
    expect ret[..] == [7];
  }

  // Test case for combination {1}/R8:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: ret[..] == a[l .. r]
  {
    var a := new int[3] [-6, 5, 3];
    var l := 2;
    var r := 3;
    var ret := copyArr(a, l, r);
    expect ret[..] == [3];
  }

  // Test case for combination {1}/R9:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: ret[..] == a[l .. r]
  {
    var a := new int[3] [-5, 7, -8];
    var l := 2;
    var r := 3;
    var ret := copyArr(a, l, r);
    expect ret[..] == [-8];
  }

  // Test case for combination {1}/R10:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: ret[..] == a[l .. r]
  {
    var a := new int[3] [-4, -5, 4];
    var l := 2;
    var r := 3;
    var ret := copyArr(a, l, r);
    expect ret[..] == [4];
  }

}

method TestsFormergeArr()
{
  // Test case for combination {1}/Rel:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[4] [-6, -9, -9, -12];
    var l := 2;
    var m := 3;
    var r := 4;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
    expect a[..] == [-6, -9, -12, -9]; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bl=0:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[3] [-9, -6, -1];
    var l := 0;
    var m := 2;
    var r := 3;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    // actual runtime state: a=[-1, -9, -6]
    // expect sorted(a[l .. r]); // got false
    // expect a[..l] == old_a_l; // LHS=[], RHS=[]
    // expect a[r..] == old_a_r; // LHS=[], RHS=[]
  }

  // Test case for combination {1}/Bl=1:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[4] [-7, -1, 8, 95];
    var l := 1;
    var m := 2;
    var r := 3;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/R3:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[6] [-10, -8, -4, 27438, 27438, -8];
    var l := 3;
    var m := 5;
    var r := 6;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
    expect a[..] == [-10, -8, -4, -8, 27438, 27438]; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[5] [-9, -7, -8, -3, -3];
    var l := 2;
    var m := 3;
    var r := 5;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.mergeArr(BigInteger[] a, BigInteger l, BigInteger m, BigInteger r) in C:\cygwin64\tmp\DafnyCBT_jgauchf0rlf\runner.cs:line 6709
    // runtime error: at _module.__default.TestCase__14() in C:\cygwin64\tmp\DafnyCBT_jgauchf0rlf\runner.cs:line 7383
    // expect sorted(a[l .. r]);
    // expect a[..l] == old_a_l;
    // expect a[r..] == old_a_r;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[4] [-8, -10, -10, -9];
    var l := 2;
    var m := 3;
    var r := 4;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.mergeArr(BigInteger[] a, BigInteger l, BigInteger m, BigInteger r) in C:\cygwin64\tmp\DafnyCBT_jgauchf0rlf\runner.cs:line 6709
    // runtime error: at _module.__default.TestCase__15() in C:\cygwin64\tmp\DafnyCBT_jgauchf0rlf\runner.cs:line 7435
    // expect sorted(a[l .. r]);
    // expect a[..l] == old_a_l;
    // expect a[r..] == old_a_r;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[4] [-10, -8, -9, -8];
    var l := 2;
    var m := 3;
    var r := 4;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.mergeArr(BigInteger[] a, BigInteger l, BigInteger m, BigInteger r) in C:\cygwin64\tmp\DafnyCBT_jgauchf0rlf\runner.cs:line 6709
    // runtime error: at _module.__default.TestCase__16() in C:\cygwin64\tmp\DafnyCBT_jgauchf0rlf\runner.cs:line 7487
    // expect sorted(a[l .. r]);
    // expect a[..l] == old_a_l;
    // expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/R7:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[4] [-6, -2, 3, -4];
    var l := 2;
    var m := 3;
    var r := 4;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
    expect a[..] == [-6, -2, -4, 3]; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[4] [-10, -9, 9, 10];
    var l := 2;
    var m := 3;
    var r := 4;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.mergeArr(BigInteger[] a, BigInteger l, BigInteger m, BigInteger r) in C:\cygwin64\tmp\DafnyCBT_jgauchf0rlf\runner.cs:line 6709
    // runtime error: at _module.__default.TestCase__18() in C:\cygwin64\tmp\DafnyCBT_jgauchf0rlf\runner.cs:line 7591
    // expect sorted(a[l .. r]);
    // expect a[..l] == old_a_l;
    // expect a[r..] == old_a_r;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[4] [-10, -4, -2, 27439];
    var l := 2;
    var m := 3;
    var r := 4;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.mergeArr(BigInteger[] a, BigInteger l, BigInteger m, BigInteger r) in C:\cygwin64\tmp\DafnyCBT_jgauchf0rlf\runner.cs:line 6709
    // runtime error: at _module.__default.TestCase__19() in C:\cygwin64\tmp\DafnyCBT_jgauchf0rlf\runner.cs:line 7643
    // expect sorted(a[l .. r]);
    // expect a[..l] == old_a_l;
    // expect a[r..] == old_a_r;
  }

}

method TestsForsort()
{
  // Test case for combination {1}:
  //   POST Q1: sorted(a[..])
  {
    var a := new int[1] [10];
    sort(a);
    expect sorted(a[..]);
  }

  // Test case for combination {1}/O|a|=0:
  //   POST Q1: sorted(a[..])
  {
    var a := new int[0] [];
    sort(a);
    expect a[..] == [];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: sorted(a[..])
  {
    var a := new int[2] [-1, 2];
    sort(a);
    // actual runtime state: a=[2, -1]
    // expect sorted(a[..]); // got false
  }

  // Test case for combination {1}/R4:
  //   POST Q1: sorted(a[..])
  {
    var a := new int[1] [-10];
    sort(a);
    expect sorted(a[..]);
  }

  // Test case for combination {1}/R5:
  //   POST Q1: sorted(a[..])
  {
    var a := new int[1] [9];
    sort(a);
    expect sorted(a[..]);
  }

  // Test case for combination {1}/R6:
  //   POST Q1: sorted(a[..])
  {
    var a := new int[1] [-9];
    sort(a);
    expect sorted(a[..]);
  }

  // Test case for combination {1}/R7:
  //   POST Q1: sorted(a[..])
  {
    var a := new int[1] [-8];
    sort(a);
    expect sorted(a[..]);
  }

  // Test case for combination {1}/R8:
  //   POST Q1: sorted(a[..])
  {
    var a := new int[1] [3];
    sort(a);
    expect sorted(a[..]);
  }

  // Test case for combination {1}/R9:
  //   POST Q1: sorted(a[..])
  {
    var a := new int[1] [4];
    sort(a);
    expect sorted(a[..]);
  }

  // Test case for combination {1}/R10:
  //   POST Q1: sorted(a[..])
  {
    var a := new int[1] [-7];
    sort(a);
    expect sorted(a[..]);
  }

}

method TestsForsortAux()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[8] [9, 10, -3, 147, 265, 267, 268, 150];
    var l := 3;
    var r := 7;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    sortAux(a, l, r);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.mergeArr(BigInteger[] a, BigInteger l, BigInteger m, BigInteger r) in C:\cygwin64\tmp\DafnyCBT_jgauchf0rlf\runner.cs:line 6709
    // runtime error: at _module.__default.sortAux(BigInteger[] a, BigInteger l, BigInteger r) in C:\cygwin64\tmp\DafnyCBT_jgauchf0rlf\runner.cs:line 6737
    // expect sorted(a[l .. r]);
    // expect a[..l] == old_a_l;
    // expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/Bl=0:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[2] [-1, -1];
    var l := 0;
    var r := 2;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    sortAux(a, l, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/Bl=1:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[2] [-10, -4];
    var l := 1;
    var r := 2;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    sortAux(a, l, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/O|a|=1:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[1] [-10];
    var l := 0;
    var r := 1;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    sortAux(a, l, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/R4:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[3] [-5, -3, 9];
    var l := 2;
    var r := 3;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    sortAux(a, l, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/R5:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[3] [-4, -2, -10];
    var l := 2;
    var r := 3;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    sortAux(a, l, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/R6:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[4] [2, 9, 8, 69];
    var l := 2;
    var r := 3;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    sortAux(a, l, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/R7:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[3] [-3, 10, -6];
    var l := 2;
    var r := 3;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    sortAux(a, l, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/R8:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[3] [10, 8, -9];
    var l := 2;
    var r := 3;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    sortAux(a, l, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/R9:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[3] [-6, -7, 10];
    var l := 2;
    var r := 3;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    sortAux(a, l, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

}

method Main()
{
  TestsForcopyArr();
  print "TestsForcopyArr: all non-failing tests passed!\n";
  TestsFormergeArr();
  print "TestsFormergeArr: all non-failing tests passed!\n";
  TestsForsort();
  print "TestsForsort: all non-failing tests passed!\n";
  TestsForsortAux();
  print "TestsForsortAux: all non-failing tests passed!\n";
}
