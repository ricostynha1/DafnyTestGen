// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_624.dfy
// Method: ToUppercase
// Generated: 2026-04-23 20:43:15

// Converts a string to uppercase (only 'a' to 'z' characters are converted).
method ToUppercase(s: string) returns (v: string)
    ensures IsMapSeq(s, v, CharToUpper)
{
    v := [];
    for i := 0 to |s|
        invariant  IsMapSeq(s[..i], v, CharToUpper)
    {
        v := v + [CharToUpper(s[i])];
    }
}

function CharToUpper(c : char) : char {
    if 'a' <= c <= 'z' then c - ('a' - 'A') else c
}

// Checks if a sequence 't' is the result of applying a function 'f'
// to every element of a sequence 's'.
predicate IsMapSeq<T, E(==)>(s: seq<T>, t: seq<E>, f: T -> E) {
  |t| == |s| && forall i :: 0 <= i < |s| ==> t[i] == f(s[i])
}

// Test cases checked statically.
method ToUppercaseTest(){
  var out1 := ToUppercase("person");
  assert out1 == "PERSON";

  var out2 := ToUppercase("final");
  assert out2 == "FINAL";

}

method TestsForToUppercase()
{
  // Test case for combination {1}:
  //   POST Q1: IsMapSeq(s, v, CharToUpper)
  {
    var s: seq<char> := [];
    var v := ToUppercase(s);
    expect IsMapSeq(s, v, CharToUpper);
    expect v == []; // observed from implementation
  }

  // Test case for combination {1}/O|s|=1:
  //   POST Q1: IsMapSeq(s, v, CharToUpper)
  {
    var s: seq<char> := ['Z'];
    var v := ToUppercase(s);
    expect IsMapSeq(s, v, CharToUpper);
    expect v == ['Z']; // observed from implementation
  }

  // Test case for combination {1}/O|s|>=2:
  //   POST Q1: IsMapSeq(s, v, CharToUpper)
  {
    var s: seq<char> := ['D', 'J'];
    var v := ToUppercase(s);
    expect IsMapSeq(s, v, CharToUpper);
    expect v == ['D', 'J']; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   POST Q1: IsMapSeq(s, v, CharToUpper)
  {
    var s: seq<char> := ['~'];
    var v := ToUppercase(s);
    expect IsMapSeq(s, v, CharToUpper);
    expect v == ['~']; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   POST Q1: IsMapSeq(s, v, CharToUpper)
  {
    var s: seq<char> := ['Y'];
    var v := ToUppercase(s);
    expect IsMapSeq(s, v, CharToUpper);
    expect v == ['Y']; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   POST Q1: IsMapSeq(s, v, CharToUpper)
  {
    var s: seq<char> := ['}'];
    var v := ToUppercase(s);
    expect IsMapSeq(s, v, CharToUpper);
    expect v == ['}']; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   POST Q1: IsMapSeq(s, v, CharToUpper)
  {
    var s: seq<char> := ['X'];
    var v := ToUppercase(s);
    expect IsMapSeq(s, v, CharToUpper);
    expect v == ['X']; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   POST Q1: IsMapSeq(s, v, CharToUpper)
  {
    var s: seq<char> := ['|'];
    var v := ToUppercase(s);
    expect IsMapSeq(s, v, CharToUpper);
    expect v == ['|']; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   POST Q1: IsMapSeq(s, v, CharToUpper)
  {
    var s: seq<char> := ['W'];
    var v := ToUppercase(s);
    expect IsMapSeq(s, v, CharToUpper);
    expect v == ['W']; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   POST Q1: IsMapSeq(s, v, CharToUpper)
  {
    var s: seq<char> := ['V'];
    var v := ToUppercase(s);
    expect IsMapSeq(s, v, CharToUpper);
    expect v == ['V']; // observed from implementation
  }

}

method Main()
{
  TestsForToUppercase();
  print "TestsForToUppercase: all non-failing tests passed!\n";
}
