// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_624.dfy
// Method: ToUppercase
// Generated: 2026-04-19 21:59:02

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
  //   POST: IsMapSeq(s, v, CharToUpper)
  //   POST: forall i: int {:trigger s[i]} {:trigger v[i]} :: 0 <= i && i < |s| ==> v[i] == CharToUpper(s[i])
  //   ENSURES: IsMapSeq(s, v, CharToUpper)
  {
    var s: seq<char> := [];
    var v := ToUppercase(s);
    expect v == [];
  }

  // Test case for combination {1}/Q|s|>=2:
  //   POST: IsMapSeq(s, v, CharToUpper)
  //   POST: forall i: int {:trigger s[i]} {:trigger v[i]} :: 0 <= i && i < |s| ==> v[i] == CharToUpper(s[i])
  //   ENSURES: IsMapSeq(s, v, CharToUpper)
  {
    var s: seq<char> := ['~', '|'];
    var v := ToUppercase(s);
    expect IsMapSeq(s, v, CharToUpper);
    expect forall i: int  :: 0 <= i && i < |s| ==> v[i] == CharToUpper(s[i]);
    expect v == ['~', '|']; // observed from implementation
  }

  // Test case for combination {1}/Q|s|=1:
  //   POST: IsMapSeq(s, v, CharToUpper)
  //   POST: forall i: int {:trigger s[i]} {:trigger v[i]} :: 0 <= i && i < |s| ==> v[i] == CharToUpper(s[i])
  //   ENSURES: IsMapSeq(s, v, CharToUpper)
  {
    var s: seq<char> := ['{'];
    var v := ToUppercase(s);
    expect IsMapSeq(s, v, CharToUpper);
    expect forall i: int  :: 0 <= i && i < |s| ==> v[i] == CharToUpper(s[i]);
    expect v == ['{']; // observed from implementation
  }

  // Test case for combination {1}/Rel:
  //   POST: IsMapSeq(s, v, CharToUpper)
  //   POST: forall i: int {:trigger s[i]} {:trigger v[i]} :: 0 <= i && i < |s| ==> v[i] == CharToUpper(s[i])
  //   ENSURES: IsMapSeq(s, v, CharToUpper)
  {
    var s: seq<char> := ['6'];
    var v := ToUppercase(s);
    expect IsMapSeq(s, v, CharToUpper);
    expect forall i: int  :: 0 <= i && i < |s| ==> v[i] == CharToUpper(s[i]);
    expect v == ['6']; // observed from implementation
  }

}

method Main()
{
  TestsForToUppercase();
  print "TestsForToUppercase: all non-failing tests passed!\n";
}
