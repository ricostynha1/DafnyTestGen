// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Clover_triple4.dfy
// Method: Triple
// Generated: 2026-04-01 13:48:53

// Clover_triple4.dfy

method Triple(x: int) returns (r: int)
  ensures r == 3 * x
  decreases x
{
  var y := x * 2;
  r := y + x;
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: r == 3 * x
  {
    var x := 0;
    var r := Triple(x);
    expect r == 0;
  }

  // Test case for combination {1}/Bx=1:
  //   POST: r == 3 * x
  {
    var x := 1;
    var r := Triple(x);
    expect r == 3;
  }

  // Test case for combination {1}/R3:
  //   POST: r == 3 * x
  {
    var x := -1;
    var r := Triple(x);
    expect r == -3;
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
