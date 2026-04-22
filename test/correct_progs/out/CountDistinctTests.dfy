// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\CountDistinct.dfy
// Method: CountDistinct
// Generated: 2026-04-21 23:35:25


// Returns the number of distinct elements in a sorted array of integers.
method CountDistinct(a: array<int>) returns (count: nat)
  requires IsSorted(a)
  ensures count == |AsSet(a)|
{
    if a.Length == 0 {
        return 0;
    }
    count := 1;
    assert AsSet(a, 1) == {a[0]}; // helper
    for i := 1 to a.Length
      invariant count == |AsSet(a, i)|
    {
        if a[i] != a[i-1] {
            count := count + 1;
            assert AsSet(a, i+1) == AsSet(a, i) + {a[i]}; //helper
        }
        else {
            assert AsSet(a, i+1) == AsSet(a, i); //helper
        }
    }
    return count;
}

// Checks if array 'a' is sorted.
predicate IsSorted(a: array<int>) 
  reads a
{
    forall i, j :: 0 <= i < j < a.Length ==> a[i] <= a[j]
}

// Obtains the content of array 'a' as a set.
function AsSet(a: array<int>, n: nat := a.Length): set<int> 
  reads a
{
    set k | 0 <= k < n <= a.Length :: a[k] 
}


method TestsForCountDistinct()
{
  // Test case for combination {1}:
  //   PRE:  IsSorted(a)
  //   POST Q1: count == |AsSet(a)|
  {
    var a := new int[1] [-10];
    var count := CountDistinct(a);
    expect count == 1;
  }

  // Test case for combination {1}/O|a|=0:
  //   PRE:  IsSorted(a)
  //   POST Q1: count == |AsSet(a)|
  {
    var a := new int[0] [];
    var count := CountDistinct(a);
    expect count == 0;
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  IsSorted(a)
  //   POST Q1: count == |AsSet(a)|
  {
    var a := new int[2] [-10, -10];
    var count := CountDistinct(a);
    expect count == 1;
  }

  // Test case for combination {1}/R4:
  //   PRE:  IsSorted(a)
  //   POST Q1: count == |AsSet(a)|
  {
    var a := new int[1] [-9];
    var count := CountDistinct(a);
    expect count == 1;
  }

}

method Main()
{
  TestsForCountDistinct();
  print "TestsForCountDistinct: all non-failing tests passed!\n";
}
