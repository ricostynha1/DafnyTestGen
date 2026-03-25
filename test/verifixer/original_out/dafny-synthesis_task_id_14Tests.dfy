// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-synthesis_task_id_14.dfy
// Method: TriangularPrismVolume
// Generated: 2026-03-25 22:38:26

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST: volume == base * height * length / 2
  {
    var base := 1;
    var height := 1;
    var length := 1;
    var volume := TriangularPrismVolume(base, height, length);
    expect volume == 0;
  }

  // Test case for combination {1}:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST: volume == base * height * length / 2
  {
    var base := 2;
    var height := 1;
    var length := 1;
    var volume := TriangularPrismVolume(base, height, length);
    expect volume == 1;
  }

  // Test case for combination {1}/Bbase=1,height=1,length=2:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST: volume == base * height * length / 2
  {
    var base := 1;
    var height := 1;
    var length := 2;
    var volume := TriangularPrismVolume(base, height, length);
    expect volume == 1;
  }

  // Test case for combination {1}/Bbase=1,height=2,length=1:
  //   PRE:  base > 0
  //   PRE:  height > 0
  //   PRE:  length > 0
  //   POST: volume == base * height * length / 2
  {
    var base := 1;
    var height := 2;
    var length := 1;
    var volume := TriangularPrismVolume(base, height, length);
    expect volume == 1;
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
