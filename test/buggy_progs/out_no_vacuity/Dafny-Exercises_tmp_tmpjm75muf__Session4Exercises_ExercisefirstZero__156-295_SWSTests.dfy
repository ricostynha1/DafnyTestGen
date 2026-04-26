// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny-Exercises_tmp_tmpjm75muf__Session4Exercises_ExercisefirstZero__156-295_SWS.dfy
// Method: mfirstCero
// Generated: 2026-04-24 16:11:16

// Dafny-Exercises_tmp_tmpjm75muf__Session4Exercises_ExercisefirstZero.dfy

method mfirstCero(v: array<int>) returns (i: int)
  ensures 0 <= i <= v.Length
  ensures forall j: int {:trigger v[j]} :: 0 <= j < i ==> v[j] != 0
  ensures i != v.Length ==> v[i] == 0
  decreases v
{
  while i < v.Length && v[i] != 0
    invariant 0 <= i <= v.Length
    invariant forall j: int {:trigger v[j]} :: 0 <= j < i ==> v[j] != 0
    decreases v.Length - i
  {
    i := i + 1;
  }
  i := 0;
}


method TestsFormfirstCero()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   POST Q1: 0 <= i
  //   POST Q2: i == v.Length
  //   POST Q3: forall j: int {:trigger v[j]} :: 0 <= j < i ==> v[j] != 0
  {
    var v := new int[1] [-10];
    var i := mfirstCero(v);
    // expect i == 1; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Rel:
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall j: int {:trigger v[j]} :: 0 <= j < i ==> v[j] != 0
  //   POST Q4: v[i] == 0
  {
    var v := new int[8] [6, -1, -5, 0, 0, 0, 0, 0];
    var i := mfirstCero(v);
    // expect i == 3; // got 0
  }

  // Test case for combination {1}/Bi=0:
  //   POST Q1: 0 <= i
  //   POST Q2: i == v.Length
  //   POST Q3: forall j: int {:trigger v[j]} :: 0 <= j < i ==> v[j] != 0
  {
    var v := new int[0] [];
    var i := mfirstCero(v);
    expect i == 0;
  }

  // Test case for combination {2}/Bi=0:
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall j: int {:trigger v[j]} :: 0 <= j < i ==> v[j] != 0
  //   POST Q4: v[i] == 0
  {
    var v := new int[1] [0];
    var i := mfirstCero(v);
    expect i == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bi=1:
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall j: int {:trigger v[j]} :: 0 <= j < i ==> v[j] != 0
  //   POST Q4: v[i] == 0
  {
    var v := new int[2] [-10, 0];
    var i := mfirstCero(v);
    // expect i == 1; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|v|>=2:
  //   POST Q1: 0 <= i
  //   POST Q2: i == v.Length
  //   POST Q3: forall j: int {:trigger v[j]} :: 0 <= j < i ==> v[j] != 0
  {
    var v := new int[2] [-10, -1];
    var i := mfirstCero(v);
    // expect i == 2; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R3:
  //   POST Q1: 0 <= i
  //   POST Q2: i == v.Length
  //   POST Q3: forall j: int {:trigger v[j]} :: 0 <= j < i ==> v[j] != 0
  {
    var v := new int[1] [-9];
    var i := mfirstCero(v);
    // expect i == 1; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   POST Q1: 0 <= i
  //   POST Q2: i == v.Length
  //   POST Q3: forall j: int {:trigger v[j]} :: 0 <= j < i ==> v[j] != 0
  {
    var v := new int[1] [-8];
    var i := mfirstCero(v);
    // expect i == 1; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   POST Q1: 0 <= i
  //   POST Q2: i == v.Length
  //   POST Q3: forall j: int {:trigger v[j]} :: 0 <= j < i ==> v[j] != 0
  {
    var v := new int[1] [-7];
    var i := mfirstCero(v);
    // expect i == 1; // got 0
  }

}

method Main()
{
  TestsFormfirstCero();
  print "TestsFormfirstCero: all non-failing tests passed!\n";
}
