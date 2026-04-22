// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_433.dfy
// Method: IsGreater
// Generated: 2026-04-21 23:40:52

// Checks if a number 'n' is greater than all elements in an array 'a'
method IsGreater(n: int, a: array<int>) returns (result: bool)
    ensures result <==> (forall i :: 0 <= i < a.Length ==> n > a[i])
{
    for i := 0 to a.Length
        invariant forall k :: 0 <= k < i ==> n > a[k]
    {
        if n <= a[i] {
            return false;
        }
    }
    return true;
}

// Test cases checked statically
method IsGreaterTest(){
    var a1 := new int[] [3, 2, 1, 5, 2];
    var out1 := IsGreater(4, a1);
    assert 4 <= a1[3]; // proof helper (counter-example)
    assert ! out1;

    var out2 := IsGreater(6, a1);
    assert out2;
}

method TestsForIsGreater()
{
  // Test case for combination {1}:
  //   POST Q1: result
  //   POST Q2: forall i: int :: 0 <= i < a.Length ==> n > a[i]
  {
    var n := 10;
    var a := new int[1] [5];
    var result := IsGreater(n, a);
    expect result == true;
  }

  // Test case for combination {2}:
  //   POST Q1: !result
  //   POST Q2: 0 <= (a.Length - 1)
  //   POST Q3: n <= a[0]
  {
    var n := -10;
    var a := new int[1] [-10];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {3}:
  //   POST Q1: !result
  //   POST Q2: exists i :: 1 <= i < (a.Length - 1) && !(n > a[i])
  {
    var n := -9;
    var a := new int[3] [-5, -9, -10];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {1}/On=0:
  //   POST Q1: result
  //   POST Q2: forall i: int :: 0 <= i < a.Length ==> n > a[i]
  {
    var n := 0;
    var a := new int[1] [-10];
    var result := IsGreater(n, a);
    expect result == true;
  }

}

method Main()
{
  TestsForIsGreater();
  print "TestsForIsGreater: all non-failing tests passed!\n";
}
