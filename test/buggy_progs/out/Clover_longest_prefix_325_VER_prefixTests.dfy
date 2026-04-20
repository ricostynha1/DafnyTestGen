// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Clover_longest_prefix_325_VER_prefix.dfy
// Method: LongestCommonPrefix
// Generated: 2026-04-20 22:29:15

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


method TestsForLongestCommonPrefix()
{
  // Test case for combination {3}/Rel:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: !(|prefix| == |str1|)
  //   POST: !(|prefix| == |str2|)
  //   POST: str1[|prefix|] != str2[|prefix|]
  //   ENSURES: |prefix| <= |str1| && prefix == str1[0 .. |prefix|] && |prefix| <= |str2| && prefix == str2[0 .. |prefix|]
  //   ENSURES: |prefix| == |str1| || |prefix| == |str2| || str1[|prefix|] != str2[|prefix|]
  {
    var str1: seq<char> := ['q', '\U{005C}', '>', 'W', '~'];
    var str2: seq<char> := ['q', '\U{005C}', '?', 'V', '}'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['q', '\U{005C}'];
  }

  // Test case for combination {1}:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str1|
  //   ENSURES: |prefix| <= |str1| && prefix == str1[0 .. |prefix|] && |prefix| <= |str2| && prefix == str2[0 .. |prefix|]
  //   ENSURES: |prefix| == |str1| || |prefix| == |str2| || str1[|prefix|] != str2[|prefix|]
  {
    var str1: seq<char> := [];
    var str2: seq<char> := ['~'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {2}:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: !(|prefix| == |str1|)
  //   POST: |prefix| == |str2|
  //   ENSURES: |prefix| <= |str1| && prefix == str1[0 .. |prefix|] && |prefix| <= |str2| && prefix == str2[0 .. |prefix|]
  //   ENSURES: |prefix| == |str1| || |prefix| == |str2| || str1[|prefix|] != str2[|prefix|]
  {
    var str1: seq<char> := ['~'];
    var str2: seq<char> := [];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {1}/O|str1|=1:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str1|
  //   ENSURES: |prefix| <= |str1| && prefix == str1[0 .. |prefix|] && |prefix| <= |str2| && prefix == str2[0 .. |prefix|]
  //   ENSURES: |prefix| == |str1| || |prefix| == |str2| || str1[|prefix|] != str2[|prefix|]
  {
    var str1: seq<char> := ['~'];
    var str2: seq<char> := ['~'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['~'];
  }

}

method Main()
{
  TestsForLongestCommonPrefix();
  print "TestsForLongestCommonPrefix: all non-failing tests passed!\n";
}
