// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_455__169-191_CIR.dfy
// Method: MonthHas31Days
// Generated: 2026-04-24 16:26:26

// dafny-synthesis_task_id_455.dfy

method MonthHas31Days(month: int) returns (result: bool)
  requires 1 <= month <= 12
  ensures result <==> month in {1, 3, 5, 7, 8, 10, 12}
  decreases month
{
  result := month in {};
}


method TestsForMonthHas31Days()
{
  // Test case for combination {1}:
  //   PRE:  1 <= month <= 12
  //   POST Q1: result
  //   POST Q2: month in {1, 3, 5, 7, 8, 10, 12}
  {
    var month := 2;
    var result := MonthHas31Days(month);
    expect result == true || result == false;
    expect result == false; // observed from implementation
  }

  // Test case for combination {1}/Bmonth=1:
  //   PRE:  1 <= month <= 12
  //   POST Q1: result
  //   POST Q2: month in {1, 3, 5, 7, 8, 10, 12}
  {
    var month := 1;
    var result := MonthHas31Days(month);
    expect result == true || result == false;
    expect result == false; // observed from implementation
  }

  // Test case for combination {1}/Bmonth=11:
  //   PRE:  1 <= month <= 12
  //   POST Q1: result
  //   POST Q2: month in {1, 3, 5, 7, 8, 10, 12}
  {
    var month := 11;
    var result := MonthHas31Days(month);
    expect result == true || result == false;
    expect result == false; // observed from implementation
  }

  // Test case for combination {1}/Bmonth=12:
  //   PRE:  1 <= month <= 12
  //   POST Q1: result
  //   POST Q2: month in {1, 3, 5, 7, 8, 10, 12}
  {
    var month := 12;
    var result := MonthHas31Days(month);
    expect result == true || result == false;
    expect result == false; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  1 <= month <= 12
  //   POST Q1: result
  //   POST Q2: month in {1, 3, 5, 7, 8, 10, 12}
  {
    var month := 10;
    var result := MonthHas31Days(month);
    expect result == true || result == false;
    expect result == false; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  1 <= month <= 12
  //   POST Q1: result
  //   POST Q2: month in {1, 3, 5, 7, 8, 10, 12}
  {
    var month := 9;
    var result := MonthHas31Days(month);
    expect result == true || result == false;
    expect result == false; // observed from implementation
  }

}

method Main()
{
  TestsForMonthHas31Days();
  print "TestsForMonthHas31Days: all non-failing tests passed!\n";
}
