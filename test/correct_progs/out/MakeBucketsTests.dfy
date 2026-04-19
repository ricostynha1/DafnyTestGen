// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\MakeBuckets.dfy
// Method: MakeBuckets
// Generated: 2026-04-19 21:53:19

// Given a non-empty array 'a' of natural numbers, generates a new array ‘b’ 
// (buckets) such that b[k] gives the number of occurrences of 'k' in 'a',
// for 0 <= k <= m, where 'm' denotes the maximum value in 'a'.
method MakeBuckets(a: array<nat>) returns(b: array<nat>)
  requires a.Length > 0
  ensures fresh(b) 
  ensures b.Length > 0 && b.Length == MaxSeq(a[..]) + 1
  ensures forall k :: 0 <= k < b.Length ==> b[k] == count(k, a[..])
{
   var max := a[0];
   for i := 1 to a.Length
     invariant max == MaxSeq(a[..i])
   {
      if a[i] > max {
         max := a[i];
      }
   } 

   b := new nat[1 + max];
   forall k | 0 <= k <= max {
     b[k] := 0;
   }
   assert a[..] == (a[..]); // proof helper
   for i := 0 to a.Length
    invariant forall k :: 0 <= k < b.Length ==> b[k] == count(k, a[..i])
   {
      b[a[i]] := b[a[i]] + 1; 
      assert a[..i+1] == a[..i] + [a[i]]; // proof helper
   } 
   assert a[..] == a[..a.Length]; // proof helper
}

// Gets the maximum value in a non-empty sequence 's' of natural numbers.
function MaxSeq(s: seq<nat>) : (result: nat) 
  requires |s| > 0
  ensures result in s && forall k :: 0 <= k < |s| ==> result >= s[k]
{
   if |s| == 1 then s[0] else if s[0] > MaxSeq(s[1..]) then s[0] else MaxSeq(s[1..])
}

// Counts the number of occurrences of 'x' in a sequence 's' of natural numbers.
function count(x: nat, s: seq<nat>) : nat {
   if |s| == 0 then 0 
   else if s[|s|-1] == x then 1 + count(x, s[..|s|-1]) 
   else count(x, s[..|s|-1])
   
}



method TestsForMakeBuckets()
{
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST: b.Length > 0
  //   POST: b.Length == MaxSeq(a[..]) + 1
  //   POST: forall k: int :: 0 <= k < b.Length ==> b[k] == count(k, a[..])
  //   ENSURES: b.Length > 0 && b.Length == MaxSeq(a[..]) + 1
  //   ENSURES: forall k: int :: 0 <= k < b.Length ==> b[k] == count(k, a[..])
  {
    var a := new nat[1] [20];
    var b := MakeBuckets(a);
    expect b.Length > 0;
    expect b.Length == MaxSeq(a[..]) + 1;
    expect forall k: int :: 0 <= k < b.Length ==> b[k] == count(k, a[..]);
    expect b == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]; // observed from implementation
  }

  // Test case for combination {1}/Q|a|>=2:
  //   PRE:  a.Length > 0
  //   POST: b.Length > 0
  //   POST: b.Length == MaxSeq(a[..]) + 1
  //   POST: forall k: int :: 0 <= k < b.Length ==> b[k] == count(k, a[..])
  //   ENSURES: b.Length > 0 && b.Length == MaxSeq(a[..]) + 1
  //   ENSURES: forall k: int :: 0 <= k < b.Length ==> b[k] == count(k, a[..])
  {
    var a := new nat[2] [20, 15];
    var b := MakeBuckets(a);
    expect b.Length > 0;
    expect b.Length == MaxSeq(a[..]) + 1;
    expect forall k: int :: 0 <= k < b.Length ==> b[k] == count(k, a[..]);
    expect b == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]; // observed from implementation
  }

  // Test case for combination {1}/Rel:
  //   PRE:  a.Length > 0
  //   POST: b.Length > 0
  //   POST: b.Length == MaxSeq(a[..]) + 1
  //   POST: forall k: int :: 0 <= k < b.Length ==> b[k] == count(k, a[..])
  //   ENSURES: b.Length > 0 && b.Length == MaxSeq(a[..]) + 1
  //   ENSURES: forall k: int :: 0 <= k < b.Length ==> b[k] == count(k, a[..])
  {
    var a := new nat[1] [2];
    var b := MakeBuckets(a);
    expect b.Length > 0;
    expect b.Length == MaxSeq(a[..]) + 1;
    expect forall k: int :: 0 <= k < b.Length ==> b[k] == count(k, a[..]);
    expect b == [0, 0, 1]; // observed from implementation
  }

  // Test case for combination {1}/R3:
  //   PRE:  a.Length > 0
  //   POST: b.Length > 0
  //   POST: b.Length == MaxSeq(a[..]) + 1
  //   POST: forall k: int :: 0 <= k < b.Length ==> b[k] == count(k, a[..])
  //   ENSURES: b.Length > 0 && b.Length == MaxSeq(a[..]) + 1
  //   ENSURES: forall k: int :: 0 <= k < b.Length ==> b[k] == count(k, a[..])
  {
    var a := new nat[1] [19];
    var b := MakeBuckets(a);
    expect b.Length > 0;
    expect b.Length == MaxSeq(a[..]) + 1;
    expect forall k: int :: 0 <= k < b.Length ==> b[k] == count(k, a[..]);
    expect b == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]; // observed from implementation
  }

}

method Main()
{
  TestsForMakeBuckets();
  print "TestsForMakeBuckets: all non-failing tests passed!\n";
}
