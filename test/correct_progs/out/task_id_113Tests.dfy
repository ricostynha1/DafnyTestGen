// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\Correct_progs\in\task_id_113.dfy
// Method: IsInteger
// Generated: 2026-03-22 20:27:05

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
  // Test case for combination {1}/Bs=1:
  //   POST: result
  //   POST: |s| > 0
  //   POST: forall i :: 0 <= i < |s| ==> IsDigit(s[i])
  {
    var s: seq<char> := ['0'];
    var result := IsInteger(s);
    expect result == true;
  }

  // Test case for combination {1}/Bs=2:
  //   POST: result
  //   POST: |s| > 0
  //   POST: forall i :: 0 <= i < |s| ==> IsDigit(s[i])
  {
    var s: seq<char> := ['0', '1'];
    var result := IsInteger(s);
    expect result == true;
  }

  // Test case for combination {1}/Bs=3:
  //   POST: result
  //   POST: |s| > 0
  //   POST: forall i :: 0 <= i < |s| ==> IsDigit(s[i])
  {
    var s: seq<char> := ['0', '1', '2'];
    var result := IsInteger(s);
    expect result == true;
  }

  // Test case for combination {2}/Bs=0:
  //   POST: !(result)
  //   POST: !(|s| > 0)
  {
    var s: seq<char> := [];
    var result := IsInteger(s);
    expect result == false;
  }

  // Test case for combination {3}/Bs=2:
  //   POST: !(result)
  //   POST: !(IsDigit(s[0]))
  {
    var s: seq<char> := [':', '0'];
    var result := IsInteger(s);
    expect result == false;
  }

  // Test case for combination {3}/Bs=3:
  //   POST: !(result)
  //   POST: !(IsDigit(s[0]))
  {
    var s: seq<char> := [' ', '0', '1'];
    var result := IsInteger(s);
    expect result == false;
  }

  // Test case for combination {4}/Bs=3:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (|s| - 1) && !(IsDigit(s[i]))
  {
    var s: seq<char> := ['0', ' ', '1'];
    var result := IsInteger(s);
    expect result == false;
  }

  // Test case for combination {3,4}/Bs=3:
  //   POST: !(result)
  //   POST: !(IsDigit(s[0]))
  //   POST: exists i :: 1 <= i < (|s| - 1) && !(IsDigit(s[i]))
  {
    var s: seq<char> := [':', ' ', '9'];
    var result := IsInteger(s);
    expect result == false;
  }

  // Test case for combination {5}/Bs=2:
  //   POST: !(result)
  //   POST: !(IsDigit(s[(|s| - 1)]))
  {
    var s: seq<char> := ['0', 'Q'];
    var result := IsInteger(s);
    expect result == false;
  }

  // Test case for combination {5}/Bs=3:
  //   POST: !(result)
  //   POST: !(IsDigit(s[(|s| - 1)]))
  {
    var s: seq<char> := ['1', '0', ';'];
    var result := IsInteger(s);
    expect result == false;
  }

  // Test case for combination {3,5}/Bs=1:
  //   POST: !(result)
  //   POST: !(IsDigit(s[0]))
  //   POST: !(IsDigit(s[(|s| - 1)]))
  {
    var s: seq<char> := [':'];
    var result := IsInteger(s);
    expect result == false;
  }

  // Test case for combination {3,5}/Bs=2:
  //   POST: !(result)
  //   POST: !(IsDigit(s[0]))
  //   POST: !(IsDigit(s[(|s| - 1)]))
  {
    var s: seq<char> := ['P', 'Q'];
    var result := IsInteger(s);
    expect result == false;
  }

  // Test case for combination {3,5}/Bs=3:
  //   POST: !(result)
  //   POST: !(IsDigit(s[0]))
  //   POST: !(IsDigit(s[(|s| - 1)]))
  {
    var s: seq<char> := [' ', '0', ':'];
    var result := IsInteger(s);
    expect result == false;
  }

  // Test case for combination {4,5}/Bs=3:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (|s| - 1) && !(IsDigit(s[i]))
  //   POST: !(IsDigit(s[(|s| - 1)]))
  {
    var s: seq<char> := ['0', ' ', ':'];
    var result := IsInteger(s);
    expect result == false;
  }

  // Test case for combination {3,4,5}/Bs=3:
  //   POST: !(result)
  //   POST: !(IsDigit(s[0]))
  //   POST: exists i :: 1 <= i < (|s| - 1) && !(IsDigit(s[i]))
  //   POST: !(IsDigit(s[(|s| - 1)]))
  {
    var s: seq<char> := [' ', ':', ';'];
    var result := IsInteger(s);
    expect result == false;
  }

  // Test case for combination {3}/R3:
  //   POST: !(result)
  //   POST: !(IsDigit(s[0]))
  {
    var s: seq<char> := [':', '5', '2', '0'];
    var result := IsInteger(s);
    expect result == false;
  }

  // Test case for combination {4}/R2:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (|s| - 1) && !(IsDigit(s[i]))
  {
    var s: seq<char> := ['0', '!', ' ', '7'];
    var result := IsInteger(s);
    expect result == false;
  }

  // Test case for combination {4}/R3:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (|s| - 1) && !(IsDigit(s[i]))
  {
    var s: seq<char> := ['0', ':', '#', '/', '.', '5'];
    var result := IsInteger(s);
    expect result == false;
  }

  // Test case for combination {3,4}/R2:
  //   POST: !(result)
  //   POST: !(IsDigit(s[0]))
  //   POST: exists i :: 1 <= i < (|s| - 1) && !(IsDigit(s[i]))
  {
    var s: seq<char> := [';', ' ', ':', '0'];
    var result := IsInteger(s);
    expect result == false;
  }

  // Test case for combination {3,4}/R3:
  //   POST: !(result)
  //   POST: !(IsDigit(s[0]))
  //   POST: exists i :: 1 <= i < (|s| - 1) && !(IsDigit(s[i]))
  {
    var s: seq<char> := [':', '"', '7', '/', '&', '0'];
    var result := IsInteger(s);
    expect result == false;
  }

  // Test case for combination {5}/R3:
  //   POST: !(result)
  //   POST: !(IsDigit(s[(|s| - 1)]))
  {
    var s: seq<char> := ['0', '0', '3', ':'];
    var result := IsInteger(s);
    expect result == false;
  }

  // Test case for combination {4,5}/R2:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (|s| - 1) && !(IsDigit(s[i]))
  //   POST: !(IsDigit(s[(|s| - 1)]))
  {
    var s: seq<char> := ['0', 'x', ':', 's'];
    var result := IsInteger(s);
    expect result == false;
  }

  // Test case for combination {4,5}/R3:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (|s| - 1) && !(IsDigit(s[i]))
  //   POST: !(IsDigit(s[(|s| - 1)]))
  {
    var s: seq<char> := ['0', '#', 'D', '/', '$', '&'];
    var result := IsInteger(s);
    expect result == false;
  }

  // Test case for combination {3,4,5}/R2:
  //   POST: !(result)
  //   POST: !(IsDigit(s[0]))
  //   POST: exists i :: 1 <= i < (|s| - 1) && !(IsDigit(s[i]))
  //   POST: !(IsDigit(s[(|s| - 1)]))
  {
    var s: seq<char> := [' ', '/', ':', 'g'];
    var result := IsInteger(s);
    expect result == false;
  }

  // Test case for combination {3,4,5}/R3:
  //   POST: !(result)
  //   POST: !(IsDigit(s[0]))
  //   POST: exists i :: 1 <= i < (|s| - 1) && !(IsDigit(s[i]))
  //   POST: !(IsDigit(s[(|s| - 1)]))
  {
    var s: seq<char> := [':', '}', '1', 'x', '*', 'q'];
    var result := IsInteger(s);
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
