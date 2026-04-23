// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Clover_integer_square_root.dfy
// Method: SquareRoot
// Generated: 2026-04-22 21:26:35

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
    r := r + 1;
  }
}


method TestsForSquareRoot()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: r * r <= N
  //   POST Q2: N < (r + 1) * (r + 1)
  {
    var N := 10;
    var r := SquareRoot(N);
    expect r == 3;
  }

  // Test case for combination {1}/BN=0:
  //   POST Q1: r * r <= N
  //   POST Q2: N < (r + 1) * (r + 1)
  {
    var N := 0;
    var r := SquareRoot(N);
    expect r == 0;
  }

  // Test case for combination {1}/BN=1:
  //   POST Q1: r * r <= N
  //   POST Q2: N < (r + 1) * (r + 1)
  {
    var N := 1;
    var r := SquareRoot(N);
    expect r == 1;
  }

  // Test case for combination {1}/Br=N-1:
  //   POST Q1: r * r <= N
  //   POST Q2: N < (r + 1) * (r + 1)
  {
    var N := 2;
    var r := SquareRoot(N);
    expect r == 1;
  }

}

method Main()
{
  TestsForSquareRoot();
  print "TestsForSquareRoot: all non-failing tests passed!\n";
}
