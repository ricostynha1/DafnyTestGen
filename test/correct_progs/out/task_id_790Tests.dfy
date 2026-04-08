// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_790.dfy
// Method: IsEvenAtIndexEven
// Generated: 2026-04-08 00:09:26

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
  {
    var s: seq<int> := [];
    var result := IsEvenAtIndexEven(s);
    expect result == true;
  }

  // Test case for combination {1}/Bs=1:
  //   POST: result
  {
    var s: seq<int> := [2];
    var result := IsEvenAtIndexEven(s);
    expect result == true;
  }

  // Test case for combination {1}/Bs=2:
  //   POST: result
  {
    var s: seq<int> := [4, 3];
    var result := IsEvenAtIndexEven(s);
    expect result == true;
  }

  // Test case for combination {1}/Oresult=true:
  //   POST: result
  {
    var s: seq<int> := [0, 12, 0, 20];
    var result := IsEvenAtIndexEven(s);
    expect result == true;
  }

}

method Failing()
{
  // Test case for combination {1}/Bs=3:
  //   POST: result
  {
    var s: seq<int> := [5, 4, 6];
    var result := IsEvenAtIndexEven(s);
    // expect result == false;
  }

  // Test case for combination {1}/Oresult=false:
  //   POST: result
  {
    var s: seq<int> := [10, 11, -1, 12, 4875];
    var result := IsEvenAtIndexEven(s);
    // expect result == false;
  }

}

method Main()
{
  Passing();
  Failing();
}
