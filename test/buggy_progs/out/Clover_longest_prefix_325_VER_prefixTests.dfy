// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\buggy_progs\in\Clover_longest_prefix_325_VER_prefix.dfy
// Method: LongestCommonPrefix
// Generated: 2026-03-23 14:56:51

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
    var str2: seq<char> := [' '];
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
    var str2: seq<char> := [' ', '!'];
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
    var str2: seq<char> := [' ', '"', '!'];
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
    var str1: seq<char> := [' '];
    var str2: seq<char> := [' ', '!'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [' '];
  }

  // Test case for combination {1}/Bstr1=1,str2=3:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str1|
  {
    var str1: seq<char> := [' '];
    var str2: seq<char> := [' ', '!', '"'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [' '];
  }

  // Test case for combination {1}/Bstr1=2,str2=3:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str1|
  {
    var str1: seq<char> := [' ', '!'];
    var str2: seq<char> := [' ', '!', '"'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [' ', '!'];
  }

  // Test case for combination {2}/Bstr1=1,str2=0:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str2|
  {
    var str1: seq<char> := [' '];
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
    var str1: seq<char> := [' ', '!'];
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
    var str1: seq<char> := [' ', '"', '!'];
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
    var str1: seq<char> := [' '];
    var str2: seq<char> := [' '];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [' '];
  }

  // Test case for combination {1,2}/Bstr1=2,str2=2:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str1|
  //   POST: |prefix| == |str2|
  {
    var str1: seq<char> := [' ', '!'];
    var str2: seq<char> := [' ', '!'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [' ', '!'];
  }

  // Test case for combination {1,2}/Bstr1=3,str2=3:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str1|
  //   POST: |prefix| == |str2|
  {
    var str1: seq<char> := [' ', '!', '"'];
    var str2: seq<char> := [' ', '!', '"'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [' ', '!', '"'];
  }

  // Test case for combination {3}/Bstr1=1,str2=1:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: str1[|prefix|] != str2[|prefix|]
  {
    var str1: seq<char> := [' '];
    var str2: seq<char> := ['!'];
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
    var str1: seq<char> := [' '];
    var str2: seq<char> := ['!', '"'];
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
    var str1: seq<char> := [' '];
    var str2: seq<char> := ['!', '"', '#'];
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
    var str1: seq<char> := ['w', 'x'];
    var str2: seq<char> := ['x'];
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
    var str1: seq<char> := ['o', 'p'];
    var str2: seq<char> := ['o', 'q'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['o'];
  }

  // Test case for combination {3}/Bstr1=2,str2=3:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: str1[|prefix|] != str2[|prefix|]
  {
    var str1: seq<char> := [' ', '!'];
    var str2: seq<char> := [' ', '/', '0'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [' '];
  }

  // Test case for combination {3}/Bstr1=3,str2=1:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: str1[|prefix|] != str2[|prefix|]
  {
    var str1: seq<char> := ['3', '4', '5'];
    var str2: seq<char> := ['4'];
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
    var str1: seq<char> := ['%', '&', 'p'];
    var str2: seq<char> := ['%', '\U{0027}'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['%'];
  }

  // Test case for combination {3}/Bstr1=3,str2=3:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: str1[|prefix|] != str2[|prefix|]
  {
    var str1: seq<char> := [' ', '!', '\U{0027}'];
    var str2: seq<char> := [' ', '"', 'V'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [' '];
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
    var str1: seq<char> := [' ', '!'];
    var str2: seq<char> := [' '];
    var prefix := LongestCommonPrefix(str1, str2);
    // expect prefix == [' '];
  }

  // Test case for combination {2}/Bstr1=3,str2=1:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str2|
  {
    var str1: seq<char> := [' ', '!', '"'];
    var str2: seq<char> := [' '];
    var prefix := LongestCommonPrefix(str1, str2);
    // expect prefix == [' '];
  }

  // Test case for combination {2}/Bstr1=3,str2=2:
  //   POST: |prefix| <= |str1|
  //   POST: prefix == str1[0 .. |prefix|]
  //   POST: |prefix| <= |str2|
  //   POST: prefix == str2[0 .. |prefix|]
  //   POST: |prefix| == |str2|
  {
    var str1: seq<char> := [' ', '!', '"'];
    var str2: seq<char> := [' ', '!'];
    var prefix := LongestCommonPrefix(str1, str2);
    // expect prefix == [' ', '!'];
  }

}

method Main()
{
  Passing();
  Failing();
}
