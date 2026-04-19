// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_477.dfy
// Method: ToLowercase
// Generated: 2026-04-19 21:35:05

// Convert a string to lowercase
method ToLowercase(s: string) returns (v: string)
    ensures IsMapSeq(s, v, CharToLower)
{
    v := [];
    for i := 0 to |s|
        invariant IsMapSeq(s[..i], v, CharToLower)
    {
        v := v + [CharToLower(s[i])];
    }
}

// Convert a single character to lowercase
function CharToLower(c : char) : char {
    if 'A' <= c <= 'Z' then c + ('a' - 'A') else c
}

// Checks if a sequence 't' is the result of applying a function 'f'
// to every element of a sequence 's'.
predicate IsMapSeq<T, E(==)>(s: seq<T>, t: seq<E>, f: T -> E) {
  |t| == |s| && forall i :: 0 <= i < |s| ==> t[i] == f(s[i])
}


// Test cases checked statically
method TestToLowercase()
{
    // Test case 1
    var result := ToLowercase("Hello, World!");
    assert result == "hello, world!";

    // Test case 2
    result := ToLowercase("Dafny IS Fun!");
    assert result == "dafny is fun!";

    // Test case 3 - Testing an empty string
    result := ToLowercase("");
    assert result == "";

    // Test case 4 - Testing a string with no alphabetical characters
    result := ToLowercase("1234567890");
    assert result == "1234567890";
}

method TestsForToLowercase()
{
  // Test case for combination {1}:
  //   POST: IsMapSeq(s, v, CharToLower)
  //   POST: forall i: int {:trigger s[i]} {:trigger v[i]} :: 0 <= i && i < |s| ==> v[i] == CharToLower(s[i])
  //   ENSURES: IsMapSeq(s, v, CharToLower)
  {
    var s: seq<char> := [];
    var v := ToLowercase(s);
    expect v == [];
  }

  // Test case for combination {1}/Q|s|>=2:
  //   POST: IsMapSeq(s, v, CharToLower)
  //   POST: forall i: int {:trigger s[i]} {:trigger v[i]} :: 0 <= i && i < |s| ==> v[i] == CharToLower(s[i])
  //   ENSURES: IsMapSeq(s, v, CharToLower)
  {
    var s: seq<char> := [';', '\U{005C}'];
    var v := ToLowercase(s);
    expect IsMapSeq(s, v, CharToLower);
    expect forall i: int  :: 0 <= i && i < |s| ==> v[i] == CharToLower(s[i]);
    expect v == [';', '\']; // observed from implementation
  }

  // Test case for combination {1}/Q|s|=1:
  //   POST: IsMapSeq(s, v, CharToLower)
  //   POST: forall i: int {:trigger s[i]} {:trigger v[i]} :: 0 <= i && i < |s| ==> v[i] == CharToLower(s[i])
  //   ENSURES: IsMapSeq(s, v, CharToLower)
  {
    var s: seq<char> := ['R'];
    var v := ToLowercase(s);
    expect IsMapSeq(s, v, CharToLower);
    expect forall i: int  :: 0 <= i && i < |s| ==> v[i] == CharToLower(s[i]);
    expect v == ['r']; // observed from implementation
  }

  // Test case for combination {1}/Rel:
  //   POST: IsMapSeq(s, v, CharToLower)
  //   POST: forall i: int {:trigger s[i]} {:trigger v[i]} :: 0 <= i && i < |s| ==> v[i] == CharToLower(s[i])
  //   ENSURES: IsMapSeq(s, v, CharToLower)
  {
    var s: seq<char> := ['6'];
    var v := ToLowercase(s);
    expect IsMapSeq(s, v, CharToLower);
    expect forall i: int  :: 0 <= i && i < |s| ==> v[i] == CharToLower(s[i]);
    expect v == ['6']; // observed from implementation
  }

}

method Main()
{
  TestsForToLowercase();
  print "TestsForToLowercase: all non-failing tests passed!\n";
}
