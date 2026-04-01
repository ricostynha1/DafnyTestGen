// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\BPTree-verif_tmp_tmpq1z6xm1d_Utils__11319_VER_limit.dfy
// Method: GetInsertIndex
// Generated: 2026-04-01 22:22:51

// BPTree-verif_tmp_tmpq1z6xm1d_Utils.dfy

function SetLessThan(numbers: set<int>, threshold: int): set<int>
  decreases numbers, threshold
{
  set i: int {:trigger i in numbers} | i in numbers && i < threshold
}

method OriginalMain()
{
  var t: seq<int> := [1, 2, 3];
  var s: set<int> := {1, 2, 3};
  assert |s| == 3;
  assert |s| == |t|;
  s := set x: int {:trigger x in t} | x in t;
  assert forall x: int {:trigger x in s} {:trigger x in t} :: x in t ==> x in s;
  assert forall x: int {:trigger x in t} {:trigger x in s} :: x in s ==> x in t;
  assert forall x: int {:trigger x in t} {:trigger x in s} :: x in s <==> x in t;
  assert forall i: int, j: int {:trigger t[j], t[i]} :: 0 <= i < |t| && 0 <= j < |t| && i != j ==> t[i] != t[j];
  assert |t| == 3;
  set_memebrship_implies_cardinality(s, set x: int {:trigger x in t} | x in t);
  var s2: set<int> := set x: int {:trigger x in t} | x in t;
  assert |s| == |s2|;
  s2 := {1, 2, 3};
  set_memebrship_implies_cardinality(s, s2);
  assert |s| == |s2|;
}

lemma set_memebrship_implies_cardinality_helper<A>(s: set<A>, t: set<A>, s_size: int)
  requires s_size >= 0 && s_size == |s|
  requires forall x: A {:trigger x in t} {:trigger x in s} :: x in s <==> x in t
  ensures |s| == |t|
  decreases s_size
{
  if s_size == 0 {
  } else {
    var s_hd;
    s_hd :| s_hd in s;
    set_memebrship_implies_cardinality_helper(s - {s_hd}, t - {s_hd}, s_size - 1);
  }
}

lemma set_memebrship_implies_cardinality<A>(s: set<A>, t: set<A>)
  requires forall x: A {:trigger x in t} {:trigger x in s} :: x in s <==> x in t
  ensures |s| == |t|
  decreases s, t
{
  set_memebrship_implies_cardinality_helper(s, t, |s|);
}

function seqSet(nums: seq<int>, index: nat): set<int>
  decreases nums, index
{
  set x: int {:trigger nums[x]} | 0 <= x < index < |nums| :: nums[x]
}

lemma containsDuplicateI(nums: seq<int>) returns (containsDuplicate: bool)
  ensures containsDuplicate ==> exists i: int, j: int {:trigger nums[j], nums[i]} :: 0 <= i < j < |nums| && nums[i] == nums[j]
  decreases nums
{
  var windowGhost: set<int> := {};
  var windowSet: set<int> := {};
  for i: int := 0 to |nums|
    invariant 0 <= i <= |nums|
    invariant forall j: int {:trigger nums[j]} :: 0 <= j < i < |nums| ==> nums[j] in windowSet
    invariant forall x: int {:trigger x in nums[0 .. i]} {:trigger x in windowSet} :: x in windowSet ==> x in nums[0 .. i]
    invariant seqSet(nums, i) <= windowSet
  {
    windowGhost := windowSet;
    if nums[i] in windowSet {
      return true;
    }
    windowSet := windowSet + {nums[i]};
  }
  return false;
}

lemma set_memebrship_implies_equality_helper<A>(s: set<A>, t: set<A>, s_size: int)
  requires s_size >= 0 && s_size == |s|
  requires forall x: A {:trigger x in t} {:trigger x in s} :: x in s <==> x in t
  ensures s == t
  decreases s_size
{
  if s_size == 0 {
  } else {
    var s_hd;
    s_hd :| s_hd in s;
    set_memebrship_implies_equality_helper(s - {s_hd}, t - {s_hd}, s_size - 1);
  }
}

lemma set_memebrship_implies_equality<A>(s: set<A>, t: set<A>)
  requires forall x: A {:trigger x in t} {:trigger x in s} :: x in s <==> x in t
  ensures s == t
  decreases s, t
{
  set_memebrship_implies_equality_helper(s, t, |s|);
}

lemma set_seq_equality(s: set<int>, t: seq<int>)
  requires distinct(t)
  requires forall x: int {:trigger x in s} {:trigger x in t} :: x in t <==> x in s
  decreases s, t
{
  var s2: set<int> := set x: int {:trigger x in t} | x in t;
  set_memebrship_implies_equality_helper(s, s2, |s|);
  assert |s2| == |s|;
}

predicate SortedSeq(a: seq<int>)
  decreases a
{
  forall i: int, j: int {:trigger a[j], a[i]} :: 
    0 <= i < j < |a| ==>
      a[i] < a[j]
}

method GetInsertIndex(a: array<int>, limit: int, x: int)
    returns (idx: int)
  requires x !in a[..]
  requires 0 <= limit <= a.Length
  requires SortedSeq(a[..limit])
  ensures 0 <= idx <= limit
  ensures SortedSeq(a[..limit])
  ensures idx > 0 ==> a[idx - 1] < x
  ensures idx < limit ==> x < a[idx]
  decreases a, limit, x
{
  idx := limit;
  for i: int := 0 to limit
    invariant i > 0 ==> x > a[i - 1]
  {
    if x < a[i] {
      idx := i;
      break;
    }
  }
}

predicate sorted(a: seq<int>)
  decreases a
{
  forall i: int, j: int {:trigger a[j], a[i]} :: 
    0 <= i < j < |a| ==>
      a[i] < a[j]
}

predicate distinct(a: seq<int>)
  decreases a
{
  forall i: int, j: int {:trigger a[j], a[i]} :: 
    0 <= i < |a| &&
    0 <= j < |a| &&
    i != j ==>
      a[i] != a[j]
}

predicate sorted_eq(a: seq<int>)
  decreases a
{
  forall i: int, j: int {:trigger a[j], a[i]} :: 
    0 <= i < j < |a| ==>
      a[i] <= a[j]
}

predicate lessThan(a: seq<int>, key: int)
  decreases a, key
{
  forall i: int {:trigger a[i]} :: 
    0 <= i < |a| ==>
      a[i] < key
}

predicate greaterThan(a: seq<int>, key: int)
  decreases a, key
{
  forall i: int {:trigger a[i]} :: 
    0 <= i < |a| ==>
      a[i] > key
}

predicate greaterEqualThan(a: seq<int>, key: int)
  decreases a, key
{
  forall i: int {:trigger a[i]} :: 
    0 <= i < |a| ==>
      a[i] >= key
}

lemma /*{:_inductionTrigger a + b}*/ /*{:_induction a, b}*/ DistributiveLemma(a: seq<bool>, b: seq<bool>)
  ensures count(a + b) == count(a) + count(b)
  decreases a, b
{
  if a == [] {
    assert a + b == b;
  } else {
    DistributiveLemma(a[1..], b);
    assert a + b == [a[0]] + (a[1..] + b);
  }
}

function count(a: seq<bool>): nat
  decreases a
{
  if |a| == 0 then
    0
  else
    (if a[0] then 1 else 0) + count(a[1..])
}

lemma DistributiveIn(a: seq<int>, b: seq<int>, k: int, key: int)
  requires |a| + 1 == |b|
  requires 0 <= k <= |a|
  requires b == a[..k] + [key] + a[k..]
  ensures forall i: int {:trigger a[i]} :: 0 <= i < |a| ==> a[i] in b
  decreases a, b, k, key
{
  assert forall j: int {:trigger a[j]} :: 0 <= j < k ==> a[j] in b;
  assert forall j: int {:trigger a[j]} :: k <= j < |a| ==> a[j] in b;
  assert (forall j: int {:trigger a[j]} :: 0 <= j < k ==> a[j] in b) && (forall j: int {:trigger a[j]} :: k <= j < |a| ==> a[j] in b) ==> forall j: int {:trigger a[j]} :: 0 <= j < |a| ==> a[j] in b;
  assert forall j: int {:trigger a[j]} :: 0 <= j < |a| ==> a[j] in b;
}

lemma DistributiveGreater(a: seq<int>, b: seq<int>, k: int, key: int)
  requires |a| + 1 == |b|
  requires 0 <= k <= |a|
  requires b == a[..k] + [key] + a[k..]
  requires forall j: int {:trigger a[j]} :: 0 <= j < |a| ==> a[j] > 0
  requires key > 0
  ensures forall i: int {:trigger b[i]} :: 0 <= i < |b| ==> b[i] > 0
  decreases a, b, k, key
{
  assert forall j: int {:trigger b[j]} :: 0 <= j < |b| ==> b[j] > 0;
}

method InsertIntoSorted(a: array<int>, limit: int, key: int)
    returns (b: array<int>)
  requires key > 0
  requires key !in a[..]
  requires 0 <= limit < a.Length
  requires forall i: int {:trigger a[i]} :: 0 <= i < limit ==> a[i] > 0
  requires forall i: int {:trigger a[i]} :: limit <= i < a.Length ==> a[i] == 0
  requires sorted(a[..limit])
  ensures b.Length == a.Length
  ensures sorted(b[..limit + 1])
  ensures forall i: int {:trigger b[i]} :: limit + 1 <= i < b.Length ==> b[i] == 0
  ensures forall i: int {:trigger a[i]} :: 0 <= i < limit ==> a[i] in b[..]
  ensures forall i: int {:trigger b[i]} :: 0 <= i < limit + 1 ==> b[i] > 0
  decreases a, limit, key
{
  b := new int[a.Length];
  var k := 0;
  b[0] := key;
  var a' := a[..];
  var i := 0;
  while i < limit
    invariant 0 <= k <= i <= limit
    invariant b.Length == a.Length
    invariant a[..] == a'
    invariant lessThan(a[..i], key) ==> i == k
    invariant lessThan(a[..k], key)
    invariant b[..k] == a[..k]
    invariant b[k] == key
    invariant k < i ==> b[k + 1 .. i + 1] == a[k .. i]
    invariant k < i ==> greaterThan(b[k + 1 .. i + 1], key)
    invariant 0 <= k < b.Length && b[k] == key
    decreases limit - i
    modifies b
  {
    if a[limit] < key {
      b[i] := a[i];
      b[i + 1] := key;
      k := i + 1;
    } else if a[i] >= key {
      b[i + 1] := a[i];
    }
    i := i + 1;
  }
  assert b[..limit + 1] == a[..k] + [key] + a[k .. limit];
  assert sorted(b[..limit + 1]);
  DistributiveIn(a[..limit], b[..limit + 1], k, key);
  assert forall i: int {:trigger a[i]} :: 0 <= i < limit ==> a[i] in b[..limit + 1];
  DistributiveGreater(a[..limit], b[..limit + 1], k, key);
  var b' := b[..];
  i := limit + 1;
  while i < b.Length
    invariant limit + 1 <= i <= b.Length
    invariant forall j: int {:trigger b[j]} :: limit + 1 <= j < i ==> b[j] == 0
    invariant b[..limit + 1] == b'[..limit + 1]
    invariant sorted(b[..limit + 1])
    decreases b.Length - i
  {
    b[i] := 0;
    i := i + 1;
  }
  assert forall i: int {:trigger b[i]} :: limit + 1 <= i < b.Length ==> b[i] == 0;
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  x !in a[..]
  //   PRE:  0 <= limit <= a.Length
  //   PRE:  SortedSeq(a[..limit])
  //   POST: 0 <= idx <= limit
  //   POST: SortedSeq(a[..limit])
  //   POST: !(idx > 0)
  //   POST: !(idx < limit)
  {
    var a := new int[0] [];
    var limit := 0;
    var x := 0;
    expect x !in a[..]; // PRE-CHECK
    expect 0 <= limit <= a.Length; // PRE-CHECK
    expect SortedSeq(a[..limit]); // PRE-CHECK
    var idx := GetInsertIndex(a, limit, x);
    expect idx == 0;
  }

  // Test case for combination {2}:
  //   PRE:  x !in a[..]
  //   PRE:  0 <= limit <= a.Length
  //   PRE:  SortedSeq(a[..limit])
  //   POST: 0 <= idx <= limit
  //   POST: SortedSeq(a[..limit])
  //   POST: !(idx > 0)
  //   POST: x < a[idx]
  {
    var a := new int[1] [7720];
    var limit := 1;
    var x := 7719;
    expect x !in a[..]; // PRE-CHECK
    expect 0 <= limit <= a.Length; // PRE-CHECK
    expect SortedSeq(a[..limit]); // PRE-CHECK
    var idx := GetInsertIndex(a, limit, x);
    expect idx == 0;
  }

  // Test case for combination {3}:
  //   PRE:  x !in a[..]
  //   PRE:  0 <= limit <= a.Length
  //   PRE:  SortedSeq(a[..limit])
  //   POST: 0 <= idx <= limit
  //   POST: SortedSeq(a[..limit])
  //   POST: a[idx - 1] < x
  //   POST: !(idx < limit)
  {
    var a := new int[1] [-1];
    var limit := 1;
    var x := 0;
    expect x !in a[..]; // PRE-CHECK
    expect 0 <= limit <= a.Length; // PRE-CHECK
    expect SortedSeq(a[..limit]); // PRE-CHECK
    var idx := GetInsertIndex(a, limit, x);
    expect idx == 1;
  }

  // Test case for combination {4}:
  //   PRE:  x !in a[..]
  //   PRE:  0 <= limit <= a.Length
  //   PRE:  SortedSeq(a[..limit])
  //   POST: 0 <= idx <= limit
  //   POST: SortedSeq(a[..limit])
  //   POST: a[idx - 1] < x
  //   POST: x < a[idx]
  {
    var a := new int[2] [7717, 7719];
    var limit := 2;
    var x := 7718;
    expect x !in a[..]; // PRE-CHECK
    expect 0 <= limit <= a.Length; // PRE-CHECK
    expect SortedSeq(a[..limit]); // PRE-CHECK
    var idx := GetInsertIndex(a, limit, x);
    expect idx == 1;
  }

  // Test case for combination {1,2}:
  //   PRE:  x !in a[..]
  //   PRE:  0 <= limit <= a.Length
  //   PRE:  SortedSeq(a[..limit])
  //   POST: 0 <= idx <= limit
  //   POST: SortedSeq(a[..limit])
  //   POST: !(idx > 0)
  //   POST: !(idx < limit)
  //   POST: x < a[idx]
  {
    var a := new int[1] [7720];
    var limit := 0;
    var x := 7719;
    expect x !in a[..]; // PRE-CHECK
    expect 0 <= limit <= a.Length; // PRE-CHECK
    expect SortedSeq(a[..limit]); // PRE-CHECK
    var idx := GetInsertIndex(a, limit, x);
    expect idx == 0;
  }

  // Test case for combination {3,4}:
  //   PRE:  x !in a[..]
  //   PRE:  0 <= limit <= a.Length
  //   PRE:  SortedSeq(a[..limit])
  //   POST: 0 <= idx <= limit
  //   POST: SortedSeq(a[..limit])
  //   POST: a[idx - 1] < x
  //   POST: !(idx < limit)
  //   POST: x < a[idx]
  {
    var a := new int[2] [7717, 7719];
    var limit := 1;
    var x := 7718;
    expect x !in a[..]; // PRE-CHECK
    expect 0 <= limit <= a.Length; // PRE-CHECK
    expect SortedSeq(a[..limit]); // PRE-CHECK
    var idx := GetInsertIndex(a, limit, x);
    expect idx == 1;
  }

  // Test case for combination {1}:
  //   PRE:  key > 0
  //   PRE:  key !in a[..]
  //   PRE:  0 <= limit < a.Length
  //   PRE:  forall i: int {:trigger a[i]} :: 0 <= i < limit ==> a[i] > 0
  //   PRE:  forall i: int {:trigger a[i]} :: limit <= i < a.Length ==> a[i] == 0
  //   PRE:  sorted(a[..limit])
  //   POST: b.Length == a.Length
  //   POST: sorted(b[..limit + 1])
  //   POST: forall i: int {:trigger b[i]} :: limit + 1 <= i < b.Length ==> b[i] == 0
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < limit ==> a[i] in b[..]
  //   POST: forall i: int {:trigger b[i]} :: 0 <= i < limit + 1 ==> b[i] > 0
  {
    var a := new int[1] [0];
    var limit := 0;
    var key := 1;
    expect key > 0; // PRE-CHECK
    expect key !in a[..]; // PRE-CHECK
    expect 0 <= limit < a.Length; // PRE-CHECK
    expect forall i: int {:trigger a[i]} :: 0 <= i < limit ==> a[i] > 0; // PRE-CHECK
    expect forall i: int {:trigger a[i]} :: limit <= i < a.Length ==> a[i] == 0; // PRE-CHECK
    expect sorted(a[..limit]); // PRE-CHECK
    var b := InsertIntoSorted(a, limit, key);
    expect b.Length == a.Length;
    expect sorted(b[..limit + 1]);
    expect forall i: int :: limit + 1 <= i < b.Length ==> b[i] == 0;
    expect forall i: int :: 0 <= i < limit ==> a[i] in b[..];
    expect forall i: int :: 0 <= i < limit + 1 ==> b[i] > 0;
  }

  // Test case for combination {1}/Ba=1,limit=0,key=2:
  //   PRE:  key > 0
  //   PRE:  key !in a[..]
  //   PRE:  0 <= limit < a.Length
  //   PRE:  forall i: int {:trigger a[i]} :: 0 <= i < limit ==> a[i] > 0
  //   PRE:  forall i: int {:trigger a[i]} :: limit <= i < a.Length ==> a[i] == 0
  //   PRE:  sorted(a[..limit])
  //   POST: b.Length == a.Length
  //   POST: sorted(b[..limit + 1])
  //   POST: forall i: int {:trigger b[i]} :: limit + 1 <= i < b.Length ==> b[i] == 0
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < limit ==> a[i] in b[..]
  //   POST: forall i: int {:trigger b[i]} :: 0 <= i < limit + 1 ==> b[i] > 0
  {
    var a := new int[1] [0];
    var limit := 0;
    var key := 2;
    expect key > 0; // PRE-CHECK
    expect key !in a[..]; // PRE-CHECK
    expect 0 <= limit < a.Length; // PRE-CHECK
    expect forall i: int {:trigger a[i]} :: 0 <= i < limit ==> a[i] > 0; // PRE-CHECK
    expect forall i: int {:trigger a[i]} :: limit <= i < a.Length ==> a[i] == 0; // PRE-CHECK
    expect sorted(a[..limit]); // PRE-CHECK
    var b := InsertIntoSorted(a, limit, key);
    expect b.Length == a.Length;
    expect sorted(b[..limit + 1]);
    expect forall i: int :: limit + 1 <= i < b.Length ==> b[i] == 0;
    expect forall i: int :: 0 <= i < limit ==> a[i] in b[..];
    expect forall i: int :: 0 <= i < limit + 1 ==> b[i] > 0;
  }

  // Test case for combination {1}/Ba=2,limit=1,key=2:
  //   PRE:  key > 0
  //   PRE:  key !in a[..]
  //   PRE:  0 <= limit < a.Length
  //   PRE:  forall i: int {:trigger a[i]} :: 0 <= i < limit ==> a[i] > 0
  //   PRE:  forall i: int {:trigger a[i]} :: limit <= i < a.Length ==> a[i] == 0
  //   PRE:  sorted(a[..limit])
  //   POST: b.Length == a.Length
  //   POST: sorted(b[..limit + 1])
  //   POST: forall i: int {:trigger b[i]} :: limit + 1 <= i < b.Length ==> b[i] == 0
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < limit ==> a[i] in b[..]
  //   POST: forall i: int {:trigger b[i]} :: 0 <= i < limit + 1 ==> b[i] > 0
  {
    var a := new int[2] [1, 0];
    var limit := 1;
    var key := 2;
    expect key > 0; // PRE-CHECK
    expect key !in a[..]; // PRE-CHECK
    expect 0 <= limit < a.Length; // PRE-CHECK
    expect forall i: int {:trigger a[i]} :: 0 <= i < limit ==> a[i] > 0; // PRE-CHECK
    expect forall i: int {:trigger a[i]} :: limit <= i < a.Length ==> a[i] == 0; // PRE-CHECK
    expect sorted(a[..limit]); // PRE-CHECK
    var b := InsertIntoSorted(a, limit, key);
    expect b.Length == a.Length;
    expect sorted(b[..limit + 1]);
    expect forall i: int :: limit + 1 <= i < b.Length ==> b[i] == 0;
    expect forall i: int :: 0 <= i < limit ==> a[i] in b[..];
    expect forall i: int :: 0 <= i < limit + 1 ==> b[i] > 0;
  }

}

method Failing()
{
  // Test case for combination {1}/Ba=2,limit=1,key=1:
  //   PRE:  key > 0
  //   PRE:  key !in a[..]
  //   PRE:  0 <= limit < a.Length
  //   PRE:  forall i: int {:trigger a[i]} :: 0 <= i < limit ==> a[i] > 0
  //   PRE:  forall i: int {:trigger a[i]} :: limit <= i < a.Length ==> a[i] == 0
  //   PRE:  sorted(a[..limit])
  //   POST: b.Length == a.Length
  //   POST: sorted(b[..limit + 1])
  //   POST: forall i: int {:trigger b[i]} :: limit + 1 <= i < b.Length ==> b[i] == 0
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < limit ==> a[i] in b[..]
  //   POST: forall i: int {:trigger b[i]} :: 0 <= i < limit + 1 ==> b[i] > 0
  {
    var a := new int[2] [2, 0];
    var limit := 1;
    var key := 1;
    // expect key > 0; // PRE-CHECK
    // expect key !in a[..]; // PRE-CHECK
    // expect 0 <= limit < a.Length; // PRE-CHECK
    // expect forall i: int {:trigger a[i]} :: 0 <= i < limit ==> a[i] > 0; // PRE-CHECK
    // expect forall i: int {:trigger a[i]} :: limit <= i < a.Length ==> a[i] == 0; // PRE-CHECK
    // expect sorted(a[..limit]); // PRE-CHECK
    var b := InsertIntoSorted(a, limit, key);
    // expect b.Length == a.Length;
    // expect sorted(b[..limit + 1]);
    // expect forall i: int :: limit + 1 <= i < b.Length ==> b[i] == 0;
    // expect forall i: int :: 0 <= i < limit ==> a[i] in b[..];
    // expect forall i: int :: 0 <= i < limit + 1 ==> b[i] > 0;
  }

}

method Main()
{
  Passing();
  Failing();
}
