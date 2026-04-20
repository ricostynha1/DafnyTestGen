// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\LinearSearch2.dfy
// Method: LinearSearch
// Generated: 2026-04-20 09:03:07

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
  //   POST: 0 <= (a.Length - 1)
  //   POST: a[0] == x
  //   POST: 0 <= index
  //   POST: index < a.Length
  //   POST: a[index] == x
  //   ENSURES: if exists k: int :: 0 <= k < a.Length && a[k] == x then 0 <= index < a.Length && a[index] == x else index == -1
  {
    var a := new int[2] [-1, 6];
    var x := -1;
    var index := LinearSearch(a, x);
    expect index == 0;
  }

  // Test case for combination {2}/Rel:
  //   POST: exists k :: 1 <= k < (a.Length - 1) && a[k] == x
  //   POST: 0 <= index
  //   POST: index < a.Length
  //   POST: a[index] == x
  //   ENSURES: if exists k: int :: 0 <= k < a.Length && a[k] == x then 0 <= index < a.Length && a[index] == x else index == -1
  {
    var a := new int[3] [-10, -7, -8];
    var x := -7;
    var index := LinearSearch(a, x);
    expect index == 1;
  }

  // Test case for combination {3}/Rel:
  //   POST: 0 <= (a.Length - 1)
  //   POST: a[(a.Length - 1)] == x
  //   POST: 0 <= index
  //   POST: index < a.Length
  //   POST: a[index] == x
  //   ENSURES: if exists k: int :: 0 <= k < a.Length && a[k] == x then 0 <= index < a.Length && a[index] == x else index == -1
  {
    var a := new int[2] [-1, -2];
    var x := -2;
    var index := LinearSearch(a, x);
    expect index == 1;
  }

  // Test case for combination {4}/Rel:
  //   POST: exists k, k_2 | 0 <= k && k < k_2 && k_2 <= (a.Length - 1) :: (a[k] == x) && (a[k_2] == x)
  //   POST: 0 <= index
  //   POST: index < a.Length
  //   POST: a[index] == x
  //   ENSURES: if exists k: int :: 0 <= k < a.Length && a[k] == x then 0 <= index < a.Length && a[index] == x else index == -1
  {
    var a := new int[4] [10, -1, 10, 22];
    var x := 10;
    var index := LinearSearch(a, x);
    expect 0 <= index;
    expect index < a.Length;
    expect a[index] == x;
    expect index == 0; // observed from implementation
  }

  // Test case for combination {5}:
  //   POST: !exists k: int :: 0 <= k < a.Length && a[k] == x
  //   POST: index == -1
  //   ENSURES: if exists k: int :: 0 <= k < a.Length && a[k] == x then 0 <= index < a.Length && a[index] == x else index == -1
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
