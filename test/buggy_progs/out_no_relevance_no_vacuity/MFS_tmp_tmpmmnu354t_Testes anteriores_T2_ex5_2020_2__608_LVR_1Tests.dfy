// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\MFS_tmp_tmpmmnu354t_Testes anteriores_T2_ex5_2020_2__608_LVR_1.dfy
// Method: leq
// Generated: 2026-04-25 00:21:44

// MFS_tmp_tmpmmnu354t_Testes anteriores_T2_ex5_2020_2.dfy

method leq(a: array<int>, b: array<int>) returns (result: bool)
  ensures result <==> (a.Length <= b.Length && a[..] == b[..a.Length]) || exists k: int {:trigger b[k]} {:trigger a[k]} {:trigger b[..k]} {:trigger a[..k]} :: 0 <= k < a.Length && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  decreases a, b
{
  var i := 0;
  while i < a.Length && i < b.Length
    invariant 0 <= i <= a.Length && 0 <= i <= b.Length
    invariant a[..i] == b[..i]
    decreases a.Length - i
  {
    if a[i] < b[i] {
      return true;
    } else if a[i] > b[i] {
      return false;
    } else {
      i := i + 1;
    }
  }
  return a.Length <= b.Length;
}

method testLeq()
{
  var b := new int[] [1, 2];
  var a1 := new int[] [];
  var r1 := leq(a1, b);
  assert r1;
  var a2 := new int[] [1];
  var r2 := leq(a2, b);
  assert r2;
  var a3 := new int[] [1, 2];
  var r3 := leq(a3, b);
  assert r3;
  var a4 := new int[] [1, 1, 2];
  var r4 := leq(a4, b);
  assert a4[1] < b[1] && r4;
  var a5 := new int[] [1, 2, 3];
  var r5 := leq(a5, b);
  assert !r5;
  var a6 := new int[] [2];
  var r6 := leq(a6, b);
  assert !r6;
}


method TestsForleq()
{
  // Test case for combination {1}:
  //   POST Q1: result
  //   POST Q2: a.Length <= b.Length
  //   POST Q3: a[..] == b[..a.Length]
  {
    var a := new int[1] [7];
    var b := new int[1] [7];
    var result := leq(a, b);
    expect result == true;
  }

  // Test case for combination {2}:
  //   POST Q1: result
  //   POST Q2: a.Length > b.Length
  //   POST Q3: 0 <= (a.Length - 1)
  //   POST Q4: 0 < b.Length && a[..0] == b[..0] && a[0] < b[0]
  {
    var a := new int[2] [-10, 8];
    var b := new int[1] [10];
    var result := leq(a, b);
    expect result == true;
  }

  // Test case for combination {3}:
  //   POST Q1: result
  //   POST Q2: a.Length > b.Length
  //   POST Q3: exists k :: 1 <= k < (a.Length - 1) && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  {
    var a := new int[4] [2, 10, -10, 15660];
    var b := new int[3] [2, 10, -9];
    var result := leq(a, b);
    expect result == true;
  }

  // Test case for combination {5}:
  //   POST Q1: result
  //   POST Q2: a.Length <= b.Length
  //   POST Q3: a[..] != b[..a.Length]
  //   POST Q4: 0 <= (a.Length - 1)
  //   POST Q5: 0 < b.Length && a[..0] == b[..0] && a[0] < b[0]
  {
    var a := new int[1] [-10];
    var b := new int[1] [2];
    var result := leq(a, b);
    expect result == true;
  }

  // Test case for combination {6}:
  //   POST Q1: result
  //   POST Q2: a.Length <= b.Length
  //   POST Q3: a[..] != b[..a.Length]
  //   POST Q4: exists k :: 1 <= k < (a.Length - 1) && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  {
    var a := new int[4] [-10, 9, -1, 25561];
    var b := new int[4] [-10, 10, -2, 25562];
    var result := leq(a, b);
    expect result == true;
  }

  // Test case for combination {8}:
  //   POST Q1: !result
  //   POST Q2: a.Length > b.Length
  //   POST Q3: !exists k: int {:trigger b[k]} {:trigger a[k]} {:trigger b[..k]} {:trigger a[..k]} :: 0 <= k < a.Length && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  {
    var a := new int[2] [-9, 10];
    var b := new int[1] [-10];
    var result := leq(a, b);
    expect result == false;
  }

  // Test case for combination {9}:
  //   POST Q1: !result
  //   POST Q2: a.Length <= b.Length
  //   POST Q3: a[..] != b[..a.Length]
  //   POST Q4: !exists k: int {:trigger b[k]} {:trigger a[k]} {:trigger b[..k]} {:trigger a[..k]} :: 0 <= k < a.Length && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  {
    var a := new int[1] [10];
    var b := new int[1] [-10];
    var result := leq(a, b);
    expect result == false;
  }

  // Test case for combination {1}/O|a|=0:
  //   POST Q1: result
  //   POST Q2: a.Length <= b.Length
  //   POST Q3: a[..] == b[..a.Length]
  {
    var a := new int[0] [];
    var b := new int[1] [-1];
    var result := leq(a, b);
    expect result == true;
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: result
  //   POST Q2: a.Length <= b.Length
  //   POST Q3: a[..] == b[..a.Length]
  {
    var a := new int[2] [-2, -10];
    var b := new int[2] [-2, -10];
    var result := leq(a, b);
    expect result == true;
  }

  // Test case for combination {1}/O|b|=0:
  //   POST Q1: result
  //   POST Q2: a.Length <= b.Length
  //   POST Q3: a[..] == b[..a.Length]
  {
    var a := new int[0] [];
    var b := new int[0] [];
    var result := leq(a, b);
    expect result == true;
  }

}

method Main()
{
  TestsForleq();
  print "TestsForleq: all non-failing tests passed!\n";
}
