// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_762__198-207_COI.dfy
// Method: IsMonthWith30Days
// Generated: 2026-04-24 23:56:32

// dafny-synthesis_task_id_762.dfy

method IsMonthWith30Days(month: int) returns (result: bool)
  requires 1 <= month <= 12
  ensures result <==> month == 4 || month == 6 || month == 9 || month == 11
  decreases month
{
  result := month == 4 || !(month == 6) || month == 9 || month == 11;
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

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   PRE:  1 <= month <= 12
  //   POST Q1: result
  //   POST Q2: month != 4
  //   POST Q3: month == 6
  {
    var month := 6;
    var result := IsMonthWith30Days(month);
    // expect result == true; // got false
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

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {5}:
  //   PRE:  1 <= month <= 12
  //   POST Q1: !result
  //   POST Q2: month != 4
  //   POST Q3: month != 6
  //   POST Q4: month != 9
  //   POST Q5: month != 11
  {
    var month := 2;
    var result := IsMonthWith30Days(month);
    // expect result == false; // got true
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {5}/Bmonth=1:
  //   PRE:  1 <= month <= 12
  //   POST Q1: !result
  //   POST Q2: month != 4
  //   POST Q3: month != 6
  //   POST Q4: month != 9
  //   POST Q5: month != 11
  {
    var month := 1;
    var result := IsMonthWith30Days(month);
    // expect result == false; // got true
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {5}/Bmonth=12:
  //   PRE:  1 <= month <= 12
  //   POST Q1: !result
  //   POST Q2: month != 4
  //   POST Q3: month != 6
  //   POST Q4: month != 9
  //   POST Q5: month != 11
  {
    var month := 12;
    var result := IsMonthWith30Days(month);
    // expect result == false; // got true
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {5}/R4:
  //   PRE:  1 <= month <= 12
  //   POST Q1: !result
  //   POST Q2: month != 4
  //   POST Q3: month != 6
  //   POST Q4: month != 9
  //   POST Q5: month != 11
  {
    var month := 3;
    var result := IsMonthWith30Days(month);
    // expect result == false; // got true
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {5}/R5:
  //   PRE:  1 <= month <= 12
  //   POST Q1: !result
  //   POST Q2: month != 4
  //   POST Q3: month != 6
  //   POST Q4: month != 9
  //   POST Q5: month != 11
  {
    var month := 5;
    var result := IsMonthWith30Days(month);
    // expect result == false; // got true
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {5}/R6:
  //   PRE:  1 <= month <= 12
  //   POST Q1: !result
  //   POST Q2: month != 4
  //   POST Q3: month != 6
  //   POST Q4: month != 9
  //   POST Q5: month != 11
  {
    var month := 8;
    var result := IsMonthWith30Days(month);
    // expect result == false; // got true
  }

}

method Main()
{
  TestsForIsMonthWith30Days();
  print "TestsForIsMonthWith30Days: all non-failing tests passed!\n";
}
