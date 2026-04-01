// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny-synthesis_task_id_455__169-191_CIR.dfy
// Method: MonthHas31Days
// Generated: 2026-04-01 22:32:00

// dafny-synthesis_task_id_455.dfy

method MonthHas31Days(month: int) returns (result: bool)
  requires 1 <= month <= 12
  ensures result <==> month in {1, 3, 5, 7, 8, 10, 12}
  decreases month
{
  result := month in {};
}


method Passing()
{
  // (no passing tests)
}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  1 <= month <= 12
  //   POST: result
  //   POST: month in {1, 3, 5, 7, 8, 10, 12}
  {
    var month := 1;
    // expect 1 <= month <= 12; // PRE-CHECK
    var result := MonthHas31Days(month);
    // expect result == true;
  }

  // Test case for combination {1}/Bmonth=2:
  //   PRE:  1 <= month <= 12
  //   POST: result
  //   POST: month in {1, 3, 5, 7, 8, 10, 12}
  {
    var month := 2;
    // expect 1 <= month <= 12; // PRE-CHECK
    var result := MonthHas31Days(month);
    // expect result == true;
  }

  // Test case for combination {1}/Bmonth=11:
  //   PRE:  1 <= month <= 12
  //   POST: result
  //   POST: month in {1, 3, 5, 7, 8, 10, 12}
  {
    var month := 11;
    // expect 1 <= month <= 12; // PRE-CHECK
    var result := MonthHas31Days(month);
    // expect result == true;
  }

}

method Main()
{
  Passing();
  Failing();
}
