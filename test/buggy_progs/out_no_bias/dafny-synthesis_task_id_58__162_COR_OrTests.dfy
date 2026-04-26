// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_58__162_COR_Or.dfy
// Method: HasOppositeSign
// Generated: 2026-04-24 12:04:50

// dafny-synthesis_task_id_58.dfy

method HasOppositeSign(a: int, b: int) returns (result: bool)
  ensures result <==> (a < 0 && b > 0) || (a > 0 && b < 0)
  decreases a, b
{
  result := (a < 0 && b > 0) || a > 0 || b < 0;
}


method TestsForHasOppositeSign()
{
  // Test case for combination {1}:
  //   POST Q1: result
  //   POST Q2: a < 0
  //   POST Q3: b > 0
  {
    var a := -1;
    var b := 1;
    var result := HasOppositeSign(a, b);
    expect result == true;
  }

  // Test case for combination {2}:
  //   POST Q1: result
  //   POST Q2: a >= 0
  //   POST Q3: a > 0
  //   POST Q4: b < 0
  {
    var a := 1;
    var b := -1;
    var result := HasOppositeSign(a, b);
    expect result == true;
  }

  // Test case for combination {4}:
  //   POST Q1: !result
  //   POST Q2: a >= 0
  //   POST Q3: a <= 0
  {
    var a := 0;
    var b := 0;
    var result := HasOppositeSign(a, b);
    expect result == false;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {5}:
  //   POST Q1: !result
  //   POST Q2: a >= 0
  //   POST Q3: a > 0
  //   POST Q4: b >= 0
  {
    var a := 1;
    var b := 0;
    var result := HasOppositeSign(a, b);
    // expect result == false; // got true
  }

  // Test case for combination {6}:
  //   POST Q1: !result
  //   POST Q2: a < 0
  //   POST Q3: b <= 0
  //   POST Q4: a <= 0
  {
    var a := -1;
    var b := 0;
    var result := HasOppositeSign(a, b);
    expect result == false;
  }

  // Test case for combination {1}/Ba=-2:
  //   POST Q1: result
  //   POST Q2: a < 0
  //   POST Q3: b > 0
  {
    var a := -2;
    var b := 1;
    var result := HasOppositeSign(a, b);
    expect result == true;
  }

  // Test case for combination {1}/Bb=2:
  //   POST Q1: result
  //   POST Q2: a < 0
  //   POST Q3: b > 0
  {
    var a := -1;
    var b := 2;
    var result := HasOppositeSign(a, b);
    expect result == true;
  }

  // Test case for combination {2}/Bb=-2:
  //   POST Q1: result
  //   POST Q2: a >= 0
  //   POST Q3: a > 0
  //   POST Q4: b < 0
  {
    var a := 1;
    var b := -2;
    var result := HasOppositeSign(a, b);
    expect result == true;
  }

  // Test case for combination {4}/Ob>0:
  //   POST Q1: !result
  //   POST Q2: a >= 0
  //   POST Q3: a <= 0
  {
    var a := 0;
    var b := 1;
    var result := HasOppositeSign(a, b);
    expect result == false;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {4}/Ob<0:
  //   POST Q1: !result
  //   POST Q2: a >= 0
  //   POST Q3: a <= 0
  {
    var a := 0;
    var b := -1;
    var result := HasOppositeSign(a, b);
    // expect result == false; // got true
  }

}

method Main()
{
  TestsForHasOppositeSign();
  print "TestsForHasOppositeSign: all non-failing tests passed!\n";
}
