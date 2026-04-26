// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\QS_BoilerPlate1_tmp_tmpa29vtz9__Ex2__1425_MVR_l.dfy
// Method: copyArr
// Generated: 2026-04-24 20:34:32

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
    var a := new int[1] [12];
    var l := 0;
    var r := 1;
    var ret := copyArr(a, l, r);
    expect ret[..] == [12];
  }

  // Test case for combination {1}/Bl=1:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: ret[..] == a[l .. r]
  {
    var a := new int[2] [9, 12];
    var l := 1;
    var r := 2;
    var ret := copyArr(a, l, r);
    expect ret[..] == [12];
  }

  // Test case for combination {1}/Br=a_len-1:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: ret[..] == a[l .. r]
  {
    var a := new int[2] [13, 14];
    var l := 0;
    var r := 1;
    var ret := copyArr(a, l, r);
    expect ret[..] == [13];
  }

  // Test case for combination {1}/O|ret|>=2:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: ret[..] == a[l .. r]
  {
    var a := new int[2] [16, 17];
    var l := 0;
    var r := 2;
    var ret := copyArr(a, l, r);
    expect ret[..] == [16, 17];
  }

  // Test case for combination {1}/R5:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: ret[..] == a[l .. r]
  {
    var a := new int[1] [18];
    var l := 0;
    var r := 1;
    var ret := copyArr(a, l, r);
    expect ret[..] == [18];
  }

  // Test case for combination {1}/R6:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: ret[..] == a[l .. r]
  {
    var a := new int[1] [11];
    var l := 0;
    var r := 1;
    var ret := copyArr(a, l, r);
    expect ret[..] == [11];
  }

  // Test case for combination {1}/R7:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: ret[..] == a[l .. r]
  {
    var a := new int[1] [19];
    var l := 0;
    var r := 1;
    var ret := copyArr(a, l, r);
    expect ret[..] == [19];
  }

  // Test case for combination {1}/R8:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: ret[..] == a[l .. r]
  {
    var a := new int[1] [20];
    var l := 0;
    var r := 1;
    var ret := copyArr(a, l, r);
    expect ret[..] == [20];
  }

  // Test case for combination {1}/R9:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: ret[..] == a[l .. r]
  {
    var a := new int[1] [21];
    var l := 0;
    var r := 1;
    var ret := copyArr(a, l, r);
    expect ret[..] == [21];
  }

  // Test case for combination {1}/R10:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: ret[..] == a[l .. r]
  {
    var a := new int[1] [22];
    var l := 0;
    var r := 1;
    var ret := copyArr(a, l, r);
    expect ret[..] == [22];
  }

}

method TestsFormergeArr()
{
  // Test case for combination {1}:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[2] [80, 80];
    var l := 0;
    var m := 1;
    var r := 2;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/Bl=1:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[4] [41, 71, 71, 70];
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
    var a := new int[2] [65, 65];
    var l := 0;
    var m := 1;
    var r := 2;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/R4:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[2] [81, 81];
    var l := 0;
    var m := 1;
    var r := 2;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/R5:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[2] [94, 94];
    var l := 0;
    var m := 1;
    var r := 2;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/R6:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[2] [90, 90];
    var l := 0;
    var m := 1;
    var r := 2;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/R7:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[2] [85, 85];
    var l := 0;
    var m := 1;
    var r := 2;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/R8:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[2] [79, 79];
    var l := 0;
    var m := 1;
    var r := 2;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/R9:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[2] [92, 92];
    var l := 0;
    var m := 1;
    var r := 2;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/R10:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[2] [73, 73];
    var l := 0;
    var m := 1;
    var r := 2;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

}

method TestsForsort()
{
  // Test case for combination {1}:
  //   POST Q1: sorted(a[..])
  {
    var a := new int[0] [];
    sort(a);
    expect a[..] == [];
  }

  // Test case for combination {1}/O|a|=1:
  //   POST Q1: sorted(a[..])
  {
    var a := new int[1] [2];
    sort(a);
    expect sorted(a[..]);
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: sorted(a[..])
  {
    var a := new int[2] [22, 21];
    sort(a);
    expect sorted(a[..]);
    expect a[..] == [21, 22]; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   POST Q1: sorted(a[..])
  {
    var a := new int[1] [18];
    sort(a);
    expect sorted(a[..]);
  }

  // Test case for combination {1}/R5:
  //   POST Q1: sorted(a[..])
  {
    var a := new int[1] [17];
    sort(a);
    expect sorted(a[..]);
  }

  // Test case for combination {1}/R6:
  //   POST Q1: sorted(a[..])
  {
    var a := new int[1] [19];
    sort(a);
    expect sorted(a[..]);
  }

  // Test case for combination {1}/R7:
  //   POST Q1: sorted(a[..])
  {
    var a := new int[1] [20];
    sort(a);
    expect sorted(a[..]);
  }

  // Test case for combination {1}/R8:
  //   POST Q1: sorted(a[..])
  {
    var a := new int[1] [23];
    sort(a);
    expect sorted(a[..]);
  }

  // Test case for combination {1}/R9:
  //   POST Q1: sorted(a[..])
  {
    var a := new int[1] [27];
    sort(a);
    expect sorted(a[..]);
  }

  // Test case for combination {1}/R10:
  //   POST Q1: sorted(a[..])
  {
    var a := new int[1] [24];
    sort(a);
    expect sorted(a[..]);
  }

}

method TestsForsortAux()
{
  // Test case for combination {1}:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[1] [54];
    var l := 0;
    var r := 1;
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
    var a := new int[2] [21, 36];
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
    var a := new int[2] [37, 39];
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
    var a := new int[1] [43];
    var l := 0;
    var r := 1;
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
    var a := new int[1] [42];
    var l := 0;
    var r := 1;
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
    var a := new int[1] [44];
    var l := 0;
    var r := 1;
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
    var a := new int[1] [45];
    var l := 0;
    var r := 1;
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
    var a := new int[1] [46];
    var l := 0;
    var r := 1;
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
    var a := new int[1] [47];
    var l := 0;
    var r := 1;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    sortAux(a, l, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/R10:
  //   PRE:  0 <= l < r <= a.Length
  //   POST Q1: sorted(a[l .. r])
  //   POST Q2: a[..l] == old(a[..l])
  //   POST Q3: a[r..] == old(a[r..])
  {
    var a := new int[1] [48];
    var l := 0;
    var r := 1;
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
