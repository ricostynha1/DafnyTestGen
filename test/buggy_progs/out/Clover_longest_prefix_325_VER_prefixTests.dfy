// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Clover_longest_prefix_325_VER_prefix.dfy
// Method: LongestCommonPrefix
// Generated: 2026-04-08 10:36:59

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
  // Test case for combination {7}:
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
    var str1: seq<char> := [' '];
    var str2: seq<char> := ['!'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {7}/Bstr1=1,str2=2:
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
    var str1: seq<char> := [' '];
    var str2: seq<char> := ['!', '"'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {7}/Bstr1=1,str2=3:
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
    var str1: seq<char> := [' '];
    var str2: seq<char> := ['!', '"', '#'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {7}/Bstr1=2,str2=1:
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
    var str1: seq<char> := ['w', 'x'];
    var str2: seq<char> := ['x'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {7}/O|prefix|>=3:
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
    var str1: seq<char> := ['p', 'k', '"', '!'];
    var str2: seq<char> := ['p', 'k', '"', ' '];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['p', 'k', '"'];
  }

  // Test case for combination {7}/O|prefix|>=2:
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
    var str1: seq<char> := ['Z', 'a', '!'];
    var str2: seq<char> := ['Z', 'a', ' '];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['Z', 'a'];
  }

  // Test case for combination {7}/O|prefix|=1:
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
    var str1: seq<char> := ['1', ' '];
    var str2: seq<char> := ['1', '!'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['1'];
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
