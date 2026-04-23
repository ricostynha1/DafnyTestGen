// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Dafny-Exercises_tmp_tmpjm75muf__Session3Exercises_ExerciseMaximum.dfy
// Method: mmaximum1
// Generated: 2026-04-22 21:30:44

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
  i := v.Length - 1;
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
    var v := new int[2] [-10, 3];
    var i := mmaximum1(v);
    expect i == 1;
  }

  // Test case for combination {1}/Bi=0:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [10];
    var i := mmaximum1(v);
    expect i == 0;
  }

  // Test case for combination {1}/R2:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [4];
    var i := mmaximum1(v);
    expect i == 0;
  }

  // Test case for combination {1}/R3:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [-6];
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
    var v := new int[2] [10, 4];
    var i := mmaximum2(v);
    expect i == 0;
  }

  // Test case for combination {1}/Bi=1:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[2] [-10, -10];
    var i := mmaximum2(v);
    expect i == 1 || i == 0;
    expect i == 1; // observed from implementation
  }

  // Test case for combination {1}/O|v|=1:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [-10];
    var i := mmaximum2(v);
    expect i == 0;
  }

  // Test case for combination {1}/R3:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [10];
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
    var v := new int[3] [-6, -3, -3];
    var i := mfirstMaximum(v);
    expect i == 1;
  }

  // Test case for combination {1}/Bi=0:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  {
    var v := new int[1] [10];
    var i := mfirstMaximum(v);
    expect i == 0;
  }

  // Test case for combination {1}/R2:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  {
    var v := new int[1] [-10];
    var i := mfirstMaximum(v);
    expect i == 0;
  }

  // Test case for combination {1}/R3:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  {
    var v := new int[1] [9];
    var i := mfirstMaximum(v);
    expect i == 0;
  }

}

method TestsFormlastMaximum()
{
  // Test case for combination {1}/Rel:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[4] [-1, -1, -7, -8];
    var i := mlastMaximum(v);
    expect i == 1;
  }

  // Test case for combination {1}/Bi=0:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[1] [-10];
    var i := mlastMaximum(v);
    expect i == 0;
  }

  // Test case for combination {1}/R2:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[1] [-9];
    var i := mlastMaximum(v);
    expect i == 0;
  }

  // Test case for combination {1}/R3:
  //   PRE:  v.Length > 0
  //   POST Q1: 0 <= i
  //   POST Q2: i < v.Length
  //   POST Q3: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST Q4: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[1] [10];
    var i := mlastMaximum(v);
    expect i == 0;
  }

}

method TestsFormmaxvalue1()
{
  // Test case for combination {1}/Rel:
  //   PRE:  v.Length > 0
  //   POST Q1: m in v[..]
  //   POST Q2: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[2] [-10, -9];
    var m := mmaxvalue1(v);
    expect m == -9;
  }

  // Test case for combination {1}/O|v|=1:
  //   PRE:  v.Length > 0
  //   POST Q1: m in v[..]
  //   POST Q2: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[1] [-10];
    var m := mmaxvalue1(v);
    expect m == -10;
  }

  // Test case for combination {1}/Om=0:
  //   PRE:  v.Length > 0
  //   POST Q1: m in v[..]
  //   POST Q2: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[4] [-1, -10, -9, 0];
    var m := mmaxvalue1(v);
    expect m == 0;
  }

  // Test case for combination {1}/Om>0:
  //   PRE:  v.Length > 0
  //   POST Q1: m in v[..]
  //   POST Q2: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[1] [10];
    var m := mmaxvalue1(v);
    expect m == 10;
  }

}

method TestsFormmaxvalue2()
{
  // Test case for combination {1}/Rel:
  //   PRE:  v.Length > 0
  //   POST Q1: m in v[..]
  //   POST Q2: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[2] [-10, -9];
    var m := mmaxvalue2(v);
    expect m == -9;
  }

  // Test case for combination {1}/O|v|=1:
  //   PRE:  v.Length > 0
  //   POST Q1: m in v[..]
  //   POST Q2: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[1] [-10];
    var m := mmaxvalue2(v);
    expect m == -10;
  }

  // Test case for combination {1}/Om=0:
  //   PRE:  v.Length > 0
  //   POST Q1: m in v[..]
  //   POST Q2: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[4] [-1, -10, -9, 0];
    var m := mmaxvalue2(v);
    expect m == 0;
  }

  // Test case for combination {1}/Om>0:
  //   PRE:  v.Length > 0
  //   POST Q1: m in v[..]
  //   POST Q2: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[1] [10];
    var m := mmaxvalue2(v);
    expect m == 10;
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
