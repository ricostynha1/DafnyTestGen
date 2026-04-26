// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\MIEIC_mfes_tmp_tmpq3ho7nve_TP3_binary_search__842_ROR_Neq.dfy
// Method: binarySearch
// Generated: 2026-04-24 20:27:24

// MIEIC_mfes_tmp_tmpq3ho7nve_TP3_binary_search.dfy

predicate isSorted(a: array<int>)
  reads a
  decreases {a}, a
{
  forall i: int, j: int {:trigger a[j], a[i]} :: 
    0 <= i < j < a.Length ==>
      a[i] <= a[j]
}

method binarySearch(a: array<int>, x: int) returns (index: int)
  requires isSorted(a)
  ensures -1 <= index < a.Length
  ensures if index != -1 then a[index] == x else x !in a[..]
  decreases a, x
{
  var low, high := 0, a.Length;
  while low < high
    invariant 0 <= low <= high <= a.Length && x !in a[..low] && x !in a[high..]
    decreases high - low
  {
    var mid := low + (high - low) / 2;
    if {
      case a[mid] < x =>
        low := mid + 1;
      case a[mid] > x =>
        high := mid;
      case a[mid] != x =>
        return mid;
    }
  }
  return -1;
}

method testBinarySearch()
{
  var a := new int[] [1, 4, 4, 6, 8];
  assert a[..] == [1, 4, 4, 6, 8];
  var id1 := binarySearch(a, 6);
  assert a[3] == 6;
  assert id1 == 3;
  var id2 := binarySearch(a, 3);
  assert id2 == -1;
  var id3 := binarySearch(a, 4);
  assert a[1] == 4 && a[2] == 4;
  assert id3 in {1, 2};
}


method TestsForbinarySearch()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  isSorted(a)
  //   POST Q1: -1 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: index != -1
  //   POST Q4: a[index] == x
  {
    var a := new int[1] [16];
    var x := 16;
    var index := binarySearch(a, x);
    // runtime error: Unhandled exception. System.Exception: unreachable alternative
    // runtime error: at _module.__default.binarySearch(BigInteger[] a, BigInteger x) in C:\cygwin64\tmp\DafnyCBT_xo1hb2d1sbe\runner.cs:line 5970
    // runtime error: at _module.__default.TestCase__0() in C:\cygwin64\tmp\DafnyCBT_xo1hb2d1sbe\runner.cs:line 6026
    // expect index == 0;
  }

  // Test case for combination {2}:
  //   PRE:  isSorted(a)
  //   POST Q1: -1 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: index == -1
  //   POST Q4: x !in a[..]
  {
    var a := new int[0] [];
    var x := 0;
    var index := binarySearch(a, x);
    expect index == -1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bindex=1:
  //   PRE:  isSorted(a)
  //   POST Q1: -1 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: index != -1
  //   POST Q4: a[index] == x
  {
    var a := new int[2] [-400, 175];
    var x := 175;
    var index := binarySearch(a, x);
    // runtime error: Unhandled exception. System.Exception: unreachable alternative
    // runtime error: at _module.__default.binarySearch(BigInteger[] a, BigInteger x) in C:\cygwin64\tmp\DafnyCBT_xo1hb2d1sbe\runner.cs:line 5970
    // runtime error: at _module.__default.TestCase__2() in C:\cygwin64\tmp\DafnyCBT_xo1hb2d1sbe\runner.cs:line 6092
    // expect index == 1;
  }

  // Test case for combination {2}/Bx=a_len-1:
  //   PRE:  isSorted(a)
  //   POST Q1: -1 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: index == -1
  //   POST Q4: x !in a[..]
  {
    var a := new int[1] [176];
    var x := 0;
    var index := binarySearch(a, x);
    expect index == -1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Ox=0:
  //   PRE:  isSorted(a)
  //   POST Q1: -1 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: index != -1
  //   POST Q4: a[index] == x
  {
    var a := new int[1] [0];
    var x := 0;
    var index := binarySearch(a, x);
    // runtime error: Unhandled exception. System.Exception: unreachable alternative
    // runtime error: at _module.__default.binarySearch(BigInteger[] a, BigInteger x) in C:\cygwin64\tmp\DafnyCBT_xo1hb2d1sbe\runner.cs:line 5970
    // runtime error: at _module.__default.TestCase__4() in C:\cygwin64\tmp\DafnyCBT_xo1hb2d1sbe\runner.cs:line 6158
    // expect index == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Ox<0:
  //   PRE:  isSorted(a)
  //   POST Q1: -1 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: index != -1
  //   POST Q4: a[index] == x
  {
    var a := new int[1] [-1];
    var x := -1;
    var index := binarySearch(a, x);
    // runtime error: Unhandled exception. System.Exception: unreachable alternative
    // runtime error: at _module.__default.binarySearch(BigInteger[] a, BigInteger x) in C:\cygwin64\tmp\DafnyCBT_xo1hb2d1sbe\runner.cs:line 5970
    // runtime error: at _module.__default.TestCase__5() in C:\cygwin64\tmp\DafnyCBT_xo1hb2d1sbe\runner.cs:line 6191
    // expect index == 0;
  }

  // Test case for combination {2}/O|a|>=2:
  //   PRE:  isSorted(a)
  //   POST Q1: -1 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: index == -1
  //   POST Q4: x !in a[..]
  {
    var a := new int[2] [-175, 0];
    var x := 8;
    var index := binarySearch(a, x);
    expect index == -1;
  }

  // Test case for combination {2}/Ox<0:
  //   PRE:  isSorted(a)
  //   POST Q1: -1 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: index == -1
  //   POST Q4: x !in a[..]
  {
    var a := new int[0] [];
    var x := -1;
    var index := binarySearch(a, x);
    expect index == -1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  isSorted(a)
  //   POST Q1: -1 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: index != -1
  //   POST Q4: a[index] == x
  {
    var a := new int[1] [17];
    var x := 17;
    var index := binarySearch(a, x);
    // runtime error: Unhandled exception. System.Exception: unreachable alternative
    // runtime error: at _module.__default.binarySearch(BigInteger[] a, BigInteger x) in C:\cygwin64\tmp\DafnyCBT_xo1hb2d1sbe\runner.cs:line 5970
    // runtime error: at _module.__default.TestCase__8() in C:\cygwin64\tmp\DafnyCBT_xo1hb2d1sbe\runner.cs:line 6290
    // expect index == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  isSorted(a)
  //   POST Q1: -1 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: index != -1
  //   POST Q4: a[index] == x
  {
    var a := new int[1] [18];
    var x := 18;
    var index := binarySearch(a, x);
    // runtime error: Unhandled exception. System.Exception: unreachable alternative
    // runtime error: at _module.__default.binarySearch(BigInteger[] a, BigInteger x) in C:\cygwin64\tmp\DafnyCBT_xo1hb2d1sbe\runner.cs:line 5970
    // runtime error: at _module.__default.TestCase__9() in C:\cygwin64\tmp\DafnyCBT_xo1hb2d1sbe\runner.cs:line 6323
    // expect index == 0;
  }

}

method Main()
{
  TestsForbinarySearch();
  print "TestsForbinarySearch: all non-failing tests passed!\n";
}
