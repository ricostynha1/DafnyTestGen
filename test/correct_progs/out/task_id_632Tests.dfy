// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_632.dfy
// Method: MoveZeroesToEnd
// Generated: 2026-04-15 22:34:49

// Move all zeroes to the end of the array, preserving the order of non-zero elements.
// Returns the number of non-zero elements in the array.
method MoveZeroesToEnd(a: array<int>) returns (nz: nat)
    modifies a
    ensures 0 <= nz <= a.Length
    ensures a[..nz] == FilterNZ(old(a[..]))
    ensures forall k :: nz <= k < a.Length ==> a[k] == 0
{
    nz := 0; // number of non-zero elems to the left of index i
    for i := 0 to a.Length // iterate over the array and swap non-zero elements to the left
        invariant 0 <= nz <= i
        invariant a[..nz] == FilterNZ(old(a[..i])) // first nz elements are non-zero, by the same order
        invariant forall k :: nz <= k < i ==> a[k] == 0 // then zero up to index i (exclusive)
        invariant a[i..] == old(a[i..])  // then old values up to the end       
    {
        if a[i] != 0 {
            if nz < i {
                a[nz], a[i] := a[i], a[nz]; // swap non-zero element to the left
            }
            nz := nz + 1; // increment number of non-zero elements
        }
        assert a[..i+1] == a[..i] + [a[i]]; // helper
        assert (a[..i+1] == a[..i] + [a[i]]); // helper
    }    
    assert (a[..] == a[..a.Length]); // helper
}

// Filters a sequence 's' using a predicate 'p'.
// Returns a new sequence with the elements of 's' that satisfy the predicate 'p'.
function {:fuel 4} FilterNZ(s: seq<int>): (r : seq<int>)
   ensures forall i :: 0 <= i < |r| ==> r[i] != 0
{
    if |s| == 0 then s
    else if Last(s) != 0 then FilterNZ(DropLast(s)) + [Last(s)]
    else FilterNZ(DropLast(s))
}

// Retrieves the same sequence with the last element removed 
function DropLast<T>(s: seq<T>): seq<T>
    requires |s| > 0
{  
    s[..|s|-1] 
}

// Retrieves the last element of a non-empty sequence
function Last<T>(s: seq<T>): T
    requires |s| > 0
{ 
    s[|s|-1] 
}

// Test cases checked statically by Dafny (with helper assertions)
method MoveZeroesToEndTest(){
    var a1 := new int[] [1, 0, 0, 3];
    var nz1 := MoveZeroesToEnd(a1);
    assert nz1 == 2 && a1[..] == [1, 3, 0, 0];
 
    var a2 := new int[] [0, 1, 0, 1];
    var nz2 := MoveZeroesToEnd(a2);
    assert nz2 == 2 && a2[..] == [1, 1, 0, 0];
}

method Passing()
{
  // Test case for combination {1}:
  //   POST: 0 <= nz <= a.Length
  //   POST: a[..nz] == FilterNZ(old(a[..]))
  //   POST: forall k :: nz <= k < a.Length ==> a[k] == 0
  //   ENSURES: 0 <= nz <= a.Length
  //   ENSURES: a[..nz] == FilterNZ(old(a[..]))
  //   ENSURES: forall k :: nz <= k < a.Length ==> a[k] == 0
  {
    var a := new int[0] [];
    var nz := MoveZeroesToEnd(a);
    expect nz == 0;
    expect a[..] == [];
  }

  // Test case for combination {1}/Ba=1:
  //   POST: 0 <= nz <= a.Length
  //   POST: a[..nz] == FilterNZ(old(a[..]))
  //   POST: forall k :: nz <= k < a.Length ==> a[k] == 0
  //   ENSURES: 0 <= nz <= a.Length
  //   ENSURES: a[..nz] == FilterNZ(old(a[..]))
  //   ENSURES: forall k :: nz <= k < a.Length ==> a[k] == 0
  {
    var a := new int[1] [3];
    var old_a := a[..];
    var nz := MoveZeroesToEnd(a);
    expect 0 <= nz <= a.Length;
    expect a[..nz] == FilterNZ(old_a);
    expect forall k :: nz <= k < a.Length ==> a[k] == 0;
  }

  // Test case for combination {1}/Ba=2:
  //   POST: 0 <= nz <= a.Length
  //   POST: a[..nz] == FilterNZ(old(a[..]))
  //   POST: forall k :: nz <= k < a.Length ==> a[k] == 0
  //   ENSURES: 0 <= nz <= a.Length
  //   ENSURES: a[..nz] == FilterNZ(old(a[..]))
  //   ENSURES: forall k :: nz <= k < a.Length ==> a[k] == 0
  {
    var a := new int[2] [4, 3];
    var old_a := a[..];
    var nz := MoveZeroesToEnd(a);
    expect 0 <= nz <= a.Length;
    expect a[..nz] == FilterNZ(old_a);
    expect forall k :: nz <= k < a.Length ==> a[k] == 0;
  }

  // Test case for combination {1}/Ba=3:
  //   POST: 0 <= nz <= a.Length
  //   POST: a[..nz] == FilterNZ(old(a[..]))
  //   POST: forall k :: nz <= k < a.Length ==> a[k] == 0
  //   ENSURES: 0 <= nz <= a.Length
  //   ENSURES: a[..nz] == FilterNZ(old(a[..]))
  //   ENSURES: forall k :: nz <= k < a.Length ==> a[k] == 0
  {
    var a := new int[3] [5, 4, 6];
    var old_a := a[..];
    var nz := MoveZeroesToEnd(a);
    expect 0 <= nz <= a.Length;
    expect a[..nz] == FilterNZ(old_a);
    expect forall k :: nz <= k < a.Length ==> a[k] == 0;
  }

}

method Failing()
{
  // (no failing tests)
}

method Main()
{
  Passing();
  Failing();
}
