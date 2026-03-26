// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-synthesis_task_id_264.dfy
// Method: DogYears
// Generated: 2026-03-26 14:57:36

// dafny-synthesis_task_id_264.dfy

method DogYears(humanYears: int) returns (dogYears: int)
  requires humanYears >= 0
  ensures dogYears == 7 * humanYears
  decreases humanYears
{
  dogYears := 7 * humanYears;
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  humanYears >= 0
  //   POST: dogYears == 7 * humanYears
  {
    var humanYears := 0;
    var dogYears := DogYears(humanYears);
    expect dogYears == 0;
  }

  // Test case for combination {1}:
  //   PRE:  humanYears >= 0
  //   POST: dogYears == 7 * humanYears
  {
    var humanYears := 1;
    var dogYears := DogYears(humanYears);
    expect dogYears == 7;
  }

  // Test case for combination {1}/R3:
  //   PRE:  humanYears >= 0
  //   POST: dogYears == 7 * humanYears
  {
    var humanYears := 2;
    var dogYears := DogYears(humanYears);
    expect dogYears == 14;
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
