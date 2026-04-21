// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_807.dfy
// Method: FindFirstOdd
// Generated: 2026-04-21 23:17:58

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
  // Test case for combination {2}/Rel:
  //   POST Q1: index != -1
  //   POST Q2: 0 <= index
  //   POST Q3: index < a.Length
  //   POST Q4: a[index] % 2 != 0
  //   POST Q5: forall i: int {:trigger a[i]} :: 0 <= i && i < index ==> !(a[i] % 2 != 0)
  {
    var a := new int[2] [-9, -1];
    var index := FindFirstOdd(a);
    expect index == 0;
  }

  // Test case for combination {1}:
  //   POST Q1: IsFirstOdd(a, index)
  //   POST Q2: forall i: int {:trigger a[i]} :: 0 <= i && i < a.Length ==> !(a[i] % 2 != 0)
  {
    var a := new int[1] [-10];
    var index := FindFirstOdd(a);
    expect index == -1;
  }

  // Test case for combination {2}/V5:
  //   POST Q1: index != -1
  //   POST Q2: 0 <= index
  //   POST Q3: index < a.Length
  //   POST Q4: a[index] % 2 != 0
  //   POST Q5: forall i: int {:trigger a[i]} :: 0 <= i && i < index ==> !(a[i] % 2 != 0)  // VACUOUS (forced true by other literals for this ins)
  {
    var a := new int[1] [-1];
    var index := FindFirstOdd(a);
    expect index == 0;
  }

  // Test case for combination {2}/Bindex=1:
  //   POST Q1: index != -1
  //   POST Q2: 0 <= index
  //   POST Q3: index < a.Length
  //   POST Q4: a[index] % 2 != 0
  //   POST Q5: forall i: int {:trigger a[i]} :: 0 <= i && i < index ==> !(a[i] % 2 != 0)
  {
    var a := new int[2] [-10, -1];
    var index := FindFirstOdd(a);
    expect index == 1;
  }

}

method Main()
{
  TestsForFindFirstOdd();
  print "TestsForFindFirstOdd: all non-failing tests passed!\n";
}
