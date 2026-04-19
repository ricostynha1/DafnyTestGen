// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\FindMaxIndex.dfy
// Method: FindMaxIndex
// Generated: 2026-04-19 21:52:31

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
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST: 0 <= maxIndex
  //   POST: maxIndex < a.Length
  //   POST: forall k: int :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  //   ENSURES: 0 <= maxIndex < a.Length
  //   ENSURES: forall k: int :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  {
    var a := new real[1] [0.0];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 0;
  }

  // Test case for combination {1}/Q|a|>=2:
  //   PRE:  a.Length > 0
  //   POST: 0 <= maxIndex
  //   POST: maxIndex < a.Length
  //   POST: forall k: int :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  //   ENSURES: 0 <= maxIndex < a.Length
  //   ENSURES: forall k: int :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  {
    var a := new real[2] [-1.0, -31226.0];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 0;
  }

  // Test case for combination {1}/Rel:
  //   PRE:  a.Length > 0
  //   POST: 0 <= maxIndex
  //   POST: maxIndex < a.Length
  //   POST: forall k: int :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  //   ENSURES: 0 <= maxIndex < a.Length
  //   ENSURES: forall k: int :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  {
    var a := new real[2] [63739.0, 63738.5];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 0;
  }

  // Test case for combination {1}/BmaxIndex=1:
  //   PRE:  a.Length > 0
  //   POST: 0 <= maxIndex
  //   POST: maxIndex < a.Length
  //   POST: forall k: int :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  //   ENSURES: 0 <= maxIndex < a.Length
  //   ENSURES: forall k: int :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  {
    var a := new real[2] [-62453.0, -62453.0];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 1 || maxIndex == 0;
  }

}

method Main()
{
  TestsForFindMaxIndex();
  print "TestsForFindMaxIndex: all non-failing tests passed!\n";
}
