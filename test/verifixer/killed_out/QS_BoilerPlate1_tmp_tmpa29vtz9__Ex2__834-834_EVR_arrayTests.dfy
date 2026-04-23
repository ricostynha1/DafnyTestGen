// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\QS_BoilerPlate1_tmp_tmpa29vtz9__Ex2__834-834_EVR_array.dfy
// Method: copyArr
// Generated: 2026-04-22 21:56:10

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
  var right := copyArr(null, m, r);
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
    if (i == left.Length && j < right.Length) || (j != right.Length && left[i] > right[j]) {
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
    var a := new int[4] [-1, -7, -10, 28];
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
    var a := new int[2] [-10, -3];
    var l := 1;
    var r := 2;
    var ret := copyArr(a, l, r);
    expect ret[..] == [-3];
  }

  // Test case for combination {1}/O|a|=1:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: ret[..] == a[l .. r]
  {
    var a := new int[1] [2];
    var l := 0;
    var r := 1;
    var ret := copyArr(a, l, r);
    expect ret[..] == [2];
  }

}

method TestsFormergeArr()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[4] [-1, -3, -3, -3];
    var l := 2;
    var m := 3;
    var r := 4;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    // runtime error: Unhandled exception. System.NullReferenceException: Object reference not set to an instance of an object.
    // runtime error: at _module.__default.copyArr(BigInteger[] a, BigInteger l, BigInteger r) in C:\cygwin64\tmp\DafnyTestGen_qxbvwsqa0r2\runner.cs:line 6174
    // runtime error: at _module.__default.mergeArr(BigInteger[] a, BigInteger l, BigInteger m, BigInteger r) in C:\cygwin64\tmp\DafnyTestGen_qxbvwsqa0r2\runner.cs:line 6188
    // expect sorted(a[l .. r]);
    // expect a[..l] == old_a_l;
    // expect a[r..] == old_a_r;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bl=0:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[3] [-8, -3, 10];
    var l := 0;
    var m := 2;
    var r := 3;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    // runtime error: Unhandled exception. System.NullReferenceException: Object reference not set to an instance of an object.
    // runtime error: at _module.__default.copyArr(BigInteger[] a, BigInteger l, BigInteger r) in C:\cygwin64\tmp\DafnyTestGen_qxbvwsqa0r2\runner.cs:line 6174
    // runtime error: at _module.__default.mergeArr(BigInteger[] a, BigInteger l, BigInteger m, BigInteger r) in C:\cygwin64\tmp\DafnyTestGen_qxbvwsqa0r2\runner.cs:line 6188
    // expect sorted(a[l .. r]);
    // expect a[..l] == old_a_l;
    // expect a[r..] == old_a_r;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bl=1:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[4] [5, -1, -1, 86];
    var l := 1;
    var m := 2;
    var r := 3;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    // runtime error: Unhandled exception. System.NullReferenceException: Object reference not set to an instance of an object.
    // runtime error: at _module.__default.copyArr(BigInteger[] a, BigInteger l, BigInteger r) in C:\cygwin64\tmp\DafnyTestGen_qxbvwsqa0r2\runner.cs:line 6174
    // runtime error: at _module.__default.mergeArr(BigInteger[] a, BigInteger l, BigInteger m, BigInteger r) in C:\cygwin64\tmp\DafnyTestGen_qxbvwsqa0r2\runner.cs:line 6188
    // expect sorted(a[l .. r]);
    // expect a[..l] == old_a_l;
    // expect a[r..] == old_a_r;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R3:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[6] [6, -4, 9, 23216, 23216, 8];
    var l := 3;
    var m := 5;
    var r := 6;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    // runtime error: Unhandled exception. System.NullReferenceException: Object reference not set to an instance of an object.
    // runtime error: at _module.__default.copyArr(BigInteger[] a, BigInteger l, BigInteger r) in C:\cygwin64\tmp\DafnyTestGen_qxbvwsqa0r2\runner.cs:line 6174
    // runtime error: at _module.__default.mergeArr(BigInteger[] a, BigInteger l, BigInteger m, BigInteger r) in C:\cygwin64\tmp\DafnyTestGen_qxbvwsqa0r2\runner.cs:line 6188
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
    var a := new int[2] [-1, 7];
    sort(a);
    // runtime error: Unhandled exception. System.NullReferenceException: Object reference not set to an instance of an object.
    // runtime error: at _module.__default.copyArr(BigInteger[] a, BigInteger l, BigInteger r) in C:\cygwin64\tmp\DafnyTestGen_qxbvwsqa0r2\runner.cs:line 6174
    // runtime error: at _module.__default.mergeArr(BigInteger[] a, BigInteger l, BigInteger m, BigInteger r) in C:\cygwin64\tmp\DafnyTestGen_qxbvwsqa0r2\runner.cs:line 6188
    // expect sorted(a[..]);
  }

  // Test case for combination {1}/R4:
  //   POST Q1: sorted(a[..])
  {
    var a := new int[1] [-10];
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
    var a := new int[4] [-1, 8, -10, 213];
    var l := 2;
    var r := 4;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    sortAux(a, l, r);
    // runtime error: Unhandled exception. System.NullReferenceException: Object reference not set to an instance of an object.
    // runtime error: at _module.__default.copyArr(BigInteger[] a, BigInteger l, BigInteger r) in C:\cygwin64\tmp\DafnyTestGen_qxbvwsqa0r2\runner.cs:line 6174
    // runtime error: at _module.__default.mergeArr(BigInteger[] a, BigInteger l, BigInteger m, BigInteger r) in C:\cygwin64\tmp\DafnyTestGen_qxbvwsqa0r2\runner.cs:line 6188
    // expect sorted(a[l .. r]);
    // expect a[..l] == old_a_l;
    // expect a[r..] == old_a_r;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bl=0:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[2] [-10, -10];
    var l := 0;
    var r := 2;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    sortAux(a, l, r);
    // runtime error: Unhandled exception. System.NullReferenceException: Object reference not set to an instance of an object.
    // runtime error: at _module.__default.copyArr(BigInteger[] a, BigInteger l, BigInteger r) in C:\cygwin64\tmp\DafnyTestGen_qxbvwsqa0r2\runner.cs:line 6174
    // runtime error: at _module.__default.mergeArr(BigInteger[] a, BigInteger l, BigInteger m, BigInteger r) in C:\cygwin64\tmp\DafnyTestGen_qxbvwsqa0r2\runner.cs:line 6188
    // expect sorted(a[l .. r]);
    // expect a[..l] == old_a_l;
    // expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/Bl=1:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[2] [-10, -6];
    var l := 1;
    var r := 2;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    sortAux(a, l, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/Br=a_pre_len-1:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[4] [-1, -7, -10, 48];
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
