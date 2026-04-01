// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-synthesis_task_id_58.dfy
// Method: HasOppositeSign
// Generated: 2026-04-01 13:51:24

// dafny-synthesis_task_id_58.dfy

method HasOppositeSign(a: int, b: int) returns (result: bool)
  ensures result <==> (a < 0 && b > 0) || (a > 0 && b < 0)
  decreases a, b
{
  result := (a < 0 && b > 0) || (a > 0 && b < 0);
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: result
  //   POST: a < 0
  //   POST: b > 0
  {
    var a := -1;
    var b := 1;
    var result := HasOppositeSign(a, b);
    expect result == true;
  }

  // Test case for combination {2}:
  //   POST: result
  //   POST: a > 0
  //   POST: b < 0
  {
    var a := 1;
    var b := -1;
    var result := HasOppositeSign(a, b);
    expect result == true;
  }

  // Test case for combination {4}:
  //   POST: !result
  //   POST: !(a < 0)
  //   POST: !(b < 0)
  {
    var a := 1;
    var b := 1;
    var result := HasOppositeSign(a, b);
    expect result == false;
  }

  // Test case for combination {5}:
  //   POST: !result
  //   POST: !(b > 0)
  //   POST: !(a > 0)
  {
    var a := -1;
    var b := -1;
    var result := HasOppositeSign(a, b);
    expect result == false;
  }

  // Test case for combination {3,4}:
  //   POST: !result
  //   POST: !(a < 0)
  //   POST: !(a > 0)
  //   POST: !(b < 0)
  {
    var a := 0;
    var b := 1;
    var result := HasOppositeSign(a, b);
    expect result == false;
  }

  // Test case for combination {3,5}:
  //   POST: !result
  //   POST: !(a < 0)
  //   POST: !(a > 0)
  //   POST: !(b > 0)
  {
    var a := 0;
    var b := -1;
    var result := HasOppositeSign(a, b);
    expect result == false;
  }

  // Test case for combination {4,5}:
  //   POST: !result
  //   POST: !(a < 0)
  //   POST: !(b < 0)
  //   POST: !(b > 0)
  //   POST: !(a > 0)
  {
    var a := 0;
    var b := 0;
    var result := HasOppositeSign(a, b);
    expect result == false;
  }

  // Test case for combination {4,6}:
  //   POST: !result
  //   POST: !(a < 0)
  //   POST: !(b < 0)
  //   POST: !(b > 0)
  {
    var a := 1;
    var b := 0;
    var result := HasOppositeSign(a, b);
    expect result == false;
  }

  // Test case for combination {5,6}:
  //   POST: !result
  //   POST: !(b > 0)
  //   POST: !(a > 0)
  //   POST: !(b < 0)
  {
    var a := -1;
    var b := 0;
    var result := HasOppositeSign(a, b);
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
