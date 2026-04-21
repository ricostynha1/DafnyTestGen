// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_170.dfy
// Method: CalcSumRange
// Generated: 2026-04-21 23:13:29

// Calculates the sum of elements in an array from a 'start' index
// (inclusive) to an 'end' index (exclusive).
// Itertative implementation.
method CalcSumRange(a: array<int>, start: nat := 0, end: nat := a.Length) returns (sum: int)
  requires 0 <= start <= end <= a.Length
  ensures sum == SumSeq(a[start..end]) 
{
  sum := 0;
  for i := start to end
    invariant sum == SumSeq(a[start..i])
  {
    sum := sum + a[i];
    assert a[start..i+1] == a[start..i] + [a[i]]; // proof helper

  }
}

// Recursive definition of the sum of elements in a sequence.
function {:fuel 4} SumSeq(s: seq<int>): int {
  if |s| == 0 then 0 else s[|s|-1] + SumSeq(s[..|s|-1])
}

// Test cases checked statically.
method SumInRangeTest(){
  var a1 := new int[] [2, 1, 5, 6];
  var s0 := CalcSumRange(a1, 0, 0);
  assert s0 == 0;
  var s1 := CalcSumRange(a1, 1, 2);
  assert s1 == 1;
  var s2 := CalcSumRange(a1, 1, 3);
  assert s2 == 6;
  var s3 := CalcSumRange(a1, 0, 2);
  assert s3 == 3;
  var s5 := CalcSumRange(a1, 0, 4);
  assert s5 == 14;
}

method TestsForCalcSumRange()
{
  // Test case for combination {1}:
  //   PRE:  0 <= start <= end <= a.Length
  //   POST Q1: sum == SumSeq(a[start .. end])
  //   POST Q2: sum == 0
  {
    var a := new int[2] [-10, -6];
    var start := 2;
    var end := 2;
    var sum := CalcSumRange(a, start, end);
    expect sum == 0;
  }

  // Test case for combination {2}:
  //   PRE:  0 <= start <= end <= a.Length
  //   POST Q1: |a[start .. end]| != 0
  //   POST Q2: sum == a[start .. end][|a[start .. end]| - 1] + SumSeq(a[start .. end][..|a[start .. end]| - 1])
  {
    var a := new int[3] [-10, -1, 5];
    var start := 2;
    var end := 3;
    var sum := CalcSumRange(a, start, end);
    expect sum == 5;
  }

  // Test case for combination {1}/Bstart=0:
  //   PRE:  0 <= start <= end <= a.Length
  //   POST Q1: sum == SumSeq(a[start .. end])
  //   POST Q2: sum == 0
  {
    var a := new int[1] [-1];
    var start := 0;
    var end := 0;
    var sum := CalcSumRange(a, start, end);
    expect sum == 0;
  }

  // Test case for combination {1}/Bstart=1:
  //   PRE:  0 <= start <= end <= a.Length
  //   POST Q1: sum == SumSeq(a[start .. end])
  //   POST Q2: sum == 0
  {
    var a := new int[1] [-1];
    var start := 1;
    var end := 1;
    var sum := CalcSumRange(a, start, end);
    expect sum == 0;
  }

}

method Main()
{
  TestsForCalcSumRange();
  print "TestsForCalcSumRange: all non-failing tests passed!\n";
}
