// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_807.dfy
// Method: FindFirstOdd
// Generated: 2026-04-19 21:38:16

// Finds the index of the first odd number in an arrray.
// If there is no odd number, returns -1.
method FindFirstOdd(a: array<int>) returns (index: int)
    ensures IsFirstOdd(a, index)
{
    for i := 0 to a.Length
        invariant forall j :: 0 <= j < i ==> !IsOdd(a[j])
    {
        if IsOdd(a[i]) {
            return i;
        }
    }
    return -1;
}

// Post-condition of method FindFirstOdd defined separately for reuse.
predicate IsFirstOdd(a: array<int>, index: int)
  reads a
{
    if index == -1 then forall i :: 0 <= i < a.Length ==> !IsOdd(a[i])
    else 0 <= index < a.Length && IsOdd(a[index]) 
         && forall i :: 0 <= i < index ==> !IsOdd(a[i])
}

predicate IsOdd(x: int) {
    x % 2 != 0
}

// Test cases checked statically.
method FindFirstOddTest(){
    // first
    var a1 := new int[] [1, 3, 5];

    var out1 := FindFirstOdd(a1);
    assert IsOdd(a1[0]); // proof helper
    assert out1 == 0;

    // last
    var a2 := new int[] [2, 4, 1];
    var out2 := FindFirstOdd(a2);
    assert IsOdd(a2[2]); // proof helper
    assert out2 == 2;

    // none
    var a3 := new int[] [2, 6, 4];
    var out3 := FindFirstOdd(a3);
    assert out3 == -1;
}

method TestsForFindFirstOdd()
{
  // Test case for combination {1}:
  //   POST: IsFirstOdd(a, index)
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i && i < a.Length ==> !(a[i] % 2 != 0)
  //   ENSURES: IsFirstOdd(a, index)
  {
    var a := new int[1] [-2];
    var index := FindFirstOdd(a);
    expect index == -1;
  }

  // Test case for combination {2}:
  //   POST: !(index == -1)
  //   POST: 0 <= index
  //   POST: index < a.Length
  //   POST: a[index] % 2 != 0
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i && i < index ==> !(a[i] % 2 != 0)
  //   ENSURES: IsFirstOdd(a, index)
  {
    var a := new int[1] [-1];
    var index := FindFirstOdd(a);
    expect index == 0;
  }

  // Test case for combination {1}/Q|a|>=2:
  //   POST: IsFirstOdd(a, index)
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i && i < a.Length ==> !(a[i] % 2 != 0)
  //   ENSURES: IsFirstOdd(a, index)
  {
    var a := new int[2] [96424, 64768];
    var index := FindFirstOdd(a);
    expect index == -1;
  }

  // Test case for combination {1}/Q|a|=0:
  //   POST: IsFirstOdd(a, index)
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i && i < a.Length ==> !(a[i] % 2 != 0)
  //   ENSURES: IsFirstOdd(a, index)
  {
    var a := new int[0] [];
    var index := FindFirstOdd(a);
    expect index == -1;
  }

  // Test case for combination {2}/Q|a|>=2:
  //   POST: !(index == -1)
  //   POST: 0 <= index
  //   POST: index < a.Length
  //   POST: a[index] % 2 != 0
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i && i < index ==> !(a[i] % 2 != 0)
  //   ENSURES: IsFirstOdd(a, index)
  {
    var a := new int[2] [-1, 60859];
    var index := FindFirstOdd(a);
    expect index == 0;
  }

  // Test case for combination {2}/Rel:
  //   POST: !(index == -1)
  //   POST: 0 <= index
  //   POST: index < a.Length
  //   POST: a[index] % 2 != 0
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i && i < index ==> !(a[i] % 2 != 0)
  //   ENSURES: IsFirstOdd(a, index)
  {
    var a := new int[2] [4875, 17711];
    var index := FindFirstOdd(a);
    expect index == 0;
  }

}

method Main()
{
  TestsForFindFirstOdd();
  print "TestsForFindFirstOdd: all non-failing tests passed!\n";
}
