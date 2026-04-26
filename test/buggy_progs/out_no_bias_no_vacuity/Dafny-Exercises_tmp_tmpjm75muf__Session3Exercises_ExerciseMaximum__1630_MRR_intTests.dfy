// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny-Exercises_tmp_tmpjm75muf__Session3Exercises_ExerciseMaximum__1630_MRR_int.dfy
// Method: mmaximum1
// Generated: 2026-04-24 22:06:22

// Dafny-Exercises_tmp_tmpjm75muf__Session3Exercises_ExerciseMaximum.dfy

method mmaximum1(v: array<int>) returns (i: int)
  requires v.Length > 0
  ensures 0 <= i < v.Length
  ensures forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  decreases v
{
  var j := 1;
  i := 0;
  while j < v.Length
    invariant 0 <= j <= v.Length
    invariant 0 <= i < j
    invariant forall k: int {:trigger v[k]} :: 0 <= k < j ==> v[i] >= v[k]
    decreases v.Length - j
  {
    if v[j] > v[i] {
      i := j;
    }
    j := j + 1;
  }
}

method mmaximum2(v: array<int>) returns (i: int)
  requires v.Length > 0
  ensures 0 <= i < v.Length
  ensures forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  decreases v
{
  var j := v.Length - 2;
  i := v.Length - 1;
  while j >= 0
    invariant 0 <= i < v.Length
    invariant -1 <= j < v.Length - 1
    invariant forall k: int {:trigger v[k]} :: v.Length > k > j ==> v[k] <= v[i]
    decreases j
  {
    if v[j] > v[i] {
      i := j;
    }
    j := j - 1;
  }
}

method mfirstMaximum(v: array<int>) returns (i: int)
  requires v.Length > 0
  ensures 0 <= i < v.Length
  ensures forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  ensures forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  decreases v
{
  var j := 1;
  i := 0;
  while j < v.Length
    invariant 0 <= j <= v.Length
    invariant 0 <= i < j
    invariant forall k: int {:trigger v[k]} :: 0 <= k < j ==> v[i] >= v[k]
    invariant forall k: int {:trigger v[k]} :: 0 <= k < i ==> v[i] > v[k]
    decreases v.Length - j
  {
    if v[j] > v[i] {
      i := j;
    }
    j := j + 1;
  }
}

method mlastMaximum(v: array<int>) returns (i: int)
  requires v.Length > 0
  ensures 0 <= i < v.Length
  ensures forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  ensures forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  decreases v
{
  var j := v.Length - 2;
  i := 0 - 1;
  while j >= 0
    invariant -1 <= j < v.Length - 1
    invariant 0 <= i < v.Length
    invariant forall k: int {:trigger v[k]} :: v.Length > k > j ==> v[k] <= v[i]
    invariant forall k: int {:trigger v[k]} :: v.Length > k > i ==> v[k] < v[i]
    decreases j
  {
    if v[j] > v[i] {
      i := j;
    }
    j := j - 1;
  }
}

method mmaxvalue1(v: array<int>) returns (m: int)
  requires v.Length > 0
  ensures m in v[..]
  ensures forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  decreases v
{
  var i := mmaximum1(v);
  m := v[i];
}

method mmaxvalue2(v: array<int>) returns (m: int)
  requires v.Length > 0
  ensures m in v[..]
  ensures forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  decreases v
{
  var i := mmaximum2(v);
  m := v[i];
}


method TestsFormmaximum1()
{
  // Test case for combination {1}/Rel:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[2] [3026, 3025];
    var i := mmaximum1(v);
    expect i == 0;
  }

  // Test case for combination {1}/Bi=1:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[2] [-400, 175];
    var i := mmaximum1(v);
    expect i == 1;
  }

  // Test case for combination {1}/O|v|=1:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [0];
    var i := mmaximum1(v);
    expect i == 0;
  }

  // Test case for combination {1}/R3:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [-1];
    var i := mmaximum1(v);
    expect i == 0;
  }

  // Test case for combination {1}/R4:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [-2];
    var i := mmaximum1(v);
    expect i == 0;
  }

  // Test case for combination {1}/R5:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [-3];
    var i := mmaximum1(v);
    expect i == 0;
  }

  // Test case for combination {1}/R6:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [-4];
    var i := mmaximum1(v);
    expect i == 0;
  }

  // Test case for combination {1}/R7:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [-5];
    var i := mmaximum1(v);
    expect i == 0;
  }

  // Test case for combination {1}/R8:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [-6];
    var i := mmaximum1(v);
    expect i == 0;
  }

  // Test case for combination {1}/R9:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [-7];
    var i := mmaximum1(v);
    expect i == 0;
  }

}

method TestsFormmaximum2()
{
  // Test case for combination {1}/Rel:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[2] [3026, 3025];
    var i := mmaximum2(v);
    expect i == 0;
  }

  // Test case for combination {1}/Bi=1:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[2] [-400, 175];
    var i := mmaximum2(v);
    expect i == 1;
  }

  // Test case for combination {1}/O|v|=1:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [0];
    var i := mmaximum2(v);
    expect i == 0;
  }

  // Test case for combination {1}/R3:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [-1];
    var i := mmaximum2(v);
    expect i == 0;
  }

  // Test case for combination {1}/R4:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [-2];
    var i := mmaximum2(v);
    expect i == 0;
  }

  // Test case for combination {1}/R5:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [-3];
    var i := mmaximum2(v);
    expect i == 0;
  }

  // Test case for combination {1}/R6:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [-4];
    var i := mmaximum2(v);
    expect i == 0;
  }

  // Test case for combination {1}/R7:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [-5];
    var i := mmaximum2(v);
    expect i == 0;
  }

  // Test case for combination {1}/R8:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [-6];
    var i := mmaximum2(v);
    expect i == 0;
  }

  // Test case for combination {1}/R9:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [-7];
    var i := mmaximum2(v);
    expect i == 0;
  }

}

method TestsFormfirstMaximum()
{
  // Test case for combination {1}/Rel:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  {
    var v := new int[4] [1769, 101498, 101499, 101499];
    var i := mfirstMaximum(v);
    expect i == 2;
  }

  // Test case for combination {1}/Bi=0:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  {
    var v := new int[1] [175];
    var i := mfirstMaximum(v);
    expect i == 0;
  }

  // Test case for combination {1}/Bi=1:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  {
    var v := new int[2] [399, 400];
    var i := mfirstMaximum(v);
    expect i == 1;
  }

  // Test case for combination {1}/R3:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  {
    var v := new int[1] [0];
    var i := mfirstMaximum(v);
    expect i == 0;
  }

  // Test case for combination {1}/R4:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  {
    var v := new int[1] [-1];
    var i := mfirstMaximum(v);
    expect i == 0;
  }

  // Test case for combination {1}/R5:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  {
    var v := new int[1] [-2];
    var i := mfirstMaximum(v);
    expect i == 0;
  }

  // Test case for combination {1}/R6:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  {
    var v := new int[1] [-3];
    var i := mfirstMaximum(v);
    expect i == 0;
  }

  // Test case for combination {1}/R7:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  {
    var v := new int[1] [-4];
    var i := mfirstMaximum(v);
    expect i == 0;
  }

  // Test case for combination {1}/R8:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  {
    var v := new int[1] [-5];
    var i := mfirstMaximum(v);
    expect i == 0;
  }

  // Test case for combination {1}/R9:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  {
    var v := new int[1] [-6];
    var i := mfirstMaximum(v);
    expect i == 0;
  }

}

method TestsFormlastMaximum()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[3] [151422, 151422, 151421];
    var i := mlastMaximum(v);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.mlastMaximum(BigInteger[] v) in C:\cygwin64\tmp\DafnyCBT_gtkuu2flfug\runner.cs:line 6639
    // runtime error: at _module.__default.TestCase__30() in C:\cygwin64\tmp\DafnyCBT_gtkuu2flfug\runner.cs:line 7540
    // expect i == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bi=0:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[1] [400];
    var i := mlastMaximum(v);
    // expect i == 0; // got -1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R2:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[1] [399];
    var i := mlastMaximum(v);
    // expect i == 0; // got -1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R3:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[1] [398];
    var i := mlastMaximum(v);
    // expect i == 0; // got -1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[1] [397];
    var i := mlastMaximum(v);
    // expect i == 0; // got -1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[1] [396];
    var i := mlastMaximum(v);
    // expect i == 0; // got -1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[1] [395];
    var i := mlastMaximum(v);
    // expect i == 0; // got -1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[1] [394];
    var i := mlastMaximum(v);
    // expect i == 0; // got -1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[1] [393];
    var i := mlastMaximum(v);
    // expect i == 0; // got -1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[1] [392];
    var i := mlastMaximum(v);
    // expect i == 0; // got -1
  }

}

method TestsFormmaxvalue1()
{
  // Test case for combination {1}/Rel:
  //   PRE:  v.Length > 0
  //   POST Q1: m in v[..]
  //   POST Q2: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[2] [174, 175];
    var m := mmaxvalue1(v);
    expect m == 175;
  }

  // Test case for combination {1}/O|v|=1:
  //   PRE:  v.Length > 0
  //   POST Q1: m in v[..]
  //   POST Q2: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[1] [2];
    var m := mmaxvalue1(v);
    expect m == 2;
  }

  // Test case for combination {1}/Om=0:
  //   PRE:  v.Length > 0
  //   POST Q1: m in v[..]
  //   POST Q2: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[1] [0];
    var m := mmaxvalue1(v);
    expect m == 0;
  }

  // Test case for combination {1}/Om<0:
  //   PRE:  v.Length > 0
  //   POST Q1: m in v[..]
  //   POST Q2: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[1] [-1];
    var m := mmaxvalue1(v);
    expect m == -1;
  }

}

method TestsFormmaxvalue2()
{
  // Test case for combination {1}/Rel:
  //   PRE:  v.Length > 0
  //   POST Q1: m in v[..]
  //   POST Q2: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[2] [174, 175];
    var m := mmaxvalue2(v);
    expect m == 175;
  }

  // Test case for combination {1}/O|v|=1:
  //   PRE:  v.Length > 0
  //   POST Q1: m in v[..]
  //   POST Q2: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[1] [2];
    var m := mmaxvalue2(v);
    expect m == 2;
  }

  // Test case for combination {1}/Om=0:
  //   PRE:  v.Length > 0
  //   POST Q1: m in v[..]
  //   POST Q2: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[1] [0];
    var m := mmaxvalue2(v);
    expect m == 0;
  }

  // Test case for combination {1}/Om<0:
  //   PRE:  v.Length > 0
  //   POST Q1: m in v[..]
  //   POST Q2: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[1] [-1];
    var m := mmaxvalue2(v);
    expect m == -1;
  }

}

method Main()
{
  TestsFormmaximum1();
  print "TestsFormmaximum1: all non-failing tests passed!\n";
  TestsFormmaximum2();
  print "TestsFormmaximum2: all non-failing tests passed!\n";
  TestsFormfirstMaximum();
  print "TestsFormfirstMaximum: all non-failing tests passed!\n";
  TestsFormlastMaximum();
  print "TestsFormlastMaximum: all non-failing tests passed!\n";
  TestsFormmaxvalue1();
  print "TestsFormmaxvalue1: all non-failing tests passed!\n";
  TestsFormmaxvalue2();
  print "TestsFormmaxvalue2: all non-failing tests passed!\n";
}
