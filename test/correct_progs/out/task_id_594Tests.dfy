// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_594.dfy
// Method: FirstEvenOddDifference
// Generated: 2026-04-10 23:40:29

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
    var a := new int[2] [0, 42479];
    var diff := FirstEvenOddDifference(a);
    expect diff == -42479;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,3}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[3] [0, 15439, 77];
    var diff := FirstEvenOddDifference(a);
    expect diff == -15439;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,5}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [0, 4875, 0, 42479];
    var diff := FirstEvenOddDifference(a);
    expect diff == -4875;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,3,5}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [0, 15439, 0, 77];
    var diff := FirstEvenOddDifference(a);
    expect diff == -15439;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,6}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[3] [0, 0, 42479];
    var diff := FirstEvenOddDifference(a);
    expect diff == -42479;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,3,6}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, 23595, 24, 31, 32, 33, 0, 15439];
    var diff := FirstEvenOddDifference(a);
    expect diff == -23595;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,6}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[3] [42479, 0, 4875];
    var diff := FirstEvenOddDifference(a);
    expect diff == -42479;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,5,6}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, 15439, 30, 31, 32, 33, 0, 77];
    var diff := FirstEvenOddDifference(a);
    expect diff == -15439;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,5,6}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, 26, 27, 0, 28, 29, 4875, 42479];
    var diff := FirstEvenOddDifference(a);
    expect diff == -27;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,3,5,6}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, -1, 0, 33, 34, 35, 17711];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,5,6}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [-1, 0, 17711, 4875];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{7}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[2] [42479, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == -42479;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,7}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[3] [42479, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == -42479;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,7}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [42477, 0, 4877, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == -42477;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,5,7}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [-1, 0, 4875, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,8}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[3] [0, 77, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == -77;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,5,8}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [0, 77, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == -77;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,5,8}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [-1, 29, 0, 23595, 27, 28, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{7,8}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[3] [42479, 4875, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == -42479;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,7,8}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [-1, 4875, 28, 0, 49, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == 29;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,7,8}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [15439, 42477, 28, 29, 30, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == -15411;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,5,7,8}/{1}:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [16733, 25, 0, 28, 64573, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == -16733;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,3}/{1}/Odiff>0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [0, 4875, 17713, 42477];
    var diff := FirstEvenOddDifference(a);
    expect diff == -4875;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,3}/{1}/Odiff<0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, 64571, 23595, 16733, 20901, 61225, 11707, 17711];
    var diff := FirstEvenOddDifference(a);
    expect diff == -64571;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,3}/{1}/Odiff=0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, 5997, 17893, 52571, 41953, 29361, 31843];
    var diff := FirstEvenOddDifference(a);
    expect diff == -5997;
  }

  // Test case for combination P{3,5}/{1}/Odiff>0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, 16731, 0, 33, 34, 35, 17713];
    var diff := FirstEvenOddDifference(a);
    expect diff == -16731;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,5}/{1}/Odiff<0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [0, 4875, 0, 33, 34, -1];
    var diff := FirstEvenOddDifference(a);
    expect diff == -4875;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,5}/{1}/Odiff=0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [0, 4875, 0, 24, -1];
    var diff := FirstEvenOddDifference(a);
    expect diff == -4875;
  }

  // Test case for combination P{2,3,5}/{1}/Odiff>0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [0, 4877, 0, 33, 34, 42477];
    var diff := FirstEvenOddDifference(a);
    expect diff == -4877;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,3,5}/{1}/Odiff<0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [0, 4877, 0, 24, 42477];
    var diff := FirstEvenOddDifference(a);
    expect diff == -4877;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,6}/{1}/Odiff>0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, 4877, 30, 31, 32, 0, 42477];
    var diff := FirstEvenOddDifference(a);
    expect diff == -4877;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,6}/{1}/Odiff<0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [0, 4877, 30, 31, 0, 42477];
    var diff := FirstEvenOddDifference(a);
    expect diff == -4877;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,6}/{1}/Odiff>0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [0, 0, 0, 42479];
    var diff := FirstEvenOddDifference(a);
    expect diff == -42479;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,6}/{1}/Odiff<0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, 0, 0, 0, 0, 0, 0, -1];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{3,6}/{1}/Odiff=0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, 0, 0, 0, 0, 0, -1];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1;
  }

  // Test case for combination P{4,6}/{1}/Odiff>0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [42479, 0, 0, 4875];
    var diff := FirstEvenOddDifference(a);
    expect diff == -42479;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,6}/{1}/Odiff<0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [-1, 0, 0, 0, 0, 0, 0, 4875];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,6}/{1}/Odiff=0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [-1, 0, 0, 0, 0, 0, 17711];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1;
  }

  // Test case for combination P{4,5,6}/{1}/Odiff>0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [-1, 17711, 30, 31, 32, 0, 52, 4875];
    var diff := FirstEvenOddDifference(a);
    expect diff == 31;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,5,6}/{1}/Odiff<0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [-1, 17711, 30, 31, 32, 0, 4875];
    var diff := FirstEvenOddDifference(a);
    expect diff == 31;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,5,6}/{1}/Odiff=0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [-1, 17711, 0, 33, 34, 4875];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1;
  }

  // Test case for combination P{4,7}/{1}/Odiff>0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [42479, 0, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == -42479;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,7}/{1}/Odiff<0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [-1, 0, 0, 0, 0, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,7}/{1}/Odiff=0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [-1, 0, 0, 0, 0, 0, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1;
  }

  // Test case for combination P{5,7}/{1}/Odiff>0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [42477, 4877, 28, 29, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == -42449;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,7}/{1}/Odiff<0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [77, 15439, 0, 23, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == -77;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{5,7}/{1}/Odiff=0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [42477, 4877, 0, 30, 31, 32, 33, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == -42477;
  }

  // Test case for combination P{4,5,7}/{1}/Odiff>0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [-1, 4875, 0, 23, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,5,7}/{1}/Odiff<0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [-1, 4875, 0, 32, 33, 34, 35, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,8}/{1}/Odiff>0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [0, 42477, 4877, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == -42477;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,8}/{1}/Odiff<0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, 16731, 17711, 23597, 64571, 20901, 61225, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == -16731;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,8}/{1}/Odiff=0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, 565, 56203, 2285, 41075, 31843, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == -565;
  }

  // Test case for combination P{4,8}/{1}/Odiff>0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [-1, 4875, 22, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == 23;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,8}/{1}/Odiff<0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [-1, 24, 25, 26, 0, 37, 23595, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == 25;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{4,8}/{1}/Odiff=0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [-1, 4875, 24, 25, 0, 26, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == 25;
  }

  // Test case for combination P{2,5,8}/{1}/Odiff>0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [0, 77, 30, 31, 32, 33, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == -77;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,5,8}/{1}/Odiff<0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [0, 42479, 30, 31, 32, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == -42479;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{2,5,8}/{1}/Odiff=0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [0, 42479, 30, 31, 0, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == -42479;
  }

  // Test case for combination P{7,8}/{1}/Odiff>0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [-1, 4875, 17711, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{7,8}/{1}/Odiff<0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [17893, 41953, 5995, 29361, 63785, 43311, 51813, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == -17893;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j];
  }

  // Test case for combination P{7,8}/{1}/Odiff=0:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  //   ENSURES: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [-1, 52571, 31843, 17889, 29361, 5995, 0];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1;
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
