// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\M2_tmp_tmp2laaavvl_Software Verification_Exercices_Exo4-CountAndReturn__164-174_SDL.dfy
// Method: CountToAndReturnN
// Generated: 2026-04-22 21:51:47

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
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST Q1: r == n
  {
    var n := 10;
    var r := CountToAndReturnN(n);
    // expect r == 10; // got 0
  }

  // Test case for combination {1}/On=0:
  //   PRE:  n >= 0
  //   POST Q1: r == n
  {
    var n := 0;
    var r := CountToAndReturnN(n);
    expect r == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R3:
  //   PRE:  n >= 0
  //   POST Q1: r == n
  {
    var n := 9;
    var r := CountToAndReturnN(n);
    // expect r == 9; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  n >= 0
  //   POST Q1: r == n
  {
    var n := 8;
    var r := CountToAndReturnN(n);
    // expect r == 8; // got 0
  }

}

method Main()
{
  TestsForCountToAndReturnN();
  print "TestsForCountToAndReturnN: all non-failing tests passed!\n";
}
