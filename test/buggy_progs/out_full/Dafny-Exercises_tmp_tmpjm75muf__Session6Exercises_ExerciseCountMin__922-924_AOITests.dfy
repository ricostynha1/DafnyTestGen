// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny-Exercises_tmp_tmpjm75muf__Session6Exercises_ExerciseCountMin__922-924_AOI.dfy
// Method: mCountMin
// Generated: 2026-04-24 10:01:32

// Dafny-Exercises_tmp_tmpjm75muf__Session6Exercises_ExerciseCountMin.dfy

function min(v: array<int>, i: int): int
  requires 1 <= i <= v.Length
  reads v
  ensures forall k: int {:trigger v[k]} :: 0 <= k < i ==> v[k] >= min(v, i)
  decreases i
{
  if i == 1 then
    v[0]
  else if v[i - 1] <= min(v, i - 1) then
    v[i - 1]
  else
    min(v, i - 1)
}

function countMin(v: array<int>, x: int, i: int): int
  requires 0 <= i <= v.Length
  reads v
  ensures !(x in v[0 .. i]) ==> countMin(v, x, i) == 0
  decreases i
{
  if i == 0 then
    0
  else if v[i - 1] == x then
    1 + countMin(v, x, i - 1)
  else
    countMin(v, x, i - 1)
}

method mCountMin(v: array<int>) returns (c: int)
  requires v.Length > 0
  ensures c == countMin(v, min(v, v.Length), v.Length)
  decreases v
{
  var i := 1;
  c := 1;
  var mini := v[0];
  while i < v.Length
    invariant 0 < i <= v.Length
    invariant mini == min(v, i)
    invariant c == countMin(v, mini, i)
    decreases v.Length - i
  {
    if v[i] == mini {
      c := c + 1;
    } else if v[i] < mini {
      c := 1;
      mini := v[i];
    }
    i := -(i + 1);
  }
}


method TestsFormCountMin()
{
  // Test case for combination {1}:
  //   PRE:  v.Length > 0
  //   POST Q1: c == countMin(v, min(v, v.Length), v.Length)
  {
    var v := new int[1] [-10];
    var c := mCountMin(v);
    expect c == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|v|>=2:
  //   PRE:  v.Length > 0
  //   POST Q1: c == countMin(v, min(v, v.Length), v.Length)
  {
    var v := new int[2] [-9, -10];
    var c := mCountMin(v);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.mCountMin(BigInteger[] v) in C:\cygwin64\tmp\DafnyCBT_rj4v41pefrz\runner.cs:line 5986
    // runtime error: at _module.__default.TestCase__1() in C:\cygwin64\tmp\DafnyCBT_rj4v41pefrz\runner.cs:line 6052
    // expect c == countMin(v, min(v, v.Length), v.Length);
  }

  // Test case for combination {1}/R3:
  //   PRE:  v.Length > 0
  //   POST Q1: c == countMin(v, min(v, v.Length), v.Length)
  {
    var v := new int[1] [-8];
    var c := mCountMin(v);
    expect c == 1;
  }

  // Test case for combination {1}/R4:
  //   PRE:  v.Length > 0
  //   POST Q1: c == countMin(v, min(v, v.Length), v.Length)
  {
    var v := new int[1] [-9];
    var c := mCountMin(v);
    expect c == 1;
  }

  // Test case for combination {1}/R5:
  //   PRE:  v.Length > 0
  //   POST Q1: c == countMin(v, min(v, v.Length), v.Length)
  {
    var v := new int[1] [-7];
    var c := mCountMin(v);
    expect c == 1;
  }

  // Test case for combination {1}/R6:
  //   PRE:  v.Length > 0
  //   POST Q1: c == countMin(v, min(v, v.Length), v.Length)
  {
    var v := new int[1] [-6];
    var c := mCountMin(v);
    expect c == 1;
  }

  // Test case for combination {1}/R7:
  //   PRE:  v.Length > 0
  //   POST Q1: c == countMin(v, min(v, v.Length), v.Length)
  {
    var v := new int[1] [-5];
    var c := mCountMin(v);
    expect c == 1;
  }

  // Test case for combination {1}/R8:
  //   PRE:  v.Length > 0
  //   POST Q1: c == countMin(v, min(v, v.Length), v.Length)
  {
    var v := new int[1] [-4];
    var c := mCountMin(v);
    expect c == 1;
  }

  // Test case for combination {1}/R9:
  //   PRE:  v.Length > 0
  //   POST Q1: c == countMin(v, min(v, v.Length), v.Length)
  {
    var v := new int[1] [-3];
    var c := mCountMin(v);
    expect c == 1;
  }

  // Test case for combination {1}/R10:
  //   PRE:  v.Length > 0
  //   POST Q1: c == countMin(v, min(v, v.Length), v.Length)
  {
    var v := new int[1] [-2];
    var c := mCountMin(v);
    expect c == 1;
  }

}

method Main()
{
  TestsFormCountMin();
  print "TestsFormCountMin: all non-failing tests passed!\n";
}
