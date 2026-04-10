// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\CountDistinct.dfy
// Method: CountDistinct
// Generated: 2026-04-10 22:24:58


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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  IsSorted(a)
  //   POST: count == |AsSet(a)|
  //   ENSURES: count == |AsSet(a)|
  {
    var a := new int[0] [];
    var count := CountDistinct(a);
    expect count == 0;
  }

  // Test case for combination {1}/Ba=1,a-shape=const:
  //   PRE:  IsSorted(a)
  //   POST: count == |AsSet(a)|
  //   ENSURES: count == |AsSet(a)|
  {
    var a := new int[1] [2];
    var count := CountDistinct(a);
    expect count == 1;
  }

  // Test case for combination {1}/Ba=2,a-shape=const:
  //   PRE:  IsSorted(a)
  //   POST: count == |AsSet(a)|
  //   ENSURES: count == |AsSet(a)|
  {
    var a := new int[2] [3, 3];
    var count := CountDistinct(a);
    expect count == 1;
  }

  // Test case for combination {1}/Ba=3,a-shape=const:
  //   PRE:  IsSorted(a)
  //   POST: count == |AsSet(a)|
  //   ENSURES: count == |AsSet(a)|
  {
    var a := new int[3] [4, 4, 4];
    var count := CountDistinct(a);
    expect count == 1;
  }

  // Test case for combination {1}/Ocount>=2:
  //   PRE:  IsSorted(a)
  //   POST: count == |AsSet(a)|
  //   ENSURES: count == |AsSet(a)|
  {
    var a := new int[4] [-38, 0, 0, 7719];
    var count := CountDistinct(a);
    expect count == 3;
  }

  // Test case for combination {1}/Ocount=1:
  //   PRE:  IsSorted(a)
  //   POST: count == |AsSet(a)|
  //   ENSURES: count == |AsSet(a)|
  {
    var a := new int[5] [-38, 0, 0, 0, 7719];
    var count := CountDistinct(a);
    expect count == 3;
  }

  // Test case for combination {1}/Ocount=0:
  //   PRE:  IsSorted(a)
  //   POST: count == |AsSet(a)|
  //   ENSURES: count == |AsSet(a)|
  {
    var a := new int[6] [-38, 0, 0, 0, 0, 7719];
    var count := CountDistinct(a);
    expect count == 3;
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
