// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_18.dfy
// Method: RemoveChars
// Generated: 2026-04-21 23:13:33

// Remove from the first string all characters which are present in the second string.
// Preserves the order of the remaining elements.
method RemoveChars(s1: string, s2: string) returns (v: string)
  ensures v == Filter(s1, s2)
{
  v := [];
  for i := 0 to |s1|
    invariant v == Filter(s1[..i], s2)
  {
    if !(s1[i] in s2) {
      v := v + [s1[i]];
    }
    assert s1[..i+1] == s1[..i] + [s1[i]]; // proof helper
  }
  assert s1 == s1[..|s1|]; // proof helper
}

// Filters a sequence using a predicate.
// Returns a new sequence with the elements of s that are not in t.
function {:fuel 6} Filter<T(==)>(s: seq<T>, t: seq<T>): (r : seq<T>)
{
    if |s| == 0 then []
    else if s[|s|-1] !in t then Filter(s[..|s|-1] , t) + [s[|s|-1] ]
    else Filter(s[..|s|-1] , t)
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


method TestsForRemoveChars()
{
  // Test case for combination {1}:
  //   POST Q1: v == Filter(s1, s2)
  //   POST Q2: v == []
  {
    var s1: seq<char> := [];
    var s2: seq<char> := [];
    var v := RemoveChars(s1, s2);
    expect v == [];
  }

  // Test case for combination {2}:
  //   POST Q1: |s1| != 0
  //   POST Q2: s1[|s1| - 1] !in s2
  //   POST Q3: v == Filter<T>(s1[..|s1| - 1], s2) + [s1[|s1| - 1]]
  {
    var s1: seq<char> := ['b'];
    var s2: seq<char> := ['F'];
    var v := RemoveChars(s1, s2);
    expect v == ['b'];
  }

  // Test case for combination {3}:
  //   POST Q1: |s1| != 0
  //   POST Q2: s1[|s1| - 1] in s2
  //   POST Q3: v == Filter<T>(s1[..|s1| - 1], s2)
  {
    var s1: seq<char> := ['~'];
    var s2: seq<char> := ['~'];
    var v := RemoveChars(s1, s2);
    expect v == [];
  }

  // Test case for combination {1}/O|s2|=1:
  //   POST Q1: v == Filter(s1, s2)
  //   POST Q2: v == []
  {
    var s1: seq<char> := [];
    var s2: seq<char> := ['~'];
    var v := RemoveChars(s1, s2);
    expect v == [];
  }

}

method Main()
{
  TestsForRemoveChars();
  print "TestsForRemoveChars: all non-failing tests passed!\n";
}
