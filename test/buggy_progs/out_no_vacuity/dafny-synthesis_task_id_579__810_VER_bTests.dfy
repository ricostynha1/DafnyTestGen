// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_579__810_VER_b.dfy
// Method: DissimilarElements
// Generated: 2026-04-24 16:27:36

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
  // Test case for combination {1}/Rel:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[1] [-9];
    var b := new int[2] [-10, -7];
    var result := DissimilarElements(a, b);
    expect forall x: int  :: x in result ==> InArray(a, x) != InArray(b, x);
    expect forall i: int, j: int :: 0 <= i < j < |result| ==> result[i] != result[j];
    expect result == [-9, -10, -7]; // observed from implementation
  }

  // Test case for combination {1}/O|a|=0:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[0] [];
    var b := new int[1] [-10];
    var result := DissimilarElements(a, b);
    expect result == [] || result == [-10];
    expect result[..] == [-10]; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[2] [-2, -1];
    var b := new int[1] [10];
    var result := DissimilarElements(a, b);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.DissimilarElements(BigInteger[] a, BigInteger[] b) in C:\cygwin64\tmp\DafnyCBT_xnsq3wxormp\runner.cs:line 5946
    // runtime error: at _module.__default.TestCase__2() in C:\cygwin64\tmp\DafnyCBT_xnsq3wxormp\runner.cs:line 6076
    // expect forall x: int  :: x in result ==> InArray(a, x) != InArray(b, x);
    // expect forall i: int, j: int :: 0 <= i < j < |result| ==> result[i] != result[j];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|b|=0:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[1] [-10];
    var b := new int[0] [];
    var result := DissimilarElements(a, b);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.DissimilarElements(BigInteger[] a, BigInteger[] b) in C:\cygwin64\tmp\DafnyCBT_xnsq3wxormp\runner.cs:line 5946
    // runtime error: at _module.__default.TestCase__3() in C:\cygwin64\tmp\DafnyCBT_xnsq3wxormp\runner.cs:line 6129
    // expect result == [] || result == [-10];
  }

  // Test case for combination {1}/O|result|=1:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[1] [-9];
    var b := new int[1] [2];
    var result := DissimilarElements(a, b);
    expect forall x: int  :: x in result ==> InArray(a, x) != InArray(b, x);
    expect forall i: int, j: int :: 0 <= i < j < |result| ==> result[i] != result[j];
    expect result == [-9, 2]; // observed from implementation
  }

  // Test case for combination {1}/O|a|=0/R5:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[0] [];
    var b := new int[1] [-9];
    var result := DissimilarElements(a, b);
    expect result == [-9] || result == [];
    expect result[..] == [-9]; // observed from implementation
  }

  // Test case for combination {1}/O|a|=0/R6:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[0] [];
    var b := new int[1] [-8];
    var result := DissimilarElements(a, b);
    expect result == [-8] || result == [];
    expect result[..] == [-8]; // observed from implementation
  }

  // Test case for combination {1}/O|a|=0/R7:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[0] [];
    var b := new int[1] [5];
    var result := DissimilarElements(a, b);
    expect result == [] || result == [5];
    expect result[..] == [5]; // observed from implementation
  }

  // Test case for combination {1}/O|a|=0/R8:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[0] [];
    var b := new int[1] [-7];
    var result := DissimilarElements(a, b);
    expect result == [] || result == [-7];
    expect result[..] == [-7]; // observed from implementation
  }

  // Test case for combination {1}/O|a|=0/R9:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[0] [];
    var b := new int[1] [-6];
    var result := DissimilarElements(a, b);
    expect result == [] || result == [-6];
    expect result[..] == [-6]; // observed from implementation
  }

}

method Main()
{
  TestsForDissimilarElements();
  print "TestsForDissimilarElements: all non-failing tests passed!\n";
}
