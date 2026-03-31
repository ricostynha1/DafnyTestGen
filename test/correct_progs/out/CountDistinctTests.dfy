// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\CountDistinct.dfy
// Method: CountDistinct
// Generated: 2026-03-31 21:45:44


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


method GeneratedTests_CountDistinct()
{
  // Test case for combination {1}:
  //   PRE:  IsSorted(a)
  //   POST: count == |AsSet(a)|
  {
    var a := new int[0] [];
    var check_count := |AsSet(a)|;
    expect IsSorted(a); // PRE-CHECK
    var count := CountDistinct(a);
    expect count == check_count;
  }

  // Test case for combination {1}/Ba=1:
  //   PRE:  IsSorted(a)
  //   POST: count == |AsSet(a)|
  {
    var a := new int[1] [2];
    var check_count := |AsSet(a)|;
    expect IsSorted(a); // PRE-CHECK
    var count := CountDistinct(a);
    expect count == check_count;
  }

  // Test case for combination {1}/Ba=2:
  //   PRE:  IsSorted(a)
  //   POST: count == |AsSet(a)|
  {
    var a := new int[2] [4, 3];
    var check_count := |AsSet(a)|;
    expect IsSorted(a); // PRE-CHECK
    var count := CountDistinct(a);
    expect count == check_count;
  }

  // Test case for combination {1}/Ba=3:
  //   PRE:  IsSorted(a)
  //   POST: count == |AsSet(a)|
  {
    var a := new int[3] [5, 4, 6];
    var check_count := |AsSet(a)|;
    expect IsSorted(a); // PRE-CHECK
    var count := CountDistinct(a);
    expect count == check_count;
  }

}

method Main()
{
  GeneratedTests_CountDistinct();
  print "GeneratedTests_CountDistinct: all tests passed!\n";
}
