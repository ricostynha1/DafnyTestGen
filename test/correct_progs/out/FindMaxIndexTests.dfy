// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\FindMaxIndex.dfy
// Method: FindMaxIndex
// Generated: 2026-04-15 16:33:40

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




method Passing()
{
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST: 0 <= maxIndex < a.Length
  //   POST: forall k :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  //   ENSURES: 0 <= maxIndex < a.Length
  //   ENSURES: forall k :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  {
    var a := new real[1] [38.0];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 0;
  }

  // Test case for combination {1}/Q|a|>=2:
  //   PRE:  a.Length > 0
  //   POST: 0 <= maxIndex < a.Length
  //   POST: forall k :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  //   ENSURES: 0 <= maxIndex < a.Length
  //   ENSURES: forall k :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  {
    var a := new real[2] [38.0, -7719.0];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 0;
  }

  // Test case for combination {1}/Ba=3:
  //   PRE:  a.Length > 0
  //   POST: 0 <= maxIndex < a.Length
  //   POST: forall k :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  //   ENSURES: 0 <= maxIndex < a.Length
  //   ENSURES: forall k :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  {
    var a := new real[3] [-5282.5, -5282.25, -5282.0];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 2;
  }

  // Test case for combination {1}/OmaxIndex=1:
  //   PRE:  a.Length > 0
  //   POST: 0 <= maxIndex < a.Length
  //   POST: forall k :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  //   ENSURES: 0 <= maxIndex < a.Length
  //   ENSURES: forall k :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  {
    var a := new real[4] [-38.0, 0.0, -7719.0, -21238.0];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 1;
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
