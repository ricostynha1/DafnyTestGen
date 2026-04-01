// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\M2_tmp_tmp2laaavvl_Software Verification_Exercices_Exo4-CountAndReturn__164-174_SDL.dfy
// Method: CountToAndReturnN
// Generated: 2026-04-01 22:36:26

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST: r == n
  {
    var n := 0;
    expect n >= 0; // PRE-CHECK
    var r := CountToAndReturnN(n);
    expect r == 0;
  }

}

method Failing()
{
  // Test case for combination {1}/Bn=1:
  //   PRE:  n >= 0
  //   POST: r == n
  {
    var n := 1;
    // expect n >= 0; // PRE-CHECK
    var r := CountToAndReturnN(n);
    // expect r == 1;
  }

  // Test case for combination {1}/R3:
  //   PRE:  n >= 0
  //   POST: r == n
  {
    var n := 2;
    // expect n >= 0; // PRE-CHECK
    var r := CountToAndReturnN(n);
    // expect r == 2;
  }

}

method Main()
{
  Passing();
  Failing();
}
