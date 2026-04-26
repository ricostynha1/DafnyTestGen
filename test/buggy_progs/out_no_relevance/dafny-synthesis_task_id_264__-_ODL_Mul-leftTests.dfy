// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_264__-_ODL_Mul-left.dfy
// Method: DogYears
// Generated: 2026-04-24 13:37:45

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

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  humanYears >= 0
  //   POST Q1: dogYears == 7 * humanYears
  {
    var humanYears := 8;
    var dogYears := DogYears(humanYears);
    // expect dogYears == 56; // got 8
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  humanYears >= 0
  //   POST Q1: dogYears == 7 * humanYears
  {
    var humanYears := 7;
    var dogYears := DogYears(humanYears);
    // expect dogYears == 49; // got 7
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  humanYears >= 0
  //   POST Q1: dogYears == 7 * humanYears
  {
    var humanYears := 6;
    var dogYears := DogYears(humanYears);
    // expect dogYears == 42; // got 6
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  humanYears >= 0
  //   POST Q1: dogYears == 7 * humanYears
  {
    var humanYears := 5;
    var dogYears := DogYears(humanYears);
    // expect dogYears == 35; // got 5
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  humanYears >= 0
  //   POST Q1: dogYears == 7 * humanYears
  {
    var humanYears := 4;
    var dogYears := DogYears(humanYears);
    // expect dogYears == 28; // got 4
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   PRE:  humanYears >= 0
  //   POST Q1: dogYears == 7 * humanYears
  {
    var humanYears := 3;
    var dogYears := DogYears(humanYears);
    // expect dogYears == 21; // got 3
  }

}

method Main()
{
  TestsForDogYears();
  print "TestsForDogYears: all non-failing tests passed!\n";
}
