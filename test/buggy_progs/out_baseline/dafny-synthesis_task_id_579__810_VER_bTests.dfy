// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_579__810_VER_b.dfy
// Method: DissimilarElements
// Generated: 2026-04-24 20:07:33

// dafny-synthesis_task_id_579.dfy

predicate InArray(a: array<int>, x: int)
  reads a
  decreases {a}, a, x
{
  exists i: int {:trigger a[i]} :: 
    0 <= i < a.Length &&
    a[i] == x
}

method DissimilarElements(a: array<int>, b: array<int>) returns (result: seq<int>)
  ensures forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  ensures forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  decreases a, b
{
  var res: seq<int> := [];
  for i: int := 0 to a.Length
    invariant 0 <= i <= a.Length
    invariant forall x: int {:trigger InArray(a, x)} {:trigger x in res} :: x in res ==> InArray(a, x)
    invariant forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in res} :: x in res ==> InArray(a, x) != InArray(b, x)
    invariant forall i: int, j: int {:trigger res[j], res[i]} :: 0 <= i < j < |res| ==> res[i] != res[j]
  {
    if !InArray(b, a[i]) && b[i] !in res {
      res := res + [a[i]];
    }
  }
  var partialSize := |res|;
  for i: int := 0 to b.Length
    invariant 0 <= i <= b.Length
    invariant forall k: int {:trigger res[k]} :: partialSize <= k < |res| ==> InArray(b, res[k])
    invariant forall k: int {:trigger res[k]} :: 0 <= k < |res| ==> InArray(a, res[k]) != InArray(b, res[k])
    invariant forall i: int, j: int {:trigger res[j], res[i]} :: 0 <= i < j < |res| ==> res[i] != res[j]
  {
    if !InArray(a, b[i]) && b[i] !in res {
      res := res + [b[i]];
    }
  }
  result := res;
}


method TestsForDissimilarElements()
{
  // Test case for combination {1}:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[1] [41];
    var b := new int[1] [17];
    var result := DissimilarElements(a, b);
    expect forall x: int  :: x in result ==> InArray(a, x) != InArray(b, x);
    expect forall i: int, j: int :: 0 <= i < j < |result| ==> result[i] != result[j];
    expect result == [41, 17]; // observed from implementation
  }

  // Test case for combination {1}/O|a|=0:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[0] [];
    var b := new int[1] [26];
    var result := DissimilarElements(a, b);
    expect result == [26] || result == [];
    expect result[..] == [26]; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[2] [42, 43];
    var b := new int[0] [];
    var result := DissimilarElements(a, b);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.DissimilarElements(BigInteger[] a, BigInteger[] b) in C:\cygwin64\tmp\DafnyCBT_ur0lugy1gmz\runner.cs:line 5958
    // runtime error: at _module.__default.TestCase__2() in C:\cygwin64\tmp\DafnyCBT_ur0lugy1gmz\runner.cs:line 6086
    // expect forall x: int  :: x in result ==> InArray(a, x) != InArray(b, x);
    // expect forall i: int, j: int :: 0 <= i < j < |result| ==> result[i] != result[j];
  }

  // Test case for combination {1}/O|b|>=2:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[1] [38];
    var b := new int[2] [35, 36];
    var result := DissimilarElements(a, b);
    expect forall x: int  :: x in result ==> InArray(a, x) != InArray(b, x);
    expect forall i: int, j: int :: 0 <= i < j < |result| ==> result[i] != result[j];
    expect result == [38, 35, 36]; // observed from implementation
  }

  // Test case for combination {1}/O|result|>=2:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[1] [25];
    var b := new int[1] [8];
    var result := DissimilarElements(a, b);
    expect forall x: int  :: x in result ==> InArray(a, x) != InArray(b, x);
    expect forall i: int, j: int :: 0 <= i < j < |result| ==> result[i] != result[j];
    expect result == [25, 8]; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[1] [37];
    var b := new int[1] [39];
    var result := DissimilarElements(a, b);
    expect forall x: int  :: x in result ==> InArray(a, x) != InArray(b, x);
    expect forall i: int, j: int :: 0 <= i < j < |result| ==> result[i] != result[j];
    expect result == [37, 39]; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[1] [44];
    var b := new int[1] [18];
    var result := DissimilarElements(a, b);
    expect forall x: int  :: x in result ==> InArray(a, x) != InArray(b, x);
    expect forall i: int, j: int :: 0 <= i < j < |result| ==> result[i] != result[j];
    expect result == [44, 18]; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[1] [47];
    var b := new int[1] [19];
    var result := DissimilarElements(a, b);
    expect forall x: int  :: x in result ==> InArray(a, x) != InArray(b, x);
    expect forall i: int, j: int :: 0 <= i < j < |result| ==> result[i] != result[j];
    expect result == [47, 19]; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[1] [50];
    var b := new int[1] [20];
    var result := DissimilarElements(a, b);
    expect forall x: int  :: x in result ==> InArray(a, x) != InArray(b, x);
    expect forall i: int, j: int :: 0 <= i < j < |result| ==> result[i] != result[j];
    expect result == [50, 20]; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[1] [51];
    var b := new int[1] [21];
    var result := DissimilarElements(a, b);
    expect forall x: int  :: x in result ==> InArray(a, x) != InArray(b, x);
    expect forall i: int, j: int :: 0 <= i < j < |result| ==> result[i] != result[j];
    expect result == [51, 21]; // observed from implementation
  }

}

method Main()
{
  TestsForDissimilarElements();
  print "TestsForDissimilarElements: all non-failing tests passed!\n";
}
