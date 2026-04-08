// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_732.dfy
// Method: ReplaceWithColon
// Generated: 2026-04-08 09:46:26

// Replaces all spaces, commas and dots in a string with colons.
method ReplaceWithColon(s: string) returns (v: string)
    ensures IsMapSeq(s, v, ReplaceCharWithColon)
{
    v := [];
    for i := 0 to |s|
        invariant IsMapSeq(s[..i], v, ReplaceCharWithColon)
    {
        v := v + [ReplaceCharWithColon(s[i])];
    }
}

// Transformation to apply to each character.
function ReplaceCharWithColon(c: char) : char {
    if c == ' ' || c == ',' || c == '.' then ':' else c
}

// Checks is a target sequence 't' is the result of applying a function 'f'
// to each element of a source sequence 's'.
predicate  IsMapSeq<T, E(==)>(s: seq<T>, t: seq<E>, f: T -> E) {
   |t| == |s| && (forall i :: 0 <= i < |s| ==> t[i] == f(s[i]))
}

// Test cases checked statically.
method ReplaceWithColonTest(){
    var out1 := ReplaceWithColon("Python language, Programming language.");
    assert out1 == "Python:language::Programming:language:";

    var out2 := ReplaceWithColon("a b c,d e f");
    assert out2 == "a:b:c:d:e:f";

    var out3 := ReplaceWithColon("ram reshma,ram rahim");
    assert out3 == "ram:reshma:ram:rahim";
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: IsMapSeq(s, v, ReplaceCharWithColon)
  {
    var s: seq<char> := [];
    var v := ReplaceWithColon(s);
    expect v == [];
  }

  // Test case for combination {1}/Bs=1:
  //   POST: IsMapSeq(s, v, ReplaceCharWithColon)
  {
    var s: seq<char> := [' '];
    var v := ReplaceWithColon(s);
    expect v == [':'];
    expect IsMapSeq(s, v, ReplaceCharWithColon);
  }

  // Test case for combination {1}/Bs=2:
  //   POST: IsMapSeq(s, v, ReplaceCharWithColon)
  {
    var s: seq<char> := [' ', '!'];
    var v := ReplaceWithColon(s);
    expect v == [':', '!'];
    expect IsMapSeq(s, v, ReplaceCharWithColon);
  }

  // Test case for combination {1}/Bs=3:
  //   POST: IsMapSeq(s, v, ReplaceCharWithColon)
  {
    var s: seq<char> := ['!', '"', ' '];
    var v := ReplaceWithColon(s);
    expect v == ['!', '"', ':'];
    expect IsMapSeq(s, v, ReplaceCharWithColon);
  }

  // Test case for combination {1}/O|v|>=3:
  //   POST: IsMapSeq(s, v, ReplaceCharWithColon)
  {
    var s: seq<char> := [' ', 'X', 'a', ' '];
    var v := ReplaceWithColon(s);
    expect v == [':', 'X', 'a', ':'];
    expect IsMapSeq(s, v, ReplaceCharWithColon);
  }

  // Test case for combination {1}/O|v|>=2:
  //   POST: IsMapSeq(s, v, ReplaceCharWithColon)
  {
    var s: seq<char> := ['%', 'R', 'b', 'b', ' '];
    var v := ReplaceWithColon(s);
    expect v == ['%', 'R', 'b', 'b', ':'];
    expect IsMapSeq(s, v, ReplaceCharWithColon);
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
