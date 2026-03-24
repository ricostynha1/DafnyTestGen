// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Clover_longest_prefix_325_VER_prefix.dfy
// Method: LongestCommonPrefix
// Generated: 2026-03-24 22:09:44

// Clover_longest_prefix.dfy

method LongestCommonPrefix(str1: seq<char>, str2: seq<char>) returns (prefix: seq<char>)
  ensures |prefix| <= |str1| && prefix == str1[0 .. |prefix|] && |prefix| <= |str2| && prefix == str2[0 .. |prefix|]
  ensures |prefix| == |str1| || |prefix| == |str2| || str1[|prefix|] != str2[|prefix|]
  decreases str1, str2
{
  prefix := [];
  var minLength := if |prefix| < |str2| then |str1| else |str2|;
  for idx: int := 0 to minLength
    invariant |prefix| == idx <= minLength <= |str1| && minLength <= |str2|
    invariant |prefix| <= |str1| && prefix == str1[0 .. |prefix|] && |prefix| <= |str2| && prefix == str2[0 .. |prefix|]
  {
    if str1[idx] != str2[idx] {
      return;
    }
    prefix := prefix + [str1[idx]];
  }
}


method Passing()
{
  // Test case for combination {1}/R1:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str1|
  {
    var str1: seq<char> := [];
    var str2: seq<char> := [' '];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {1}/R2:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str1|
  {
    var str1: seq<char> := ['%'];
    var str2: seq<char> := ['%', ' '];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['%'];
  }

  // Test case for combination {1}/R3:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str1|
  {
    var str1: seq<char> := [];
    var str2: seq<char> := [' ', '%'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {1}/R4:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str1|
  {
    var str1: seq<char> := ['%', '6', '^'];
    var str2: seq<char> := ['%', '6', '^', ' '];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['%', '6', '^'];
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
