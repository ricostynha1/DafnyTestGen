// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\FindMaxIndex.dfy
// Method: FindMaxIndex
// Generated: 2026-04-23 20:24:58

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
    var a := new real[2] [0.0, -0.5];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 0;
  }

  // Test case for combination {1}/BmaxIndex=1:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= maxIndex
  //   POST Q2: maxIndex < a.Length
  //   POST Q3: forall k: int :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  {
    var a := new real[2] [-4413.0, 0.0];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 1;
  }

  // Test case for combination {1}/O|a|=1:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= maxIndex
  //   POST Q2: maxIndex < a.Length
  //   POST Q3: forall k: int :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  {
    var a := new real[1] [0.0];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 0;
  }

  // Test case for combination {1}/OmaxIndex>=2:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= maxIndex
  //   POST Q2: maxIndex < a.Length
  //   POST Q3: forall k: int :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  {
    var a := new real[3] [-0.5, -4413.5, 0.0];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 2;
  }

  // Test case for combination {1}/R4:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= maxIndex
  //   POST Q2: maxIndex < a.Length
  //   POST Q3: forall k: int :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  {
    var a := new real[1] [-0.25];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 0;
  }

  // Test case for combination {1}/R5:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= maxIndex
  //   POST Q2: maxIndex < a.Length
  //   POST Q3: forall k: int :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  {
    var a := new real[1] [-1.25];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 0;
  }

  // Test case for combination {1}/R6:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= maxIndex
  //   POST Q2: maxIndex < a.Length
  //   POST Q3: forall k: int :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  {
    var a := new real[1] [-2.25];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 0;
  }

  // Test case for combination {1}/R7:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= maxIndex
  //   POST Q2: maxIndex < a.Length
  //   POST Q3: forall k: int :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  {
    var a := new real[1] [-3.25];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 0;
  }

  // Test case for combination {1}/R8:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= maxIndex
  //   POST Q2: maxIndex < a.Length
  //   POST Q3: forall k: int :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  {
    var a := new real[1] [-4.25];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 0;
  }

  // Test case for combination {1}/R9:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= maxIndex
  //   POST Q2: maxIndex < a.Length
  //   POST Q3: forall k: int :: 0 <= k < a.Length ==> a[maxIndex] >= a[k]
  {
    var a := new real[1] [-5.25];
    var maxIndex := FindMaxIndex(a);
    expect maxIndex == 0;
  }

}

method Main()
{
  TestsForFindMaxIndex();
  print "TestsForFindMaxIndex: all non-failing tests passed!\n";
}
