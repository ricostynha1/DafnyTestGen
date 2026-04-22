// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\FindMaxIndex.dfy
// Method: FindMaxIndex
// Generated: 2026-04-21 23:35:55

// Finds the index of a maximum value in a non-empty array.
method FindMaxIndex(a: array<real>) returns (maxIndex: nat)
  requires a.Length > 0
  ensures 0 <= maxIndex < a.Length
  ensures forall k :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
{
    maxIndex := 0;
    for i := 1 to a.Length
      invariant 0 <= maxIndex < i
      invariant forall k :: 0 <= k < i ==> a[maxIndex] >= a[k]
    {
        if (a[i] > a[maxIndex]) {
            maxIndex := i;
        }
    } 
}




method TestsForFindMaxIndex()
{
  // Test case for combination {1}/Rel:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= maxIndex
  //   POST Q2: maxIndex < a.Length
  //   POST Q3: forall k: int :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  {
    var a := new real[2] [53393.0, 53393.5];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 1;
  }

  // Test case for combination {1}/V3:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= maxIndex
  //   POST Q2: maxIndex < a.Length
  //   POST Q3: forall k: int :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]  // VACUOUS (forced true by other literals for this ins)
  {
    var a := new real[1] [17517.0];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 0;
  }

  // Test case for combination {1}/OmaxIndex>=2:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= maxIndex
  //   POST Q2: maxIndex < a.Length
  //   POST Q3: forall k: int :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  {
    var a := new real[3] [0.0, -29443.0, 17517.0];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 2;
  }

  // Test case for combination {1}/R2:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= maxIndex
  //   POST Q2: maxIndex < a.Length
  //   POST Q3: forall k: int :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  {
    var a := new real[1] [-0.5];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 0;
  }

}

method Main()
{
  TestsForFindMaxIndex();
  print "TestsForFindMaxIndex: all non-failing tests passed!\n";
}
