// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_436.dfy
// Method: FindNegativeNumbers
// Generated: 2026-04-15 22:30:50

// Resturns a sequence with the negative numbers in the input array 'a', 
// by the same order as they appear in the array.
method FindNegativeNumbers(a: array<int>) returns (res: seq<int>)
  ensures res == Filter(a[..], x => x < 0)
{
  res := [];
  for i := 0 to a.Length
    invariant res == Filter(a[..i], x => x < 0)
  {
    assert a[..i+1] == a[..i] + [a[i]]; // proof helper
    if a[i] < 0 {
      res := res + [a[i]];
    }
  }
  assert a[..] == a[..a.Length]; // proof helper
}

// Select from a sequence 'a' the elements that satisfy a predicate 'p'.
function {:fuel 4} Filter<T>(a: seq<T>, p: (T) -> bool): seq<T> {
  if |a| == 0 then []
  else if p(a[|a|-1]) then Filter(a[..|a|-1], p) + [a[|a|-1]]
  else Filter(a[..|a|-1], p)
}

// Test cases checked statically.
method FindNegativeNumbersTest(){
  var a1 := new int[] [-1, 4, 5, -6];
  var res1 := FindNegativeNumbers(a1);
  assert res1 == [-1, -6];

  var a2:= new int[] [-1, -2, -3];
  var res2 := FindNegativeNumbers(a2);
  assert res2 == [-1, -2, -3];

  var a3:= new int[] [0, 1];
  var res3 := FindNegativeNumbers(a3);
  assert res3 == [];
}

method Passing()
{
  // Test case for combination {1}:
  //   POST: res == Filter(a[..], x => x < 0)
  //   ENSURES: res == Filter(a[..], x => x < 0)
  {
    var a := new int[0] [];
    var res := FindNegativeNumbers(a);
    expect res == [];
  }

  // Test case for combination {1}/Ba=1:
  //   POST: res == Filter(a[..], x => x < 0)
  //   ENSURES: res == Filter(a[..], x => x < 0)
  {
    var a := new int[1] [2];
    var res := FindNegativeNumbers(a);
    expect res == [];
  }

  // Test case for combination {1}/Ba=2:
  //   POST: res == Filter(a[..], x => x < 0)
  //   ENSURES: res == Filter(a[..], x => x < 0)
  {
    var a := new int[2] [4, 3];
    var res := FindNegativeNumbers(a);
    expect res == [];
  }

  // Test case for combination {1}/Ba=3:
  //   POST: res == Filter(a[..], x => x < 0)
  //   ENSURES: res == Filter(a[..], x => x < 0)
  {
    var a := new int[3] [5, 4, 6];
    var res := FindNegativeNumbers(a);
    expect res == [];
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
