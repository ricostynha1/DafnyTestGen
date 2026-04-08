// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\QS_BoilerPlate1_tmp_tmpa29vtz9__Ex2__834-834_EVR_array.dfy
// Method: copyArr
// Generated: 2026-04-08 16:23:06

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  0 <= l < r <= a.Length
  //   POST: ret[..] == a[l .. r]
  //   ENSURES: ret[..] == a[l .. r]
  {
    var a := new int[1] [12];
    var l := 0;
    var r := 1;
    var ret := copyArr(a, l, r);
    expect ret[..] == [12];
  }

  // Test case for combination {1}/Ba=2,l=0,r==a_len:
  //   PRE:  0 <= l < r <= a.Length
  //   POST: ret[..] == a[l .. r]
  //   ENSURES: ret[..] == a[l .. r]
  {
    var a := new int[2] [4, 3];
    var l := 0;
    var r := 2;
    var ret := copyArr(a, l, r);
    expect ret[..] == [4, 3];
  }

  // Test case for combination {1}/Ba=2,l=0,r=1:
  //   PRE:  0 <= l < r <= a.Length
  //   POST: ret[..] == a[l .. r]
  //   ENSURES: ret[..] == a[l .. r]
  {
    var a := new int[2] [4, 3];
    var l := 0;
    var r := 1;
    var ret := copyArr(a, l, r);
    expect ret[..] == [4];
  }

  // Test case for combination {1}/Ba=2,l=1,r==a_len:
  //   PRE:  0 <= l < r <= a.Length
  //   POST: ret[..] == a[l .. r]
  //   ENSURES: ret[..] == a[l .. r]
  {
    var a := new int[2] [4, 3];
    var l := 1;
    var r := 2;
    var ret := copyArr(a, l, r);
    expect ret[..] == [3];
  }

  // Test case for combination {1}:
  //   POST: sorted(a[..])
  //   ENSURES: sorted(a[..])
  {
    var a := new int[0] [];
    sort(a);
    expect a[..] == [];
  }

  // Test case for combination {1}/Ba=1:
  //   POST: sorted(a[..])
  //   ENSURES: sorted(a[..])
  {
    var a := new int[1] [3];
    sort(a);
    expect sorted(a[..]);
  }

  // Test case for combination {1}:
  //   PRE:  0 <= l < r <= a.Length
  //   POST: sorted(a[l .. r])
  //   POST: a[..l] == old(a[..l])
  //   POST: a[r..] == old(a[r..])
  //   ENSURES: sorted(a[l .. r])
  //   ENSURES: a[..l] == old(a[..l])
  //   ENSURES: a[r..] == old(a[r..])
  {
    var a := new int[1] [17];
    var l := 0;
    var r := 1;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    sortAux(a, l, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/Ba=2,l=0,r=1:
  //   PRE:  0 <= l < r <= a.Length
  //   POST: sorted(a[l .. r])
  //   POST: a[..l] == old(a[..l])
  //   POST: a[r..] == old(a[r..])
  //   ENSURES: sorted(a[l .. r])
  //   ENSURES: a[..l] == old(a[..l])
  //   ENSURES: a[r..] == old(a[r..])
  {
    var a := new int[2] [4, 3];
    var l := 0;
    var r := 1;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    sortAux(a, l, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/Ba=2,l=1,r==a_pre_len:
  //   PRE:  0 <= l < r <= a.Length
  //   POST: sorted(a[l .. r])
  //   POST: a[..l] == old(a[..l])
  //   POST: a[r..] == old(a[r..])
  //   ENSURES: sorted(a[l .. r])
  //   ENSURES: a[..l] == old(a[..l])
  //   ENSURES: a[r..] == old(a[r..])
  {
    var a := new int[2] [4, 3];
    var l := 1;
    var r := 2;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    sortAux(a, l, r);
    expect sorted(a[l .. r]);
    expect a[..l] == old_a_l;
    expect a[r..] == old_a_r;
  }

}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST: sorted(a[l .. r])
  //   POST: a[..l] == old(a[..l])
  //   POST: a[r..] == old(a[r..])
  //   ENSURES: sorted(a[l .. r])
  //   ENSURES: a[..l] == old(a[..l])
  //   ENSURES: a[r..] == old(a[r..])
  {
    var a := new int[2] [23, 24];
    var l := 0;
    var m := 1;
    var r := 2;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    // expect sorted(a[l .. r]);
    // expect a[..l] == old_a_l;
    // expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/Ba=3,l=0,m=1,r==a_pre_len:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST: sorted(a[l .. r])
  //   POST: a[..l] == old(a[..l])
  //   POST: a[r..] == old(a[r..])
  //   ENSURES: sorted(a[l .. r])
  //   ENSURES: a[..l] == old(a[..l])
  //   ENSURES: a[r..] == old(a[r..])
  {
    var a := new int[3] [5, 4, 6];
    var l := 0;
    var m := 1;
    var r := 3;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    // expect sorted(a[l .. r]);
    // expect a[..l] == old_a_l;
    // expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/R3:
  //   PRE:  0 <= l < m < r <= a.Length
  //   PRE:  sorted(a[l .. m]) && sorted(a[m .. r])
  //   POST: sorted(a[l .. r])
  //   POST: a[..l] == old(a[..l])
  //   POST: a[r..] == old(a[r..])
  //   ENSURES: sorted(a[l .. r])
  //   ENSURES: a[..l] == old(a[..l])
  //   ENSURES: a[r..] == old(a[r..])
  {
    var a := new int[3] [22, 23, 24];
    var l := 1;
    var m := 2;
    var r := 3;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    mergeArr(a, l, m, r);
    // expect sorted(a[l .. r]);
    // expect a[..l] == old_a_l;
    // expect a[r..] == old_a_r;
  }

  // Test case for combination {1}/Ba=2:
  //   POST: sorted(a[..])
  //   ENSURES: sorted(a[..])
  {
    var a := new int[2] [4, 3];
    sort(a);
    // expect sorted(a[..]);
  }

  // Test case for combination {1}/Ba=3:
  //   POST: sorted(a[..])
  //   ENSURES: sorted(a[..])
  {
    var a := new int[3] [5, 4, 6];
    sort(a);
    // expect sorted(a[..]);
  }

  // Test case for combination {1}/Ba=2,l=0,r==a_pre_len:
  //   PRE:  0 <= l < r <= a.Length
  //   POST: sorted(a[l .. r])
  //   POST: a[..l] == old(a[..l])
  //   POST: a[r..] == old(a[r..])
  //   ENSURES: sorted(a[l .. r])
  //   ENSURES: a[..l] == old(a[..l])
  //   ENSURES: a[r..] == old(a[r..])
  {
    var a := new int[2] [4, 3];
    var l := 0;
    var r := 2;
    var old_a_l := a[..l];
    var old_a_r := a[r..];
    sortAux(a, l, r);
    // expect sorted(a[l .. r]);
    // expect a[..l] == old_a_l;
    // expect a[r..] == old_a_r;
  }

}

method Main()
{
  Passing();
  Failing();
}
