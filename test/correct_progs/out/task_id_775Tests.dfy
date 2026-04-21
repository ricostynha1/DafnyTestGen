// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_775.dfy
// Method: IsOddAtIndexOdd
// Generated: 2026-04-20 22:34:35

// Checks if all elements at odd indices are odd.
method IsOddAtIndexOdd(a: array<int>) returns (result: bool)
    ensures result <==> forall i :: 0 <= i < a.Length && IsOdd(i) ==> IsOdd(a[i])
{
    for i := 0 to a.Length
        invariant forall k :: 0 <= k < i && IsOdd(k) ==> IsOdd(a[k])
    {
        if IsOdd(i) && !IsOdd(a[i]) {
            return false;
        }
    }
    return true;
}

predicate IsOdd(n: int) {
    n % 2 == 1
}

// Test cases checked statically.
method IsOddAtIndexOddTest(){
  var a1 := new int[] [2, 1, 4, 3, 6, 7, 6, 3];
  var out1 := IsOddAtIndexOdd(a1);
  assert out1;

  var a2 := new int[] [1, 2, 3];
  var out2 := IsOddAtIndexOdd(a2);
  assert a2[1] == 2; // proof helper (counter example)
  assert !out2;
}

method TestsForIsOddAtIndexOdd()
{
  // Test case for combination {1}:
  //   POST: result
  //   POST: forall i: int :: 0 <= i < a.Length && IsOdd(i) ==> IsOdd(a[i])
  //   ENSURES: result <==> forall i: int :: 0 <= i < a.Length && IsOdd(i) ==> IsOdd(a[i])
  {
    var a := new int[1] [10];
    var result := IsOddAtIndexOdd(a);
    expect result == true;
  }

  // Test case for combination {3}:
  //   POST: !result
  //   POST: exists i :: 1 <= i < (a.Length - 1) && IsOdd(i) && !IsOdd(a[i])
  //   ENSURES: result <==> forall i: int :: 0 <= i < a.Length && IsOdd(i) ==> IsOdd(a[i])
  {
    var a := new int[3] [-6, -10, -4];
    var result := IsOddAtIndexOdd(a);
    expect result == false;
  }

  // Test case for combination {4}:
  //   POST: !result
  //   POST: 0 <= (a.Length - 1)
  //   POST: IsOdd((a.Length - 1)) && !IsOdd(a[(a.Length - 1)])
  //   ENSURES: result <==> forall i: int :: 0 <= i < a.Length && IsOdd(i) ==> IsOdd(a[i])
  {
    var a := new int[2] [-2, 6];
    var result := IsOddAtIndexOdd(a);
    expect result == false;
  }

  // Test case for combination {1}/O|a|=0:
  //   POST: result
  //   POST: forall i: int :: 0 <= i < a.Length && IsOdd(i) ==> IsOdd(a[i])
  //   ENSURES: result <==> forall i: int :: 0 <= i < a.Length && IsOdd(i) ==> IsOdd(a[i])
  {
    var a := new int[0] [];
    var result := IsOddAtIndexOdd(a);
    expect result == true;
  }

}

method Main()
{
  TestsForIsOddAtIndexOdd();
  print "TestsForIsOddAtIndexOdd: all non-failing tests passed!\n";
}
