// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\MFES_2021_tmp_tmpuljn8zd9_FCUL_Exercises_10_find__218-230_COI.dfy
// Method: find
// Generated: 2026-04-08 16:20:22

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


method Passing()
{
  // Test case for combination {3}:
  //   PRE:  a.Length > 0
  //   POST: 0 <= index <= a.Length
  //   POST: index < a.Length
  //   POST: a[index] == key
  //   ENSURES: 0 <= index <= a.Length
  //   ENSURES: index < a.Length ==> a[index] == key
  {
    var a := new int[1] [4];
    var key := 4;
    var index := find(a, key);
    expect index == 1;
  }

  // Test case for combination {3}/Ba=1,key=0:
  //   PRE:  a.Length > 0
  //   POST: 0 <= index <= a.Length
  //   POST: index < a.Length
  //   POST: a[index] == key
  //   ENSURES: 0 <= index <= a.Length
  //   ENSURES: index < a.Length ==> a[index] == key
  {
    var a := new int[1] [0];
    var key := 0;
    var index := find(a, key);
    expect index == 1;
  }

  // Test case for combination {3}/Ba=1,key=1:
  //   PRE:  a.Length > 0
  //   POST: 0 <= index <= a.Length
  //   POST: index < a.Length
  //   POST: a[index] == key
  //   ENSURES: 0 <= index <= a.Length
  //   ENSURES: index < a.Length ==> a[index] == key
  {
    var a := new int[1] [1];
    var key := 1;
    var index := find(a, key);
    expect index == 1;
  }

  // Test case for combination {3}/Oindex=0:
  //   PRE:  a.Length > 0
  //   POST: 0 <= index <= a.Length
  //   POST: index < a.Length
  //   POST: a[index] == key
  //   ENSURES: 0 <= index <= a.Length
  //   ENSURES: index < a.Length ==> a[index] == key
  {
    var a := new int[1] [3];
    var key := 3;
    var index := find(a, key);
    expect index == 1;
  }

}

method Failing()
{
  // Test case for combination {3}/Ba=2,key=0:
  //   PRE:  a.Length > 0
  //   POST: 0 <= index <= a.Length
  //   POST: index < a.Length
  //   POST: a[index] == key
  //   ENSURES: 0 <= index <= a.Length
  //   ENSURES: index < a.Length ==> a[index] == key
  {
    var a := new int[2] [0, 5];
    var key := 0;
    var index := find(a, key);
    // expect index == 0;
  }

  // Test case for combination {3}/Oindex>0:
  //   PRE:  a.Length > 0
  //   POST: 0 <= index <= a.Length
  //   POST: index < a.Length
  //   POST: a[index] == key
  //   ENSURES: 0 <= index <= a.Length
  //   ENSURES: index < a.Length ==> a[index] == key
  {
    var a := new int[2] [5, 8];
    var key := 8;
    var index := find(a, key);
    // expect index == 1;
  }

}

method Main()
{
  Passing();
  Failing();
}
