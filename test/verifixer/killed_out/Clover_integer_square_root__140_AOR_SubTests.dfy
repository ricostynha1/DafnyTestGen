// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Clover_integer_square_root__140_AOR_Sub.dfy
// Method: SquareRoot
// Generated: 2026-04-22 21:28:12

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


method TestsForSquareRoot()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   POST Q1: r * r <= N
  //   POST Q2: N < (r + 1) * (r + 1)
  {
    var N := 10;
    var r := SquareRoot(N);
    // expect r == 3; // got -5
  }

  // Test case for combination {1}/BN=0:
  //   POST Q1: r * r <= N
  //   POST Q2: N < (r + 1) * (r + 1)
  {
    var N := 0;
    var r := SquareRoot(N);
    expect r == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/BN=1:
  //   POST Q1: r * r <= N
  //   POST Q2: N < (r + 1) * (r + 1)
  {
    var N := 1;
    var r := SquareRoot(N);
    // expect r == 1; // got -3
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Br=N-1:
  //   POST Q1: r * r <= N
  //   POST Q2: N < (r + 1) * (r + 1)
  {
    var N := 2;
    var r := SquareRoot(N);
    // expect r == 1; // got -3
  }

}

method Main()
{
  TestsForSquareRoot();
  print "TestsForSquareRoot: all non-failing tests passed!\n";
}
