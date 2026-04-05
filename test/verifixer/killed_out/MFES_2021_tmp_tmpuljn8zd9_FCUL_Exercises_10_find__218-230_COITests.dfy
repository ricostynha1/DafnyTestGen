// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\MFES_2021_tmp_tmpuljn8zd9_FCUL_Exercises_10_find__218-230_COI.dfy
// Method: find
// Generated: 2026-04-05 23:54:49

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
  // (no passing tests)
}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST: 0 <= index <= a.Length
  //   POST: !(index < a.Length)
  {
    var a := new int[1] [4];
    var key := 0;
    var index := find(a, key);
    // expect index == 1;
  }

  // Test case for combination {2}:
  //   PRE:  a.Length > 0
  //   POST: 0 <= index <= a.Length
  //   POST: a[index] == key
  {
    var a := new int[1] [4];
    var key := 4;
    var index := find(a, key);
    // expect index == 0;
  }

  // Test case for combination {1}/Ba=1,key=1:
  //   PRE:  a.Length > 0
  //   POST: 0 <= index <= a.Length
  //   POST: !(index < a.Length)
  {
    var a := new int[1] [2];
    var key := 1;
    var index := find(a, key);
    // expect index == 1;
  }

  // Test case for combination {1}/Ba=2,key=0:
  //   PRE:  a.Length > 0
  //   POST: 0 <= index <= a.Length
  //   POST: !(index < a.Length)
  {
    var a := new int[2] [4, 3];
    var key := 0;
    var index := find(a, key);
    // expect index == 2;
  }

}

method Main()
{
  Passing();
  Failing();
}
