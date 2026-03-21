// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\correct_progs\in\Classify.dfy
// Method: Classify
// Generated: 2026-03-21 12:20:50

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


method GeneratedTests_Classify()
{
  // Test case for combination {2}/Bx=1:
  //   PRE:  -100 <= x <= 100
  //   POST: !(x < 0)
  //   POST: !(x == 0)
  //   POST: r == 1
  {
    var x := 1;
    var r := Classify(x);
    expect r == 1;
  }

  // Test case for combination {2}/Bx=99:
  //   PRE:  -100 <= x <= 100
  //   POST: !(x < 0)
  //   POST: !(x == 0)
  //   POST: r == 1
  {
    var x := 99;
    var r := Classify(x);
    expect r == 1;
  }

  // Test case for combination {2}/Bx=100:
  //   PRE:  -100 <= x <= 100
  //   POST: !(x < 0)
  //   POST: !(x == 0)
  //   POST: r == 1
  {
    var x := 100;
    var r := Classify(x);
    expect r == 1;
  }

  // Test case for combination {3}/Bx=0:
  //   PRE:  -100 <= x <= 100
  //   POST: !(x < 0)
  //   POST: r == 0
  //   POST: !(x > 0)
  {
    var x := 0;
    var r := Classify(x);
    expect r == 0;
  }

  // Test case for combination {5}/Bx=-100:
  //   PRE:  -100 <= x <= 100
  //   POST: r == -1
  //   POST: !(x == 0)
  //   POST: !(x > 0)
  {
    var x := -100;
    var r := Classify(x);
    expect r == -1;
  }

  // Test case for combination {5}/Bx=-99:
  //   PRE:  -100 <= x <= 100
  //   POST: r == -1
  //   POST: !(x == 0)
  //   POST: !(x > 0)
  {
    var x := -99;
    var r := Classify(x);
    expect r == -1;
  }

  // Test case for combination {5}/R3:
  //   PRE:  -100 <= x <= 100
  //   POST: r == -1
  //   POST: !(x == 0)
  //   POST: !(x > 0)
  {
    var x := -4;
    var r := Classify(x);
    expect r == -1;
  }

}

method Main()
{
  GeneratedTests_Classify();
  print "GeneratedTests_Classify: all tests passed!\n";
}
