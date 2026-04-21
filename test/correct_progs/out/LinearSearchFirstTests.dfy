// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\LinearSearchFirst.dfy
// Method: LinearSearchFirst
// Generated: 2026-04-21 23:11:26

// Searches for a value 'x' in an array 'a' and returns an index 
// where x occurs, or -1 if not found. 
// In case x occurs multiple times, it returns the index of an arbitrary occurrence
// (this holds from a specification perspective; the implementation may choose to follow a more specific policy).
method LinearSearchFirst(a: array<int>, x: int) returns (index: int)
  ensures if exists k :: 0 <= k < a.Length && a[k] == x 
          then 0 <= index < a.Length && a[index] == x && forall k :: 0 <= k < index ==> a[k] != x
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


method TestsForLinearSearchFirst()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: 0 <= (a.Length - 1)
  //   POST Q2: a[0] == x
  //   POST Q3: 0 <= index
  //   POST Q4: index < a.Length
  //   POST Q5: a[index] == x
  //   POST Q6: forall k: int :: 0 <= k < index ==> a[k] != x
  {
    var a := new int[2] [-10, -10];
    var x := -10;
    var index := LinearSearchFirst(a, x);
    expect index == 0;
  }

  // Test case for combination {2}/Rel:
  //   POST Q1: exists k :: 1 <= k < (a.Length - 1) && a[k] == x
  //   POST Q2: 0 <= index
  //   POST Q3: index < a.Length
  //   POST Q4: a[index] == x
  //   POST Q5: forall k: int :: 0 <= k < index ==> a[k] != x
  {
    var a := new int[3] [-10, -1, -1];
    var x := -1;
    var index := LinearSearchFirst(a, x);
    expect index == 1;
  }

  // Test case for combination {4}:
  //   POST Q1: !exists k: int :: 0 <= k < a.Length && a[k] == x
  //   POST Q2: index == -1
  {
    var a := new int[1] [-10];
    var x := -9;
    var index := LinearSearchFirst(a, x);
    expect index == -1;
  }

  // Test case for combination {1}/V6:
  //   POST Q1: 0 <= (a.Length - 1)
  //   POST Q2: a[0] == x
  //   POST Q3: 0 <= index
  //   POST Q4: index < a.Length
  //   POST Q5: a[index] == x
  //   POST Q6: forall k: int :: 0 <= k < index ==> a[k] != x  // VACUOUS (forced true by other literals for this ins)
  {
    var a := new int[1] [-10];
    var x := -10;
    var index := LinearSearchFirst(a, x);
    expect index == 0;
  }

}

method Main()
{
  TestsForLinearSearchFirst();
  print "TestsForLinearSearchFirst: all non-failing tests passed!\n";
}
