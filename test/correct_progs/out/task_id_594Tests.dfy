// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_594.dfy
// Method: FirstEvenOddDifference
// Generated: 2026-04-15 09:06:51

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
  // Test case for combination P{3}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[2] [0, 4875];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,3,4}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [0, 20903, 61225, 64573];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,7,8}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[3] [42479, 0, 1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,6,7,8}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [-1, 4875, 0, 1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{9}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[2] [42479, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{9,10,12}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [61227, 11707, -1, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{7,8,13}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [16731, 0, 0, 23597];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,7,8,13}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [-1, 0, 0, 1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{6,7,8,13}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [64571, 20903, 25, 26, 0, 32, 0, 16733];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,6,7,8,13}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [17713, 0, 0, 24, 37, 64571, 16731];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,9,13}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[3] [42479, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{6,8,9,13}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [-1, 4875, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,6,8,10,13}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [17713, 23595, 28, 29, 30, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,6,8,9,10,13}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [-1, 61225, 0, 25, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,6,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [-1, 0, 4875, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{6,8,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [-1, 4875, 29, 30, 31, 32, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,6,8,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [42479, 4875, 29, 30, 31, 32, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{6,9,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [42477, 0, 4877, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{6,8,9,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [-1, 27, 4875, 34, 35, 36, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,6,8,9,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [-1, 0, 4875, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,6,10,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [-1, 29, 17711, 4875, 41, 42, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{6,8,10,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [-1, 27, 4875, 34, 35, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{6,9,10,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [4875, 16731, 26, 27, 0, 28, 29, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,6,9,10,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [-1, 4875, 29, 30, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{6,8,9,10,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [-1, 4875, 32, 33, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,4,6,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [0, 0, 16731, 23597];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,3,4,6,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [0, 0, 17711, 4875];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,4,7,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [0, 0, 20903, 64573];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,3,4,7,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, 31843, 41075, 25, 26, 0, 50, 4875];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,4,6,7,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, -1, 41075, 25, 26, 0, 50, 23597];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,4,6,7,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, -1, 41075, 25, 26, 0, 56, 17713];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,3,4,6,7,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [0, 29, 0, 23595, 30, 17713];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,3,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [0, 17711, 0, 4875];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,4,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, 0, 27, 28, 11707, 42, -1, 61227];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,3,4,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, 27, 28, 29, 0, -1, 1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,6,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [0, 20903, 0, 64573];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,4,6,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, 29, 30, 31, 0, 17711, 4875];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,3,4,6,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [0, 42479, 25, 0, 1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,3,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [0, 0, 23595, 25, 1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,4,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [0, 16731, 25, 0, 0, 1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,4,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, 0, 29, 30, 31, 17711, 4875];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [-1, 0, 4875, 25, 0, 44, 45, 1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,6,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, -1, 41075, 25, 26, 0, 50, 17713];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,6,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, -1, 41075, 25, 26, 0, 56, 23597];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,4,6,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, 27, 28, 29, 0, 16731, 23597];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,4,6,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [0, 20901, 0, 25, 1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,6,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [64573, 61225, 25, 0, 37, 11707, 0, 20903];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[3] [0, 42479, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [0, 4875, -1, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,6,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [0, 42479, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,6,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, 4875, -1, 25, 39, 40, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,4,8,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, 4875, -1, 25, 39, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,4,6,8,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [0, 4875, -1, 25, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,4,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [0, 16733, 61227, 20901, 64571, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,6,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, 16731, 23597, 25, 39, 0, 54, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,4,6,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [0, 4875, -1, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,8,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, 23597, 25, 16731, 0, 37, 47, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,8,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [-1, 0, 27, 28, 4875, 44, 45, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{6,9,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [42477, 29, 17711, 4877, 37, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{8,9,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [-1, 0, 27, 28, 4875, 37, 38, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,8,9,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [-1, 0, 27, 28, 29, 4875, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,10,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, 64573, 2285, 56201, 11709, 61225, 20901, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,4,10,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, 2285, 56201, 11709, 61225, 20903, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{6,9,10,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [42477, 4877, 32, 33, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{7,8,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [16731, 0, 64571, 25, 0, 38, 39, 23597];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,7,8,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [42479, 0, 4875, 25, 0, 44, 1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{6,7,8,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [4875, 17711, 25, 26, 0, 0, -1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,6,7,8,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [-1, 17711, 0, 23595, 0, 4875];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,8,9,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [-1, 0, 27, 28, 4875, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{8,10,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [-1, 4875, 29, 30, 31, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,12,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [-1, 0, 29, 17711, 30, 4875, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,8,12,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [-1, 0, 31, 4875, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{6,9,12,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [42477, 0, 4877, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,4,6,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [0, 61225, 20903, 25, 0, 64573];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,7,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [0, 0, 0, -1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,4,7,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [0, 64573, 0, 25, 16733];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,3,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [0, 42479, 0, 25, 26, 1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,4,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, 11707, 25, 0, 26, 27, -1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [64573, 0, 0, 20903];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,6,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, 61225, 0, 20901, 25, 26, 64573];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,6,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [0, 0, 11707, 25, -1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,6,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, 61225, 25, 0, 26, 27, -1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,4,6,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, 29, 30, 31, 32, 0, 20903, 64573];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,6,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [64573, 20901, 25, 0, 0, 61227, 44, 1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,7,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [-1, 0, 0, 0, 0, 0, 1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,6,7,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [0, 26, 4481, 0, 27, 57765];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,6,7,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [0, -1, 0, 25, 2285];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,6,7,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [-1, 17711, 0, 0, 4875];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,8,13,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [64573, 0, 0, 0, 20903];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{6,8,13,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [-1, 17711, 25, 26, 0, 37, 0, 4875];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,6,8,13,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [16733, 64571, 0, 0, 20903, 45, 1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{7,8,13,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [16731, 0, 0, 0, 23597];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,7,8,13,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [-1, 0, 0, 0, 1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{6,7,8,13,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [4875, 17711, 25, 0, 0, -1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,6,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, 17711, 4875, 27, 28, 29, 0, -1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,4,6,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [0, 64571, 25, 0, 1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,7,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, 0, 27, 28, 20903, 64571, 16733];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,4,7,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [0, 27, 20903, 0, 64571, 16733];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,6,7,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, 0, 16731, 25, 23595, 26, 17711];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, 29, 30, 20903, 31, 32, 0, 64573];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, 0, 29, 16731, 30, 23595, 17713];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,4,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [0, 64573, 0, 25, 26, 16733];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,4,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [0, 0, 20903, 64571, 16733];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [-1, 25, 17711, 26, 0, 41, 0, 4875];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,6,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, 23595, 25, 26, 0, 27, 17711];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,6,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [0, 29, 30, 0, 17711, 4875];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,6,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [16733, 20901, 0, 61227, 0, 64571];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,7,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [0, 42479, 25, 0, 26, 1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,7,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [0, 27, 20903, 64571, 0, 16733];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,7,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [0, 0, 27, 20903, 64571, 16733];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,7,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [-1, 25, 4875, 0, 0, 1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,8,13,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [-1, 25, 17711, 26, 0, 0, 4875];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{6,8,13,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [-1, 17711, 25, 26, 0, 0, 4875];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,6,8,13,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [64573, 61227, 0, 0, 20901];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{7,8,13,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [16731, 0, 64571, 25, 0, 38, 23597];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,7,8,13,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [-1, 0, 4875, 0, 1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{6,7,8,13,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [4875, 17711, 0, 0, -1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,3,7,16}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, 0, 25, 26, 11707, 27, 28, 61225];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,6,7,16}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, 0, 29, 30, 31, -1, 11707, 61227];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,3,6,7,16}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, 29, 0, 0, 41, 42479, 1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,6,7,16}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [17713, 0, 0, 25, 38, 64571, 44, 16731];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,7,8,16}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [42479, 0, 0, 0, 0, 1];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,10,16}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [0, 17711, 23595, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,10,16}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [0, 23595, 17711, 4875, -1, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,4,10,16}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, 2285, 56201, 11707, 61227, -1, 563, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,6,10,16}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, 16731, 23597, 24, 38, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,6,10,16}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [17713, 0, 0, 25, 26, 11707, 60, 0];
    var diff := FirstEvenOddDifference(a);
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
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
