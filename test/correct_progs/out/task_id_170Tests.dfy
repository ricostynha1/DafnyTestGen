// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_170.dfy
// Method: CalcSumRange
// Generated: 2026-04-10 23:14:24

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

method Passing()
{
  // Test case for combination {1}:
  //   PRE:  0 <= start <= end <= a.Length
  //   POST: sum == SumSeq(a[start .. end])
  //   POST: sum == 0
  //   ENSURES: sum == SumSeq(a[start .. end])
  {
    var a := new int[1] [12];
    var start := 0;
    var end := 0;
    var sum := CalcSumRange(a, start, end);
    expect sum == 0;
  }

  // Test case for combination {2}:
  //   PRE:  0 <= start <= end <= a.Length
  //   POST: !(|a[start .. end]| == 0)
  //   POST: sum == a[start .. end][|a[start .. end]| - 1] + (if |a[start .. end][..|a[start .. end]| - 1]| == 0 then 0 else a[start .. end][..|a[start .. end]| - 1][|a[start .. end][..|a[start .. end]| - 1]| - 1] + SumSeq(a[start .. end][..|a[start .. end]| - 1][..|a[start .. end][..|a[start .. end]| - 1]| - 1]))
  //   ENSURES: sum == SumSeq(a[start .. end])
  {
    var a := new int[1] [13];
    var start := 0;
    var end := 1;
    var sum := CalcSumRange(a, start, end);
    expect sum == 13;
  }

  // Test case for combination {1}/Ba=0,start==end,end==a_len:
  //   PRE:  0 <= start <= end <= a.Length
  //   POST: sum == SumSeq(a[start .. end])
  //   POST: sum == 0
  //   ENSURES: sum == SumSeq(a[start .. end])
  {
    var a := new int[0] [];
    var start := 0;
    var end := 0;
    var sum := CalcSumRange(a, start, end);
    expect sum == 0;
  }

  // Test case for combination {1}/Ba=1,start==end,end==a_len:
  //   PRE:  0 <= start <= end <= a.Length
  //   POST: sum == SumSeq(a[start .. end])
  //   POST: sum == 0
  //   ENSURES: sum == SumSeq(a[start .. end])
  {
    var a := new int[1] [2];
    var start := 1;
    var end := 1;
    var sum := CalcSumRange(a, start, end);
    expect sum == 0;
  }

  // Test case for combination {1}/Osum=0:
  //   PRE:  0 <= start <= end <= a.Length
  //   POST: sum == SumSeq(a[start .. end])
  //   POST: sum == 0
  //   ENSURES: sum == SumSeq(a[start .. end])
  {
    var a := new int[2] [13, 15];
    var start := 1;
    var end := 1;
    var sum := CalcSumRange(a, start, end);
    expect sum == 0;
  }

  // Test case for combination {2}/Osum>0:
  //   PRE:  0 <= start <= end <= a.Length
  //   POST: !(|a[start .. end]| == 0)
  //   POST: sum == a[start .. end][|a[start .. end]| - 1] + (if |a[start .. end][..|a[start .. end]| - 1]| == 0 then 0 else a[start .. end][..|a[start .. end]| - 1][|a[start .. end][..|a[start .. end]| - 1]| - 1] + SumSeq(a[start .. end][..|a[start .. end]| - 1][..|a[start .. end][..|a[start .. end]| - 1]| - 1]))
  //   ENSURES: sum == SumSeq(a[start .. end])
  {
    var a := new int[2] [15, 8];
    var start := 1;
    var end := 2;
    var sum := CalcSumRange(a, start, end);
    expect sum == 8;
  }

  // Test case for combination {2}/Osum<0:
  //   PRE:  0 <= start <= end <= a.Length
  //   POST: !(|a[start .. end]| == 0)
  //   POST: sum == a[start .. end][|a[start .. end]| - 1] + (if |a[start .. end][..|a[start .. end]| - 1]| == 0 then 0 else a[start .. end][..|a[start .. end]| - 1][|a[start .. end][..|a[start .. end]| - 1]| - 1] + SumSeq(a[start .. end][..|a[start .. end]| - 1][..|a[start .. end][..|a[start .. end]| - 1]| - 1]))
  //   ENSURES: sum == SumSeq(a[start .. end])
  {
    var a := new int[2] [8, 15];
    var start := 0;
    var end := 1;
    var sum := CalcSumRange(a, start, end);
    expect sum == 8;
  }

  // Test case for combination {2}/Osum=0:
  //   PRE:  0 <= start <= end <= a.Length
  //   POST: !(|a[start .. end]| == 0)
  //   POST: sum == a[start .. end][|a[start .. end]| - 1] + (if |a[start .. end][..|a[start .. end]| - 1]| == 0 then 0 else a[start .. end][..|a[start .. end]| - 1][|a[start .. end][..|a[start .. end]| - 1]| - 1] + SumSeq(a[start .. end][..|a[start .. end]| - 1][..|a[start .. end][..|a[start .. end]| - 1]| - 1]))
  //   ENSURES: sum == SumSeq(a[start .. end])
  {
    var a := new int[2] [9, 15];
    var start := 0;
    var end := 2;
    var sum := CalcSumRange(a, start, end);
    expect sum == 24;
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
