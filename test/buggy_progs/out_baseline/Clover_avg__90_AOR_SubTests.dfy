// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Clover_avg__90_AOR_Sub.dfy
// Method: ComputeAvg
// Generated: 2026-04-24 19:26:38

// Clover_avg.dfy

method ComputeAvg(a: int, b: int) returns (avg: int)
  ensures avg == (a + b) / 2
  decreases a, b
{
  avg := (a - b) / 2;
}


method TestsForComputeAvg()
{
  // Test case for combination {1}:
  //   POST Q1: avg == (a + b) / 2
  {
    var a := 0;
    var b := 0;
    var avg := ComputeAvg(a, b);
    expect avg == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Oa>0:
  //   POST Q1: avg == (a + b) / 2
  {
    var a := 1;
    var b := 1;
    var avg := ComputeAvg(a, b);
    // expect avg == 1; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Oa<0:
  //   POST Q1: avg == (a + b) / 2
  {
    var a := -1;
    var b := -1;
    var avg := ComputeAvg(a, b);
    // expect avg == -1; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   POST Q1: avg == (a + b) / 2
  {
    var a := -2;
    var b := -2;
    var avg := ComputeAvg(a, b);
    // expect avg == -2; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   POST Q1: avg == (a + b) / 2
  {
    var a := 0;
    var b := -3;
    var avg := ComputeAvg(a, b);
    // expect avg == -2; // got 1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   POST Q1: avg == (a + b) / 2
  {
    var a := 2;
    var b := -4;
    var avg := ComputeAvg(a, b);
    // expect avg == -1; // got 3
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   POST Q1: avg == (a + b) / 2
  {
    var a := 0;
    var b := -5;
    var avg := ComputeAvg(a, b);
    // expect avg == -3; // got 2
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   POST Q1: avg == (a + b) / 2
  {
    var a := -3;
    var b := -6;
    var avg := ComputeAvg(a, b);
    // expect avg == -5; // got 1
  }

  // Test case for combination {1}/R9:
  //   POST Q1: avg == (a + b) / 2
  {
    var a := -4;
    var b := 0;
    var avg := ComputeAvg(a, b);
    expect avg == -2;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   POST Q1: avg == (a + b) / 2
  {
    var a := -5;
    var b := -7;
    var avg := ComputeAvg(a, b);
    // expect avg == -6; // got 1
  }

}

method Main()
{
  TestsForComputeAvg();
  print "TestsForComputeAvg: all non-failing tests passed!\n";
}
