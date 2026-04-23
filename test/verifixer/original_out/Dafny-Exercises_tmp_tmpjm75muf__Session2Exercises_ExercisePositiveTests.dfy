// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Dafny-Exercises_tmp_tmpjm75muf__Session2Exercises_ExercisePositive.dfy
// Method: mpositive
// Generated: 2026-04-22 21:30:28

// Dafny-Exercises_tmp_tmpjm75muf__Session2Exercises_ExercisePositive.dfy

predicate positive(s: seq<int>)
  decreases s
{
  forall u: int {:trigger s[u]} :: 
    0 <= u < |s| ==>
      s[u] >= 0
}

method mpositive(v: array<int>) returns (b: bool)
  ensures b == positive(v[0 .. v.Length])
  decreases v
{
  var i := 0;
  while i < v.Length && v[i] >= 0
    invariant 0 <= i <= v.Length
    invariant positive(v[..i])
    decreases v.Length - i
  {
    i := i + 1;
  }
  b := i == v.Length;
}

method mpositive3(v: array<int>) returns (b: bool)
  ensures b == positive(v[0 .. v.Length])
  decreases v
{
  var i := 0;
  b := true;
  while i < v.Length && b
    invariant 0 <= i <= v.Length
    invariant b == positive(v[0 .. i])
    invariant !b ==> !positive(v[0 .. v.Length])
    decreases v.Length - i
  {
    b := v[i] >= 0;
    i := i + 1;
  }
}

method mpositive4(v: array<int>) returns (b: bool)
  ensures b == positive(v[0 .. v.Length])
  decreases v
{
  var i := 0;
  b := true;
  while i < v.Length && b
    invariant 0 <= i <= v.Length
    invariant b == positive(v[0 .. i])
    invariant !b ==> !positive(v[0 .. v.Length])
    decreases v.Length - i
  {
    b := v[i] >= 0;
    i := i + 1;
  }
}

method mpositivertl(v: array<int>) returns (b: bool)
  ensures b == positive(v[0 .. v.Length])
  decreases v
{
  var i := v.Length - 1;
  while i >= 0 && v[i] >= 0
    invariant -1 <= i < v.Length
    invariant positive(v[i + 1..])
    decreases i
  {
    i := i - 1;
  }
  b := i == -1;
}


method TestsFormpositive()
{
  // Test case for combination {1}:
  //   POST Q1: b == positive(v[0 .. v.Length])
  {
    var v := new int[1] [-10];
    var b := mpositive(v);
    expect b == false;
  }

  // Test case for combination {1}/O|v|=0:
  //   POST Q1: b == positive(v[0 .. v.Length])
  {
    var v := new int[0] [];
    var b := mpositive(v);
    expect b == true;
  }

  // Test case for combination {1}/O|v|>=2:
  //   POST Q1: b == positive(v[0 .. v.Length])
  {
    var v := new int[2] [7, -3];
    var b := mpositive(v);
    expect b == false;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: b == positive(v[0 .. v.Length])
  {
    var v := new int[1] [-9];
    var b := mpositive(v);
    expect b == false;
  }

}

method TestsFormpositive3()
{
  // Test case for combination {1}:
  //   POST Q1: b == positive(v[0 .. v.Length])
  {
    var v := new int[1] [-10];
    var b := mpositive3(v);
    expect b == false;
  }

  // Test case for combination {1}/O|v|=0:
  //   POST Q1: b == positive(v[0 .. v.Length])
  {
    var v := new int[0] [];
    var b := mpositive3(v);
    expect b == true;
  }

  // Test case for combination {1}/O|v|>=2:
  //   POST Q1: b == positive(v[0 .. v.Length])
  {
    var v := new int[2] [-1, -10];
    var b := mpositive3(v);
    expect b == false;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: b == positive(v[0 .. v.Length])
  {
    var v := new int[1] [-9];
    var b := mpositive3(v);
    expect b == false;
  }

}

method TestsFormpositive4()
{
  // Test case for combination {1}:
  //   POST Q1: b == positive(v[0 .. v.Length])
  {
    var v := new int[1] [7];
    var b := mpositive4(v);
    expect b == true;
  }

  // Test case for combination {1}/O|v|=0:
  //   POST Q1: b == positive(v[0 .. v.Length])
  {
    var v := new int[0] [];
    var b := mpositive4(v);
    expect b == true;
  }

  // Test case for combination {1}/O|v|>=2:
  //   POST Q1: b == positive(v[0 .. v.Length])
  {
    var v := new int[2] [-1, -5];
    var b := mpositive4(v);
    expect b == false;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: b == positive(v[0 .. v.Length])
  {
    var v := new int[1] [-10];
    var b := mpositive4(v);
    expect b == false;
  }

}

method TestsFormpositivertl()
{
  // Test case for combination {1}:
  //   POST Q1: b == positive(v[0 .. v.Length])
  {
    var v := new int[1] [2];
    var b := mpositivertl(v);
    expect b == true;
  }

  // Test case for combination {1}/O|v|=0:
  //   POST Q1: b == positive(v[0 .. v.Length])
  {
    var v := new int[0] [];
    var b := mpositivertl(v);
    expect b == true;
  }

  // Test case for combination {1}/O|v|>=2:
  //   POST Q1: b == positive(v[0 .. v.Length])
  {
    var v := new int[2] [-1, -9];
    var b := mpositivertl(v);
    expect b == false;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: b == positive(v[0 .. v.Length])
  {
    var v := new int[1] [-10];
    var b := mpositivertl(v);
    expect b == false;
  }

}

method Main()
{
  TestsFormpositive();
  print "TestsFormpositive: all non-failing tests passed!\n";
  TestsFormpositive3();
  print "TestsFormpositive3: all non-failing tests passed!\n";
  TestsFormpositive4();
  print "TestsFormpositive4: all non-failing tests passed!\n";
  TestsFormpositivertl();
  print "TestsFormpositivertl: all non-failing tests passed!\n";
}
