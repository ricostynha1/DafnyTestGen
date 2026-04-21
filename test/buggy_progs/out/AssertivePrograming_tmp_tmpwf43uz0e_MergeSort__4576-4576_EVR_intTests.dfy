// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\AssertivePrograming_tmp_tmpwf43uz0e_MergeSort__4576-4576_EVR_int.dfy
// Method: MergeSort
// Generated: 2026-04-21 22:49:21

// AssertivePrograming_tmp_tmpwf43uz0e_MergeSort.dfy

predicate Sorted(q: seq<int>)
  decreases q
{
  forall i: int, j: int {:trigger q[j], q[i]} :: 
    0 <= i <= j < |q| ==>
      q[i] <= q[j]
}

method MergeSort(a: array<int>) returns (b: array<int>)
  ensures b.Length == a.Length && Sorted(b[..]) && multiset(a[..]) == multiset(b[..])
  decreases a.Length
{
  if a.Length <= 1 {
    b := a;
  } else {
    var mid: nat := a.Length / 2;
    var a1: array<int> := new int[mid];
    var a2: array<int> := new int[a.Length - mid];
    assert a1.Length <= a2.Length;
    assert a.Length == a1.Length + a2.Length;
    var i: nat := 0;
    while i < a1.Length
      invariant Inv(a[..], a1[..], a2[..], i, mid)
      decreases a1.Length - i
    {
      a1[i] := a[i];
      a2[i] := a[i + mid];
      i := i + 1;
    }
    assert !(i < a1.Length);
    assert i >= a1.Length;
    assert i == a1.Length;
    assert Inv(a[..], a1[..], a2[..], i, mid);
    assert i <= |a1[..]| && i <= |a2[..]| && i + mid <= |a[..]|;
    assert a1[..i] == a[..i] && a2[..i] == a[mid .. i + mid];
    if a1.Length < a2.Length {
      a2[i] := a[i + mid];
      assert i + 1 == a2.Length;
      assert a2[..i + 1] == a[mid .. i + 1 + mid];
      assert a1[..i] == a[..i] && a2[..i + 1] == a[mid .. i + 1 + mid];
      assert a[..i] + a[i .. i + 1 + mid] == a1[..i] + a2[..i + 1];
      assert a[..i] + a[i .. i + 1 + mid] == a1[..] + a2[..];
      assert a[..] == a1[..] + a2[..];
    } else {
      assert i == a2.Length;
      assert a1[..i] == a[..i] && a2[..i] == a[mid .. i + mid];
      assert a[..i] + a[i .. i + mid] == a1[..i] + a2[..i];
      assert a[..i] + a[i .. i + mid] == a1[..] + a2[..];
      assert a[..] == a1[..] + a2[..];
    }
    assert a1.Length < a.Length;
    a1 := MergeSort(a1);
    assert a2.Length < a.Length;
    a2 := MergeSort(a2);
    b := new int[a.Length];
    Merge(b, a1, a2);
    assert multiset(b[..]) == multiset(a1[..]) + multiset(a2[..]);
    assert Sorted(b[..]);
  }
  assert b.Length == a.Length && Sorted(b[..]) && multiset(a[..]) == multiset(b[..]);
}

predicate Inv(a: seq<int>, a1: seq<int>, a2: seq<int>, i: nat, mid: nat)
  decreases a, a1, a2, i, mid
{
  i <= |a1| &&
  i <= |a2| &&
  i + mid <= |a| &&
  a1[..i] == a[..i] &&
  a2[..i] == a[mid .. i + mid]
}

method Merge(b: array<int>, c: array<int>, d: array<int>)
  requires b != c && b != d && b.Length == c.Length + d.Length
  requires Sorted(c[..]) && Sorted(d[..])
  modifies b
  ensures Sorted(b[..]) && multiset(b[..]) == multiset(c[..]) + multiset(d[..])
  decreases b, c, d
{
  var i: nat, j: nat := 0, 0;
  while i + j < b.Length
    invariant i <= c.Length && j <= d.Length && i + j <= b.Length
    invariant InvSubSet(b[..], c[..], d[..], i, j)
    invariant InvSorted(b[..], c[..], d[..], i, j)
    decreases c.Length - i, d.Length - j
  {
    i, j := MergeLoop(b, c, d, i, j);
    assert InvSubSet(b[..], c[..], d[..], i, j);
    assert InvSorted(b[..], c[..], d[..], i, j);
  }
  assert InvSubSet(b[..], c[..], d[..], i, j);
  LemmaMultysetsEquals(b[..], c[..], d[..], i, j);
  assert multiset(b[..]) == multiset(c[..]) + multiset(d[..]);
}

method {:verify true} MergeLoop(b: array<int>, c: array<int>, d: array<int>, i0: nat, j0: nat)
    returns (i: nat, j: nat)
  requires b != c && b != d && b.Length == c.Length + d.Length
  requires Sorted(c[..]) && Sorted(d[..])
  requires i0 <= c.Length && j0 <= d.Length && i0 + j0 <= b.Length
  requires InvSubSet(b[..], c[..], d[..], i0, j0)
  requires InvSorted(b[..], c[..], d[..], i0, j0)
  requires i0 + j0 < b.Length
  modifies b
  ensures i <= c.Length && j <= d.Length && i + j <= b.Length
  ensures InvSubSet(b[..], c[..], d[..], i, j)
  ensures InvSorted(b[..], c[..], d[..], i, j)
  ensures 0 <= c.Length - i < c.Length - i0 || (c.Length - i == c.Length - i0 && 0 <= d.Length - j < d.Length - j0)
  decreases b, c, d, i0, j0
{
  i, j := i0, j0;
  if 0 == c.Length || (j < d.Length && d[j] < c[i]) {
    assert InvSorted(b[..][i + j := d[j]], c[..], d[..], i, j + 1);
    b[i + j] := d[j];
    lemmaInvSubsetTakeValueFromD(b[..], c[..], d[..], i, j);
    assert InvSubSet(b[..], c[..], d[..], i, j + 1);
    assert InvSorted(b[..], c[..], d[..], i, j + 1);
    j := j + 1;
  } else {
    assert j == d.Length || (i < c.Length && c[i] <= d[j]);
    assert InvSorted(b[..][i + j := c[i]], c[..], d[..], i + 1, j);
    b[i + j] := c[i];
    lemmaInvSubsetTakeValueFromC(b[..], c[..], d[..], i, j);
    assert InvSubSet(b[..], c[..], d[..], i + 1, j);
    assert InvSorted(b[..], c[..], d[..], i + 1, j);
    i := i + 1;
  }
}

predicate InvSorted(b: seq<int>, c: seq<int>, d: seq<int>, i: nat, j: nat)
  decreases b, c, d, i, j
{
  i <= |c| &&
  j <= |d| &&
  i + j <= |b| &&
  (i + j > 0 &&
  i < |c| ==>
    b[j + i - 1] <= c[i]) &&
  (i + j > 0 &&
  j < |d| ==>
    b[j + i - 1] <= d[j]) &&
  Sorted(b[..i + j])
}

predicate InvSubSet(b: seq<int>, c: seq<int>, d: seq<int>, i: nat, j: nat)
  decreases b, c, d, i, j
{
  i <= |c| &&
  j <= |d| &&
  i + j <= |b| &&
  multiset(b[..i + j]) == multiset(c[..i]) + multiset(d[..j])
}

lemma LemmaMultysetsEquals(b: seq<int>, c: seq<int>, d: seq<int>, i: nat, j: nat)
  requires i == |c|
  requires j == |d|
  requires i + j == |b|
  requires multiset(b[..i + j]) == multiset(c[..i]) + multiset(d[..j])
  ensures multiset(b[..]) == multiset(c[..]) + multiset(d[..])
  decreases b, c, d, i, j
{
  assert b[..] == b[..i + j];
  assert c[..] == c[..i];
  assert d[..] == d[..j];
}

lemma lemmaInvSubsetTakeValueFromC(b: seq<int>, c: seq<int>, d: seq<int>, i: nat, j: nat)
  requires i < |c|
  requires j <= |d|
  requires i + j < |b|
  requires |c| + |d| == |b|
  requires multiset(b[..i + j]) == multiset(c[..i]) + multiset(d[..j])
  requires b[i + j] == c[i]
  ensures multiset(b[..i + j + 1]) == multiset(c[..i + 1]) + multiset(d[..j])
  decreases b, c, d, i, j
{
  assert c[..i] + [c[i]] == c[..i + 1];
  assert b[..i + j + 1] == b[..i + j] + [b[i + j]];
  assert multiset(b[..i + j + 1]) == multiset(c[..i + 1]) + multiset(d[..j]);
}

lemma {:verify true} lemmaInvSubsetTakeValueFromD(b: seq<int>, c: seq<int>, d: seq<int>, i: nat, j: nat)
  requires i <= |c|
  requires j < |d|
  requires i + j < |b|
  requires |c| + |d| == |b|
  requires multiset(b[..i + j]) == multiset(c[..i]) + multiset(d[..j])
  requires b[i + j] == d[j]
  ensures multiset(b[..i + j + 1]) == multiset(c[..i]) + multiset(d[..j + 1])
  decreases b, c, d, i, j
{
  assert d[..j] + [d[j]] == d[..j + 1];
  assert b[..i + j + 1] == b[..i + j] + [b[i + j]];
  assert multiset(b[..i + j + 1]) == multiset(c[..i]) + multiset(d[..j + 1]);
}

method OriginalMain()
{
  var a := new int[3] [4, 8, 6];
  var q0 := a[..];
  assert q0 == [4, 8, 6];
  a := MergeSort(a);
  assert a.Length == |q0| && multiset(a[..]) == multiset(q0);
  print "\nThe sorted version of ", q0, " is ", a[..];
  assert Sorted(a[..]);
  assert a[..] == [4, 6, 8];
  a := new int[5] [3, 8, 5, -1, 10];
  q0 := a[..];
  assert q0 == [3, 8, 5, -1, 10];
  a := MergeSort(a);
  assert a.Length == |q0| && multiset(a[..]) == multiset(q0);
  print "\nThe sorted version of ", q0, " is ", a[..];
  assert Sorted(a[..]);
}


method TestsForMergeSort()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   POST Q1: b.Length == a.Length
  //   POST Q2: Sorted(b[..])
  //   POST Q3: multiset(a[..]) == multiset(b[..])
  {
    var a := new int[2] [5, 10];
    var b := MergeSort(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.MergeLoop(BigInteger[] b, BigInteger[] c, BigInteger[] d, BigInteger i0, BigInteger j0, BigInteger& i, BigInteger& j) in C:\cygwin64\tmp\DafnyTestGen_3tp4ndvw41f\runner.cs:line 6208
    // runtime error: at _module.__default.Merge(BigInteger[] b, BigInteger[] c, BigInteger[] d) in C:\cygwin64\tmp\DafnyTestGen_3tp4ndvw41f\runner.cs:line 6195
    // expect b.Length == a.Length;
    // expect Sorted(b[..]);
    // expect multiset(a[..]) == multiset(b[..]);
  }

  // Test case for combination {1}/V2:
  //   POST Q1: b.Length == a.Length
  //   POST Q2: Sorted(b[..])  // VACUOUS (forced true by other literals for this ins)
  //   POST Q3: multiset(a[..]) == multiset(b[..])
  {
    var a := new int[1] [10];
    var b := MergeSort(a);
    expect b.Length == a.Length;
    expect Sorted(b[..]);
    expect multiset(a[..]) == multiset(b[..]);
    expect b[..] == [10]; // observed from implementation
  }

  // Test case for combination {1}/O|a|=0:
  //   POST Q1: b.Length == a.Length
  //   POST Q2: Sorted(b[..])
  //   POST Q3: multiset(a[..]) == multiset(b[..])
  {
    var a := new int[0] [];
    var b := MergeSort(a);
    expect b.Length == a.Length;
    expect Sorted(b[..]);
    expect multiset(a[..]) == multiset(b[..]);
    expect b[..] == []; // observed from implementation
  }

}

method TestsForMerge()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  b != c && b != d && b.Length == c.Length + d.Length
  //   PRE:  Sorted(c[..]) && Sorted(d[..])
  //   POST Q1: Sorted(b[..])
  //   POST Q2: multiset(b[..]) == multiset(c[..]) + multiset(d[..])
  {
    var b := new int[2] [3, -10];
    var c := new int[1] [3];
    var d := new int[1] [3];
    Merge(b, c, d);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.MergeLoop(BigInteger[] b, BigInteger[] c, BigInteger[] d, BigInteger i0, BigInteger j0, BigInteger& i, BigInteger& j) in C:\cygwin64\tmp\DafnyTestGen_3tp4ndvw41f\runner.cs:line 6208
    // runtime error: at _module.__default.Merge(BigInteger[] b, BigInteger[] c, BigInteger[] d) in C:\cygwin64\tmp\DafnyTestGen_3tp4ndvw41f\runner.cs:line 6195
    // expect Sorted(b[..]);
    // expect multiset(b[..]) == multiset(c[..]) + multiset(d[..]);
  }

  // Test case for combination {1}/O|b|=0:
  //   PRE:  b != c && b != d && b.Length == c.Length + d.Length
  //   PRE:  Sorted(c[..]) && Sorted(d[..])
  //   POST Q1: Sorted(b[..])
  //   POST Q2: multiset(b[..]) == multiset(c[..]) + multiset(d[..])
  {
    var b := new int[0] [];
    var c := new int[0] [];
    var d := new int[0] [];
    Merge(b, c, d);
    expect Sorted(b[..]);
    expect multiset(b[..]) == multiset(c[..]) + multiset(d[..]);
  }

  // Test case for combination {1}/O|b|=1:
  //   PRE:  b != c && b != d && b.Length == c.Length + d.Length
  //   PRE:  Sorted(c[..]) && Sorted(d[..])
  //   POST Q1: Sorted(b[..])
  //   POST Q2: multiset(b[..]) == multiset(c[..]) + multiset(d[..])
  {
    var b := new int[1] [-10];
    var c := new int[1] [10];
    var d := new int[0] [];
    Merge(b, c, d);
    expect Sorted(b[..]);
    expect multiset(b[..]) == multiset(c[..]) + multiset(d[..]);
    expect b[..] == [10]; // observed from implementation
  }

  // Test case for combination {1}/O|c|>=2:
  //   PRE:  b != c && b != d && b.Length == c.Length + d.Length
  //   PRE:  Sorted(c[..]) && Sorted(d[..])
  //   POST Q1: Sorted(b[..])
  //   POST Q2: multiset(b[..]) == multiset(c[..]) + multiset(d[..])
  {
    var b := new int[3] [-2, -7, 5];
    var c := new int[2] [-8, 9];
    var d := new int[1] [-10];
    Merge(b, c, d);
    expect Sorted(b[..]);
    expect multiset(b[..]) == multiset(c[..]) + multiset(d[..]);
    expect b[..] == [-10, -8, 9]; // observed from implementation
  }

}

method Main()
{
  TestsForMergeSort();
  print "TestsForMergeSort: all non-failing tests passed!\n";
  TestsForMerge();
  print "TestsForMerge: all non-failing tests passed!\n";
}
