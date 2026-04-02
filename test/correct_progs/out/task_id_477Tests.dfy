// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_477.dfy
// Method: ToLowercase
// Generated: 2026-04-02 18:21:16

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

method GeneratedTests_ToLowercase()
{
  // Test case for combination {1}:
  //   POST: IsMapSeq(s, v, CharToLower)
  {
    var s: seq<char> := [];
    var v := ToLowercase(s);
    expect v == [];
  }

  // Test case for combination {1}/Bs=1:
  //   POST: IsMapSeq(s, v, CharToLower)
  {
    var s: seq<char> := ['['];
    var v := ToLowercase(s);
    expect v == ['['];
  }

  // Test case for combination {1}/Bs=2:
  //   POST: IsMapSeq(s, v, CharToLower)
  {
    var s: seq<char> := ['[', '\U{005C}'];
    var v := ToLowercase(s);
    expect v == ['[', '\U{005C}'];
  }

  // Test case for combination {1}/Bs=3:
  //   POST: IsMapSeq(s, v, CharToLower)
  {
    var s: seq<char> := ['[', '\U{005C}', ']'];
    var v := ToLowercase(s);
    expect v == ['[', '\U{005C}', ']'];
  }

}

method Main()
{
  GeneratedTests_ToLowercase();
  print "GeneratedTests_ToLowercase: all tests passed!\n";
}
