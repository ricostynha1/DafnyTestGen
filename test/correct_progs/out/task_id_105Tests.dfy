// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_105.dfy
// Method: CalcCountTrue
// Generated: 2026-04-18 10:10:29

// Counts the number of true values in a boolean array 'a'.
method CalcCountTrue(a: array<bool>) returns (count: nat)
  ensures count == countTrue(a[..])
{
  count := 0;
  for i := 0 to a.Length
    invariant count == countTrue(a[..i])
  {
    if a[i] {
      count := count + 1;
    }
    assert a[..i+1] == a[..i] + [a[i]]; // proof helper
  }
  assert a[..] == a[..a.Length]; // proof helper
}

function {:fuel 3} countTrue(s: seq<bool>): nat
{
  if |s| == 0 then 0
  else if s[|s|-1] then countTrue(s[..|s|-1]) + 1
  else countTrue(s[..|s|-1])
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


method TestsForCalcCountTrue()
{
  // Test case for combination {1}:
  //   POST: count == countTrue(a[..])
  //   POST: count == 0
  //   ENSURES: count == countTrue(a[..])
  {
    var a := new bool[0] [];
    var count := CalcCountTrue(a);
    expect count == 0;
  }

  // Test case for combination {2}:
  //   POST: !(|a[..]| == 0)
  //   POST: a[..][|a[..]| - 1]
  //   POST: count == countTrue(a[..][..|a[..]| - 1]) + 1
  //   ENSURES: count == countTrue(a[..])
  {
    var a := new bool[1] [true];
    var count := CalcCountTrue(a);
    expect count == 1;
  }

  // Test case for combination {3}:
  //   POST: !(|a[..]| == 0)
  //   POST: !(a[..][|a[..]| - 1])
  //   POST: count == countTrue(a[..][..|a[..]| - 1])
  //   ENSURES: count == countTrue(a[..])
  {
    var a := new bool[1] [false];
    var count := CalcCountTrue(a);
    expect count == 0;
  }

  // Test case for combination {2}/O|a|>=2:
  //   POST: !(|a[..]| == 0)
  //   POST: a[..][|a[..]| - 1]
  //   POST: count == countTrue(a[..][..|a[..]| - 1]) + 1
  //   ENSURES: count == countTrue(a[..])
  {
    var a := new bool[2] [false, true];
    var count := CalcCountTrue(a);
    expect count == 1;
  }

}

method Main()
{
  TestsForCalcCountTrue();
  print "TestsForCalcCountTrue: all non-failing tests passed!\n";
}
