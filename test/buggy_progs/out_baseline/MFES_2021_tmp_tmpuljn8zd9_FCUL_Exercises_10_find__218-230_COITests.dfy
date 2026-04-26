// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\MFES_2021_tmp_tmpuljn8zd9_FCUL_Exercises_10_find__218-230_COI.dfy
// Method: find
// Generated: 2026-04-24 20:26:56

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
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= index
  //   POST Q2: index <= a.Length
  //   POST Q3: index >= a.Length
  {
    var a := new int[1] [4];
    var key := 0;
    var index := find(a, key);
    // expect index == 1; // got 0
  }

  // Test case for combination {2}:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: a[index] == key
  {
    var a := new int[1] [4];
    var key := 4;
    var index := find(a, key);
    expect index == 0 || index == 1;
    expect index == 1; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bindex=1:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: a[index] == key
  {
    var a := new int[2] [3, 5];
    var key := 5;
    var index := find(a, key);
    // expect index == 1 || index == 2; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= index
  //   POST Q2: index <= a.Length
  //   POST Q3: index >= a.Length
  {
    var a := new int[2] [6, 7];
    var key := 1;
    var index := find(a, key);
    // expect index == 2; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Okey<0:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= index
  //   POST Q2: index <= a.Length
  //   POST Q3: index >= a.Length
  {
    var a := new int[1] [8];
    var key := -1;
    var index := find(a, key);
    // expect index == 1; // got 0
  }

  // Test case for combination {2}/Okey=0:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: a[index] == key
  {
    var a := new int[1] [0];
    var key := 0;
    var index := find(a, key);
    expect index == 0 || index == 1;
    expect index == 1; // observed from implementation
  }

  // Test case for combination {2}/Okey<0:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: a[index] == key
  {
    var a := new int[1] [-1];
    var key := -1;
    var index := find(a, key);
    expect index == 0 || index == 1;
    expect index == 1; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= index
  //   POST Q2: index <= a.Length
  //   POST Q3: index >= a.Length
  {
    var a := new int[1] [9];
    var key := 5;
    var index := find(a, key);
    // expect index == 1; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= index
  //   POST Q2: index <= a.Length
  //   POST Q3: index >= a.Length
  {
    var a := new int[1] [11];
    var key := 10;
    var index := find(a, key);
    // expect index == 1; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= index
  //   POST Q2: index <= a.Length
  //   POST Q3: index >= a.Length
  {
    var a := new int[1] [13];
    var key := 12;
    var index := find(a, key);
    // expect index == 1; // got 0
  }

}

method Main()
{
  TestsForfind();
  print "TestsForfind: all non-failing tests passed!\n";
}
