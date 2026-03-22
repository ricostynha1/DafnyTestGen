// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\Correct_progs2\in\task_id_594.dfy
// Method: FirstEvenOddDifference
// Generated: 2026-03-21 23:14:40

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
  // Test case for combination P{3}/{1}/Ba=2:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[2] [-11500, -1];
    var diff := FirstEvenOddDifference(a);
    expect diff == -11499;
  }

  // Test case for combination P{2,3}/{1}/Ba=3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[3] [-16448, -16445, -16443];
    var diff := FirstEvenOddDifference(a);
    expect diff == -3;
  }

  // Test case for combination P{3,6}/{1}/Ba=3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[3] [-1736, -1734, -1733];
    var diff := FirstEvenOddDifference(a);
    expect diff == -3;
  }

  // Test case for combination P{4,6}/{1}/Ba=3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[3] [-4929, -4928, 1067];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1;
  }

  // Test case for combination P{7}/{1}/Ba=2:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[2] [-1, 2646];
    var diff := FirstEvenOddDifference(a);
    expect diff == 2647;
  }

  // Test case for combination P{4,7}/{1}/Ba=3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[3] [-3, -2, -4];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1;
  }

  // Test case for combination P{2,8}/{1}/Ba=3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[3] [-2118, -2119, -2120];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1;
  }

  // Test case for combination P{7,8}/{1}/Ba=3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[3] [-10569, -10567, -10566];
    var diff := FirstEvenOddDifference(a);
    expect diff == 3;
  }

  // Test case for combination P{2,3}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [16912, -1, 3777, 17891];
    var diff := FirstEvenOddDifference(a);
    expect diff == 16913;
  }

  // Test case for combination P{2,3}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [11808, 14131, 14135, 16007, 8331, 14133];
    var diff := FirstEvenOddDifference(a);
    expect diff == -2323;
  }

  // Test case for combination P{3,5}/{1}/R1:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [3306, 19450, -1, 18805];
    var diff := FirstEvenOddDifference(a);
    expect diff == 3307;
  }

  // Test case for combination P{3,5}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [11808, -8403, -8642, 17759, 165, 4550, 166, 17757];
    var diff := FirstEvenOddDifference(a);
    expect diff == 20211;
  }

  // Test case for combination P{3,5}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [11808, 5608, -2, -1, 18805, 4550, 2285];
    var diff := FirstEvenOddDifference(a);
    expect diff == 11809;
  }

  // Test case for combination P{2,3,5}/{1}/R1:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [16912, 4480, 3297, 11841];
    var diff := FirstEvenOddDifference(a);
    expect diff == 13615;
  }

  // Test case for combination P{2,3,5}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [11808, -1, 19821, 128, 136, 17758, 143, 11841];
    var diff := FirstEvenOddDifference(a);
    expect diff == 11809;
  }

  // Test case for combination P{2,3,5}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [11808, 13448, -2, -1, 3189, 17758, 11841];
    var diff := FirstEvenOddDifference(a);
    expect diff == 11809;
  }

  // Test case for combination P{2,6}/{1}/R1:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [16912, 4480, 3297, 9359];
    var diff := FirstEvenOddDifference(a);
    expect diff == 13615;
  }

  // Test case for combination P{2,6}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [11808, -1, 19821, 128, 136, 17758, 143, 5995];
    var diff := FirstEvenOddDifference(a);
    expect diff == 11809;
  }

  // Test case for combination P{2,6}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [11808, 13448, -2, -1, 3189, 17758, 5995];
    var diff := FirstEvenOddDifference(a);
    expect diff == 11809;
  }

  // Test case for combination P{3,6}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [1948, 72, 12566, -1];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1949;
  }

  // Test case for combination P{3,6}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [9358, 13756, 156, 166, 206, 5544, -1];
    var diff := FirstEvenOddDifference(a);
    expect diff == 9359;
  }

  // Test case for combination P{4,6}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [-1, 3776, 5994, 11841];
    var diff := FirstEvenOddDifference(a);
    expect diff == 3777;
  }

  // Test case for combination P{4,6}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [-1, 1948, 1946, 15708, 1071];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1949;
  }

  // Test case for combination P{4,5,6}/{1}/R1:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [-1, 3776, 16913, 5995];
    var diff := FirstEvenOddDifference(a);
    expect diff == 3777;
  }

  // Test case for combination P{4,5,6}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [-1, 1948, 17881, 6424, 134, 11809, 155, 4423];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1949;
  }

  // Test case for combination P{4,5,6}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [-1, 11809, 5609, 669, 1948, 14130, 12567];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1949;
  }

  // Test case for combination P{4,7}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [-1, 3776, 5994, 11840];
    var diff := FirstEvenOddDifference(a);
    expect diff == 3777;
  }

  // Test case for combination P{4,7}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [-1, 1948, 122, 132, 14130, 134, 1070];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1949;
  }

  // Test case for combination P{5,7}/{1}/R1:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [-1, 16913, 3776, 5994];
    var diff := FirstEvenOddDifference(a);
    expect diff == 3777;
  }

  // Test case for combination P{5,7}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[5] [-1, 11809, 949, 1948, 12566];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1949;
  }

  // Test case for combination P{5,7}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [-1, 8773, 17881, 1948, -3632, 11809, 167, 12566];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1949;
  }

  // Test case for combination P{4,5,7}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [-1, 1937, 1944, 1942, 1939, 179, 1940];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1945;
  }

  // Test case for combination P{4,5,7}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [-1, 19985, 11809, 1948, 2348, 12566];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1949;
  }

  // Test case for combination P{2,8}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [16912, -1, 13853, 17890];
    var diff := FirstEvenOddDifference(a);
    expect diff == 16913;
  }

  // Test case for combination P{2,8}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [11808, -1, 129, 145, -3, 153, 11806];
    var diff := FirstEvenOddDifference(a);
    expect diff == 11809;
  }

  // Test case for combination P{4,8}/{1}/R1:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [-1, 16913, 3776, 1070];
    var diff := FirstEvenOddDifference(a);
    expect diff == 3777;
  }

  // Test case for combination P{4,8}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [-1, -2131, -4, -6, -2129, 178, -9794];
    var diff := FirstEvenOddDifference(a);
    expect diff == -3;
  }

  // Test case for combination P{4,8}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[6] [-1, 19985, 11809, 1948, 2348, 1070];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1949;
  }

  // Test case for combination P{2,5,8}/{1}/R1:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [16912, -1, 4480, 9358];
    var diff := FirstEvenOddDifference(a);
    expect diff == 16913;
  }

  // Test case for combination P{2,5,8}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[8] [11808, 17758, -1, 131, 159, 2367, 133, 5994];
    var diff := FirstEvenOddDifference(a);
    expect diff == 11809;
  }

  // Test case for combination P{2,5,8}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [11808, 12984, -2, -1, 3189, 6038, 5994];
    var diff := FirstEvenOddDifference(a);
    expect diff == 11809;
  }

  // Test case for combination P{7,8}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[4] [-1, 12567, 18805, 1948];
    var diff := FirstEvenOddDifference(a);
    expect diff == 1949;
  }

  // Test case for combination P{7,8}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < a.Length && IsEven(a[i])
  //   PRE:  exists i :: 0 <= i < a.Length && IsOdd(a[i])
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && (forall k :: 0 <= k < i ==> !IsEven(a[k])) && IsOdd(a[j]) && (forall k :: 0 <= k < j ==> !IsOdd(a[k])) && diff == a[i] - a[j]
  {
    var a := new int[7] [-1, 12097, -3, 12777, 9099, 3301, 9358];
    var diff := FirstEvenOddDifference(a);
    expect diff == 9359;
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
