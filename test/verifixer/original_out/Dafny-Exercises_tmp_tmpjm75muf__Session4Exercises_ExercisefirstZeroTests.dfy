// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Dafny-Exercises_tmp_tmpjm75muf__Session4Exercises_ExercisefirstZero.dfy
// Method: mfirstCero
// Generated: 2026-04-01 13:50:33

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


method Passing()
{
  // Test case for combination {1}:
  //   POST: 0 <= i <= v.Length
  //   POST: forall j: int {:trigger v[j]} :: 0 <= j < i ==> v[j] != 0
  //   POST: !(i != v.Length)
  {
    var v := new int[1] [8];
    var i := mfirstCero(v);
    expect i == 1;
  }

  // Test case for combination {2}:
  //   POST: 0 <= i <= v.Length
  //   POST: forall j: int {:trigger v[j]} :: 0 <= j < i ==> v[j] != 0
  //   POST: v[i] == 0
  {
    var v := new int[1] [0];
    var i := mfirstCero(v);
    expect i == 0;
  }

  // Test case for combination {1}/Bv=0:
  //   POST: 0 <= i <= v.Length
  //   POST: forall j: int {:trigger v[j]} :: 0 <= j < i ==> v[j] != 0
  //   POST: !(i != v.Length)
  {
    var v := new int[0] [];
    var i := mfirstCero(v);
    expect i == 0;
  }

  // Test case for combination {1}/Bv=2:
  //   POST: 0 <= i <= v.Length
  //   POST: forall j: int {:trigger v[j]} :: 0 <= j < i ==> v[j] != 0
  //   POST: !(i != v.Length)
  {
    var v := new int[2] [3, 4];
    var i := mfirstCero(v);
    expect i == 2;
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
