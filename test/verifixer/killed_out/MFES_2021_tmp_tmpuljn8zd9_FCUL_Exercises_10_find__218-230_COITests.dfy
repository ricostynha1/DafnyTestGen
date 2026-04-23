// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\MFES_2021_tmp_tmpuljn8zd9_FCUL_Exercises_10_find__218-230_COI.dfy
// Method: find
// Generated: 2026-04-22 21:51:53

// MFES_2021_tmp_tmpuljn8zd9_FCUL_Exercises_10_find.dfy

method find(a: array<int>, key: int) returns (index: int)
  requires a.Length > 0
  ensures 0 <= index <= a.Length
  ensures index < a.Length ==> a[index] == key
  decreases a, key
{
  index := 0;
  while index < a.Length && !(a[index] != key)
    invariant 0 <= index <= a.Length
    invariant forall x: int {:trigger a[x]} :: 0 <= x < index ==> a[x] != key
    decreases a.Length - index
  {
    index := index + 1;
  }
}


method TestsForfind()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= index
  //   POST Q2: index <= a.Length
  //   POST Q3: index >= a.Length
  {
    var a := new int[1] [6];
    var key := -10;
    var index := find(a, key);
    // expect index == 1; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Rel:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= index <= a.Length
  //   POST Q2: index < a.Length ==> a[index] == key
  {
    var a := new int[2] [-10, -9];
    var key := -9;
    var index := find(a, key);
    // actual runtime state: index=0
    // expect 0 <= index <= a.Length; // got true
    // expect index < a.Length ==> a[index] == key; // got false
  }

  // Test case for combination {2}/Bindex=0:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: a[index] == key
  {
    var a := new int[1] [-10];
    var key := -10;
    var index := find(a, key);
    expect index == 0 || index == 1;
    expect index == 1; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= index
  //   POST Q2: index <= a.Length
  //   POST Q3: index >= a.Length
  {
    var a := new int[2] [-1, -3];
    var key := -10;
    var index := find(a, key);
    // expect index == 2; // got 0
  }

}

method Main()
{
  TestsForfind();
  print "TestsForfind: all non-failing tests passed!\n";
}
