// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Mode.dfy
// Method: Mode
// Generated: 2026-04-06 23:21:36

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




method Passing()
{
  // Test case for combination {1}:
  //   PRE:  IsSorted(a)
  //   PRE:  a.Length > 0
  //   POST: m in a[..]
  //   POST: forall k :: 0 <= k < a.Length ==> Count(a[..], a[k]) <= Count(a[..], m)
  {
    var a := new int[1] [38];
    var m := Mode(a);
    expect m == 38;
  }

  // Test case for combination {1}/Ba=2,a-shape=const:
  //   PRE:  IsSorted(a)
  //   PRE:  a.Length > 0
  //   POST: m in a[..]
  //   POST: forall k :: 0 <= k < a.Length ==> Count(a[..], a[k]) <= Count(a[..], m)
  {
    var a := new int[2] [3, 3];
    var m := Mode(a);
    expect m == 3;
  }

  // Test case for combination {1}/Ba=3,a-shape=const:
  //   PRE:  IsSorted(a)
  //   PRE:  a.Length > 0
  //   POST: m in a[..]
  //   POST: forall k :: 0 <= k < a.Length ==> Count(a[..], a[k]) <= Count(a[..], m)
  {
    var a := new int[3] [4, 4, 4];
    var m := Mode(a);
    expect m == 4;
  }

  // Test case for combination {1}/Om>0:
  //   PRE:  IsSorted(a)
  //   PRE:  a.Length > 0
  //   POST: m in a[..]
  //   POST: forall k :: 0 <= k < a.Length ==> Count(a[..], a[k]) <= Count(a[..], m)
  {
    var a := new int[4] [-38, 0, 1, 23676];
    var m := Mode(a);
    expect m in a[..];
    expect m == -38;
    expect forall k :: 0 <= k < a.Length ==> Count(a[..], a[k]) <= Count(a[..], m);
  }

  // Test case for combination {1}/Om<0:
  //   PRE:  IsSorted(a)
  //   PRE:  a.Length > 0
  //   POST: m in a[..]
  //   POST: forall k :: 0 <= k < a.Length ==> Count(a[..], a[k]) <= Count(a[..], m)
  {
    var a := new int[5] [-40288, -40250, -40250, -32531, -11293];
    var m := Mode(a);
    expect m in a[..];
    expect m == -40250;
    expect forall k :: 0 <= k < a.Length ==> Count(a[..], a[k]) <= Count(a[..], m);
  }

  // Test case for combination {1}/Om=0:
  //   PRE:  IsSorted(a)
  //   PRE:  a.Length > 0
  //   POST: m in a[..]
  //   POST: forall k :: 0 <= k < a.Length ==> Count(a[..], a[k]) <= Count(a[..], m)
  {
    var a := new int[6] [-38, 0, 0, 0, 0, 0];
    var m := Mode(a);
    expect m == 0;
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
