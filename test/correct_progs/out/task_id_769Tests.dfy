// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_769.dfy
// Method: Difference
// Generated: 2026-03-31 21:54:38

// Returns the subsequence of elements of sequence 'a' that do not exist
// in a sequence 'b'.
method Difference<T(==)>(a: seq<T>, b: seq<T>) returns (diff: seq<T>)
  ensures diff == filter(a, (x) => x !in b)
{
  diff := [];
  for i := 0 to |a|
    invariant diff == filter(a[..i], (x) => x !in b)
  {
    if a[i] !in b {
      diff := diff + [a[i]];
    }
    assert a[..i+1] == a[..i] + [a[i]]; // proof helper
  }
  assert a == a[..|a|]; // proof helper
}

// Returns the subsequence of elements of 'a' that satisfy a predicate 'p'.
function {:fuel 3} filter<T>(a: seq<T>, p: (T) -> bool) : seq<T> {
  if |a| == 0 then a
  else if p(a[|a| - 1]) then filter(a[..|a| - 1], p) + [a[|a| - 1]]
  else filter(a[..|a| - 1], p)
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


method Passing()
{
  // Test case for combination {1}:
  //   POST: diff == filter(a, x => x !in b)
  {
    var a: seq<int> := [];
    var b: seq<int> := [];
    var check_diff := filter(a, x => x !in b);
    var diff := Difference<int>(a, b);
    expect diff == check_diff;
  }

  // Test case for combination {1}/Ba=0,b=1:
  //   POST: diff == filter(a, x => x !in b)
  {
    var a: seq<int> := [];
    var b: seq<int> := [2];
    var check_diff := filter(a, x => x !in b);
    var diff := Difference<int>(a, b);
    expect diff == check_diff;
  }

  // Test case for combination {1}/Ba=0,b=2:
  //   POST: diff == filter(a, x => x !in b)
  {
    var a: seq<int> := [];
    var b: seq<int> := [4, 3];
    var check_diff := filter(a, x => x !in b);
    var diff := Difference<int>(a, b);
    expect diff == check_diff;
  }

  // Test case for combination {1}/Ba=0,b=3:
  //   POST: diff == filter(a, x => x !in b)
  {
    var a: seq<int> := [];
    var b: seq<int> := [5, 4, 6];
    var check_diff := filter(a, x => x !in b);
    var diff := Difference<int>(a, b);
    expect diff == check_diff;
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
