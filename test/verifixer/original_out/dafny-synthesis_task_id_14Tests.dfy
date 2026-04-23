// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-synthesis_task_id_14.dfy
// Method: TriangularPrismVolume
// Generated: 2026-04-22 21:31:56

// dafny-synthesis_task_id_14.dfy

method TriangularPrismVolume(base: int, height: int, length: int)
    returns (volume: int)
  requires base > 0
  requires height > 0
  requires length > 0
  ensures volume == base * height * length / 2
  decreases base, height, length
{
  volume := base * height * length / 2;
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
    expect volume == 50;
  }

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
    expect volume == 100;
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

}

method Main()
{
  TestsForTriangularPrismVolume();
  print "TestsForTriangularPrismVolume: all non-failing tests passed!\n";
}
