// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_18.dfy
// Method: RemoveChars
// Generated: 2026-04-10 23:36:11

// Remove from the first string all characters which are present in the second string.
// Preserves the order of the remaining elements.
method RemoveChars(s1: string, s2: string) returns (v: string)
  ensures v == Filter(s1, c => !(c in s2))
{
  v := [];
  for i := 0 to |s1|
    invariant v == Filter(s1[..i], c => !(c in s2))
  {
    if !(s1[i] in s2) {
      v := v + [s1[i]];
    }
    assert s1[..i+1] == s1[..i] + [s1[i]]; // proof helper
  }
  assert s1 == s1[..|s1|]; // proof helper
}

// Filters a sequence using a predicate.
// Returns a new sequence with the elements of s that satisfy the predicate p.
function {:fuel 6} Filter<T>(s: seq<T>, p: T -> bool): (r : seq<T>)
{
    if |s| == 0 then []
    else if p(s[|s|-1] ) then Filter(s[..|s|-1] , p) + [s[|s|-1] ]
    else Filter(s[..|s|-1] , p)
}


// Test cases checked statically
method RemoveCharsTest(){
  var out1 := RemoveChars("a.b,c;", ".,;");
  assert "a.b,c;" == "a" + "." + "b" + "," + "c" + ";"; // proof helper
  assert out1 == "abc";

  var out2 := RemoveChars("exomile", "toxic");
  assert "exomile" == "e" + "x" + "o" + "m" + "i" + "l" + "e"; // proof helper
  assert out2 == "emle";
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: v == Filter(s1, c => !(c in s2))
  //   POST: v == []
  //   ENSURES: v == Filter(s1, c => !(c in s2))
  {
    var s1: seq<char> := [];
    var s2: seq<char> := [];
    var v := RemoveChars(s1, s2);
    expect v == [];
  }

  // Test case for combination {2}:
  //   POST: !(|s1| == 0)
  //   POST: v == if (!(s1[|s1| - 1] in s2)) then (if |s1[..|s1| - 1]| == 0 then [] else if p(s1[..|s1| - 1][|s1[..|s1| - 1]| - 1]) then Filter(s1[..|s1| - 1][..|s1[..|s1| - 1]| - 1], p) + [s1[..|s1| - 1][|s1[..|s1| - 1]| - 1]] else Filter(s1[..|s1| - 1][..|s1[..|s1| - 1]| - 1], p)) + [s1[|s1| - 1]] else (if |s1[..|s1| - 1]| == 0 then [] else if p(s1[..|s1| - 1][|s1[..|s1| - 1]| - 1]) then Filter(s1[..|s1| - 1][..|s1[..|s1| - 1]| - 1], p) + [s1[..|s1| - 1][|s1[..|s1| - 1]| - 1]] else Filter(s1[..|s1| - 1][..|s1[..|s1| - 1]| - 1], p))
  //   ENSURES: v == Filter(s1, c => !(c in s2))
  {
    var s1: seq<char> := ['U'];
    var s2: seq<char> := ['U'];
    var v := RemoveChars(s1, s2);
    expect v == [];
  }

  // Test case for combination {1}/Bs1=0,s2=1:
  //   POST: v == Filter(s1, c => !(c in s2))
  //   POST: v == []
  //   ENSURES: v == Filter(s1, c => !(c in s2))
  {
    var s1: seq<char> := [];
    var s2: seq<char> := [' '];
    var v := RemoveChars(s1, s2);
    expect v == [];
  }

  // Test case for combination {1}/Bs1=0,s2=2:
  //   POST: v == Filter(s1, c => !(c in s2))
  //   POST: v == []
  //   ENSURES: v == Filter(s1, c => !(c in s2))
  {
    var s1: seq<char> := [];
    var s2: seq<char> := [' ', '!'];
    var v := RemoveChars(s1, s2);
    expect v == [];
  }

  // Test case for combination {2}/O|v|>=3:
  //   POST: !(|s1| == 0)
  //   POST: v == if (!(s1[|s1| - 1] in s2)) then (if |s1[..|s1| - 1]| == 0 then [] else if p(s1[..|s1| - 1][|s1[..|s1| - 1]| - 1]) then Filter(s1[..|s1| - 1][..|s1[..|s1| - 1]| - 1], p) + [s1[..|s1| - 1][|s1[..|s1| - 1]| - 1]] else Filter(s1[..|s1| - 1][..|s1[..|s1| - 1]| - 1], p)) + [s1[|s1| - 1]] else (if |s1[..|s1| - 1]| == 0 then [] else if p(s1[..|s1| - 1][|s1[..|s1| - 1]| - 1]) then Filter(s1[..|s1| - 1][..|s1[..|s1| - 1]| - 1], p) + [s1[..|s1| - 1][|s1[..|s1| - 1]| - 1]] else Filter(s1[..|s1| - 1][..|s1[..|s1| - 1]| - 1], p))
  //   ENSURES: v == Filter(s1, c => !(c in s2))
  {
    var s1: seq<char> := [' ', '%'];
    var s2: seq<char> := [];
    var v := RemoveChars(s1, s2);
    expect v == [' ', '%'];
  }

  // Test case for combination {2}/O|v|>=2:
  //   POST: !(|s1| == 0)
  //   POST: v == if (!(s1[|s1| - 1] in s2)) then (if |s1[..|s1| - 1]| == 0 then [] else if p(s1[..|s1| - 1][|s1[..|s1| - 1]| - 1]) then Filter(s1[..|s1| - 1][..|s1[..|s1| - 1]| - 1], p) + [s1[..|s1| - 1][|s1[..|s1| - 1]| - 1]] else Filter(s1[..|s1| - 1][..|s1[..|s1| - 1]| - 1], p)) + [s1[|s1| - 1]] else (if |s1[..|s1| - 1]| == 0 then [] else if p(s1[..|s1| - 1][|s1[..|s1| - 1]| - 1]) then Filter(s1[..|s1| - 1][..|s1[..|s1| - 1]| - 1], p) + [s1[..|s1| - 1][|s1[..|s1| - 1]| - 1]] else Filter(s1[..|s1| - 1][..|s1[..|s1| - 1]| - 1], p))
  //   ENSURES: v == Filter(s1, c => !(c in s2))
  {
    var s1: seq<char> := [' '];
    var s2: seq<char> := [];
    var v := RemoveChars(s1, s2);
    expect v == [' '];
  }

  // Test case for combination {2}/O|v|=1:
  //   POST: !(|s1| == 0)
  //   POST: v == if (!(s1[|s1| - 1] in s2)) then (if |s1[..|s1| - 1]| == 0 then [] else if p(s1[..|s1| - 1][|s1[..|s1| - 1]| - 1]) then Filter(s1[..|s1| - 1][..|s1[..|s1| - 1]| - 1], p) + [s1[..|s1| - 1][|s1[..|s1| - 1]| - 1]] else Filter(s1[..|s1| - 1][..|s1[..|s1| - 1]| - 1], p)) + [s1[|s1| - 1]] else (if |s1[..|s1| - 1]| == 0 then [] else if p(s1[..|s1| - 1][|s1[..|s1| - 1]| - 1]) then Filter(s1[..|s1| - 1][..|s1[..|s1| - 1]| - 1], p) + [s1[..|s1| - 1][|s1[..|s1| - 1]| - 1]] else Filter(s1[..|s1| - 1][..|s1[..|s1| - 1]| - 1], p))
  //   ENSURES: v == Filter(s1, c => !(c in s2))
  {
    var s1: seq<char> := [' '];
    var s2: seq<char> := ['%', ' '];
    var v := RemoveChars(s1, s2);
    expect v == [];
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
