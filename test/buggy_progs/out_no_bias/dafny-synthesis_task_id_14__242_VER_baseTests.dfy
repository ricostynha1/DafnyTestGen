// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_14__242_VER_base.dfy
// Method: TriangularPrismVolume
// Generated: 2026-04-24 11:58:21

// dafny-synthesis_task_id_14.dfy

method TriangularPrismVolume(base: int, height: int, length: int)
    returns (volume: int)
  requires base > 0
  requires height > 0
  requires length > 0
  ensures volume == base * height * length / 2
  decreases base, height, length
{
  volume := base * height * base / 2;
}


method TestsForTriangularPrismVolume()
{
  // Test case for combination {1}:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST Q1: volume == base * height * length / 2
  {
    var base := 1;
    var height := 1;
    var length := 1;
    var volume := TriangularPrismVolume(base, height, length);
    expect volume == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bbase=2:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST Q1: volume == base * height * length / 2
  {
    var base := 2;
    var height := 1;
    var length := 1;
    var volume := TriangularPrismVolume(base, height, length);
    // expect volume == 1; // got 2
  }

  // Test case for combination {1}/Bheight=2:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST Q1: volume == base * height * length / 2
  {
    var base := 1;
    var height := 2;
    var length := 1;
    var volume := TriangularPrismVolume(base, height, length);
    expect volume == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Blength=2:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST Q1: volume == base * height * length / 2
  {
    var base := 1;
    var height := 1;
    var length := 2;
    var volume := TriangularPrismVolume(base, height, length);
    // expect volume == 1; // got 0
  }

  // Test case for combination {1}/R5:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST Q1: volume == base * height * length / 2
  {
    var base := 2;
    var height := 2;
    var length := 2;
    var volume := TriangularPrismVolume(base, height, length);
    expect volume == 4;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST Q1: volume == base * height * length / 2
  {
    var base := 1;
    var height := 2;
    var length := 2;
    var volume := TriangularPrismVolume(base, height, length);
    // expect volume == 2; // got 1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST Q1: volume == base * height * length / 2
  {
    var base := 3;
    var height := 2;
    var length := 2;
    var volume := TriangularPrismVolume(base, height, length);
    // expect volume == 6; // got 9
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST Q1: volume == base * height * length / 2
  {
    var base := 3;
    var height := 1;
    var length := 2;
    var volume := TriangularPrismVolume(base, height, length);
    // expect volume == 3; // got 4
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST Q1: volume == base * height * length / 2
  {
    var base := 3;
    var height := 3;
    var length := 2;
    var volume := TriangularPrismVolume(base, height, length);
    // expect volume == 9; // got 13
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST Q1: volume == base * height * length / 2
  {
    var base := 3;
    var height := 3;
    var length := 1;
    var volume := TriangularPrismVolume(base, height, length);
    // expect volume == 4; // got 13
  }

}

method Main()
{
  TestsForTriangularPrismVolume();
  print "TestsForTriangularPrismVolume: all non-failing tests passed!\n";
}
