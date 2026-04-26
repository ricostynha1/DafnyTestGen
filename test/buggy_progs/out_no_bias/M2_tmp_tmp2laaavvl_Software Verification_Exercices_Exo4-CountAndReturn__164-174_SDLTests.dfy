// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\M2_tmp_tmp2laaavvl_Software Verification_Exercices_Exo4-CountAndReturn__164-174_SDL.dfy
// Method: CountToAndReturnN
// Generated: 2026-04-24 12:24:23

// M2_tmp_tmp2laaavvl_Software Verification_Exercices_Exo4-CountAndReturn.dfy

method CountToAndReturnN(n: int) returns (r: int)
  requires n >= 0
  ensures r == n
  decreases n
{
  var i := 0;
  while i < n
    invariant 0 <= i <= n
    decreases n - i
  {
  }
  r := i;
}


method TestsForCountToAndReturnN()
{
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST Q1: r == n
  {
    var n := 0;
    var r := CountToAndReturnN(n);
    expect r == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/On>0:
  //   PRE:  n >= 0
  //   POST Q1: r == n
  {
    var n := 1;
    var r := CountToAndReturnN(n);
    // expect r == 1; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R3:
  //   PRE:  n >= 0
  //   POST Q1: r == n
  {
    var n := 2;
    var r := CountToAndReturnN(n);
    // expect r == 2; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  n >= 0
  //   POST Q1: r == n
  {
    var n := 3;
    var r := CountToAndReturnN(n);
    // expect r == 3; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  n >= 0
  //   POST Q1: r == n
  {
    var n := 4;
    var r := CountToAndReturnN(n);
    // expect r == 4; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  n >= 0
  //   POST Q1: r == n
  {
    var n := 5;
    var r := CountToAndReturnN(n);
    // expect r == 5; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  n >= 0
  //   POST Q1: r == n
  {
    var n := 6;
    var r := CountToAndReturnN(n);
    // expect r == 6; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  n >= 0
  //   POST Q1: r == n
  {
    var n := 7;
    var r := CountToAndReturnN(n);
    // expect r == 7; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  n >= 0
  //   POST Q1: r == n
  {
    var n := 8;
    var r := CountToAndReturnN(n);
    // expect r == 8; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   PRE:  n >= 0
  //   POST Q1: r == n
  {
    var n := 9;
    var r := CountToAndReturnN(n);
    // expect r == 9; // got 0
  }

}

method Main()
{
  TestsForCountToAndReturnN();
  print "TestsForCountToAndReturnN: all non-failing tests passed!\n";
}
