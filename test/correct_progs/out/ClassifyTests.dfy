// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Classify.dfy
// Method: Classify
// Generated: 2026-04-22 21:25:44

// Classifies a number within a bounded range.
method Classify(x: int) returns (r: int)
  requires -100 <= x <= 100
  ensures x < 0 ==> r == -1
  ensures x == 0 ==> r == 0
  ensures x > 0 ==> r == 1
{
  if x < 0 {
    r := -1;
  } else if x == 0 {
    r := 0;
  } else {
    r := 1;
  }
}


method TestsForClassify()
{
  // Test case for combination {1}:
  //   PRE:  -100 <= x <= 100
  //   POST Q1: x > 0
  //   POST Q2: r == 1
  {
    var x := 10;
    var r := Classify(x);
    expect r == 1;
  }

  // Test case for combination {2}:
  //   PRE:  -100 <= x <= 100
  //   POST Q1: x == 0
  //   POST Q2: r == 0
  {
    var x := 0;
    var r := Classify(x);
    expect r == 0;
  }

  // Test case for combination {3}:
  //   PRE:  -100 <= x <= 100
  //   POST Q1: x < 0
  //   POST Q2: r == -1
  {
    var x := -10;
    var r := Classify(x);
    expect r == -1;
  }

  // Test case for combination {1}/Bx=1:
  //   PRE:  -100 <= x <= 100
  //   POST Q1: x > 0
  //   POST Q2: r == 1
  {
    var x := 1;
    var r := Classify(x);
    expect r == 1;
  }

}

method Main()
{
  TestsForClassify();
  print "TestsForClassify: all non-failing tests passed!\n";
}
