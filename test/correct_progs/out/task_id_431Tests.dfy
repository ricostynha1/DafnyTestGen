// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_431.dfy
// Method: HasCommonElement
// Generated: 2026-03-31 21:52:43

// Checks if two arrays have a common element.
method HasCommonElement<T(==)>(a: array<T>, b: array<T>) returns (result: bool)
    ensures result <==> exists i, j :: 0 <= i < a.Length && 0 <= j < b.Length && a[i] == b[j]
{
    result := false;
    for i := 0 to a.Length
        invariant forall k, l :: 0 <= k < i && 0 <= l < b.Length ==> a[k] != b[l]
    {
        for j := 0 to b.Length
            invariant forall k :: 0 <= k < j ==> a[i] != b[k]
        {
            if a[i] == b[j] {
                return true;
            }
        }
    }
    return false;
}

// Test cases checked statically
method HasCommonElementTest(){
    // single common element
    var a1 := new int[] [1, 2, 3, 4, 5];
    var a2 := new int[] [5, 6, 7, 8, 9];
    var out1 := HasCommonElement(a1, a2);
    assert a1[..] == [1, 2, 3, 4, 5]; // proof helper (array as seq)
    assert a2[..] == [5, 6, 7, 8, 9]; // proof helper (array as seq)
    assert 5 in a1[..] && 5 in a2[..];// proof helper (example)
    assert out1;

    // no common element
    var a3 := new int[] [1, 2, 3, 4, 5];
    var a4 := new int[] [6, 7, 8, 9];
    var out2 := HasCommonElement(a3, a4);
    assert !out2;

    // multiple common elements
    var a5 := new int[] [1, 0, 1, 0];
    var a6 := new int[] [2, 0, 1];
    var out3 := HasCommonElement(a5,a6);
    assert a5[..] == [1, 0, 1, 0]; // proof helper (array as seq)
    assert a6[..] == [2, 0, 1]; // proof helper (array as seq)
    assert 0 in a5[..] && 0 in a6[..]; // proof helper (example)
    assert out3;
}

method Passing()
{
  // Test case for combination {1}:
  //   POST: result
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < b.Length && a[i] == b[j]
  {
    var a := new int[1] [4];
    var b := new int[1] [4];
    var result := HasCommonElement<int>(a, b);
    expect result == true;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < b.Length && a[i] == b[j];
  }

  // Test case for combination {2}:
  //   POST: !result
  //   POST: !exists i, j :: 0 <= i < a.Length && 0 <= j < b.Length && a[i] == b[j]
  {
    var a := new int[0] [];
    var b := new int[0] [];
    var result := HasCommonElement<int>(a, b);
    expect result == false;
    expect !exists i, j :: 0 <= i < a.Length && 0 <= j < b.Length && a[i] == b[j];
  }

  // Test case for combination {1}/Ba=3,b=2:
  //   POST: result
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < b.Length && a[i] == b[j]
  {
    var a := new int[3] [5, 9, 10];
    var b := new int[2] [5, 11];
    var result := HasCommonElement<int>(a, b);
    expect result == true;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < b.Length && a[i] == b[j];
  }

  // Test case for combination {1}/Ba=3,b=1:
  //   POST: result
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < b.Length && a[i] == b[j]
  {
    var a := new int[3] [10, 9, 5];
    var b := new int[1] [5];
    var result := HasCommonElement<int>(a, b);
    expect result == true;
    expect exists i, j :: 0 <= i < a.Length && 0 <= j < b.Length && a[i] == b[j];
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
