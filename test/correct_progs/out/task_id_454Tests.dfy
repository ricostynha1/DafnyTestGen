// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\correct_progs\in\task_id_454.dfy
// Method: ContainsZ
// Generated: 2026-03-23 00:09:00

// Checks if a string contains the letter 'z' or 'Z'
method ContainsZ(s: string) returns (result: bool)
    ensures result <==> 'z' in s || 'Z' in s
{
    result := false;
    for i := 0 to |s|
        invariant 'z' !in s[..i] && 'Z' !in s[..i]
    {
        if s[i] == 'z' || s[i] == 'Z' {
            return true;
        }
    }
    return false;

}

// Teste cases checked statically
method ContainsZTest() {
  var s1 := "pythonz";
  var out1 := ContainsZ(s1);
  assert out1;

  var s2 := "XYZ.";
  var out2 := ContainsZ(s2);
  assert out2;

  var out3 := ContainsZ("  lang  .");
  assert !out3;
}

method Passing()
{
  // Test case for combination {1}:
  //   POST: result
  //   POST: 'z' in s
  {
    var s: seq<char> := ['z'];
    var result := ContainsZ(s);
    expect result == true;
  }

  // Test case for combination {2}:
  //   POST: result
  //   POST: 'Z' in s
  {
    var s: seq<char> := ['Z'];
    var result := ContainsZ(s);
    expect result == true;
  }

  // Test case for combination {1,2}:
  //   POST: result
  //   POST: 'z' in s
  //   POST: 'Z' in s
  {
    var s: seq<char> := ['Z', 'z'];
    var result := ContainsZ(s);
    expect result == true;
  }

  // Test case for combination {3}:
  //   POST: !(result)
  //   POST: !('z' in s)
  //   POST: !('Z' in s)
  {
    var s: seq<char> := [];
    var result := ContainsZ(s);
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
