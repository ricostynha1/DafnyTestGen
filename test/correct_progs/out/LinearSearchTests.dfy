// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\correct_progs\in\LinearSearch.dfy
// Method: LinearSearch
// Generated: 2026-03-21 12:21:47

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


method GeneratedTests_LinearSearch()
{
  // Test case for combination {2}/Ba=0,x=0:
  //   POST: !(0 <= index < a.Length)
  //   POST: index == -1
  //   POST: x !in a[..]
  {
    var a := new int[0] [];
    var x := 0;
    var index := LinearSearch(a, x);
    expect index == -1;
  }

  // Test case for combination {2}/Ba=0,x=1:
  //   POST: !(0 <= index < a.Length)
  //   POST: index == -1
  //   POST: x !in a[..]
  {
    var a := new int[0] [];
    var x := 1;
    var index := LinearSearch(a, x);
    expect index == -1;
  }

  // Test case for combination {2}/Ba=1,x=0:
  //   POST: !(0 <= index < a.Length)
  //   POST: index == -1
  //   POST: x !in a[..]
  {
    var a := new int[1] [3];
    var x := 0;
    var index := LinearSearch(a, x);
    expect index == -1;
  }

  // Test case for combination {2}/Ba=1,x=1:
  //   POST: !(0 <= index < a.Length)
  //   POST: index == -1
  //   POST: x !in a[..]
  {
    var a := new int[1] [3];
    var x := 1;
    var index := LinearSearch(a, x);
    expect index == -1;
  }

  // Test case for combination {2}/Ba=2,x=0:
  //   POST: !(0 <= index < a.Length)
  //   POST: index == -1
  //   POST: x !in a[..]
  {
    var a := new int[2] [9, 4];
    var x := 0;
    var index := LinearSearch(a, x);
    expect index == -1;
  }

  // Test case for combination {2}/Ba=2,x=1:
  //   POST: !(0 <= index < a.Length)
  //   POST: index == -1
  //   POST: x !in a[..]
  {
    var a := new int[2] [9, 4];
    var x := 1;
    var index := LinearSearch(a, x);
    expect index == -1;
  }

  // Test case for combination {2}/Ba=3,x=0:
  //   POST: !(0 <= index < a.Length)
  //   POST: index == -1
  //   POST: x !in a[..]
  {
    var a := new int[3] [12, 14, 5];
    var x := 0;
    var index := LinearSearch(a, x);
    expect index == -1;
  }

  // Test case for combination {2}/Ba=3,x=1:
  //   POST: !(0 <= index < a.Length)
  //   POST: index == -1
  //   POST: x !in a[..]
  {
    var a := new int[3] [12, 14, 5];
    var x := 1;
    var index := LinearSearch(a, x);
    expect index == -1;
  }

  // Test case for combination {3}/Ba=1,x=0:
  //   POST: a[index] == x
  //   POST: 0 <= index < a.Length
  {
    var a := new int[1] [0];
    var x := 0;
    var index := LinearSearch(a, x);
    expect index == 0;
  }

  // Test case for combination {3}/Ba=1,x=1:
  //   POST: a[index] == x
  //   POST: 0 <= index < a.Length
  {
    var a := new int[1] [1];
    var x := 1;
    var index := LinearSearch(a, x);
    expect index == 0;
  }

  // Test case for combination {3}/Ba=2,x=0:
  //   POST: a[index] == x
  //   POST: 0 <= index < a.Length
  {
    var a := new int[2] [4, 0];
    var x := 0;
    var index := LinearSearch(a, x);
    expect index == 1;
  }

  // Test case for combination {3}/Ba=2,x=1:
  //   POST: a[index] == x
  //   POST: 0 <= index < a.Length
  {
    var a := new int[2] [4, 1];
    var x := 1;
    var index := LinearSearch(a, x);
    expect index == 1;
  }

  // Test case for combination {3}/Ba=3,x=0:
  //   POST: a[index] == x
  //   POST: 0 <= index < a.Length
  {
    var a := new int[3] [6, 5, 0];
    var x := 0;
    var index := LinearSearch(a, x);
    expect index == 2;
  }

  // Test case for combination {3}/Ba=3,x=1:
  //   POST: a[index] == x
  //   POST: 0 <= index < a.Length
  {
    var a := new int[3] [6, 5, 1];
    var x := 1;
    var index := LinearSearch(a, x);
    expect index == 2;
  }

}

method Main()
{
  GeneratedTests_LinearSearch();
  print "GeneratedTests_LinearSearch: all tests passed!\n";
}
