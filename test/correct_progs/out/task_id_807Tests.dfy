// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_807.dfy
// Method: FindFirstOdd
// Generated: 2026-04-08 09:47:24

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

method Passing()
{
  // Test case for combination {1}:
  //   POST: IsFirstOdd(a, index)
  //   POST: forall i :: 0 <= i < a.Length ==> !(a[i] % 2 != 0)
  {
    var a := new int[0] [];
    var index := FindFirstOdd(a);
    expect index == -1;
  }

  // Test case for combination {2}:
  //   POST: !(index == -1)
  //   POST: 0 <= index < a.Length && (a[index] % 2 != 0) && forall i :: 0 <= i < index ==> !(a[i] % 2 != 0)
  {
    var a := new int[1] [77];
    var index := FindFirstOdd(a);
    expect index == 0;
  }

  // Test case for combination {1}/Ba=1:
  //   POST: IsFirstOdd(a, index)
  //   POST: forall i :: 0 <= i < a.Length ==> !(a[i] % 2 != 0)
  {
    var a := new int[1] [0];
    var index := FindFirstOdd(a);
    expect index == -1;
  }

  // Test case for combination {1}/Ba=2:
  //   POST: IsFirstOdd(a, index)
  //   POST: forall i :: 0 <= i < a.Length ==> !(a[i] % 2 != 0)
  {
    var a := new int[2] [2, 0];
    var index := FindFirstOdd(a);
    expect index == -1;
  }

  // Test case for combination {2}/Oindex>0:
  //   POST: !(index == -1)
  //   POST: 0 <= index < a.Length && (a[index] % 2 != 0) && forall i :: 0 <= i < index ==> !(a[i] % 2 != 0)
  {
    var a := new int[2] [0, 42479];
    var index := FindFirstOdd(a);
    expect index == 1;
  }

  // Test case for combination {2}/Oindex=0:
  //   POST: !(index == -1)
  //   POST: 0 <= index < a.Length && (a[index] % 2 != 0) && forall i :: 0 <= i < index ==> !(a[i] % 2 != 0)
  {
    var a := new int[1] [1];
    var index := FindFirstOdd(a);
    expect index == 0;
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
