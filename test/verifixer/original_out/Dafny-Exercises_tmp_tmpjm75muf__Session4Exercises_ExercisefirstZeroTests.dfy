// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Dafny-Exercises_tmp_tmpjm75muf__Session4Exercises_ExercisefirstZero.dfy
// Method: mfirstCero
// Generated: 2026-04-22 21:30:57

// Dafny-Exercises_tmp_tmpjm75muf__Session4Exercises_ExercisefirstZero.dfy

method mfirstCero(v: array<int>) returns (i: int)
  ensures 0 <= i <= v.Length
  ensures forall j: int {:trigger v[j]} :: 0 <= j < i ==> v[j] != 0
  ensures i != v.Length ==> v[i] == 0
  decreases v
{
  i := 0;
  while i < v.Length && v[i] != 0
    invariant 0 <= i <= v.Length
    invariant forall j: int {:trigger v[j]} :: 0 <= j < i ==> v[j] != 0
    decreases v.Length - i
  {
    i := i + 1;
  }
}


method TestsFormfirstCero()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: 0 <= i
  //   POST Q2: i == v.Length
  //   POST Q3: forall j: int {:trigger v[j]} :: 0 <= j < i ==> v[j] != 0
  {
    var v := new int[1] [-10];
    var i := mfirstCero(v);
    expect i == 1;
  }

  // Test case for combination {2}/Rel:
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall j: int {:trigger v[j]} :: 0 <= j < i ==> v[j] != 0
  //   POST Q4: v[i] == 0
  {
    var v := new int[8] [-1, -7, -2, 0, 0, 0, 0, 0];
    var i := mfirstCero(v);
    expect i == 3;
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

}

method Main()
{
  TestsFormfirstCero();
  print "TestsFormfirstCero: all non-failing tests passed!\n";
}
