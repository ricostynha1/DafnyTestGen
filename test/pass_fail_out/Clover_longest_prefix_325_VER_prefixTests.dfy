// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\pass_fail_in\Clover_longest_prefix_325_VER_prefix.dfy
// Method: LongestCommonPrefix
// Generated: 2026-03-20 14:51:15

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
  // Test case for combination {1}/Bstr1=0,str2=1:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str1|
  {
    var str1: seq<char> := [];
    var str2: seq<char> := ['a'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {1}/Bstr1=0,str2=2:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str1|
  {
    var str1: seq<char> := [];
    var str2: seq<char> := ['a', 'm'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {1}/Bstr1=0,str2=3:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str1|
  {
    var str1: seq<char> := [];
    var str2: seq<char> := ['a', 'x', 'm'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {1}/Bstr1=1,str2=2:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str1|
  {
    var str1: seq<char> := ['x'];
    var str2: seq<char> := ['x', 'a'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['x'];
  }

  // Test case for combination {1}/Bstr1=1,str2=3:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str1|
  {
    var str1: seq<char> := ['x'];
    var str2: seq<char> := ['x', 'a', 'w'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['x'];
  }

  // Test case for combination {1}/Bstr1=2,str2=3:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str1|
  {
    var str1: seq<char> := ['w', 't'];
    var str2: seq<char> := ['w', 't', 'a'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['w', 't'];
  }

  // Test case for combination {2}/Bstr1=1,str2=0:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str2|
  {
    var str1: seq<char> := ['a'];
    var str2: seq<char> := [];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {2}/Bstr1=2,str2=0:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str2|
  {
    var str1: seq<char> := ['a', 'm'];
    var str2: seq<char> := [];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {2}/Bstr1=3,str2=0:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str2|
  {
    var str1: seq<char> := ['a', 'x', 'm'];
    var str2: seq<char> := [];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {1,2}/Bstr1=0,str2=0:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str1|
  //   POST: |prefix| == |str2|
  {
    var str1: seq<char> := [];
    var str2: seq<char> := [];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {1,2}/Bstr1=1,str2=1:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str1|
  //   POST: |prefix| == |str2|
  {
    var str1: seq<char> := ['a'];
    var str2: seq<char> := ['a'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['a'];
  }

  // Test case for combination {1,2}/Bstr1=2,str2=2:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str1|
  //   POST: |prefix| == |str2|
  {
    var str1: seq<char> := ['a', 'x'];
    var str2: seq<char> := ['a', 'x'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['a', 'x'];
  }

  // Test case for combination {1,2}/Bstr1=3,str2=3:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str1|
  //   POST: |prefix| == |str2|
  {
    var str1: seq<char> := ['a', 'w', 't'];
    var str2: seq<char> := ['a', 'w', 't'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['a', 'w', 't'];
  }

  // Test case for combination {3}/Bstr1=1,str2=1:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: str1[|prefix|] != str2[|prefix|]
  {
    var str1: seq<char> := ['a'];
    var str2: seq<char> := ['b'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {3}/Bstr1=1,str2=2:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: str1[|prefix|] != str2[|prefix|]
  {
    var str1: seq<char> := ['a'];
    var str2: seq<char> := ['b', 'w'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {3}/Bstr1=1,str2=3:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: str1[|prefix|] != str2[|prefix|]
  {
    var str1: seq<char> := ['a'];
    var str2: seq<char> := ['b', 't', 'w'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {3}/Bstr1=2,str2=1:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: str1[|prefix|] != str2[|prefix|]
  {
    var str1: seq<char> := ['a', 'w'];
    var str2: seq<char> := ['b'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {3}/Bstr1=2,str2=2:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: str1[|prefix|] != str2[|prefix|]
  {
    var str1: seq<char> := ['t', 'a'];
    var str2: seq<char> := ['t', 'b'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['t'];
  }

  // Test case for combination {3}/Bstr1=2,str2=3:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: str1[|prefix|] != str2[|prefix|]
  {
    var str1: seq<char> := ['t', 'b'];
    var str2: seq<char> := ['t', 'a', 't'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['t'];
  }

  // Test case for combination {3}/Bstr1=3,str2=1:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: str1[|prefix|] != str2[|prefix|]
  {
    var str1: seq<char> := ['a', 't', 'w'];
    var str2: seq<char> := ['b'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {3}/Bstr1=3,str2=2:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: str1[|prefix|] != str2[|prefix|]
  {
    var str1: seq<char> := ['t', 'a', 't'];
    var str2: seq<char> := ['t', 'b'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['t'];
  }

  // Test case for combination {3}/Bstr1=3,str2=3:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: str1[|prefix|] != str2[|prefix|]
  {
    var str1: seq<char> := ['t', 'a', 'k'];
    var str2: seq<char> := ['t', 'b', 'l'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['t'];
  }

}

method Failing()
{
  // Test case for combination {2}/Bstr1=2,str2=1:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str2|
  {
    var str1: seq<char> := ['x', 'a'];
    var str2: seq<char> := ['x'];
    var prefix := LongestCommonPrefix(str1, str2);
    // expect prefix == ['x'];
  }

  // Test case for combination {2}/Bstr1=3,str2=1:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str2|
  {
    var str1: seq<char> := ['x', 'a', 'w'];
    var str2: seq<char> := ['x'];
    var prefix := LongestCommonPrefix(str1, str2);
    // expect prefix == ['x'];
  }

  // Test case for combination {2}/Bstr1=3,str2=2:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str2|
  {
    var str1: seq<char> := ['w', 't', 'a'];
    var str2: seq<char> := ['w', 't'];
    var prefix := LongestCommonPrefix(str1, str2);
    // expect prefix == ['w', 't'];
  }

}

method Main()
{
  Passing();
  Failing();
}
