// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny_examples_tmp_tmp8qotd4ez_test_shuffle__1670-1680_SDL.dfy
// Method: random
// Generated: 2026-04-20 23:31:25

// dafny_examples_tmp_tmp8qotd4ez_test_shuffle.dfy

method random(a: int, b: int) returns (r: int)
  ensures a <= b ==> a <= r <= b
  decreases a, b
  {
    if a <= b {
      var i :| a <= i <= b;
      r := i;
    }
    else {
        r := a; // or any value, since the precondition is not satisfied
      }
  }

lemma eqMultiset_t<T>(t: T, s1: seq<T>, s2: seq<T>)
  requires multiset(s1) == multiset(s2)
  ensures t in s1 <==> t in s2
  decreases s1, s2
{
  calc <==> {
    t in s1;
    t in multiset(s1);
  }
}

lemma eqMultiset<T>(s1: seq<T>, s2: seq<T>)
  requires multiset(s1) == multiset(s2)
  ensures forall t: T {:trigger t in s2} {:trigger t in s1} :: t in s1 <==> t in s2
  decreases s1, s2
{
  forall t: T | true {
    eqMultiset_t(t, s1, s2);
  }
}

method swap<T>(a: array<T>, i: int, j: int)
  requires 0 <= i < a.Length && 0 <= j < a.Length
  modifies a
  ensures a[i] == old(a[j])
  ensures a[j] == old(a[i])
  ensures forall m: int {:trigger old(a[m])} {:trigger a[m]} :: 0 <= m < a.Length && m != i && m != j ==> a[m] == old(a[m])
  ensures multiset(a[..]) == old(multiset(a[..]))
  decreases a, i, j
{
  var t := a[i];
  a[i] := a[j];
  a[j] := t;
}

method getAllShuffledDataEntries<T(0)>(m_dataEntries: array<T>) returns (result: array<T>)
  ensures result.Length == m_dataEntries.Length
  ensures multiset(result[..]) == multiset(m_dataEntries[..])
  decreases m_dataEntries
{
  result := new T[m_dataEntries.Length];
  forall i: int | 0 <= i < m_dataEntries.Length {
    result[i] := m_dataEntries[i];
  }
  assert result[..] == m_dataEntries[..];
  var k := result.Length - 1;
  while k >= 0
    invariant multiset(result[..]) == multiset(m_dataEntries[..])
    decreases k - 0
  {
    var i := random(0, k);
    assert i >= 0 && i <= k;
    if i != k {
      swap(result, i, k);
    }
  }
}

function set_of_seq<T>(s: seq<T>): set<T>
  decreases s
{
  set x: T {:trigger x in s} | x in s :: x
}

lemma {:axiom} in_set_of_seq<T>(x: T, s: seq<T>)
  ensures x in s <==> x in set_of_seq(s)
  decreases s

lemma {:axiom} subset_set_of_seq<T>(s1: seq<T>, s2: seq<T>)
  requires set_of_seq(s1) <= set_of_seq(s2)
  ensures forall x: T {:trigger x in s2} {:trigger x in s1} :: x in s1 ==> x in s2
  decreases s1, s2

method getRandomDataEntry<T(==)>(m_workList: array<T>, avoidSet: seq<T>) returns (e: T)
  requires m_workList.Length > 0
  decreases m_workList, avoidSet
{
  var k := m_workList.Length - 1;
  while k >= 0
    decreases k - 0
  {
    var i := random(0, k);
    assert i >= 0 && i <= k;
    e := m_workList[i];
    if e !in avoidSet {
      return e;
    }
    k := k - 1;
  }
  return m_workList[0];
}


method TestsForrandom()
{
  // Test case for combination {2}/Rel:
  //   POST: a <= b
  //   POST: a <= r
  //   POST: r <= b
  //   ENSURES: a <= b ==> a <= r <= b
  {
    var a := -10;
    var b := -10;
    var r := random(a, b);
    expect r == -10;
  }

  // Test case for combination {1}:
  //   POST: !(a <= b)
  //   ENSURES: a <= b ==> a <= r <= b
  {
    var a := -9;
    var b := -10;
    var r := random(a, b);
  }

  // Test case for combination {2}/Ba=b-1:
  //   POST: a <= b
  //   POST: a <= r
  //   POST: r <= b
  //   ENSURES: a <= b ==> a <= r <= b
  {
    var a := -10;
    var b := -9;
    var r := random(a, b);
    expect r == -9 || r == -10;
  }

  // Test case for combination {2}/Br=b-1:
  //   POST: a <= b
  //   POST: a <= r
  //   POST: r <= b
  //   ENSURES: a <= b ==> a <= r <= b
  {
    var a := -10;
    var b := -8;
    var r := random(a, b);
    expect r == -9 || r == -10 || r == -8;
  }

}

method TestsForswap()
{
  // Test case for combination {1}/Rel:
  //   PRE:  0 <= i < a.Length && 0 <= j < a.Length
  //   POST: a[i] == old(a[j])
  //   POST: a[j] == old(a[i])
  //   POST: forall m: int {:trigger old(a[m])} {:trigger a[m]} :: 0 <= m < a.Length && m != i && m != j ==> a[m] == old(a[m])
  //   POST: multiset(a[..]) == old(multiset(a[..]))
  //   ENSURES: a[i] == old(a[j])
  //   ENSURES: a[j] == old(a[i])
  //   ENSURES: forall m: int {:trigger old(a[m])} {:trigger a[m]} :: 0 <= m < a.Length && m != i && m != j ==> a[m] == old(a[m])
  //   ENSURES: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[4] [55, 56, 10, 9];
    var i := 2;
    var j := 3;
    var old_a_j := a[j];
    var old_a_i := a[i];
    var old_a := a[..];
    var old_multiset_a := multiset(a[..]);
    swap<int>(a, i, j);
    expect a[i] == old_a_j;
    expect a[j] == old_a_i;
    expect forall m: int  :: 0 <= m < a.Length && m != i && m != j ==> a[m] == old_a[m];
    expect multiset(a[..]) == old_multiset_a;
    expect old_multiset_a == multiset{9, 10, 55, 56}; // observed from implementation
  }

  // Test case for combination {1}/Bi=0:
  //   PRE:  0 <= i < a.Length && 0 <= j < a.Length
  //   POST: a[i] == old(a[j])
  //   POST: a[j] == old(a[i])
  //   POST: forall m: int {:trigger old(a[m])} {:trigger a[m]} :: 0 <= m < a.Length && m != i && m != j ==> a[m] == old(a[m])
  //   POST: multiset(a[..]) == old(multiset(a[..]))
  //   ENSURES: a[i] == old(a[j])
  //   ENSURES: a[j] == old(a[i])
  //   ENSURES: forall m: int {:trigger old(a[m])} {:trigger a[m]} :: 0 <= m < a.Length && m != i && m != j ==> a[m] == old(a[m])
  //   ENSURES: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[3] [10, 24, 9];
    var i := 0;
    var j := 2;
    var old_a_j := a[j];
    var old_a_i := a[i];
    var old_a := a[..];
    var old_multiset_a := multiset(a[..]);
    swap<int>(a, i, j);
    expect a[i] == old_a_j;
    expect a[j] == old_a_i;
    expect forall m: int  :: 0 <= m < a.Length && m != i && m != j ==> a[m] == old_a[m];
    expect multiset(a[..]) == old_multiset_a;
    expect old_multiset_a == multiset{9, 10, 24}; // observed from implementation
  }

  // Test case for combination {1}/Bi=1:
  //   PRE:  0 <= i < a.Length && 0 <= j < a.Length
  //   POST: a[i] == old(a[j])
  //   POST: a[j] == old(a[i])
  //   POST: forall m: int {:trigger old(a[m])} {:trigger a[m]} :: 0 <= m < a.Length && m != i && m != j ==> a[m] == old(a[m])
  //   POST: multiset(a[..]) == old(multiset(a[..]))
  //   ENSURES: a[i] == old(a[j])
  //   ENSURES: a[j] == old(a[i])
  //   ENSURES: forall m: int {:trigger old(a[m])} {:trigger a[m]} :: 0 <= m < a.Length && m != i && m != j ==> a[m] == old(a[m])
  //   ENSURES: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[3] [19, 20, 20];
    var i := 1;
    var j := 2;
    var old_a_j := a[j];
    var old_a_i := a[i];
    var old_a := a[..];
    var old_multiset_a := multiset(a[..]);
    swap<int>(a, i, j);
    expect a[i] == old_a_j;
    expect a[j] == old_a_i;
    expect forall m: int  :: 0 <= m < a.Length && m != i && m != j ==> a[m] == old_a[m];
    expect multiset(a[..]) == old_multiset_a;
    expect old_multiset_a == multiset{19, 20, 20}; // observed from implementation
  }

  // Test case for combination {1}/Bi=a_pre_len-1:
  //   PRE:  0 <= i < a.Length && 0 <= j < a.Length
  //   POST: a[i] == old(a[j])
  //   POST: a[j] == old(a[i])
  //   POST: forall m: int {:trigger old(a[m])} {:trigger a[m]} :: 0 <= m < a.Length && m != i && m != j ==> a[m] == old(a[m])
  //   POST: multiset(a[..]) == old(multiset(a[..]))
  //   ENSURES: a[i] == old(a[j])
  //   ENSURES: a[j] == old(a[i])
  //   ENSURES: forall m: int {:trigger old(a[m])} {:trigger a[m]} :: 0 <= m < a.Length && m != i && m != j ==> a[m] == old(a[m])
  //   ENSURES: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[3] [27, 28, 12];
    var i := 2;
    var j := 2;
    var old_a_j := a[j];
    var old_a_i := a[i];
    var old_a := a[..];
    var old_multiset_a := multiset(a[..]);
    swap<int>(a, i, j);
    expect a[i] == old_a_j;
    expect a[j] == old_a_i;
    expect forall m: int  :: 0 <= m < a.Length && m != i && m != j ==> a[m] == old_a[m];
    expect multiset(a[..]) == old_multiset_a;
    expect old_multiset_a == multiset{12, 27, 28}; // observed from implementation
  }

}

method TestsForgetAllShuffledDataEntries()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   POST: result.Length == m_dataEntries.Length
  //   POST: multiset(result[..]) == multiset(m_dataEntries[..])
  //   ENSURES: result.Length == m_dataEntries.Length
  //   ENSURES: multiset(result[..]) == multiset(m_dataEntries[..])
  {
    var m_dataEntries := new int[1] [9];
    var result := getAllShuffledDataEntries<int>(m_dataEntries);
    // expect result.Length == m_dataEntries.Length;
    // expect multiset(result[..]) == multiset(m_dataEntries[..]);
  }

  // Test case for combination {1}/O|m_dataEntries|=0:
  //   POST: result.Length == m_dataEntries.Length
  //   POST: multiset(result[..]) == multiset(m_dataEntries[..])
  //   ENSURES: result.Length == m_dataEntries.Length
  //   ENSURES: multiset(result[..]) == multiset(m_dataEntries[..])
  {
    var m_dataEntries := new int[0] [];
    var result := getAllShuffledDataEntries<int>(m_dataEntries);
    expect result[..] == [];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|m_dataEntries|>=2:
  //   POST: result.Length == m_dataEntries.Length
  //   POST: multiset(result[..]) == multiset(m_dataEntries[..])
  //   ENSURES: result.Length == m_dataEntries.Length
  //   ENSURES: multiset(result[..]) == multiset(m_dataEntries[..])
  {
    var m_dataEntries := new int[2] [5, 6];
    var result := getAllShuffledDataEntries<int>(m_dataEntries);
    // expect result.Length == m_dataEntries.Length;
    // expect multiset(result[..]) == multiset(m_dataEntries[..]);
  }

}

method Main()
{
  TestsForrandom();
  print "TestsForrandom: all non-failing tests passed!\n";
  TestsForswap();
  print "TestsForswap: all non-failing tests passed!\n";
  TestsForgetAllShuffledDataEntries();
  print "TestsForgetAllShuffledDataEntries: all non-failing tests passed!\n";
}
