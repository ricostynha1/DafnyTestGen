// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_14__242_VER_base.dfy
// Method: TriangularPrismVolume
// Generated: 2026-04-24 23:49:31

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
    var base := 10;
    var height := 10;
    var length := 10;
    var volume := TriangularPrismVolume(base, height, length);
    expect volume == 500;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bbase=1:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST Q1: volume == base * height * length / 2
  {
    var base := 1;
    var height := 10;
    var length := 10;
    var volume := TriangularPrismVolume(base, height, length);
    // expect volume == 50; // got 5
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bbase=2:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST Q1: volume == base * height * length / 2
  {
    var base := 2;
    var height := 10;
    var length := 10;
    var volume := TriangularPrismVolume(base, height, length);
    // expect volume == 100; // got 20
  }

  // Test case for combination {1}/Bheight=1:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST Q1: volume == base * height * length / 2
  {
    var base := 10;
    var height := 1;
    var length := 10;
    var volume := TriangularPrismVolume(base, height, length);
    expect volume == 50;
  }

  // Test case for combination {1}/Bheight=2:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST Q1: volume == base * height * length / 2
  {
    var base := 10;
    var height := 2;
    var length := 10;
    var volume := TriangularPrismVolume(base, height, length);
    expect volume == 100;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Blength=1:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST Q1: volume == base * height * length / 2
  {
    var base := 10;
    var height := 10;
    var length := 1;
    var volume := TriangularPrismVolume(base, height, length);
    // expect volume == 50; // got 500
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Blength=2:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST Q1: volume == base * height * length / 2
  {
    var base := 10;
    var height := 10;
    var length := 2;
    var volume := TriangularPrismVolume(base, height, length);
    // expect volume == 100; // got 500
  }

  // Test case for combination {1}/Ovolume=0:
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
  // Test case for combination {1}/R9:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST Q1: volume == base * height * length / 2
  {
    var base := 9;
    var height := 10;
    var length := 10;
    var volume := TriangularPrismVolume(base, height, length);
    // expect volume == 450; // got 405
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST Q1: volume == base * height * length / 2
  {
    var base := 8;
    var height := 10;
    var length := 10;
    var volume := TriangularPrismVolume(base, height, length);
    // expect volume == 400; // got 320
  }

}

method Main()
{
  TestsForTriangularPrismVolume();
  print "TestsForTriangularPrismVolume: all non-failing tests passed!\n";
}
