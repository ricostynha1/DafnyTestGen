// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_433.dfy
// Method: IsGreater
// Generated: 2026-04-15 22:30:44

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

method Passing()
{
  // Test case for combination {1}:
  //   POST: result
  //   POST: forall i :: 0 <= i < a.Length ==> n > a[i]
  //   ENSURES: result <==> forall i :: 0 <= i < a.Length ==> n > a[i]
  {
    var n := 8365;
    var a := new int[1] [8364];
    var result := IsGreater(n, a);
    expect result == true;
  }

  // Test case for combination {2}:
  //   POST: !result
  //   POST: 0 <= (a.Length - 1)
  //   POST: !(n > a[0])
  //   ENSURES: result <==> forall i :: 0 <= i < a.Length ==> n > a[i]
  {
    var n := 2;
    var a := new int[1] [2];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {3}:
  //   POST: !result
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(n > a[i])
  //   ENSURES: result <==> forall i :: 0 <= i < a.Length ==> n > a[i]
  {
    var n := 0;
    var a := new int[3] [15, 38, 19];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {1}/Q|a|>=2:
  //   POST: result
  //   POST: forall i :: 0 <= i < a.Length ==> n > a[i]
  //   ENSURES: result <==> forall i :: 0 <= i < a.Length ==> n > a[i]
  {
    var n := 38;
    var a := new int[2] [37, 37];
    var result := IsGreater(n, a);
    expect result == true;
  }

  // Test case for combination {1}/Q|a|=0:
  //   POST: result
  //   POST: forall i :: 0 <= i < a.Length ==> n > a[i]
  //   ENSURES: result <==> forall i :: 0 <= i < a.Length ==> n > a[i]
  {
    var n := 0;
    var a := new int[0] [];
    var result := IsGreater(n, a);
    expect result == true;
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
