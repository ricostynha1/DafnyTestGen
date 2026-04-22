// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_8.dfy
// Method: SquareElements
// Generated: 2026-04-21 23:45:06

// Returns an array of the same length as the input array, 
// with each element of the input array squared.
method SquareElements(a: array<int>) returns (squared: array<int>)
  ensures squared.Length == a.Length
  ensures forall i :: 0 <= i < a.Length ==> squared[i] == a[i] * a[i]
{
  squared := new int[a.Length];
  for i := 0 to a.Length
    invariant forall k :: 0 <= k < i ==> squared[k] == a[k] * a[k]
  {
    squared[i] := a[i] * a[i];
  }
}

// Test cases checked statically
method SquareElementsTest(){
  // Typical case
  var a1 := new int[] [1, 2, 3, 4, 5];
  var res1 := SquareElements(a1);
  assert res1[..] ==  [1, 4, 9, 16, 25];

  // Boundary case - single element
  var a2 := new int[] [0];
  var res2 := SquareElements(a2);
  assert res2[..] == [0];

  // Boundary case - empty array
  var a3 := new int[] [];
  var res3:=SquareElements(a3);
  assert res3[..] == [];
}

method TestsForSquareElements()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: squared.Length == a.Length
  //   POST Q2: forall i: int :: 0 <= i < a.Length ==> squared[i] == a[i] * a[i]
  {
    var a := new int[1] [-3];
    var squared := SquareElements(a);
    expect squared[..] == [9];
  }

  // Test case for combination {1}/O|a|=0:
  //   POST Q1: squared.Length == a.Length
  //   POST Q2: forall i: int :: 0 <= i < a.Length ==> squared[i] == a[i] * a[i]
  {
    var a := new int[0] [];
    var squared := SquareElements(a);
    expect squared[..] == [];
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: squared.Length == a.Length
  //   POST Q2: forall i: int :: 0 <= i < a.Length ==> squared[i] == a[i] * a[i]
  {
    var a := new int[2] [-1, -10];
    var squared := SquareElements(a);
    expect squared[..] == [1, 100];
  }

}

method Main()
{
  TestsForSquareElements();
  print "TestsForSquareElements: all non-failing tests passed!\n";
}
