// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_113Tests.dfy
// Method: IsInteger
// Generated: 2026-03-31 20:52:52

// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_113.dfy
// Method: IsInteger
// Generated: 2026-03-31 19:39:47

// Auxiliary predicate to check if a character represents a digit
predicate IsDigit(c: char) {
  '0' <= c <= '9'
}

// Checks if a string represents an unsigned integer, that is, a sequence
// of one or more decimal digits.
method IsInteger(s: string) returns (result: bool)
  ensures result <==> |s| > 0 && (forall i :: 0 <= i < |s| ==> IsDigit(s[i]))
{
  if |s| == 0 {
    return false;
  } 
  for i := 0 to |s|
      invariant forall k :: 0 <= k < i ==> IsDigit(s[k])
  {
    if !IsDigit(s[i]) {
      return false;
    }
  }
  return true;
}

method IsIntegerTest(){
  var s1 := "python";
  var res1 := IsInteger(s1);
  assert !IsDigit(s1[0]); // proof helper (example)
  assert !res1;

  var res2 := IsInteger("1");
  assert res2;

  var res3 := IsInteger("12345");
  assert res3;

  var res4 := IsInteger("");
  assert !res4;
}

method Passing()
{
  // Test case for combination {1}:
  //   POST: result
  //   POST: |s| > 0
  //   POST: forall i :: 0 <= i < |s| ==> IsDigit(s[i])
  {
    var s: seq<char> := ['0'];
    var result := IsInteger(s);
    expect result == true;
    expect |s| > 0;
    expect forall i :: 0 <= i < |s| ==> IsDigit(s[i]);
  }

  // Test case for combination {2}:
  //   POST: !result
  //   POST: !(|s| > 0)
  {
    var s: seq<char> := [];
    var result := IsInteger(s);
    expect result == false;
    expect !(|s| > 0);
  }

  // Test case for combination {3}:
  //   POST: !result
  //   POST: !forall i :: 0 <= i < |s| ==> IsDigit(s[i])
  {
    var s: seq<char> := [' '];
    var result := IsInteger(s);
    expect result == false;
    expect !forall i :: 0 <= i < |s| ==> IsDigit(s[i]);
  }

  // Test case for combination {1}/Bs=2:
  //   POST: result
  //   POST: |s| > 0
  //   POST: forall i :: 0 <= i < |s| ==> IsDigit(s[i])
  {
    var s: seq<char> := ['0', '1'];
    var result := IsInteger(s);
    expect result == true;
    expect |s| > 0;
    expect forall i :: 0 <= i < |s| ==> IsDigit(s[i]);
  }

  // Test case for combination {1}:
  //   POST: result
  //   POST: |s| > 0
  //   POST: forall i :: 0 <= i < |s| ==> IsDigit(s[i])
  {
    var s: seq<char> := ['0'];
    var result := IsInteger(s);
    expect result == true;
    expect |s| > 0;
    expect forall i :: 0 <= i < |s| ==> IsDigit(s[i]);
  }

  // Test case for combination {2}:
  //   POST: !result
  //   POST: !(|s| > 0)
  {
    var s: seq<char> := [];
    var result := IsInteger(s);
    expect result == false;
    expect !(|s| > 0);
  }

  // Test case for combination {3}:
  //   POST: !result
  //   POST: !forall i :: 0 <= i < |s| ==> IsDigit(s[i])
  {
    var s: seq<char> := [' '];
    var result := IsInteger(s);
    expect result == false;
    expect !forall i :: 0 <= i < |s| ==> IsDigit(s[i]);
  }

  // Test case for combination {1}/Bs=2:
  //   POST: result
  //   POST: |s| > 0
  //   POST: forall i :: 0 <= i < |s| ==> IsDigit(s[i])
  {
    var s: seq<char> := ['0', '1'];
    var result := IsInteger(s);
    expect result == true;
    expect |s| > 0;
    expect forall i :: 0 <= i < |s| ==> IsDigit(s[i]);
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
