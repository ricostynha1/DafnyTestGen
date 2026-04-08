// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\BinarySearch.dfy
// Method: BinarySearch
// Generated: 2026-04-08 10:20:08

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


method Passing()
{
  // Test case for combination {6}:
  //   PRE:  IsSorted(a[..])
  //   POST: index != -1
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   POST: !(index == -1)
  //   POST: !(x !in a[..])
  //   ENSURES: index != -1 ==> 0 <= index < a.Length && a[index] == x
  //   ENSURES: index == -1 ==> x !in a[..]
  {
    var a := new T[1] [38];
    var x := 38;
    var index := BinarySearch(a, x);
    expect index == 0;
  }

  // Test case for combination {6}/Ba=1,x=0,a-shape=const:
  //   PRE:  IsSorted(a[..])
  //   POST: index != -1
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   POST: !(index == -1)
  //   POST: !(x !in a[..])
  //   ENSURES: index != -1 ==> 0 <= index < a.Length && a[index] == x
  //   ENSURES: index == -1 ==> x !in a[..]
  {
    var a := new T[1] [0];
    var x := 0;
    var index := BinarySearch(a, x);
    expect index == 0;
  }

  // Test case for combination {6}/Ba=1,x=1,a-shape=const:
  //   PRE:  IsSorted(a[..])
  //   POST: index != -1
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   POST: !(index == -1)
  //   POST: !(x !in a[..])
  //   ENSURES: index != -1 ==> 0 <= index < a.Length && a[index] == x
  //   ENSURES: index == -1 ==> x !in a[..]
  {
    var a := new T[1] [1];
    var x := 1;
    var index := BinarySearch(a, x);
    expect index == 0;
  }

  // Test case for combination {6}/Ba=2,x=0,a-shape=const:
  //   PRE:  IsSorted(a[..])
  //   POST: index != -1
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   POST: !(index == -1)
  //   POST: !(x !in a[..])
  //   ENSURES: index != -1 ==> 0 <= index < a.Length && a[index] == x
  //   ENSURES: index == -1 ==> x !in a[..]
  {
    var a := new T[2] [0, 0];
    var x := 0;
    var index := BinarySearch(a, x);
    expect index != -1;
    expect index == 1;
    expect 0 <= index < a.Length;
    expect a[index] == x;
    expect !(index == -1);
    expect !(x !in a[..]);
  }

  // Test case for combination {6}/Oindex>0:
  //   PRE:  IsSorted(a[..])
  //   POST: index != -1
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   POST: !(index == -1)
  //   POST: !(x !in a[..])
  //   ENSURES: index != -1 ==> 0 <= index < a.Length && a[index] == x
  //   ENSURES: index == -1 ==> x !in a[..]
  {
    var a := new T[2] [-7719, 38];
    var x := 38;
    var index := BinarySearch(a, x);
    expect index == 1;
  }

  // Test case for combination {6}/Oindex=0:
  //   PRE:  IsSorted(a[..])
  //   POST: index != -1
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   POST: !(index == -1)
  //   POST: !(x !in a[..])
  //   ENSURES: index != -1 ==> 0 <= index < a.Length && a[index] == x
  //   ENSURES: index == -1 ==> x !in a[..]
  {
    var a := new T[1] [-38];
    var x := -38;
    var index := BinarySearch(a, x);
    expect index == 0;
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
