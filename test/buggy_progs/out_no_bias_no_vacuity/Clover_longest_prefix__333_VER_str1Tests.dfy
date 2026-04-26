// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Clover_longest_prefix__333_VER_str1.dfy
// Method: LongestCommonPrefix
// Generated: 2026-04-24 21:39:38

// Clover_longest_prefix.dfy

method LongestCommonPrefix(str1: seq<char>, str2: seq<char>) returns (prefix: seq<char>)
  ensures |prefix| <= |str1| && prefix == str1[0 .. |prefix|] && |prefix| <= |str2| && prefix == str2[0 .. |prefix|]
  ensures |prefix| == |str1| || |prefix| == |str2| || str1[|prefix|] != str2[|prefix|]
  decreases str1, str2
{
  prefix := [];
  var minLength := if |str1| < |str1| then |str1| else |str2|;
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
  // Test case for combination {1}/Rel:
  //   POST Q1: |prefix| == |str1|
  //   POST Q2: prefix == str1[0 .. |prefix|]
  //   POST Q3: |prefix| <= |str2|
  //   POST Q4: prefix == str2[0 .. |prefix|]
  {
    var str1: seq<char> := ['D'];
    var str2: seq<char> := ['D'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['D'];
  }

  // Test case for combination {2}/Rel:
  //   POST Q1: |prefix| < |str1|
  //   POST Q2: prefix == str1[0 .. |prefix|]
  //   POST Q3: |prefix| == |str2|
  //   POST Q4: prefix == str2[0 .. |prefix|]
  {
    var str1: seq<char> := ['<', ' '];
    var str2: seq<char> := ['<'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['<'];
  }

  // Test case for combination {3}/Rel:
  //   POST Q1: |prefix| < |str1|
  //   POST Q2: prefix == str1[0 .. |prefix|]
  //   POST Q3: |prefix| < |str2|
  //   POST Q4: prefix == str2[0 .. |prefix|]
  //   POST Q5: str1[|prefix|] != str2[|prefix|]
  {
    var str1: seq<char> := ['M', '!', '>', '='];
    var str2: seq<char> := ['M', ' ', 'E', 'I'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['M'];
  }

  // Test case for combination {1}/O|str1|=0:
  //   POST Q1: |prefix| == |str1|
  //   POST Q2: prefix == str1[0 .. |prefix|]
  //   POST Q3: |prefix| <= |str2|
  //   POST Q4: prefix == str2[0 .. |prefix|]
  {
    var str1: seq<char> := [];
    var str2: seq<char> := [];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {1}/O|str1|>=2:
  //   POST Q1: |prefix| == |str1|
  //   POST Q2: prefix == str1[0 .. |prefix|]
  //   POST Q3: |prefix| <= |str2|
  //   POST Q4: prefix == str2[0 .. |prefix|]
  {
    var str1: seq<char> := [' ', 'D'];
    var str2: seq<char> := [' ', 'D'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [' ', 'D'];
  }

  // Test case for combination {2}/O|str1|=1:
  //   POST Q1: |prefix| < |str1|
  //   POST Q2: prefix == str1[0 .. |prefix|]
  //   POST Q3: |prefix| == |str2|
  //   POST Q4: prefix == str2[0 .. |prefix|]
  {
    var str1: seq<char> := [' '];
    var str2: seq<char> := [];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {2}/O|str2|>=2:
  //   POST Q1: |prefix| < |str1|
  //   POST Q2: prefix == str1[0 .. |prefix|]
  //   POST Q3: |prefix| == |str2|
  //   POST Q4: prefix == str2[0 .. |prefix|]
  {
    var str1: seq<char> := [' ', '<', ')'];
    var str2: seq<char> := [' ', '<'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [' ', '<'];
  }

  // Test case for combination {3}/O|str1|=1:
  //   POST Q1: |prefix| < |str1|
  //   POST Q2: prefix == str1[0 .. |prefix|]
  //   POST Q3: |prefix| < |str2|
  //   POST Q4: prefix == str2[0 .. |prefix|]
  //   POST Q5: str1[|prefix|] != str2[|prefix|]
  {
    var str1: seq<char> := [' '];
    var str2: seq<char> := ['!'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == [];
  }

  // Test case for combination {3}/O|prefix|>=2:
  //   POST Q1: |prefix| < |str1|
  //   POST Q2: prefix == str1[0 .. |prefix|]
  //   POST Q3: |prefix| < |str2|
  //   POST Q4: prefix == str2[0 .. |prefix|]
  //   POST Q5: str1[|prefix|] != str2[|prefix|]
  {
    var str1: seq<char> := ['L', 'X', ' ', ';'];
    var str2: seq<char> := ['L', 'X', '!'];
    var prefix := LongestCommonPrefix(str1, str2);
    expect prefix == ['L', 'X'];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|str1|=0/R3:
  //   POST Q1: |prefix| == |str1|
  //   POST Q2: prefix == str1[0 .. |prefix|]
  //   POST Q3: |prefix| <= |str2|
  //   POST Q4: prefix == str2[0 .. |prefix|]
  {
    var str1: seq<char> := [];
    var str2: seq<char> := [' '];
    var prefix := LongestCommonPrefix(str1, str2);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at System.Collections.Immutable.ImmutableArray`1.get_Item(Int32 index)
    // runtime error: at Dafny.Sequence`1.Select(BigInteger index) in C:\cygwin64\tmp\DafnyCBT_pnp4yluxdwm\runner.cs:line 1534
    // expect prefix == [];
  }

}

method Main()
{
  TestsForLongestCommonPrefix();
  print "TestsForLongestCommonPrefix: all non-failing tests passed!\n";
}
