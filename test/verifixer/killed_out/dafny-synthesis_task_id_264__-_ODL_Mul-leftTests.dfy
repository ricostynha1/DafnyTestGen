// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny-synthesis_task_id_264__-_ODL_Mul-left.dfy
// Method: DogYears
// Generated: 2026-04-22 21:42:20

// dafny-synthesis_task_id_264.dfy

method DogYears(humanYears: int) returns (dogYears: int)
  requires humanYears >= 0
  ensures dogYears == 7 * humanYears
  decreases humanYears
{
  dogYears := humanYears;
}


method TestsForDogYears()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  humanYears >= 0
  //   POST Q1: dogYears == 7 * humanYears
  {
    var humanYears := 10;
    var dogYears := DogYears(humanYears);
    // expect dogYears == 70; // got 10
  }

  // Test case for combination {1}/BhumanYears=0:
  //   PRE:  humanYears >= 0
  //   POST Q1: dogYears == 7 * humanYears
  {
    var humanYears := 0;
    var dogYears := DogYears(humanYears);
    expect dogYears == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/BhumanYears=1:
  //   PRE:  humanYears >= 0
  //   POST Q1: dogYears == 7 * humanYears
  {
    var humanYears := 1;
    var dogYears := DogYears(humanYears);
    // expect dogYears == 7; // got 1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  humanYears >= 0
  //   POST Q1: dogYears == 7 * humanYears
  {
    var humanYears := 9;
    var dogYears := DogYears(humanYears);
    // expect dogYears == 63; // got 9
  }

}

method Main()
{
  TestsForDogYears();
  print "TestsForDogYears: all non-failing tests passed!\n";
}
