// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\in\BinarySearch.dfy
// Method: BinarySearch
// Generated: 2026-03-20 23:17:35

/*  
* Formal verification of the binary search algorithm in Dafny. 
*/

type T = int // for demo purposes, but could be another type 

// Checks if a sequence 's' is sorted.
predicate IsSorted(a: seq<T>) 
{
  forall i, j :: 0 <= i < j < |a| ==> a[i] <= a[j]
}
  
// Finds a value 'x' in a sorted array 'a', and returns its index, or -1 if not found. 
method BinarySearch(a: array<T>, x: T) returns (index: int)
  requires IsSorted(a[..])  
  ensures index != -1 ==> 0 <= index < a.Length && a[index] == x
  ensures index == -1 ==> x !in a[..]
{   
  var low, high := 0, a.Length;
  while low < high 
    invariant 0 <= low <= high <= a.Length
    invariant x !in a[..low] && x !in a[high..]
  {
    var mid := low + (high - low) / 2;
    if {
      case a[mid]  < x => low := mid + 1;
      case a[mid]  > x => high := mid; 
      case a[mid] == x => return mid;
    }
  }
  return -1;
}


method GeneratedTests_BinarySearch()
{
  // Test case for combination {2}/Ba=0,x=0:
  //   PRE:  IsSorted(a[..])
  //   POST: !(index != -1)
  //   POST: x !in a[..]
  {
    var a := new T[0] [];
    var x := 0;
    var index := BinarySearch(a, x);
    expect index == -1;
  }

  // Test case for combination {2}/Ba=0,x=1:
  //   PRE:  IsSorted(a[..])
  //   POST: !(index != -1)
  //   POST: x !in a[..]
  {
    var a := new T[0] [];
    var x := 1;
    var index := BinarySearch(a, x);
    expect index == -1;
  }

  // Test case for combination {2}/Ba=1,x=0:
  //   PRE:  IsSorted(a[..])
  //   POST: !(index != -1)
  //   POST: x !in a[..]
  {
    var a := new T[1] [3];
    var x := 0;
    var index := BinarySearch(a, x);
    expect index == -1;
  }

  // Test case for combination {2}/Ba=1,x=1:
  //   PRE:  IsSorted(a[..])
  //   POST: !(index != -1)
  //   POST: x !in a[..]
  {
    var a := new T[1] [3];
    var x := 1;
    var index := BinarySearch(a, x);
    expect index == -1;
  }

  // Test case for combination {2}/Ba=2,x=0:
  //   PRE:  IsSorted(a[..])
  //   POST: !(index != -1)
  //   POST: x !in a[..]
  {
    var a := new T[2] [-8856, -8855];
    var x := 0;
    var index := BinarySearch(a, x);
    expect index == -1;
  }

  // Test case for combination {2}/Ba=2,x=1:
  //   PRE:  IsSorted(a[..])
  //   POST: !(index != -1)
  //   POST: x !in a[..]
  {
    var a := new T[2] [-8855, -8854];
    var x := 1;
    var index := BinarySearch(a, x);
    expect index == -1;
  }

  // Test case for combination {2}/Ba=3,x=0:
  //   PRE:  IsSorted(a[..])
  //   POST: !(index != -1)
  //   POST: x !in a[..]
  {
    var a := new T[3] [-8856, -8855, 5];
    var x := 0;
    var index := BinarySearch(a, x);
    expect index == -1;
  }

  // Test case for combination {2}/Ba=3,x=1:
  //   PRE:  IsSorted(a[..])
  //   POST: !(index != -1)
  //   POST: x !in a[..]
  {
    var a := new T[3] [-8365, 5, 2284];
    var x := 1;
    var index := BinarySearch(a, x);
    expect index == -1;
  }

  // Test case for combination {3}/Ba=1,x=0:
  //   PRE:  IsSorted(a[..])
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   POST: !(index == -1)
  {
    var a := new T[1] [0];
    var x := 0;
    var index := BinarySearch(a, x);
    expect index == 0;
  }

  // Test case for combination {3}/Ba=1,x=1:
  //   PRE:  IsSorted(a[..])
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   POST: !(index == -1)
  {
    var a := new T[1] [1];
    var x := 1;
    var index := BinarySearch(a, x);
    expect index == 0;
  }

  // Test case for combination {3}/Ba=2,x=0:
  //   PRE:  IsSorted(a[..])
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   POST: !(index == -1)
  {
    var a := new T[2] [0, 4];
    var x := 0;
    var index := BinarySearch(a, x);
    expect index == 0;
  }

  // Test case for combination {3}/Ba=2,x=1:
  //   PRE:  IsSorted(a[..])
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   POST: !(index == -1)
  {
    var a := new T[2] [1, 4];
    var x := 1;
    var index := BinarySearch(a, x);
    expect index == 0;
  }

  // Test case for combination {3}/Ba=3,x=0:
  //   PRE:  IsSorted(a[..])
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   POST: !(index == -1)
  {
    var a := new T[3] [-2, -1, 0];
    var x := 0;
    var index := BinarySearch(a, x);
    expect index == 2;
  }

  // Test case for combination {3}/Ba=3,x=1:
  //   PRE:  IsSorted(a[..])
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   POST: !(index == -1)
  {
    var a := new T[3] [-8855, -5912, 1];
    var x := 1;
    var index := BinarySearch(a, x);
    expect index == 2;
  }

}

method Main()
{
  GeneratedTests_BinarySearch();
  print "GeneratedTests_BinarySearch: all tests passed!\n";
}
