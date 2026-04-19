// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_769.dfy
// Method: Difference
// Generated: 2026-04-19 21:59:53

// Returns the subsequence of elements of sequence 'a' that do not exist
// in a sequence 'b'.
method Difference<T(==)>(a: seq<T>, b: seq<T>) returns (diff: seq<T>)
  ensures diff == filter(a, b)
{
  diff := [];
  for i := 0 to |a|
    invariant diff == filter(a[..i], b)
  {
    if a[i] !in b {
      diff := diff + [a[i]];
    }
    assert a[..i+1] == a[..i] + [a[i]]; // proof helper
  }
  assert a == a[..|a|]; // proof helper
}

// Returns the subsequence of elements of 'a' that do not exist in 'b'.
function {:fuel 3} filter<T(==)>(a: seq<T>, b: seq<T>) : seq<T> {
  if |a| == 0 then a
  else if a[|a| - 1] in b then filter(a[..|a| - 1], b)
  else filter(a[..|a| - 1], b) + [a[|a| - 1]]
}

// Teste cases checked statically.
method DifferenceTest(){
  var a1:seq<int> := [1, 2, 3, 4];
  var a2:seq<int> := [2, 4, 6];
  var res1 := Difference(a1, a2);
  assert res1 == [1, 3];

  var a3: seq<int>:= [1, 2, 3, 4];
  var a4: seq<int>:= [6, 7, 1];
  var res2 := Difference(a3, a4);
  assert res2 == [2, 3, 4];

  var a5:seq<int>:= [1, 2, 3];
  var a6:seq<int>:= [3, 2, 1];
  var res3 := Difference(a5, a6);
  assert res3 == [];
}


method TestsForDifference()
{
  // Test case for combination {1}:
  //   POST: diff == filter(a, b)
  //   POST: diff == a
  //   ENSURES: diff == filter(a, b)
  {
    var a: seq<int> := [];
    var b: seq<int> := [];
    var diff := Difference<int>(a, b);
    expect diff == [];
  }

  // Test case for combination {2}:
  //   POST: !(|a| == 0)
  //   POST: a[|a| - 1] in b
  //   POST: diff == filter<int>(a[..|a| - 1], b)
  //   ENSURES: diff == filter(a, b)
  {
    var a: seq<int> := [9];
    var b: seq<int> := [9];
    var diff := Difference<int>(a, b);
    expect diff == [];
  }

  // Test case for combination {3}:
  //   POST: !(|a| == 0)
  //   POST: !(a[|a| - 1] in b)
  //   POST: diff == filter<int>(a[..|a| - 1], b) + [a[|a| - 1]]
  //   ENSURES: diff == filter(a, b)
  {
    var a: seq<int> := [17];
    var b: seq<int> := [];
    var diff := Difference<int>(a, b);
    expect diff == [17];
  }

  // Test case for combination {1}/O|b|=1:
  //   POST: diff == filter(a, b)
  //   POST: diff == a
  //   ENSURES: diff == filter(a, b)
  {
    var a: seq<int> := [];
    var b: seq<int> := [2];
    var diff := Difference<int>(a, b);
    expect diff == [];
  }

}

method Main()
{
  TestsForDifference();
  print "TestsForDifference: all non-failing tests passed!\n";
}
