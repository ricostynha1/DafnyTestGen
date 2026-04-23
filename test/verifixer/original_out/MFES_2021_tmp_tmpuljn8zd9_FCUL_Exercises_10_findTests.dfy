// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\MFES_2021_tmp_tmpuljn8zd9_FCUL_Exercises_10_find.dfy
// Method: find
// Generated: 2026-04-22 21:35:49

// MFES_2021_tmp_tmpuljn8zd9_FCUL_Exercises_10_find.dfy

method find(a: array<int>, key: int) returns (index: int)
  requires a.Length > 0
  ensures 0 <= index <= a.Length
  ensures index < a.Length ==> a[index] == key
  decreases a, key
{
  index := 0;
  while index < a.Length && a[index] != key
    invariant 0 <= index <= a.Length
    invariant forall x: int {:trigger a[x]} :: 0 <= x < index ==> a[x] != key
    decreases a.Length - index
  {
    index := index + 1;
  }
}


method TestsForfind()
{
  // Test case for combination {1}/Rel:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= index
  //   POST Q2: index <= a.Length
  //   POST Q3: index >= a.Length
  {
    var a := new int[1] [2];
    var key := -10;
    var index := find(a, key);
    expect index == 1;
  }

  // Test case for combination {2}/Rel:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= index <= a.Length
  //   POST Q2: index < a.Length ==> a[index] == key
  {
    var a := new int[2] [-8, -9];
    var key := -9;
    var index := find(a, key);
    expect 0 <= index <= a.Length;
    expect index < a.Length ==> a[index] == key;
    expect index == 1; // observed from implementation
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
    expect index == 0; // observed from implementation
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= index
  //   POST Q2: index <= a.Length
  //   POST Q3: index >= a.Length
  {
    var a := new int[2] [8, -1];
    var key := -10;
    var index := find(a, key);
    expect index == 2;
  }

}

method Main()
{
  TestsForfind();
  print "TestsForfind: all non-failing tests passed!\n";
}
