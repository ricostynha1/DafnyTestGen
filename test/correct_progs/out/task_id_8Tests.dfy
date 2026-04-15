// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_8.dfy
// Method: SquareElements
// Generated: 2026-04-15 16:45:55

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

method Passing()
{
  // Test case for combination {1}:
  //   POST: squared.Length == a.Length
  //   POST: forall i :: 0 <= i < a.Length ==> squared[i] == a[i] * a[i]
  //   ENSURES: squared.Length == a.Length
  //   ENSURES: forall i :: 0 <= i < a.Length ==> squared[i] == a[i] * a[i]
  {
    var a := new int[0] [];
    var squared := SquareElements(a);
    expect squared[..] == [];
  }

  // Test case for combination {1}/Q|a|>=2:
  //   POST: squared.Length == a.Length
  //   POST: forall i :: 0 <= i < a.Length ==> squared[i] == a[i] * a[i]
  //   ENSURES: squared.Length == a.Length
  //   ENSURES: forall i :: 0 <= i < a.Length ==> squared[i] == a[i] * a[i]
  {
    var a := new int[2] [0, 0];
    var squared := SquareElements(a);
    expect squared[..] == [0, 0];
  }

  // Test case for combination {1}/Q|a|=1:
  //   POST: squared.Length == a.Length
  //   POST: forall i :: 0 <= i < a.Length ==> squared[i] == a[i] * a[i]
  //   ENSURES: squared.Length == a.Length
  //   ENSURES: forall i :: 0 <= i < a.Length ==> squared[i] == a[i] * a[i]
  {
    var a := new int[1] [0];
    var squared := SquareElements(a);
    expect squared[..] == [0];
  }

  // Test case for combination {1}/Ba=3:
  //   POST: squared.Length == a.Length
  //   POST: forall i :: 0 <= i < a.Length ==> squared[i] == a[i] * a[i]
  //   ENSURES: squared.Length == a.Length
  //   ENSURES: forall i :: 0 <= i < a.Length ==> squared[i] == a[i] * a[i]
  {
    var a := new int[3] [-2, -1, 0];
    var squared := SquareElements(a);
    expect squared[..] == [4, 1, 0];
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
