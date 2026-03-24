// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_105.dfy
// Method: CalcCountTrue
// Generated: 2026-03-24 21:25:35

// Counts the number of true values in a boolean array 'a'.
method CalcCountTrue(a: array<bool>) returns (count: nat)
  ensures count == multiset(a[..])[true]
{
  count := 0;
  for i := 0 to a.Length
    invariant count == multiset(a[..i])[true]
  {
    if a[i] {
      count := count + 1;
    }
  }
  assert a[..] == a[..a.Length]; // proof helper
}

// Test cases checked statically.
method CountTrueTest(){
  var a1 := new bool[] [true, false, true];
  assert a1[..] == [true, false, true]; // proof helper
  var c1 := CalcCountTrue(a1);
  assert c1 == 2;
 
  var a2 := new bool[] [false, false];
  var c2 := CalcCountTrue(a2);
  assert c2 == 0;

  var a3 := new bool[] [true, true, true];
  assert a3[..] == [true, true, true]; // proof helper
  var c3 := CalcCountTrue(a3);
  assert c3 == 3;
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: count == multiset(a[..])[true]
  {
    var a := new bool[0] [];
    var count := CalcCountTrue(a);
    expect count == multiset(a[..])[true];
  }

  // Test case for combination {1}/Ba=1:
  //   POST: count == multiset(a[..])[true]
  {
    var a := new bool[1] [false];
    var count := CalcCountTrue(a);
    expect count == multiset(a[..])[true];
  }

  // Test case for combination {1}/Ba=2:
  //   POST: count == multiset(a[..])[true]
  {
    var a := new bool[2] [true, false];
    var count := CalcCountTrue(a);
    expect count == multiset(a[..])[true];
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
