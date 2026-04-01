// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-synthesis_task_id_762.dfy
// Method: IsMonthWith30Days
// Generated: 2026-04-01 22:28:26

// dafny-synthesis_task_id_762.dfy

method IsMonthWith30Days(month: int) returns (result: bool)
  requires 1 <= month <= 12
  ensures result <==> month == 4 || month == 6 || month == 9 || month == 11
  decreases month
{
  result := month == 4 || month == 6 || month == 9 || month == 11;
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  1 <= month <= 12
  //   POST: result
  //   POST: month == 4
  {
    var month := 4;
    expect 1 <= month <= 12; // PRE-CHECK
    var result := IsMonthWith30Days(month);
    expect result == true;
  }

  // Test case for combination {2}:
  //   PRE:  1 <= month <= 12
  //   POST: result
  //   POST: month == 6
  {
    var month := 6;
    expect 1 <= month <= 12; // PRE-CHECK
    var result := IsMonthWith30Days(month);
    expect result == true;
  }

  // Test case for combination {3}:
  //   PRE:  1 <= month <= 12
  //   POST: result
  //   POST: month == 9
  {
    var month := 9;
    expect 1 <= month <= 12; // PRE-CHECK
    var result := IsMonthWith30Days(month);
    expect result == true;
  }

  // Test case for combination {4}:
  //   PRE:  1 <= month <= 12
  //   POST: result
  //   POST: month == 11
  {
    var month := 11;
    expect 1 <= month <= 12; // PRE-CHECK
    var result := IsMonthWith30Days(month);
    expect result == true;
  }

  // Test case for combination {5}:
  //   PRE:  1 <= month <= 12
  //   POST: !result
  //   POST: !(month == 4)
  //   POST: !(month == 6)
  //   POST: !(month == 9)
  //   POST: !(month == 11)
  {
    var month := 1;
    expect 1 <= month <= 12; // PRE-CHECK
    var result := IsMonthWith30Days(month);
    expect result == false;
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
