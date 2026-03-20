// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\DafnyTestGen\test\in\Merge.dfy
// Method: Merge
// Generated: 2026-03-20 12:27:57

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



method GeneratedTests_Merge()
{
  // Test case for combination 1/Ba=0,b=0:
  //   PRE:  IsSorted(a[..]) && IsSorted(b[..])
  //   POST: IsSorted(c[..])
  //   POST: multiset(c[..]) == multiset(a[..]) + multiset(b[..])
  {
    var a := new int[0] [];
    var b := new int[0] [];
    var c := Merge(a, b);
    expect IsSorted(c[..]);
    expect multiset(c[..]) == multiset(a[..]) + multiset(b[..]);
  }

  // Test case for combination 1/Ba=0,b=1:
  //   PRE:  IsSorted(a[..]) && IsSorted(b[..])
  //   POST: IsSorted(c[..])
  //   POST: multiset(c[..]) == multiset(a[..]) + multiset(b[..])
  {
    var a := new int[0] [];
    var b := new int[1] [2];
    var c := Merge(a, b);
    expect IsSorted(c[..]);
    expect multiset(c[..]) == multiset(a[..]) + multiset(b[..]);
  }

  // Test case for combination 1/Ba=0,b=2:
  //   PRE:  IsSorted(a[..]) && IsSorted(b[..])
  //   POST: IsSorted(c[..])
  //   POST: multiset(c[..]) == multiset(a[..]) + multiset(b[..])
  {
    var a := new int[0] [];
    var b := new int[2] [-38, 7681];
    var c := Merge(a, b);
    expect IsSorted(c[..]);
    expect multiset(c[..]) == multiset(a[..]) + multiset(b[..]);
  }

  // Test case for combination 1/Ba=0,b=3:
  //   PRE:  IsSorted(a[..]) && IsSorted(b[..])
  //   POST: IsSorted(c[..])
  //   POST: multiset(c[..]) == multiset(a[..]) + multiset(b[..])
  {
    var a := new int[0] [];
    var b := new int[3] [-2437, 0, 1236];
    var c := Merge(a, b);
    expect IsSorted(c[..]);
    expect multiset(c[..]) == multiset(a[..]) + multiset(b[..]);
  }

  // Test case for combination 1/Ba=1,b=0:
  //   PRE:  IsSorted(a[..]) && IsSorted(b[..])
  //   POST: IsSorted(c[..])
  //   POST: multiset(c[..]) == multiset(a[..]) + multiset(b[..])
  {
    var a := new int[1] [2];
    var b := new int[0] [];
    var c := Merge(a, b);
    expect IsSorted(c[..]);
    expect multiset(c[..]) == multiset(a[..]) + multiset(b[..]);
  }

  // Test case for combination 1/Ba=1,b=1:
  //   PRE:  IsSorted(a[..]) && IsSorted(b[..])
  //   POST: IsSorted(c[..])
  //   POST: multiset(c[..]) == multiset(a[..]) + multiset(b[..])
  {
    var a := new int[1] [2];
    var b := new int[1] [3];
    var c := Merge(a, b);
    expect IsSorted(c[..]);
    expect multiset(c[..]) == multiset(a[..]) + multiset(b[..]);
  }

  // Test case for combination 1/Ba=1,b=2:
  //   PRE:  IsSorted(a[..]) && IsSorted(b[..])
  //   POST: IsSorted(c[..])
  //   POST: multiset(c[..]) == multiset(a[..]) + multiset(b[..])
  {
    var a := new int[1] [3];
    var b := new int[2] [-38, 7681];
    var c := Merge(a, b);
    expect IsSorted(c[..]);
    expect multiset(c[..]) == multiset(a[..]) + multiset(b[..]);
  }

  // Test case for combination 1/Ba=1,b=3:
  //   PRE:  IsSorted(a[..]) && IsSorted(b[..])
  //   POST: IsSorted(c[..])
  //   POST: multiset(c[..]) == multiset(a[..]) + multiset(b[..])
  {
    var a := new int[1] [4];
    var b := new int[3] [-2437, 0, 1236];
    var c := Merge(a, b);
    expect IsSorted(c[..]);
    expect multiset(c[..]) == multiset(a[..]) + multiset(b[..]);
  }

  // Test case for combination 1/Ba=2,b=0:
  //   PRE:  IsSorted(a[..]) && IsSorted(b[..])
  //   POST: IsSorted(c[..])
  //   POST: multiset(c[..]) == multiset(a[..]) + multiset(b[..])
  {
    var a := new int[2] [-38, 7681];
    var b := new int[0] [];
    var c := Merge(a, b);
    expect IsSorted(c[..]);
    expect multiset(c[..]) == multiset(a[..]) + multiset(b[..]);
  }

  // Test case for combination 1/Ba=2,b=1:
  //   PRE:  IsSorted(a[..]) && IsSorted(b[..])
  //   POST: IsSorted(c[..])
  //   POST: multiset(c[..]) == multiset(a[..]) + multiset(b[..])
  {
    var a := new int[2] [-38, 7681];
    var b := new int[1] [3];
    var c := Merge(a, b);
    expect IsSorted(c[..]);
    expect multiset(c[..]) == multiset(a[..]) + multiset(b[..]);
  }

  // Test case for combination 1/Ba=2,b=2:
  //   PRE:  IsSorted(a[..]) && IsSorted(b[..])
  //   POST: IsSorted(c[..])
  //   POST: multiset(c[..]) == multiset(a[..]) + multiset(b[..])
  {
    var a := new int[2] [-38, 7681];
    var b := new int[2] [-1236, 1201];
    var c := Merge(a, b);
    expect IsSorted(c[..]);
    expect multiset(c[..]) == multiset(a[..]) + multiset(b[..]);
  }

  // Test case for combination 1/Ba=2,b=3:
  //   PRE:  IsSorted(a[..]) && IsSorted(b[..])
  //   POST: IsSorted(c[..])
  //   POST: multiset(c[..]) == multiset(a[..]) + multiset(b[..])
  {
    var a := new int[2] [-8855, -7059];
    var b := new int[3] [6738, 7187, 8365];
    var c := Merge(a, b);
    expect IsSorted(c[..]);
    expect multiset(c[..]) == multiset(a[..]) + multiset(b[..]);
  }

  // Test case for combination 1/Ba=3,b=0:
  //   PRE:  IsSorted(a[..]) && IsSorted(b[..])
  //   POST: IsSorted(c[..])
  //   POST: multiset(c[..]) == multiset(a[..]) + multiset(b[..])
  {
    var a := new int[3] [-2437, 0, 1236];
    var b := new int[0] [];
    var c := Merge(a, b);
    expect IsSorted(c[..]);
    expect multiset(c[..]) == multiset(a[..]) + multiset(b[..]);
  }

  // Test case for combination 1/Ba=3,b=1:
  //   PRE:  IsSorted(a[..]) && IsSorted(b[..])
  //   POST: IsSorted(c[..])
  //   POST: multiset(c[..]) == multiset(a[..]) + multiset(b[..])
  {
    var a := new int[3] [-2437, 0, 1236];
    var b := new int[1] [4];
    var c := Merge(a, b);
    expect IsSorted(c[..]);
    expect multiset(c[..]) == multiset(a[..]) + multiset(b[..]);
  }

  // Test case for combination 1/Ba=3,b=2:
  //   PRE:  IsSorted(a[..]) && IsSorted(b[..])
  //   POST: IsSorted(c[..])
  //   POST: multiset(c[..]) == multiset(a[..]) + multiset(b[..])
  {
    var a := new int[3] [2492, 2941, 8855];
    var b := new int[2] [-8365, -6083];
    var c := Merge(a, b);
    expect IsSorted(c[..]);
    expect multiset(c[..]) == multiset(a[..]) + multiset(b[..]);
  }

  // Test case for combination 1/Ba=3,b=3:
  //   PRE:  IsSorted(a[..]) && IsSorted(b[..])
  //   POST: IsSorted(c[..])
  //   POST: multiset(c[..]) == multiset(a[..]) + multiset(b[..])
  {
    var a := new int[3] [-2282, 0, 8855];
    var b := new int[3] [728, 1177, 1796];
    var c := Merge(a, b);
    expect IsSorted(c[..]);
    expect multiset(c[..]) == multiset(a[..]) + multiset(b[..]);
  }

}

method Main()
{
  GeneratedTests_Merge();
  print "GeneratedTests_Merge: all tests passed!\n";
}
