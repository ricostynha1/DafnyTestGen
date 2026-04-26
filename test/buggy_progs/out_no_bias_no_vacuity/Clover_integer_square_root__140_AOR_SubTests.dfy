// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Clover_integer_square_root__140_AOR_Sub.dfy
// Method: SquareRoot
// Generated: 2026-04-24 21:39:30

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
    var N := 12;
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

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   POST Q1: r * r <= N
  //   POST Q2: N < (r + 1) * (r + 1)
  {
    var N := 3;
    var r := SquareRoot(N);
    // expect r == 1; // got -3
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   POST Q1: r * r <= N
  //   POST Q2: N < (r + 1) * (r + 1)
  {
    var N := 10;
    var r := SquareRoot(N);
    // expect r == 3; // got -5
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   POST Q1: r * r <= N
  //   POST Q2: N < (r + 1) * (r + 1)
  {
    var N := 11;
    var r := SquareRoot(N);
    // expect r == 3; // got -5
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   POST Q1: r * r <= N
  //   POST Q2: N < (r + 1) * (r + 1)
  {
    var N := 14;
    var r := SquareRoot(N);
    // expect r == 3; // got -5
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   POST Q1: r * r <= N
  //   POST Q2: N < (r + 1) * (r + 1)
  {
    var N := 15;
    var r := SquareRoot(N);
    // expect r == 3; // got -5
  }

}

method Main()
{
  TestsForSquareRoot();
  print "TestsForSquareRoot: all non-failing tests passed!\n";
}
