// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\M2_tmp_tmp2laaavvl_Software Verification_Exercices_Exo4-CountAndReturn.dfy
// Method: CountToAndReturnN
// Generated: 2026-03-26 14:58:52

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
    i := i + 1;
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
    var r := CountToAndReturnN(n);
    expect r == 0;
  }

  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST: r == n
  {
    var n := 1;
    var r := CountToAndReturnN(n);
    expect r == 1;
  }

  // Test case for combination {1}/R3:
  //   PRE:  n >= 0
  //   POST: r == n
  {
    var n := 2;
    var r := CountToAndReturnN(n);
    expect r == 2;
  }

}

method Failing()
{
  // (no failing tests)
}

method Main()
{
  Passing();
  Failing();
}
