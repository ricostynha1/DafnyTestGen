// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_436.dfy
// Method: FindNegativeNumbers
// Generated: 2026-04-20 22:30:57

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

method TestsForFindNegativeNumbers()
{
  // Test case for combination {1}:
  //   POST: res == Filter(a[..], (x: int) => x < 0)
  //   POST: res == []
  //   ENSURES: res == Filter(a[..], (x: int) => x < 0)
  {
    var a := new int[0] [];
    var res := FindNegativeNumbers(a);
    expect res == [];
  }

  // Test case for combination {2}:
  //   POST: !(|a[..]| == 0)
  //   POST: a[..][|a[..]| - 1] < 0
  //   POST: res == Filter<T>(a[..][..|a[..]| - 1], (x: int) => x < 0) + [a[..][|a[..]| - 1]]
  //   ENSURES: res == Filter(a[..], (x: int) => x < 0)
  {
    var a := new int[1] [-10];
    var res := FindNegativeNumbers(a);
    expect res == [-10];
  }

  // Test case for combination {3}:
  //   POST: !(|a[..]| == 0)
  //   POST: !(a[..][|a[..]| - 1] < 0)
  //   POST: res == Filter<T>(a[..][..|a[..]| - 1], (x: int) => x < 0)
  //   ENSURES: res == Filter(a[..], (x: int) => x < 0)
  {
    var a := new int[1] [10];
    var res := FindNegativeNumbers(a);
    expect res == [];
  }

  // Test case for combination {2}/O|a|>=2:
  //   POST: !(|a[..]| == 0)
  //   POST: a[..][|a[..]| - 1] < 0
  //   POST: res == Filter<T>(a[..][..|a[..]| - 1], (x: int) => x < 0) + [a[..][|a[..]| - 1]]
  //   ENSURES: res == Filter(a[..], (x: int) => x < 0)
  {
    var a := new int[2] [8, -10];
    var res := FindNegativeNumbers(a);
    expect res == [-10];
  }

}

method Main()
{
  TestsForFindNegativeNumbers();
  print "TestsForFindNegativeNumbers: all non-failing tests passed!\n";
}
