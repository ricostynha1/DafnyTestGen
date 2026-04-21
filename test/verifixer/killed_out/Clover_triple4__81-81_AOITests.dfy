// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Clover_triple4__81-81_AOI.dfy
// Method: Triple
// Generated: 2026-04-08 16:43:07

// Clover_triple4.dfy

method Triple(x: int) returns (r: int)
  ensures r == 3 * x
  decreases x
{
  var y := x * 2;
  r := y + -x;
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: r == 3 * x
  //   ENSURES: r == 3 * x
  {
    var x := 0;
    var r := Triple(x);
    expect r == 0;
  }

}

method Failing()
{
  // Test case for combination {1}/Bx=1:
  //   POST: r == 3 * x
  //   ENSURES: r == 3 * x
  {
    var x := 1;
    var r := Triple(x);
    // expect r == 3;
  }

  // Test case for combination {1}/Or>0:
  //   POST: r == 3 * x
  //   ENSURES: r == 3 * x
  {
    var x := 2;
    var r := Triple(x);
    // expect r == 6;
  }

  // Test case for combination {1}/Or<0:
  //   POST: r == 3 * x
  //   ENSURES: r == 3 * x
  {
    var x := -1;
    var r := Triple(x);
    // expect r == -3;
  }

}

method Main()
{
  Passing();
  Failing();
}
