// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\LinearSearch2.dfy
// Method: LinearSearch
// Generated: 2026-04-21 23:11:23

// Searches for a value 'x' in an array 'a' and returns an index 
// where x occurs, or -1 if not found. 
// In case x occurs multiple times, it returns the index of an arbitrary occurrence
// (this holds from a specification perspective; the implementation may choose to follow a more specific policy).
method LinearSearch(a: array<int>, x: int) returns (index: int)
  ensures if exists k :: 0 <= k < a.Length && a[k] == x 
          then 0 <= index < a.Length && a[index] == x
          else index == -1 
{
  for i := 0 to a.Length
    invariant  x !in a[..i]
  {
    if a[i] == x {
      return i;
    }
  } 
  return -1;
}


method TestsForLinearSearch()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: 0 <= (a.Length - 1)
  //   POST Q2: a[0] == x
  //   POST Q3: 0 <= index
  //   POST Q4: index < a.Length
  //   POST Q5: a[index] == x
  {
    var a := new int[2] [-1, 10];
    var x := -1;
    var index := LinearSearch(a, x);
    expect index == 0;
  }

  // Test case for combination {2}/Rel:
  //   POST Q1: exists k :: 1 <= k < (a.Length - 1) && a[k] == x
  //   POST Q2: 0 <= index
  //   POST Q3: index < a.Length
  //   POST Q4: a[index] == x
  {
    var a := new int[3] [10, -10, -9];
    var x := -10;
    var index := LinearSearch(a, x);
    expect index == 1;
  }

  // Test case for combination {3}/Rel:
  //   POST Q1: 0 <= (a.Length - 1)
  //   POST Q2: a[(a.Length - 1)] == x
  //   POST Q3: 0 <= index
  //   POST Q4: index < a.Length
  //   POST Q5: a[index] == x
  {
    var a := new int[2] [-1, -10];
    var x := -10;
    var index := LinearSearch(a, x);
    expect index == 1;
  }

  // Test case for combination {4}:
  //   POST Q1: !exists k: int :: 0 <= k < a.Length && a[k] == x
  //   POST Q2: index == -1
  {
    var a := new int[1] [-10];
    var x := -9;
    var index := LinearSearch(a, x);
    expect index == -1;
  }

}

method Main()
{
  TestsForLinearSearch();
  print "TestsForLinearSearch: all non-failing tests passed!\n";
}
