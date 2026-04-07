// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_760.dfy
// Method: HasOnlyOneDistinctElement
// Generated: 2026-04-06 23:27:47

// Checks if the given array has only one distinct element (or is empty).
method HasOnlyOneDistinctElement<T(==)>(a: array<T>) returns (result: bool)
    ensures result <==> forall i, j :: 0 <= i < j < a.Length ==> a[i] == a[j]
{
    if a.Length == 0 {
        return true;
    }
    var firstElement := a[0];
    for i := 1 to a.Length
        invariant forall k :: 0 <= k < i ==> a[k] == firstElement
    {
        if a[i] != firstElement {
            return false;
        }
    }
    return true;
}

// Test cases checked statically.
method HasOnlyOneDistinctElementTest(){
    var a1 := new int[] [1, 1, 1];
    var res1 := HasOnlyOneDistinctElement(a1);
    assert res1;

    var a2 := new int[] [1, 2, 1, 2];
    var res2 := HasOnlyOneDistinctElement(a2);
    assert a2[0] != a2[1]; // proof helper (counter example)
    assert !res2;

    var a3 := new int[] [];
    var res3 := HasOnlyOneDistinctElement(a3);
    assert res3;
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: result
  //   POST: forall i, j :: 0 <= i < j < a.Length ==> a[i] == a[j]
  {
    var a := new int[0] [];
    var result := HasOnlyOneDistinctElement<int>(a);
    expect result == true;
  }

  // Test case for combination {2}:
  //   POST: !result
  //   POST: !forall i, j :: 0 <= i < j < a.Length ==> a[i] == a[j]
  {
    var a := new int[2] [8, 16];
    var result := HasOnlyOneDistinctElement<int>(a);
    expect result == false;
  }

  // Test case for combination {1}/Ba=1:
  //   POST: result
  //   POST: forall i, j :: 0 <= i < j < a.Length ==> a[i] == a[j]
  {
    var a := new int[1] [2];
    var result := HasOnlyOneDistinctElement<int>(a);
    expect result == true;
  }

  // Test case for combination {2}/Ba=3:
  //   POST: !result
  //   POST: !forall i, j :: 0 <= i < j < a.Length ==> a[i] == a[j]
  {
    var a := new int[3] [5, 4, 6];
    var result := HasOnlyOneDistinctElement<int>(a);
    expect result == false;
  }

  // Test case for combination {1}/Oresult=true:
  //   POST: result
  //   POST: forall i, j :: 0 <= i < j < a.Length ==> a[i] == a[j]
  {
    var a := new int[2] [9, 9];
    var result := HasOnlyOneDistinctElement<int>(a);
    expect result == true;
  }

  // Test case for combination {2}/Oresult=false:
  //   POST: !result
  //   POST: !forall i, j :: 0 <= i < j < a.Length ==> a[i] == a[j]
  {
    var a := new int[4] [8, 16, 22, 26];
    var result := HasOnlyOneDistinctElement<int>(a);
    expect result == false;
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
