// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Classify.dfy
// Method: Classify
// Generated: 2026-04-17 19:27:06

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
  // Test case for combination {2}:
  //   PRE:  -100 <= x <= 100
  //   POST: !(x < 0)
  //   POST: !(x == 0)
  //   POST: x > 0
  //   POST: r == 1
  //   ENSURES: x < 0 ==> r == -1
  //   ENSURES: x == 0 ==> r == 0
  //   ENSURES: x > 0 ==> r == 1
  {
    var x := 97;
    var r := Classify(x);
    expect r == 1;
  }

  // Test case for combination {3}:
  //   PRE:  -100 <= x <= 100
  //   POST: !(x < 0)
  //   POST: x == 0
  //   POST: r == 0
  //   POST: !(x > 0)
  //   ENSURES: x < 0 ==> r == -1
  //   ENSURES: x == 0 ==> r == 0
  //   ENSURES: x > 0 ==> r == 1
  {
    var x := 0;
    var r := Classify(x);
    expect r == 0;
  }

  // Test case for combination {4}:
  //   PRE:  -100 <= x <= 100
  //   POST: x < 0
  //   POST: r == -1
  //   POST: !(x == 0)
  //   POST: !(x > 0)
  //   ENSURES: x < 0 ==> r == -1
  //   ENSURES: x == 0 ==> r == 0
  //   ENSURES: x > 0 ==> r == 1
  {
    var x := -4;
    var r := Classify(x);
    expect r == -1;
  }

  // Test case for combination {2}/R2:
  //   PRE:  -100 <= x <= 100
  //   POST: !(x < 0)
  //   POST: !(x == 0)
  //   POST: x > 0
  //   POST: r == 1
  //   ENSURES: x < 0 ==> r == -1
  //   ENSURES: x == 0 ==> r == 0
  //   ENSURES: x > 0 ==> r == 1
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
