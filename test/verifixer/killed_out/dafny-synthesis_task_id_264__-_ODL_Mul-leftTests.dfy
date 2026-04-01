// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny-synthesis_task_id_264__-_ODL_Mul-left.dfy
// Method: DogYears
// Generated: 2026-04-01 22:30:01

// dafny-synthesis_task_id_264.dfy

method DogYears(humanYears: int) returns (dogYears: int)
  requires humanYears >= 0
  ensures dogYears == 7 * humanYears
  decreases humanYears
{
  dogYears := humanYears;
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  humanYears >= 0
  //   POST: dogYears == 7 * humanYears
  {
    var humanYears := 0;
    expect humanYears >= 0; // PRE-CHECK
    var dogYears := DogYears(humanYears);
    expect dogYears == 0;
  }

}

method Failing()
{
  // Test case for combination {1}/BhumanYears=1:
  //   PRE:  humanYears >= 0
  //   POST: dogYears == 7 * humanYears
  {
    var humanYears := 1;
    // expect humanYears >= 0; // PRE-CHECK
    var dogYears := DogYears(humanYears);
    // expect dogYears == 7;
  }

  // Test case for combination {1}/R3:
  //   PRE:  humanYears >= 0
  //   POST: dogYears == 7 * humanYears
  {
    var humanYears := 2;
    // expect humanYears >= 0; // PRE-CHECK
    var dogYears := DogYears(humanYears);
    // expect dogYears == 14;
  }

}

method Main()
{
  Passing();
  Failing();
}
