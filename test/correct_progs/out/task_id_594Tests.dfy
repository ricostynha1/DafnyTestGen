// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_594.dfy
// Method: FirstEvenOddDifference
// Generated: 2026-03-24 16:01:11

// Returns the difference between the first even and the first odd number in the array.
method FirstEvenOddDifference(a: array<int>) returns (diff: int)
    requires exists i :: 0 <= i < a.Length && IsEven(a[i])
    requires exists i :: 0 <= i < a.Length && IsOdd(a[i])
    ensures exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j] 
{
    var firstEven: int;
    for i := 0 to a.Length
        invariant forall k :: 0 <= k < i ==> !IsEven(a[k])
    {
        if IsEven(a[i]) {
            firstEven := i;
            break;
        }
    }

    var firstOdd: int;
    for i := 0 to a.Length
        invariant forall k :: 0 <= k < i ==> !IsOdd(a[k])
    {
        if IsOdd(a[i]) {
            firstOdd := i;
            break;
        }
    }

    return a[firstEven] - a[firstOdd];
}

// Auxiliary predicates
predicate IsEven(n: int) {
    n % 2 == 0
}
predicate IsOdd(n: int) {
    n % 2 != 0
}

// Test cases checked statically by Dafny.
method FirstEvenOddDifferenceTest(){
    var a1 := new int[] [1, 3, 5, 7, 4, 1, 6, 8];
    assert IsEven(a1[4]); // proof helper (pre-condition)
    assert IsOdd(a1[0]); // proof helper (pre-condition)
    var out1 := FirstEvenOddDifference(a1);
    assert out1 == 3;

    var a2 := new int[] [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    assert IsEven(a2[1]); // helper
    assert IsOdd(a2[0]);  // helper
    var out2 := FirstEvenOddDifference(a2);
    assert out2 == 1;

    var a3:= new int[] [1, 5, 7, 9, 10];
    assert IsEven(a3[4]); // helper
    assert IsOdd(a3[0]); // helper
    var out3 := FirstEvenOddDifference(a3);
    assert out3 == 9;
}

method Passing()
{
  // Test case for combination {1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[2] [562, -1];
    var diff := FirstEvenOddDifference(a);
    expect diff == 563;
  }

  // Test case for combination {1}/Ba=3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[3] [-2, -4, -3];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1;
  }

  // Test case for combination {1}/R3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [4911, 3189, 2284, 11841];
    var diff := FirstEvenOddDifference(a);
    expect diff == -2627;
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
