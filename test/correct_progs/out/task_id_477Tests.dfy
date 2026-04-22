// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_477.dfy
// Method: ToLowercase
// Generated: 2026-04-21 23:15:22

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
  //   POST Q1: IsMapSeq(s, v, CharToLower)
  //   POST Q2: forall i: int {:trigger s[i]} {:trigger v[i]} :: 0 <= i && i < |s| ==> v[i] == CharToLower(s[i])
  {
    var s: seq<char> := [];
    var v := ToLowercase(s);
    expect IsMapSeq(s, v, CharToLower);
    expect forall i: int  :: 0 <= i && i < |s| ==> v[i] == CharToLower(s[i]);
    expect v == []; // observed from implementation
  }

  // Test case for combination {1}/O|s|=1:
  //   POST Q1: IsMapSeq(s, v, CharToLower)
  //   POST Q2: forall i: int {:trigger s[i]} {:trigger v[i]} :: 0 <= i && i < |s| ==> v[i] == CharToLower(s[i])
  {
    var s: seq<char> := ['l'];
    var v := ToLowercase(s);
    expect IsMapSeq(s, v, CharToLower);
    expect forall i: int  :: 0 <= i && i < |s| ==> v[i] == CharToLower(s[i]);
    expect v == ['l']; // observed from implementation
  }

  // Test case for combination {1}/O|s|>=2:
  //   POST Q1: IsMapSeq(s, v, CharToLower)
  //   POST Q2: forall i: int {:trigger s[i]} {:trigger v[i]} :: 0 <= i && i < |s| ==> v[i] == CharToLower(s[i])
  {
    var s: seq<char> := ['W', '~'];
    var v := ToLowercase(s);
    expect IsMapSeq(s, v, CharToLower);
    expect forall i: int  :: 0 <= i && i < |s| ==> v[i] == CharToLower(s[i]);
    expect v == ['w', '~']; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   POST Q1: IsMapSeq(s, v, CharToLower)
  //   POST Q2: forall i: int {:trigger s[i]} {:trigger v[i]} :: 0 <= i && i < |s| ==> v[i] == CharToLower(s[i])
  {
    var s: seq<char> := ['k'];
    var v := ToLowercase(s);
    expect IsMapSeq(s, v, CharToLower);
    expect forall i: int  :: 0 <= i && i < |s| ==> v[i] == CharToLower(s[i]);
    expect v == ['k']; // observed from implementation
  }

}

method Main()
{
  TestsForToLowercase();
  print "TestsForToLowercase: all non-failing tests passed!\n";
}
