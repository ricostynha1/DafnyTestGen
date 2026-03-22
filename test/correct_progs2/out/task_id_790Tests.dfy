// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\Correct_progs2\in\task_id_790.dfy
// Method: IsEvenAtIndexEven
// Generated: 2026-03-21 23:25:28

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
  // Test case for combination {1}/Bs=0:
  //   POST: result
  //   POST: forall i :: 0 <= i < |s| && IsEven(i) ==> IsEven(s[i])
  {
    var s: seq<int> := [];
    var result := IsEvenAtIndexEven(s);
    expect result == true;
  }

  // Test case for combination {1}/Bs=1:
  //   POST: result
  //   POST: forall i :: 0 <= i < |s| && IsEven(i) ==> IsEven(s[i])
  {
    var s: seq<int> := [2472];
    var result := IsEvenAtIndexEven(s);
    expect result == true;
  }

  // Test case for combination {1}/Bs=2:
  //   POST: result
  //   POST: forall i :: 0 <= i < |s| && IsEven(i) ==> IsEven(s[i])
  {
    var s: seq<int> := [2472, 6];
    var result := IsEvenAtIndexEven(s);
    expect result == true;
  }

  // Test case for combination {1}/Bs=3:
  //   POST: result
  //   POST: forall i :: 0 <= i < |s| && IsEven(i) ==> IsEven(s[i])
  {
    var s: seq<int> := [4874, 11, 21606];
    var result := IsEvenAtIndexEven(s);
    expect result == true;
  }

  // Test case for combination {2}/Bs=2:
  //   POST: !(result)
  //   POST: IsEven(0) && !(IsEven(s[0]))
  {
    var s: seq<int> := [3593, 14];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {2}/Bs=3:
  //   POST: !(result)
  //   POST: IsEven(0) && !(IsEven(s[0]))
  {
    var s: seq<int> := [17095, 19, 17096];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {4}/Bs=3:
  //   POST: !(result)
  //   POST: IsEven((|s| - 1)) && !(IsEven(s[(|s| - 1)]))
  {
    var s: seq<int> := [2694, 19, 18891];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {2,4}/Bs=1:
  //   POST: !(result)
  //   POST: IsEven(0) && !(IsEven(s[0]))
  //   POST: IsEven((|s| - 1)) && !(IsEven(s[(|s| - 1)]))
  {
    var s: seq<int> := [-1];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {2,4}/Bs=3:
  //   POST: !(result)
  //   POST: IsEven(0) && !(IsEven(s[0]))
  //   POST: IsEven((|s| - 1)) && !(IsEven(s[(|s| - 1)]))
  {
    var s: seq<int> := [899, 19, 901];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {2}/R3:
  //   POST: !(result)
  //   POST: IsEven(0) && !(IsEven(s[0]))
  {
    var s: seq<int> := [899, 37, 38, 28];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {3}/R1:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (|s| - 1) && IsEven(i) && !(IsEven(s[i]))
  {
    var s: seq<int> := [1218, 44, 3593, 46];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {3}/R2:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (|s| - 1) && IsEven(i) && !(IsEven(s[i]))
  {
    var s: seq<int> := [2284, 37, 38, 73, 1219, 89, 17173, 40];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {3}/R3:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (|s| - 1) && IsEven(i) && !(IsEven(s[i]))
  {
    var s: seq<int> := [2284, 36, 19451, 73, 11883, 38];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {2,3}/R1:
  //   POST: !(result)
  //   POST: IsEven(0) && !(IsEven(s[0]))
  //   POST: exists i :: 1 <= i < (|s| - 1) && IsEven(i) && !(IsEven(s[i]))
  {
    var s: seq<int> := [899, 46, 16913, 43];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {2,3}/R2:
  //   POST: !(result)
  //   POST: IsEven(0) && !(IsEven(s[0]))
  //   POST: exists i :: 1 <= i < (|s| - 1) && IsEven(i) && !(IsEven(s[i]))
  {
    var s: seq<int> := [669, 36, 38, 63, 1219, 76, 80, 39];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {2,3}/R3:
  //   POST: !(result)
  //   POST: IsEven(0) && !(IsEven(s[0]))
  //   POST: exists i :: 1 <= i < (|s| - 1) && IsEven(i) && !(IsEven(s[i]))
  {
    var s: seq<int> := [7921, 35, 37, 71, 1165, 38];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {4}/R2:
  //   POST: !(result)
  //   POST: IsEven((|s| - 1)) && !(IsEven(s[(|s| - 1)]))
  {
    var s: seq<int> := [11706, 37, 19062, 69, 82, 106, 1181];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {4}/R3:
  //   POST: !(result)
  //   POST: IsEven((|s| - 1)) && !(IsEven(s[(|s| - 1)]))
  {
    var s: seq<int> := [898, 35, 1070, 42, 12567];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {2,4}/R3:
  //   POST: !(result)
  //   POST: IsEven(0) && !(IsEven(s[0]))
  //   POST: IsEven((|s| - 1)) && !(IsEven(s[(|s| - 1)]))
  {
    var s: seq<int> := [2285, 37, 1070, 38, 58, 61, 16731];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {3,4}/R1:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (|s| - 1) && IsEven(i) && !(IsEven(s[i]))
  //   POST: IsEven((|s| - 1)) && !(IsEven(s[(|s| - 1)]))
  {
    var s: seq<int> := [11840, 67, 4911, 86, 16197, 77, 3593];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {3,4}/R2:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (|s| - 1) && IsEven(i) && !(IsEven(s[i]))
  //   POST: IsEven((|s| - 1)) && !(IsEven(s[(|s| - 1)]))
  {
    var s: seq<int> := [11840, 69, 5495, 70, 8373];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {2,3,4}/R1:
  //   POST: !(result)
  //   POST: IsEven(0) && !(IsEven(s[0]))
  //   POST: exists i :: 1 <= i < (|s| - 1) && IsEven(i) && !(IsEven(s[i]))
  //   POST: IsEven((|s| - 1)) && !(IsEven(s[(|s| - 1)]))
  {
    var s: seq<int> := [-1, 67, 96, 124, 12567, 115, 4481];
    var result := IsEvenAtIndexEven(s);
    expect result == false;
  }

  // Test case for combination {2,3,4}/R2:
  //   POST: !(result)
  //   POST: IsEven(0) && !(IsEven(s[0]))
  //   POST: exists i :: 1 <= i < (|s| - 1) && IsEven(i) && !(IsEven(s[i]))
  //   POST: IsEven((|s| - 1)) && !(IsEven(s[(|s| - 1)]))
  {
    var s: seq<int> := [-1, 56, 12567, 57, 1681];
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
