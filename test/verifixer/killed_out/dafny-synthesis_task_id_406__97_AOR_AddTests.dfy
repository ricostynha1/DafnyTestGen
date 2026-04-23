// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny-synthesis_task_id_406__97_AOR_Add.dfy
// Method: IsOdd
// Generated: 2026-04-22 21:44:12

// dafny-synthesis_task_id_406.dfy

method IsOdd(n: int) returns (result: bool)
  ensures result <==> n % 2 == 1
  decreases n
{
  result := n + 2 == 1;
}


method TestsForIsOdd()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   POST Q1: result
  //   POST Q2: n % 2 == 1
  {
    var n := -9;
    var result := IsOdd(n);
    // expect result == true; // got false
  }

  // Test case for combination {2}:
  //   POST Q1: !result
  //   POST Q2: n % 2 != 1
  {
    var n := -10;
    var result := IsOdd(n);
    expect result == false;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/On>0:
  //   POST Q1: result
  //   POST Q2: n % 2 == 1
  {
    var n := 9;
    var result := IsOdd(n);
    // expect result == true; // got false
  }

  // Test case for combination {2}/On=0:
  //   POST Q1: !result
  //   POST Q2: n % 2 != 1
  {
    var n := 0;
    var result := IsOdd(n);
    expect result == false;
  }

}

method Main()
{
  TestsForIsOdd();
  print "TestsForIsOdd: all non-failing tests passed!\n";
}
