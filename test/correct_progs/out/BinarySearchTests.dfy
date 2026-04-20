// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\BinarySearch.dfy
// Method: BinarySearch
// Generated: 2026-04-20 14:53:27

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
  // Test case for combination {1}:
  //   PRE:  IsSorted(a[..])
  //   POST: !(index != -1)
  //   POST: index == -1
  //   POST: x !in a[..]
  //   ENSURES: index != -1 ==> 0 <= index < a.Length && a[index] == x
  //   ENSURES: index == -1 ==> x !in a[..]
  {
    var a := new T[0] [];
    var x := 8;
    var index := BinarySearch(a, x);
    expect index == -1;
  }

  // Test case for combination {2}:
  //   PRE:  IsSorted(a[..])
  //   POST: index != -1
  //   POST: 0 <= index
  //   POST: index < a.Length
  //   POST: a[index] == x
  //   POST: !(index == -1)
  //   ENSURES: index != -1 ==> 0 <= index < a.Length && a[index] == x
  //   ENSURES: index == -1 ==> x !in a[..]
  {
    var a := new T[1] [17];
    var x := 17;
    var index := BinarySearch(a, x);
    expect index == 0;
  }

  // Test case for combination {1}/Q|a|>=2:
  //   PRE:  IsSorted(a[..])
  //   POST: !(index != -1)
  //   POST: index == -1
  //   POST: x !in a[..]
  //   ENSURES: index != -1 ==> 0 <= index < a.Length && a[index] == x
  //   ENSURES: index == -1 ==> x !in a[..]
  {
    var a := new T[2] [-10436, 26747];
    var x := 9;
    var index := BinarySearch(a, x);
    expect index == -1;
  }

  // Test case for combination {1}/Q|a|=1:
  //   PRE:  IsSorted(a[..])
  //   POST: !(index != -1)
  //   POST: index == -1
  //   POST: x !in a[..]
  //   ENSURES: index != -1 ==> 0 <= index < a.Length && a[index] == x
  //   ENSURES: index == -1 ==> x !in a[..]
  {
    var a := new T[1] [2];
    var x := 3;
    var index := BinarySearch(a, x);
    expect index == -1;
  }

  // Test case for combination {2}/Q|a|>=2:
  //   PRE:  IsSorted(a[..])
  //   POST: index != -1
  //   POST: 0 <= index
  //   POST: index < a.Length
  //   POST: a[index] == x
  //   POST: !(index == -1)
  //   ENSURES: index != -1 ==> 0 <= index < a.Length && a[index] == x
  //   ENSURES: index == -1 ==> x !in a[..]
  {
    var a := new T[2] [-29290, 10436];
    var x := 10436;
    var index := BinarySearch(a, x);
    expect index == 1;
  }

}

method Main()
{
  TestsForBinarySearch();
  print "TestsForBinarySearch: all non-failing tests passed!\n";
}
