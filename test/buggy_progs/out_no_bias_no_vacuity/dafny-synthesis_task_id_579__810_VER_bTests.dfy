// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_579__810_VER_b.dfy
// Method: DissimilarElements
// Generated: 2026-04-24 22:19:54

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
    var a := new int[2] [63, 27];
    var b := new int[2] [45, 46];
    var result := DissimilarElements(a, b);
    expect forall x: int  :: x in result ==> InArray(a, x) != InArray(b, x);
    expect forall i: int, j: int :: 0 <= i < j < |result| ==> result[i] != result[j];
    expect result == [63, 27, 45, 46]; // observed from implementation
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

  // Test case for combination {1}/O|a|=1:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[1] [48];
    var b := new int[1] [34];
    var result := DissimilarElements(a, b);
    expect forall x: int  :: x in result ==> InArray(a, x) != InArray(b, x);
    expect forall i: int, j: int :: 0 <= i < j < |result| ==> result[i] != result[j];
    expect result == [48, 34]; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|b|=0:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[1] [26];
    var b := new int[0] [];
    var result := DissimilarElements(a, b);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.DissimilarElements(BigInteger[] a, BigInteger[] b) in C:\cygwin64\tmp\DafnyCBT_1m0wrnp2ahl\runner.cs:line 5946
    // runtime error: at _module.__default.TestCase__3() in C:\cygwin64\tmp\DafnyCBT_1m0wrnp2ahl\runner.cs:line 6129
    // expect result == [26] || result == [];
  }

  // Test case for combination {1}/O|result|>=2:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[0] [];
    var b := new int[3] [8, 10, 10];
    var result := DissimilarElements(a, b);
    expect forall x: int  :: x in result ==> InArray(a, x) != InArray(b, x);
    expect forall i: int, j: int :: 0 <= i < j < |result| ==> result[i] != result[j];
    expect result == [8, 10]; // observed from implementation
  }

  // Test case for combination {1}/O|a|=0/R5:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[0] [];
    var b := new int[0] [];
    var result := DissimilarElements(a, b);
    expect result == [];
  }

  // Test case for combination {1}/O|a|=0/R6:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[0] [];
    var b := new int[1] [25];
    var result := DissimilarElements(a, b);
    expect result == [] || result == [25];
    expect result[..] == [25]; // observed from implementation
  }

  // Test case for combination {1}/O|a|=0/R7:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[0] [];
    var b := new int[1] [35];
    var result := DissimilarElements(a, b);
    expect result == [] || result == [35];
    expect result[..] == [35]; // observed from implementation
  }

  // Test case for combination {1}/O|a|=0/R8:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[0] [];
    var b := new int[1] [33];
    var result := DissimilarElements(a, b);
    expect result == [] || result == [33];
    expect result[..] == [33]; // observed from implementation
  }

  // Test case for combination {1}/O|a|=0/R9:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: x in result ==> InArray(a, x) != InArray(b, x)
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[0] [];
    var b := new int[1] [31];
    var result := DissimilarElements(a, b);
    expect result == [] || result == [31];
    expect result[..] == [31]; // observed from implementation
  }

}

method Main()
{
  TestsForDissimilarElements();
  print "TestsForDissimilarElements: all non-failing tests passed!\n";
}
