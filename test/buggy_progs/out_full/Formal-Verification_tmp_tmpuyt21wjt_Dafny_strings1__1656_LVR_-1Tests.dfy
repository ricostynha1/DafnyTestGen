// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Formal-Verification_tmp_tmpuyt21wjt_Dafny_strings1__1656_LVR_-1.dfy
// Method: isPrefix
// Generated: 2026-04-24 10:38:32

// Formal-Verification_tmp_tmpuyt21wjt_Dafny_strings1.dfy

predicate isPrefixPredicate(pre: string, str: string)
  decreases pre, str
{
  |str| >= |pre| &&
  pre <= str
}

method isPrefix(pre: string, str: string) returns (res: bool)
  ensures |pre| > |str| ==> !res
  ensures res == isPrefixPredicate(pre, str)
  decreases pre, str
{
  if |pre| > |str| {
    return false;
  }
  var i := 0;
  while i < |pre|
    invariant 0 <= i <= |pre|
    invariant forall j: int {:trigger str[j]} {:trigger pre[j]} :: 0 <= j < i ==> pre[j] == str[j]
    decreases |pre| - i
  {
    if pre[i] != str[i] {
      return false;
    }
    i := i + 1;
  }
  return true;
}

predicate isSubstringPredicate(sub: string, str: string)
  decreases sub, str
{
  |str| >= |sub| &&
  exists i: int {:trigger str[i..]} :: 
    0 <= i <= |str| &&
    isPrefixPredicate(sub, str[i..])
}

method isSubstring(sub: string, str: string) returns (res: bool)
  ensures res == isSubstringPredicate(sub, str)
  decreases sub, str
{
  if |sub| > |str| {
    return false;
  }
  var i := |str| - |sub|;
  while i >= 0
    invariant i >= -1
    invariant forall j: int {:trigger str[j..]} :: i < j <= |str| - |sub| ==> !isPrefixPredicate(sub, str[j..])
    decreases i
  {
    var isPref := isPrefix(sub, str[i..]);
    if isPref {
      return true;
    }
    i := i - 1;
  }
  return false;
}

predicate haveCommonKSubstringPredicate(k: nat, str1: string, str2: string)
  decreases k, str1, str2
{
  |str1| >= k &&
  |str2| >= k &&
  exists i: int {:trigger str1[i..]} :: 
    0 <= i <= |str1| - k &&
    isSubstringPredicate(str1[i..][..k], str2)
}

method haveCommonKSubstring(k: nat, str1: string, str2: string)
    returns (found: bool)
  ensures |str1| < k || |str2| < k ==> !found
  ensures haveCommonKSubstringPredicate(k, str1, str2) == found
  decreases k, str1, str2
{
  if |str1| < k || |str2| < k {
    return false;
  }
  var i := |str1| - k;
  while i >= -1
    invariant i >= -1
    invariant forall j: int {:trigger str1[j..]} :: i < j <= |str1| - k ==> !isSubstringPredicate(str1[j..][..k], str2)
    decreases i
  {
    var isSub := isSubstring(str1[i..][..k], str2);
    if isSub {
      return true;
    }
    i := i - 1;
  }
  return false;
}

predicate maxCommonSubstringPredicate(str1: string, str2: string, len: nat)
  decreases str1, str2, len
{
  forall k: int {:trigger haveCommonKSubstringPredicate(k, str1, str2)} :: 
    len < k <= |str1| ==>
      !haveCommonKSubstringPredicate(k, str1, str2)
}

method maxCommonSubstringLength(str1: string, str2: string) returns (len: nat)
  ensures len <= |str1| && len <= |str2|
  ensures len >= 0
  ensures maxCommonSubstringPredicate(str1, str2, len)
  decreases str1, str2
{
  var i := |str1|;
  while i > 0
    invariant i >= 0
    invariant forall j: int {:trigger haveCommonKSubstringPredicate(j, str1, str2)} :: i < j <= |str1| ==> !haveCommonKSubstringPredicate(j, str1, str2)
    decreases i
  {
    var ans := haveCommonKSubstring(i, str1, str2);
    if ans {
      return i;
    }
    i := i - 1;
  }
  assert i == 0;
  return 0;
}


method TestsForisPrefix()
{
  // Test case for combination {2}/Rel:
  //   POST Q1: |pre| > |str|
  //   POST Q2: !res
  //   POST Q3: res == isPrefixPredicate(pre, str)
  {
    var pre: seq<char> := ['~'];
    var str: seq<char> := [];
    var res := isPrefix(pre, str);
    expect res == false;
  }

  // Test case for combination {1}:
  //   POST Q1: |pre| <= |str|
  //   POST Q2: res == isPrefixPredicate(pre, str)
  {
    var pre: seq<char> := [];
    var str: seq<char> := [];
    var res := isPrefix(pre, str);
    expect res == false || res == true;
    expect res == true; // observed from implementation
  }

  // Test case for combination {1}/O|pre|=1:
  //   POST Q1: |pre| <= |str|
  //   POST Q2: res == isPrefixPredicate(pre, str)
  {
    var pre: seq<char> := ['~'];
    var str: seq<char> := ['f'];
    var res := isPrefix(pre, str);
    expect res == false || res == true;
    expect res == false; // observed from implementation
  }

  // Test case for combination {1}/O|pre|>=2:
  //   POST Q1: |pre| <= |str|
  //   POST Q2: res == isPrefixPredicate(pre, str)
  {
    var pre: seq<char> := ['~', 'e'];
    var str: seq<char> := ['~', 'e'];
    var res := isPrefix(pre, str);
    expect res == false || res == true;
    expect res == true; // observed from implementation
  }

  // Test case for combination {1}/Ores=true:
  //   POST Q1: |pre| <= |str|
  //   POST Q2: res == isPrefixPredicate(pre, str)
  {
    var pre: seq<char> := [];
    var str: seq<char> := ['e'];
    var res := isPrefix(pre, str);
    expect res == true || res == false;
    expect res == true; // observed from implementation
  }

  // Test case for combination {2}/O|pre|>=2:
  //   POST Q1: |pre| > |str|
  //   POST Q2: !res
  //   POST Q3: res == isPrefixPredicate(pre, str)
  {
    var pre: seq<char> := ['~', '5'];
    var str: seq<char> := [];
    var res := isPrefix(pre, str);
    expect res == false;
  }

  // Test case for combination {2}/O|str|=1:
  //   POST Q1: |pre| > |str|
  //   POST Q2: !res
  //   POST Q3: res == isPrefixPredicate(pre, str)
  {
    var pre: seq<char> := ['~', '~'];
    var str: seq<char> := ['!'];
    var res := isPrefix(pre, str);
    expect res == false;
  }

  // Test case for combination {2}/O|str|>=2:
  //   POST Q1: |pre| > |str|
  //   POST Q2: !res
  //   POST Q3: res == isPrefixPredicate(pre, str)
  {
    var pre: seq<char> := ['~', 'Y', 'm', '^'];
    var str: seq<char> := ['v', 'f'];
    var res := isPrefix(pre, str);
    expect res == false;
  }

  // Test case for combination {1}/R5:
  //   POST Q1: |pre| <= |str|
  //   POST Q2: res == isPrefixPredicate(pre, str)
  {
    var pre: seq<char> := ['}'];
    var str: seq<char> := ['}'];
    var res := isPrefix(pre, str);
    expect res == false || res == true;
    expect res == true; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   POST Q1: |pre| <= |str|
  //   POST Q2: res == isPrefixPredicate(pre, str)
  {
    var pre: seq<char> := ['|'];
    var str: seq<char> := ['|'];
    var res := isPrefix(pre, str);
    expect res == false || res == true;
    expect res == true; // observed from implementation
  }

}

method TestsForisSubstring()
{
  // Test case for combination {1}:
  //   POST Q1: res == isSubstringPredicate(sub, str)
  {
    var sub: seq<char> := [];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res == false || res == true;
    expect res == true; // observed from implementation
  }

  // Test case for combination {1}/O|sub|=1:
  //   POST Q1: res == isSubstringPredicate(sub, str)
  {
    var sub: seq<char> := ['~'];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res == false || res == true;
    expect res == false; // observed from implementation
  }

  // Test case for combination {1}/O|sub|>=2:
  //   POST Q1: res == isSubstringPredicate(sub, str)
  {
    var sub: seq<char> := ['~', '!'];
    var str: seq<char> := ['~'];
    var res := isSubstring(sub, str);
    expect res == false || res == true;
    expect res == false; // observed from implementation
  }

  // Test case for combination {1}/O|str|>=2:
  //   POST Q1: res == isSubstringPredicate(sub, str)
  {
    var sub: seq<char> := ['}', '~'];
    var str: seq<char> := ['}', '~'];
    var res := isSubstring(sub, str);
    expect res == false || res == true;
    expect res == true; // observed from implementation
  }

  // Test case for combination {1}/Ores=true:
  //   POST Q1: res == isSubstringPredicate(sub, str)
  {
    var sub: seq<char> := ['c'];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res == true || res == false;
    expect res == false; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   POST Q1: res == isSubstringPredicate(sub, str)
  {
    var sub: seq<char> := [];
    var str: seq<char> := ['}'];
    var res := isSubstring(sub, str);
    expect res == false || res == true;
    expect res == true; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   POST Q1: res == isSubstringPredicate(sub, str)
  {
    var sub: seq<char> := [];
    var str: seq<char> := ['|'];
    var res := isSubstring(sub, str);
    expect res == false || res == true;
    expect res == true; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   POST Q1: res == isSubstringPredicate(sub, str)
  {
    var sub: seq<char> := ['}'];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res == false || res == true;
    expect res == false; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   POST Q1: res == isSubstringPredicate(sub, str)
  {
    var sub: seq<char> := ['|'];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res == false || res == true;
    expect res == false; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   POST Q1: res == isSubstringPredicate(sub, str)
  {
    var sub: seq<char> := ['b'];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res == false || res == true;
    expect res == false; // observed from implementation
  }

}

method TestsForhaveCommonKSubstring()
{
  // Test case for combination {1}:
  //   POST Q1: |str1| < k || |str2| < k ==> !found
  //   POST Q2: haveCommonKSubstringPredicate(k, str1, str2) == found
  {
    var k := 2;
    var str1: seq<char> := [];
    var str2: seq<char> := [];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

  // Test case for combination {1}/Bk=0:
  //   POST Q1: |str1| < k || |str2| < k ==> !found
  //   POST Q2: haveCommonKSubstringPredicate(k, str1, str2) == found
  {
    var k := 0;
    var str1: seq<char> := [];
    var str2: seq<char> := [];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == true;
  }

  // Test case for combination {1}/Bk=1:
  //   POST Q1: |str1| < k || |str2| < k ==> !found
  //   POST Q2: haveCommonKSubstringPredicate(k, str1, str2) == found
  {
    var k := 1;
    var str1: seq<char> := [];
    var str2: seq<char> := [];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

  // Test case for combination {1}/O|str1|=1:
  //   POST Q1: |str1| < k || |str2| < k ==> !found
  //   POST Q2: haveCommonKSubstringPredicate(k, str1, str2) == found
  {
    var k := 2;
    var str1: seq<char> := ['\U{005C}'];
    var str2: seq<char> := [];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

  // Test case for combination {1}/O|str1|>=2:
  //   POST Q1: |str1| < k || |str2| < k ==> !found
  //   POST Q2: haveCommonKSubstringPredicate(k, str1, str2) == found
  {
    var k := 3;
    var str1: seq<char> := ['~', 'e', 'f'];
    var str2: seq<char> := [];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

  // Test case for combination {1}/O|str2|=1:
  //   POST Q1: |str1| < k || |str2| < k ==> !found
  //   POST Q2: haveCommonKSubstringPredicate(k, str1, str2) == found
  {
    var k := 2;
    var str1: seq<char> := [];
    var str2: seq<char> := ['\U{005C}'];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

  // Test case for combination {1}/O|str2|>=2:
  //   POST Q1: |str1| < k || |str2| < k ==> !found
  //   POST Q2: haveCommonKSubstringPredicate(k, str1, str2) == found
  {
    var k := 2;
    var str1: seq<char> := [];
    var str2: seq<char> := ['+', '+'];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: |str1| < k || |str2| < k ==> !found
  //   POST Q2: haveCommonKSubstringPredicate(k, str1, str2) == found
  {
    var k := 10;
    var str1: seq<char> := [];
    var str2: seq<char> := [];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: |str1| < k || |str2| < k ==> !found
  //   POST Q2: haveCommonKSubstringPredicate(k, str1, str2) == found
  {
    var k := 4;
    var str1: seq<char> := [];
    var str2: seq<char> := ['~'];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: |str1| < k || |str2| < k ==> !found
  //   POST Q2: haveCommonKSubstringPredicate(k, str1, str2) == found
  {
    var k := 3;
    var str1: seq<char> := [];
    var str2: seq<char> := [];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

}

method TestsFormaxCommonSubstringLength()
{
  // Test case for combination {1}:
  //   POST Q1: len <= |str1| && len <= |str2|
  //   POST Q2: len >= 0
  //   POST Q3: maxCommonSubstringPredicate(str1, str2, len)
  {
    var str1: seq<char> := [];
    var str2: seq<char> := [];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0;
  }

  // Test case for combination {1}/O|str1|=1:
  //   POST Q1: len <= |str1| && len <= |str2|
  //   POST Q2: len >= 0
  //   POST Q3: maxCommonSubstringPredicate(str1, str2, len)
  {
    var str1: seq<char> := ['~'];
    var str2: seq<char> := [];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0;
  }

  // Test case for combination {1}/O|str1|>=2:
  //   POST Q1: len <= |str1| && len <= |str2|
  //   POST Q2: len >= 0
  //   POST Q3: maxCommonSubstringPredicate(str1, str2, len)
  {
    var str1: seq<char> := ['~', '!'];
    var str2: seq<char> := ['~'];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0 || len == 1;
    expect len == 1; // observed from implementation
  }

  // Test case for combination {1}/O|str2|>=2:
  //   POST Q1: len <= |str1| && len <= |str2|
  //   POST Q2: len >= 0
  //   POST Q3: maxCommonSubstringPredicate(str1, str2, len)
  {
    var str1: seq<char> := [];
    var str2: seq<char> := ['~', 'M'];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0;
  }

  // Test case for combination {1}/R5:
  //   POST Q1: len <= |str1| && len <= |str2|
  //   POST Q2: len >= 0
  //   POST Q3: maxCommonSubstringPredicate(str1, str2, len)
  {
    var str1: seq<char> := ['c'];
    var str2: seq<char> := [];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: len <= |str1| && len <= |str2|
  //   POST Q2: len >= 0
  //   POST Q3: maxCommonSubstringPredicate(str1, str2, len)
  {
    var str1: seq<char> := [];
    var str2: seq<char> := ['}'];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0;
  }

  // Test case for combination {1}/R7:
  //   POST Q1: len <= |str1| && len <= |str2|
  //   POST Q2: len >= 0
  //   POST Q3: maxCommonSubstringPredicate(str1, str2, len)
  {
    var str1: seq<char> := ['}'];
    var str2: seq<char> := [];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: len <= |str1| && len <= |str2|
  //   POST Q2: len >= 0
  //   POST Q3: maxCommonSubstringPredicate(str1, str2, len)
  {
    var str1: seq<char> := ['|'];
    var str2: seq<char> := [];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: len <= |str1| && len <= |str2|
  //   POST Q2: len >= 0
  //   POST Q3: maxCommonSubstringPredicate(str1, str2, len)
  {
    var str1: seq<char> := ['b'];
    var str2: seq<char> := [];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: len <= |str1| && len <= |str2|
  //   POST Q2: len >= 0
  //   POST Q3: maxCommonSubstringPredicate(str1, str2, len)
  {
    var str1: seq<char> := ['a'];
    var str2: seq<char> := [];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0;
  }

}

method Main()
{
  TestsForisPrefix();
  print "TestsForisPrefix: all non-failing tests passed!\n";
  TestsForisSubstring();
  print "TestsForisSubstring: all non-failing tests passed!\n";
  TestsForhaveCommonKSubstring();
  print "TestsForhaveCommonKSubstring: all non-failing tests passed!\n";
  TestsFormaxCommonSubstringLength();
  print "TestsFormaxCommonSubstringLength: all non-failing tests passed!\n";
}
