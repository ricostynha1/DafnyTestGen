// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_790.dfy
// Method: IsEvenAtIndexEven
// Generated: 2026-04-21 23:44:56

// Checks if all elements at even indices are even.
method IsEvenAtIndexEven(s: seq<int>) returns (result: bool)
  ensures result <==> forall i :: 0 <= i < |s| && IsEven(i) ==> IsEven(s[i])
{
  for i := 0 to |s|
    invariant forall k :: 0 <= k < i && IsEven(k) ==> IsEven(s[k])
  {
    if IsEven(i) && !IsEven(s[i]) {
      return false;
    }
  }
  return true;
}

// Checks if a number is even.
predicate IsEven(n: int) {
  n % 2 == 0
}

// Tests.
method IsEvenAtIndexEvenTest(){
  var s1: seq<int> := [3, 2, 1];
  var res1 := IsEvenAtIndexEven(s1);
  assert !IsEven(s1[0]); // proof heper (counter-example)
  assert !res1;

  var s2: seq<int> := [1, 2, 3];
  var res2 := IsEvenAtIndexEven(s2);
  assert !IsEven(s2[0]); // proof heper (counter-example)
  assert !res2;

  var s3: seq<int> := [2, 1, 4];
  var res3 := IsEvenAtIndexEven(s3);
  assert res3;
}

method TestsForIsEvenAtIndexEven()
{
  // Test case for combination {1}:
  //   POST Q1: result
  //   POST Q2: forall i: int :: 0 <= i < |s| && IsEven(i) ==> IsEven(s[i])
  {
    var s: seq<int> := [8];
    var result := IsEvenAtIndexEven(s);
    expect result == true;
  }

  // Test case for combination {2}:
  //   POST Q1: !result
  //   POST Q2: 0 <= (|s| - 1)
  //   POST Q3: IsEven(0) && !IsEven(s[0])
  {
    var s: seq<int> := [-1];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {3}:
  //   POST Q1: !result
  //   POST Q2: exists i :: 1 <= i < (|s| - 1) && IsEven(i) && !IsEven(s[i])
  {
    var s: seq<int> := [-2, -4, -1, 19, 27675];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {1}/O|s|=0:
  //   POST Q1: result
  //   POST Q2: forall i: int :: 0 <= i < |s| && IsEven(i) ==> IsEven(s[i])
  {
    var s: seq<int> := [];
    var result := IsEvenAtIndexEven(s);
    expect result == true;
  }

}

method Main()
{
  TestsForIsEvenAtIndexEven();
  print "TestsForIsEvenAtIndexEven: all non-failing tests passed!\n";
}
