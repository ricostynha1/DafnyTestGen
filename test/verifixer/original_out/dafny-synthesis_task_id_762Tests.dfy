// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-synthesis_task_id_762.dfy
// Method: IsMonthWith30Days
// Generated: 2026-04-22 21:33:35

// dafny-synthesis_task_id_762.dfy

method IsMonthWith30Days(month: int) returns (result: bool)
  requires 1 <= month <= 12
  ensures result <==> month == 4 || month == 6 || month == 9 || month == 11
  decreases month
{
  result := month == 4 || month == 6 || month == 9 || month == 11;
}


method TestsForIsMonthWith30Days()
{
  // Test case for combination {1}:
  //   PRE:  1 <= month <= 12
  //   POST Q1: result
  //   POST Q2: month == 4
  {
    var month := 4;
    var result := IsMonthWith30Days(month);
    expect result == true;
  }

  // Test case for combination {2}:
  //   PRE:  1 <= month <= 12
  //   POST Q1: result
  //   POST Q2: month != 4
  //   POST Q3: month == 6
  {
    var month := 6;
    var result := IsMonthWith30Days(month);
    expect result == true;
  }

  // Test case for combination {3}:
  //   PRE:  1 <= month <= 12
  //   POST Q1: result
  //   POST Q2: month != 4
  //   POST Q3: month != 6
  //   POST Q4: month == 9
  {
    var month := 9;
    var result := IsMonthWith30Days(month);
    expect result == true;
  }

  // Test case for combination {4}:
  //   PRE:  1 <= month <= 12
  //   POST Q1: result
  //   POST Q2: month != 4
  //   POST Q3: month != 6
  //   POST Q4: month != 9
  //   POST Q5: month == 11
  {
    var month := 11;
    var result := IsMonthWith30Days(month);
    expect result == true;
  }

  // Test case for combination {5}:
  //   PRE:  1 <= month <= 12
  //   POST Q1: !result
  //   POST Q2: month != 4
  //   POST Q3: month != 6
  //   POST Q4: month != 9
  //   POST Q5: month != 11
  {
    var month := 10;
    var result := IsMonthWith30Days(month);
    expect result == false;
  }

}

method Main()
{
  TestsForIsMonthWith30Days();
  print "TestsForIsMonthWith30Days: all non-failing tests passed!\n";
}
