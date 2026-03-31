// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_790.dfy
// Method: IsEvenAtIndexEven
// Generated: 2026-03-31 21:30:28

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

method GeneratedTests_IsEvenAtIndexEven()
{
  // Test case for combination {1}:
  //   POST: result
  //   POST: forall i :: 0 <= i < |s| && IsEven(i) ==> IsEven(s[i])
  {
    var s: seq<int> := [];
    var result := IsEvenAtIndexEven(s);
    expect result == true;
    expect forall i :: 0 <= i < |s| && IsEven(i) ==> IsEven(s[i]);
  }

  // Test case for combination {2}:
  //   POST: !result
  //   POST: !forall i :: 0 <= i < |s| && IsEven(i) ==> IsEven(s[i])
  {
    var s: seq<int> := [3];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
    expect !forall i :: 0 <= i < |s| && IsEven(i) ==> IsEven(s[i]);
  }

  // Test case for combination {1}/Bs=1:
  //   POST: result
  //   POST: forall i :: 0 <= i < |s| && IsEven(i) ==> IsEven(s[i])
  {
    var s: seq<int> := [0];
    var result := IsEvenAtIndexEven(s);
    expect result == true;
    expect forall i :: 0 <= i < |s| && IsEven(i) ==> IsEven(s[i]);
  }

  // Test case for combination {1}/Bs=2:
  //   POST: result
  //   POST: forall i :: 0 <= i < |s| && IsEven(i) ==> IsEven(s[i])
  {
    var s: seq<int> := [0, 6];
    var result := IsEvenAtIndexEven(s);
    expect result == true;
    expect forall i :: 0 <= i < |s| && IsEven(i) ==> IsEven(s[i]);
  }

}

method Main()
{
  GeneratedTests_IsEvenAtIndexEven();
  print "GeneratedTests_IsEvenAtIndexEven: all tests passed!\n";
}
