// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\Correct_progs2\in\task_id_474.dfy
// Method: ReplaceChars
// Generated: 2026-03-21 23:09:35

// Replace all occurrences of oldChar in string s by newChar 
// and return the resulting string.
method ReplaceChars(s: string, oldChar: char, newChar: char) returns (v: string)
    ensures IsMapSeq(s, v, c => if c == oldChar then newChar else c)
{
    v := [];
    for i := 0 to |s|
        invariant IsMapSeq(s[..i], v, c => if c == oldChar then newChar else c)
    {
        if s[i] == oldChar {
            v := v + [newChar];
        }
        else {
            v := v + [s[i]];
        }
    }
}

// Checks if a sequence 't' is the result of applying a function 'f'
// to every element of a sequence 's'.
predicate IsMapSeq<T, E(==)>(s: seq<T>, t: seq<E>, f: T -> E) {
  |t| == |s| && forall i :: 0 <= i < |s| ==> t[i] == f(s[i])
}

// Test cases checked statically
method ReplaceCharsTest(){
    // single occurrence
    var out1 := ReplaceChars("polygon", 'y', 'i');
    assert out1 == "poligon";

    // multiple occurrences
    var out2 := ReplaceChars("polygon", 'o', 'a');
    assert out2 == "palygan";

    // no occurrence
    var out3 := ReplaceChars("polygon", 'a', 'b');
    assert out3 == "polygon";
}

method Passing()
{
  // Test case for combination {1}/Bs=1:
  //   POST: IsMapSeq(s, v, c => if c == oldChar then newChar else c)
  {
    var s: seq<char> := [' '];
    var oldChar := '!';
    var newChar := ' ';
    var v := ReplaceChars(s, oldChar, newChar);
    expect v == [' '];
  }

  // Test case for combination {1}/Bs=2:
  //   POST: IsMapSeq(s, v, c => if c == oldChar then newChar else c)
  {
    var s: seq<char> := ['+', ','];
    var oldChar := ',';
    var newChar := ' ';
    var v := ReplaceChars(s, oldChar, newChar);
    expect v == ['+', ' '];
  }

  // Test case for combination {1}/Bs=3:
  //   POST: IsMapSeq(s, v, c => if c == oldChar then newChar else c)
  {
    var s: seq<char> := ['!', '"', '#'];
    var oldChar := '#';
    var newChar := ' ';
    var v := ReplaceChars(s, oldChar, newChar);
    expect v == ['!', '"', ' '];
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
