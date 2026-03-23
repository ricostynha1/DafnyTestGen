// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\correct_progs\in\task_id_790.dfy
// Method: IsEvenAtIndexEven
// Generated: 2026-03-23 00:18:23

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

method Passing()
{
  // Test case for combination {1}:
  //   POST: result
  //   POST: forall i :: 0 <= i < |s| && IsEven(i) ==> IsEven(s[i])
  {
    var s: seq<int> := [];
    var result := IsEvenAtIndexEven(s);
    expect result == true;
  }

  // Test case for combination {2}:
  //   POST: !(result)
  //   POST: IsEven(0) && !(IsEven(s[0]))
  {
    var s: seq<int> := [42477, 16];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {3}:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (|s| - 1) && IsEven(i) && !(IsEven(s[i]))
  {
    var s: seq<int> := [0, 22, 16733, 31];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {2,3}:
  //   POST: !(result)
  //   POST: IsEven(0) && !(IsEven(s[0]))
  //   POST: exists i :: 1 <= i < (|s| - 1) && IsEven(i) && !(IsEven(s[i]))
  {
    var s: seq<int> := [4875, 18, -1, 26];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {4}:
  //   POST: !(result)
  //   POST: IsEven((|s| - 1)) && !(IsEven(s[(|s| - 1)]))
  {
    var s: seq<int> := [0, 22, 3];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {2,4}:
  //   POST: !(result)
  //   POST: IsEven(0) && !(IsEven(s[0]))
  //   POST: IsEven((|s| - 1)) && !(IsEven(s[(|s| - 1)]))
  {
    var s: seq<int> := [1];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {3,4}:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (|s| - 1) && IsEven(i) && !(IsEven(s[i]))
  //   POST: IsEven((|s| - 1)) && !(IsEven(s[(|s| - 1)]))
  {
    var s: seq<int> := [0, 21, 1, 34, 1];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {2,3,4}:
  //   POST: !(result)
  //   POST: IsEven(0) && !(IsEven(s[0]))
  //   POST: exists i :: 1 <= i < (|s| - 1) && IsEven(i) && !(IsEven(s[i]))
  //   POST: IsEven((|s| - 1)) && !(IsEven(s[(|s| - 1)]))
  {
    var s: seq<int> := [4875, 21, 23595, 28, 17711];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
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
