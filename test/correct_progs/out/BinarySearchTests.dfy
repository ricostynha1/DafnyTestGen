// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\BinarySearch.dfy
// Method: BinarySearch
// Generated: 2026-04-22 10:29:46

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
    var a := new T[2] [-30276, 11157];
    var x := -30276;
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

  // Test case for combination {2}/V4:
  //   PRE:  IsSorted(a[..])
  //   POST Q1: index != -1
  //   POST Q2: 0 <= index
  //   POST Q3: index < a.Length
  //   POST Q4: a[index] == x  // VACUOUS (forced true by other literals for this ins)
  {
    var a := new T[1] [17];
    var x := 17;
    var index := BinarySearch(a, x);
    expect index == 0;
  }

  // Test case for combination {2}/Bindex=1:
  //   PRE:  IsSorted(a[..])
  //   POST Q1: index != -1
  //   POST Q2: 0 <= index
  //   POST Q3: index < a.Length
  //   POST Q4: a[index] == x
  {
    var a := new T[2] [-11157, 18582];
    var x := 18582;
    var index := BinarySearch(a, x);
    expect index == 1;
  }

}

method Main()
{
  TestsForBinarySearch();
  print "TestsForBinarySearch: all non-failing tests passed!\n";
}
