// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Clover_integer_square_root__140_AOR_Sub.dfy
// Method: SquareRoot
// Generated: 2026-04-01 13:52:45

// Clover_integer_square_root.dfy

method SquareRoot(N: nat) returns (r: nat)
  ensures r * r <= N < (r + 1) * (r + 1)
  decreases N
{
  r := 0;
  while (r + 1) * (r + 1) <= N
    invariant r * r <= N
    decreases N - (r + 1) * (r + 1)
  {
    r := r - 1;
  }
}


method Passing()
{
  // Test case for combination {1}/BN=0:
  //   POST: r * r <= N < (r + 1) * (r + 1)
  {
    var N := 0;
    var r := SquareRoot(N);
    expect r == 0;
  }

}

method Failing()
{
  // Test case for combination {1}:
  //   POST: r * r <= N < (r + 1) * (r + 1)
  {
    var N := 15;
    var r := SquareRoot(N);
    // expect r == 3;
  }

  // Test case for combination {1}/BN=1:
  //   POST: r * r <= N < (r + 1) * (r + 1)
  {
    var N := 1;
    var r := SquareRoot(N);
    // expect r == 1;
  }

}

method Main()
{
  Passing();
  Failing();
}
