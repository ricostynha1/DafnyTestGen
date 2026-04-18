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
ghost function {:fuel 6} Filter<T(==)>(s: seq<T>, t: seq<T>): (r : seq<T>)
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
