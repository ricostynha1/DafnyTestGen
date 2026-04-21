// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\LinearSearch.dfy
// Method: LinearSearch
// Generated: 2026-04-21 23:11:21

// Searches for a value 'x' in an array 'a' and returns an index 
// where x occurs, or -1 if not found. 
// In case x occurs multiple times, it returns the index of an arbitrary occurrence
// (this holds from a specification perspective; the implementation may choose to follow a more specific policy).
method LinearSearch(a: array<int>, x: int) returns (index: int)
  ensures 0 <= index < a.Length ==> a[index] == x
  ensures ! (0 <= index < a.Length) ==> index == -1 && x !in a[..]
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
  //   POST Q1: 0 > index
  //   POST Q2: index == -1
  //   POST Q3: x !in a[..]
  {
    var a := new int[1] [-8];
    var x := -9;
    var index := LinearSearch(a, x);
    expect index == -1;
  }

  // Test case for combination {2}/Rel:
  //   POST Q1: 0 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: a[index] == x
  {
    var a := new int[2] [-10, -9];
    var x := -9;
    var index := LinearSearch(a, x);
    expect index == 1;
  }

  // Test case for combination {2}/V3:
  //   POST Q1: 0 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: a[index] == x  // VACUOUS (forced true by other literals for this ins)
  {
    var a := new int[1] [-10];
    var x := -10;
    var index := LinearSearch(a, x);
    expect index == 0;
  }

  // Test case for combination {1}/O|a|=0:
  //   POST Q1: 0 > index
  //   POST Q2: index == -1
  //   POST Q3: x !in a[..]
  {
    var a := new int[0] [];
    var x := -10;
    var index := LinearSearch(a, x);
    expect index == -1;
  }

}

method Main()
{
  TestsForLinearSearch();
  print "TestsForLinearSearch: all non-failing tests passed!\n";
}
