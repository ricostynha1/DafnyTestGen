// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny-synthesis_task_id_406__97_AOR_Add.dfy
// Method: IsOdd
// Generated: 2026-03-26 15:01:13

// dafny-synthesis_task_id_406.dfy

method IsOdd(n: int) returns (result: bool)
  ensures result <==> n % 2 == 1
  decreases n
{
  result := n + 2 == 1;
}


method Passing()
{
  // Test case for combination {2}:
  //   POST: !result
  //   POST: !(n % 2 == 1)
  {
    var n := 0;
    var result := IsOdd(n);
    expect result == false;
  }

  // Test case for combination {2}:
  //   POST: !result
  //   POST: !(n % 2 == 1)
  {
    var n := -2;
    var result := IsOdd(n);
    expect result == false;
  }

}

method Failing()
{
  // Test case for combination {1}:
  //   POST: result
  //   POST: n % 2 == 1
  {
    var n := 1;
    var result := IsOdd(n);
    // expect result == true;
  }

  // Test case for combination {1}:
  //   POST: result
  //   POST: n % 2 == 1
  {
    var n := 3;
    var result := IsOdd(n);
    // expect result == true;
  }

}

method Main()
{
  Passing();
  Failing();
}
