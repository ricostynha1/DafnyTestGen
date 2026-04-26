// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\BinarySearch.dfy
// Method: BinarySearch
// Generated: 2026-04-23 19:31:47

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


method TestsForBinarySearch()
{
  // Test case for combination {2}/Rel:
  //   PRE:  IsSorted(a[..])
  //   POST Q1: index != -1
  //   POST Q2: 0 <= index
  //   POST Q3: index < a.Length
  //   POST Q4: a[index] == x
  {
    var a := new T[2] [-23264, 30634];
    var x := -23264;
    var index := BinarySearch(a, x);
    expect index == 0;
  }

  // Test case for combination {1}:
  //   PRE:  IsSorted(a[..])
  //   POST Q1: index == -1
  //   POST Q2: x !in a[..]
  {
    var a := new T[0] [];
    var x := 8;
    var index := BinarySearch(a, x);
    expect index == -1;
  }

  // Test case for combination {2}/Bindex=1:
  //   PRE:  IsSorted(a[..])
  //   POST Q1: index != -1
  //   POST Q2: 0 <= index
  //   POST Q3: index < a.Length
  //   POST Q4: a[index] == x
  {
    var a := new T[2] [-30634, 9921];
    var x := 9921;
    var index := BinarySearch(a, x);
    expect index == 1;
  }

  // Test case for combination {1}/O|a|=1:
  //   PRE:  IsSorted(a[..])
  //   POST Q1: index == -1
  //   POST Q2: x !in a[..]
  {
    var a := new T[1] [2];
    var x := 3;
    var index := BinarySearch(a, x);
    expect index == -1;
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  IsSorted(a[..])
  //   POST Q1: index == -1
  //   POST Q2: x !in a[..]
  {
    var a := new T[2] [-30634, 9921];
    var x := 9;
    var index := BinarySearch(a, x);
    expect index == -1;
  }

  // Test case for combination {1}/Ox=0:
  //   PRE:  IsSorted(a[..])
  //   POST Q1: index == -1
  //   POST Q2: x !in a[..]
  {
    var a := new T[0] [];
    var x := 0;
    var index := BinarySearch(a, x);
    expect index == -1;
  }

  // Test case for combination {1}/Ox=1:
  //   PRE:  IsSorted(a[..])
  //   POST Q1: index == -1
  //   POST Q2: x !in a[..]
  {
    var a := new T[0] [];
    var x := 1;
    var index := BinarySearch(a, x);
    expect index == -1;
  }

  // Test case for combination {2}/O|a|=1:
  //   PRE:  IsSorted(a[..])
  //   POST Q1: index != -1
  //   POST Q2: 0 <= index
  //   POST Q3: index < a.Length
  //   POST Q4: a[index] == x
  {
    var a := new T[1] [2];
    var x := 2;
    var index := BinarySearch(a, x);
    expect index == 0;
  }

  // Test case for combination {2}/Ox=0:
  //   PRE:  IsSorted(a[..])
  //   POST Q1: index != -1
  //   POST Q2: 0 <= index
  //   POST Q3: index < a.Length
  //   POST Q4: a[index] == x
  {
    var a := new T[1] [0];
    var x := 0;
    var index := BinarySearch(a, x);
    expect index == 0;
  }

  // Test case for combination {2}/Ox=1:
  //   PRE:  IsSorted(a[..])
  //   POST Q1: index != -1
  //   POST Q2: 0 <= index
  //   POST Q3: index < a.Length
  //   POST Q4: a[index] == x
  {
    var a := new T[1] [1];
    var x := 1;
    var index := BinarySearch(a, x);
    expect index == 0;
  }

}

method Main()
{
  TestsForBinarySearch();
  print "TestsForBinarySearch: all non-failing tests passed!\n";
}
