// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Mode.dfy
// Method: Mode
// Generated: 2026-04-21 23:36:56

// Returns the mode (element with highest frequency) in a non-empty sorted array.
// In case multiple solutins exist, returns an arbitrary one.
method Mode(a: array<int>) returns (m: int)
  requires IsSorted(a)
  requires a.Length > 0
  ensures m in a[..]
  ensures forall k :: 0 <= k < a.Length ==> Count(a[..], a[k]) <= Count(a[..], m)
{
    var best_m := a[0];
    var best_count := 1;
    var current_count := 1;
    for i := 1 to a.Length 
        invariant best_m in a[..i]
        invariant best_count == Count(a[..i], best_m)
        invariant forall k :: 0 <= k < i ==> Count(a[..i], a[k]) <= best_count
        invariant current_count == Count(a[..i], a[i-1])
    {
        if a[i] == a[i-1] {
            current_count := current_count + 1;
            if current_count > best_count {
                best_count := current_count;
                best_m := a[i];
            }
        }
        else {
            current_count := 1;
        }
        assert a[..i+1] == a[..i] + [a[i]]; // helper
    }
    assert a[..] == a[..a.Length]; // helper
    return best_m;
}

// Counts the number of occurrences of a value in a sequence
function {:fuel 5} Count<T(==)>(s: seq<T>, x: T) : nat
  ensures x !in s ==> Count(s, x) == 0
{
    if |s| == 0 then 0 else (if s[|s|-1] == x then 1 else 0) + Count(s[..|s|-1], x)
}

// Checks if the array is sorted
predicate IsSorted(a: array<int>) 
  reads a
{
    forall i, j :: 0 <= i < j < a.Length ==> a[i] <= a[j]
}




method TestsForMode()
{
  // Test case for combination {1}/Rel:
  //   PRE:  IsSorted(a)
  //   PRE:  a.Length > 0
  //   POST Q1: m in a[..]
  //   POST Q2: forall k: int :: 0 <= k < a.Length ==> Count(a[..], a[k]) <= Count(a[..], m)
  {
    var a := new int[1] [-10];
    var m := Mode(a);
    expect m in a[..];
    expect forall k: int :: 0 <= k < a.Length ==> Count(a[..], a[k]) <= Count(a[..], m);
    expect m == -10; // observed from implementation
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  IsSorted(a)
  //   PRE:  a.Length > 0
  //   POST Q1: m in a[..]
  //   POST Q2: forall k: int :: 0 <= k < a.Length ==> Count(a[..], a[k]) <= Count(a[..], m)
  {
    var a := new int[2] [-10, -9];
    var m := Mode(a);
    expect m in a[..];
    expect forall k: int :: 0 <= k < a.Length ==> Count(a[..], a[k]) <= Count(a[..], m);
    expect m == -10; // observed from implementation
  }

  // Test case for combination {1}/Om=0:
  //   PRE:  IsSorted(a)
  //   PRE:  a.Length > 0
  //   POST Q1: m in a[..]
  //   POST Q2: forall k: int :: 0 <= k < a.Length ==> Count(a[..], a[k]) <= Count(a[..], m)
  {
    var a := new int[4] [-3, -1, -1, 0];
    var m := Mode(a);
    expect m in a[..];
    expect forall k: int :: 0 <= k < a.Length ==> Count(a[..], a[k]) <= Count(a[..], m);
    expect m == -1; // observed from implementation
  }

  // Test case for combination {1}/Om>0:
  //   PRE:  IsSorted(a)
  //   PRE:  a.Length > 0
  //   POST Q1: m in a[..]
  //   POST Q2: forall k: int :: 0 <= k < a.Length ==> Count(a[..], a[k]) <= Count(a[..], m)
  {
    var a := new int[1] [4];
    var m := Mode(a);
    expect m in a[..];
    expect forall k: int :: 0 <= k < a.Length ==> Count(a[..], a[k]) <= Count(a[..], m);
    expect m == 4; // observed from implementation
  }

}

method Main()
{
  TestsForMode();
  print "TestsForMode: all non-failing tests passed!\n";
}
