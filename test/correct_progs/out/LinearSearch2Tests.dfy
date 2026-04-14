// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\LinearSearch2.dfy
// Method: LinearSearch
// Generated: 2026-04-14 17:16:42

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


method Passing()
{
  // Test case for combination {1}:
  //   POST: 0 <= (a.Length - 1)
  //   POST: a[0] == x
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   ENSURES: if exists k :: 0 <= k < a.Length && a[k] == x then 0 <= index < a.Length && a[index] == x else index == -1
  {
    var a := new int[1] [4];
    var x := 4;
    var index := LinearSearch(a, x);
    expect index == 0;
  }

  // Test case for combination {2}:
  //   POST: exists k :: 1 <= k < (a.Length - 1) && a[k] == x
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   ENSURES: if exists k :: 0 <= k < a.Length && a[k] == x then 0 <= index < a.Length && a[index] == x else index == -1
  {
    var a := new int[3] [17, 8, 24];
    var x := 8;
    var index := LinearSearch(a, x);
    expect index == 1;
  }

  // Test case for combination {4}:
  //   POST: exists k, k_2 :: 0 <= k < k_2 <= (a.Length - 1) && a[k] == x && a[k_2] == x
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   ENSURES: if exists k :: 0 <= k < a.Length && a[k] == x then 0 <= index < a.Length && a[index] == x else index == -1
  {
    var a := new int[2] [9, 9];
    var x := 9;
    var index := LinearSearch(a, x);
    expect 0 <= index < a.Length;
    expect a[index] == x;
  }

  // Test case for combination {5}:
  //   POST: !exists k :: 0 <= k < a.Length && a[k] == x
  //   POST: index == -1
  //   ENSURES: if exists k :: 0 <= k < a.Length && a[k] == x then 0 <= index < a.Length && a[index] == x else index == -1
  {
    var a := new int[1] [11];
    var x := 9;
    var index := LinearSearch(a, x);
    expect index == -1;
  }

  // Test case for combination {1}/Oindex>0:
  //   POST: 0 <= (a.Length - 1)
  //   POST: a[0] == x
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   ENSURES: if exists k :: 0 <= k < a.Length && a[k] == x then 0 <= index < a.Length && a[index] == x else index == -1
  {
    var a := new int[2] [6, 6];
    var x := 6;
    var index := LinearSearch(a, x);
    expect 0 <= index < a.Length;
    expect a[index] == x;
  }

  // Test case for combination {1}/Oindex=0:
  //   POST: 0 <= (a.Length - 1)
  //   POST: a[0] == x
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   ENSURES: if exists k :: 0 <= k < a.Length && a[k] == x then 0 <= index < a.Length && a[index] == x else index == -1
  {
    var a := new int[1] [3];
    var x := 3;
    var index := LinearSearch(a, x);
    expect index == 0;
  }

  // Test case for combination {2}/Oindex>0:
  //   POST: exists k :: 1 <= k < (a.Length - 1) && a[k] == x
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   ENSURES: if exists k :: 0 <= k < a.Length && a[k] == x then 0 <= index < a.Length && a[index] == x else index == -1
  {
    var a := new int[3] [18, 9, 24];
    var x := 9;
    var index := LinearSearch(a, x);
    expect index == 1;
  }

  // Test case for combination {2}/Oindex=0:
  //   POST: exists k :: 1 <= k < (a.Length - 1) && a[k] == x
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   ENSURES: if exists k :: 0 <= k < a.Length && a[k] == x then 0 <= index < a.Length && a[index] == x else index == -1
  {
    var a := new int[4] [15, 15, 23, 22];
    var x := 15;
    var index := LinearSearch(a, x);
    expect 0 <= index < a.Length;
    expect a[index] == x;
  }

  // Test case for combination {3}/Oindex>0:
  //   POST: 0 <= (a.Length - 1)
  //   POST: a[(a.Length - 1)] == x
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   ENSURES: if exists k :: 0 <= k < a.Length && a[k] == x then 0 <= index < a.Length && a[index] == x else index == -1
  {
    var a := new int[2] [14, 6];
    var x := 6;
    var index := LinearSearch(a, x);
    expect index == 1;
  }

  // Test case for combination {3}/Oindex=0:
  //   POST: 0 <= (a.Length - 1)
  //   POST: a[(a.Length - 1)] == x
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   ENSURES: if exists k :: 0 <= k < a.Length && a[k] == x then 0 <= index < a.Length && a[index] == x else index == -1
  {
    var a := new int[1] [5];
    var x := 5;
    var index := LinearSearch(a, x);
    expect index == 0;
  }

  // Test case for combination {4}/Oindex>0:
  //   POST: exists k, k_2 :: 0 <= k < k_2 <= (a.Length - 1) && a[k] == x && a[k_2] == x
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   ENSURES: if exists k :: 0 <= k < a.Length && a[k] == x then 0 <= index < a.Length && a[index] == x else index == -1
  {
    var a := new int[2] [10, 10];
    var x := 10;
    var index := LinearSearch(a, x);
    expect 0 <= index < a.Length;
    expect a[index] == x;
  }

  // Test case for combination {4}/Oindex=0:
  //   POST: exists k, k_2 :: 0 <= k < k_2 <= (a.Length - 1) && a[k] == x && a[k_2] == x
  //   POST: 0 <= index < a.Length
  //   POST: a[index] == x
  //   ENSURES: if exists k :: 0 <= k < a.Length && a[k] == x then 0 <= index < a.Length && a[index] == x else index == -1
  {
    var a := new int[2] [11, 11];
    var x := 11;
    var index := LinearSearch(a, x);
    expect 0 <= index < a.Length;
    expect a[index] == x;
  }

  // Test case for combination {5}/Oindex<0:
  //   POST: !exists k :: 0 <= k < a.Length && a[k] == x
  //   POST: index == -1
  //   ENSURES: if exists k :: 0 <= k < a.Length && a[k] == x then 0 <= index < a.Length && a[index] == x else index == -1
  {
    var a := new int[0] [];
    var x := 8;
    var index := LinearSearch(a, x);
    expect index == -1;
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
