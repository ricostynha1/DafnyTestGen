// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Merge.dfy
// Method: Merge
// Generated: 2026-04-06 23:21:32

// Auxiliary predicate that checks if a sequence 's' is sorted.
predicate IsSorted(s: seq<int>) {
  forall i, j :: 0 <= i < j < |s| ==> s[i] <= s[j]
}

// Merges two sorted arrays 'a' and 'b' into a new sorted array 'c'.
// This routine is part of the merge sort algorithm. 
method Merge(a: array<int>, b: array<int>) returns (c: array<int>)
   requires IsSorted(a[..]) && IsSorted(b[..])
   ensures fresh (c)
   ensures IsSorted(c[..]) 
   ensures multiset(c[..]) == multiset(a[..]) + multiset(b[..])
{
    c := new int[a.Length + b.Length];
    var i, j := 0, 0; // indices in 'a' and 'b' respectively

    // Repeatidly pick the smallest element from 'a' and 'b' and copy it into 'c'
    while i < a.Length || j < b.Length
       decreases (a.Length - i) + (b.Length - j)
       invariant 0 <= i <= a.Length
       invariant 0 <= j <= b.Length
       invariant IsSorted(c[..i + j])
       invariant multiset(c[..i + j]) == multiset(a[..i]) + multiset(b[..j])
       invariant i < a.Length && i + j > 0 ==> c[i + j - 1] <= a[i]
       invariant j < b.Length && i + j > 0 ==> c[i + j - 1] <= b[j]         
    {
        if i < a.Length && (j == b.Length  || a[i] <= b[j])  {
            c[j + i] := a[i];
            i := i + 1;
        } 
        else {
            c[i + j] := b[j];
            j := j + 1;
        }
    }

    assert a[..a.Length] == a[..]; // helper
    assert b[..b.Length] == b[..]; // helper
    assert c[..c.Length] == c[..]; // helper
}



method Passing()
{
  // Test case for combination {1}:
  //   PRE:  IsSorted(a[..]) && IsSorted(b[..])
  //   POST: IsSorted(c[..])
  //   POST: multiset(c[..]) == multiset(a[..]) + multiset(b[..])
  {
    var a := new int[0] [];
    var b := new int[0] [];
    var c := Merge(a, b);
    expect c[..] == [];
    expect IsSorted(c[..]);
    expect multiset(c[..]) == multiset(a[..]) + multiset(b[..]);
  }

  // Test case for combination {1}/Ba=2,b=0,a-shape=strict-asc,b-shape=const:
  //   PRE:  IsSorted(a[..]) && IsSorted(b[..])
  //   POST: IsSorted(c[..])
  //   POST: multiset(c[..]) == multiset(a[..]) + multiset(b[..])
  {
    var a := new int[2] [28957, 28958];
    var b := new int[0] [];
    var c := Merge(a, b);
    expect c[..] == [28957, 28958];
    expect IsSorted(c[..]);
    expect multiset(c[..]) == multiset(a[..]) + multiset(b[..]);
  }

  // Test case for combination {1}/Ba=2,b=1,a-shape=const,b-shape=const:
  //   PRE:  IsSorted(a[..]) && IsSorted(b[..])
  //   POST: IsSorted(c[..])
  //   POST: multiset(c[..]) == multiset(a[..]) + multiset(b[..])
  {
    var a := new int[2] [17, 17];
    var b := new int[1] [21];
    var c := Merge(a, b);
    expect c[..] == [17, 17, 21];
    expect IsSorted(c[..]);
    expect multiset(c[..]) == multiset(a[..]) + multiset(b[..]);
  }

  // Test case for combination {1}/Ba=2,b=2,a-shape=const,b-shape=const:
  //   PRE:  IsSorted(a[..]) && IsSorted(b[..])
  //   POST: IsSorted(c[..])
  //   POST: multiset(c[..]) == multiset(a[..]) + multiset(b[..])
  {
    var a := new int[2] [17, 17];
    var b := new int[2] [18, 18];
    var c := Merge(a, b);
    expect c[..] == [17, 17, 18, 18];
    expect IsSorted(c[..]);
    expect multiset(c[..]) == multiset(a[..]) + multiset(b[..]);
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
