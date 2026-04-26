// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Formal-Verification_tmp_tmpuyt21wjt_Dafny_strings3__2754_BBR_false.dfy
// Method: isPrefix
// Generated: 2026-04-24 12:19:22

// Formal-Verification_tmp_tmpuyt21wjt_Dafny_strings3.dfy

predicate isPrefixPred(pre: string, str: string)
  decreases pre, str
{
  |pre| <= |str| &&
  pre == str[..|pre|]
}

predicate isNotPrefixPred(pre: string, str: string)
  decreases pre, str
{
  |pre| > |str| || pre != str[..|pre|]
}

lemma PrefixNegationLemma(pre: string, str: string)
  ensures isPrefixPred(pre, str) <==> !isNotPrefixPred(pre, str)
  ensures !isPrefixPred(pre, str) <==> isNotPrefixPred(pre, str)
  decreases pre, str
{
}

method isPrefix(pre: string, str: string) returns (res: bool)
  ensures !res <==> isNotPrefixPred(pre, str)
  ensures res <==> isPrefixPred(pre, str)
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

predicate isSubstringPred(sub: string, str: string)
  decreases sub, str
{
  exists i: int {:trigger str[i..]} :: 
    0 <= i <= |str| &&
    isPrefixPred(sub, str[i..])
}

predicate isNotSubstringPred(sub: string, str: string)
  decreases sub, str
{
  forall i: int {:trigger str[i..]} :: 
    0 <= i <= |str| ==>
      isNotPrefixPred(sub, str[i..])
}

lemma SubstringNegationLemma(sub: string, str: string)
  ensures isSubstringPred(sub, str) <==> !isNotSubstringPred(sub, str)
  ensures !isSubstringPred(sub, str) <==> isNotSubstringPred(sub, str)
  decreases sub, str
{
}

method isSubstring(sub: string, str: string) returns (res: bool)
  ensures res <==> isSubstringPred(sub, str)
  decreases sub, str
{
  if |sub| > |str| {
    return false;
  }
  var i := |str| - |sub|;
  while i >= 0
    invariant i >= -1
    invariant forall j: int {:trigger str[j..]} :: i < j <= |str| - |sub| ==> !isPrefixPred(sub, str[j..])
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

predicate haveCommonKSubstringPred(k: nat, str1: string, str2: string)
  decreases k, str1, str2
{
  exists i1: int, j1: int {:trigger str1[i1 .. j1]} :: 
    0 <= i1 <= |str1| - k &&
    j1 == i1 + k &&
    isSubstringPred(str1[i1 .. j1], str2)
}

predicate haveNotCommonKSubstringPred(k: nat, str1: string, str2: string)
  decreases k, str1, str2
{
  forall i1: int, j1: int {:trigger str1[i1 .. j1]} :: 
    0 <= i1 <= |str1| - k &&
    j1 == i1 + k ==>
      isNotSubstringPred(str1[i1 .. j1], str2)
}

lemma commonKSubstringLemma(k: nat, str1: string, str2: string)
  ensures haveCommonKSubstringPred(k, str1, str2) <==> !haveNotCommonKSubstringPred(k, str1, str2)
  ensures !haveCommonKSubstringPred(k, str1, str2) <==> haveNotCommonKSubstringPred(k, str1, str2)
  decreases k, str1, str2
{
}

method haveCommonKSubstring(k: nat, str1: string, str2: string)
    returns (found: bool)
  ensures found <==> haveCommonKSubstringPred(k, str1, str2)
  decreases k, str1, str2
{
  if false || |str2| < k {
    return false;
  }
  var i := |str1| - k;
  while i >= 0
    invariant i >= -1
    invariant forall j: int, t: int {:trigger str1[j .. t]} :: i < j <= |str1| - k && t == j + k ==> !isSubstringPred(str1[j .. t], str2)
    decreases i
  {
    var t := i + k;
    var isSub := isSubstring(str1[i .. t], str2);
    if isSub {
      return true;
    }
    i := i - 1;
  }
  return false;
}

method maxCommonSubstringLength(str1: string, str2: string) returns (len: nat)
  requires |str1| <= |str2|
  ensures forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  ensures haveCommonKSubstringPred(len, str1, str2)
  decreases str1, str2
{
  var i := |str1|;
  while i > 0
    invariant i >= 0
    invariant forall j: int {:trigger haveCommonKSubstringPred(j, str1, str2)} :: i < j <= |str1| ==> !haveCommonKSubstringPred(j, str1, str2)
    decreases i
  {
    var ans := haveCommonKSubstring(i, str1, str2);
    if ans {
      return i;
    }
    i := i - 1;
  }
  assert i == 0;
  assert isPrefixPred(str1[0 .. 0], str2[0..]);
  return 0;
}


method TestsForisPrefix()
{
  // Test case for combination {1}:
  //   POST Q1: !res
  //   POST Q2: isNotPrefixPred(pre, str)
  {
    var pre: seq<char> := [' '];
    var str: seq<char> := [];
    var res := isPrefix(pre, str);
    expect res == false;
  }

  // Test case for combination {2}:
  //   POST Q1: !res
  //   POST Q2: !isNotPrefixPred(pre, str)
  //   POST Q3: !isPrefixPred(pre, str)
  {
    var pre: seq<char> := ['*'];
    var str: seq<char> := [')'];
    var res := isPrefix(pre, str);
    expect res == false;
  }

  // Test case for combination {3}:
  //   POST Q1: res
  //   POST Q2: !isNotPrefixPred(pre, str)
  //   POST Q3: isPrefixPred(pre, str)
  {
    var pre: seq<char> := [' '];
    var str: seq<char> := [' '];
    var res := isPrefix(pre, str);
    expect res == true;
  }

  // Test case for combination {1}/O|pre|>=2:
  //   POST Q1: !res
  //   POST Q2: isNotPrefixPred(pre, str)
  {
    var pre: seq<char> := [' ', '4'];
    var str: seq<char> := ['<'];
    var res := isPrefix(pre, str);
    expect res == false;
  }

  // Test case for combination {1}/O|str|>=2:
  //   POST Q1: !res
  //   POST Q2: isNotPrefixPred(pre, str)
  {
    var pre: seq<char> := [' ', ')', 'D'];
    var str: seq<char> := ['V', 'G'];
    var res := isPrefix(pre, str);
    expect res == false;
  }

  // Test case for combination {2}/O|pre|>=2:
  //   POST Q1: !res
  //   POST Q2: !isNotPrefixPred(pre, str)
  //   POST Q3: !isPrefixPred(pre, str)
  {
    var pre: seq<char> := ['=', '1'];
    var str: seq<char> := ['<', '2'];
    var res := isPrefix(pre, str);
    expect res == false;
  }

  // Test case for combination {3}/O|pre|=0:
  //   POST Q1: res
  //   POST Q2: !isNotPrefixPred(pre, str)
  //   POST Q3: isPrefixPred(pre, str)
  {
    var pre: seq<char> := [];
    var str: seq<char> := [];
    var res := isPrefix(pre, str);
    expect res == true;
  }

  // Test case for combination {3}/O|pre|>=2:
  //   POST Q1: res
  //   POST Q2: !isNotPrefixPred(pre, str)
  //   POST Q3: isPrefixPred(pre, str)
  {
    var pre: seq<char> := [' ', '4'];
    var str: seq<char> := [' ', '4'];
    var res := isPrefix(pre, str);
    expect res == true;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: !res
  //   POST Q2: isNotPrefixPred(pre, str)
  {
    var pre: seq<char> := ['!'];
    var str: seq<char> := [];
    var res := isPrefix(pre, str);
    expect res == false;
  }

  // Test case for combination {1}/R5:
  //   POST Q1: !res
  //   POST Q2: isNotPrefixPred(pre, str)
  {
    var pre: seq<char> := ['"'];
    var str: seq<char> := [];
    var res := isPrefix(pre, str);
    expect res == false;
  }

}

method TestsForisSubstring()
{
  // Test case for combination {1}:
  //   POST Q1: res <==> isSubstringPred(sub, str)
  {
    var sub: seq<char> := [];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res == false || res == true;
    expect res == true; // observed from implementation
  }

  // Test case for combination {1}/O|sub|=1:
  //   POST Q1: res <==> isSubstringPred(sub, str)
  {
    var sub: seq<char> := [' '];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res == false;
  }

  // Test case for combination {1}/O|sub|>=2:
  //   POST Q1: res <==> isSubstringPred(sub, str)
  {
    var sub: seq<char> := [' ', '4'];
    var str: seq<char> := ['<'];
    var res := isSubstring(sub, str);
    expect res == false;
  }

  // Test case for combination {1}/O|str|>=2:
  //   POST Q1: res <==> isSubstringPred(sub, str)
  {
    var sub: seq<char> := ['!', ' '];
    var str: seq<char> := ['!', ' '];
    var res := isSubstring(sub, str);
    expect res == false || res == true;
    expect res == true; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   POST Q1: res <==> isSubstringPred(sub, str)
  {
    var sub: seq<char> := ['"'];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res == false;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: res <==> isSubstringPred(sub, str)
  {
    var sub: seq<char> := [];
    var str: seq<char> := [' '];
    var res := isSubstring(sub, str);
    expect res == false || res == true;
    expect res == true; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   POST Q1: res <==> isSubstringPred(sub, str)
  {
    var sub: seq<char> := ['#'];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res == false;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: res <==> isSubstringPred(sub, str)
  {
    var sub: seq<char> := ['$'];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res == false;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: res <==> isSubstringPred(sub, str)
  {
    var sub: seq<char> := ['%'];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res == false;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: res <==> isSubstringPred(sub, str)
  {
    var sub: seq<char> := ['&'];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res == false;
  }

}

method TestsForhaveCommonKSubstring()
{
  // Test case for combination {1}:
  //   POST Q1: found <==> haveCommonKSubstringPred(k, str1, str2)
  {
    var k := 0;
    var str1: seq<char> := [];
    var str2: seq<char> := [];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false || found == true;
    expect found == true; // observed from implementation
  }

  // Test case for combination {1}/Bk=1:
  //   POST Q1: found <==> haveCommonKSubstringPred(k, str1, str2)
  {
    var k := 1;
    var str1: seq<char> := [];
    var str2: seq<char> := [];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

  // Test case for combination {1}/Ok>=2:
  //   POST Q1: found <==> haveCommonKSubstringPred(k, str1, str2)
  {
    var k := 2;
    var str1: seq<char> := [' '];
    var str2: seq<char> := [];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

  // Test case for combination {1}/O|str1|>=2:
  //   POST Q1: found <==> haveCommonKSubstringPred(k, str1, str2)
  {
    var k := 0;
    var str1: seq<char> := [' ', '4'];
    var str2: seq<char> := ['<'];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false || found == true;
    expect found == true; // observed from implementation
  }

  // Test case for combination {1}/O|str2|>=2:
  //   POST Q1: found <==> haveCommonKSubstringPred(k, str1, str2)
  {
    var k := 3;
    var str1: seq<char> := [];
    var str2: seq<char> := [' ', ')'];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: found <==> haveCommonKSubstringPred(k, str1, str2)
  {
    var k := 2;
    var str1: seq<char> := [];
    var str2: seq<char> := [];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

  // Test case for combination {1}/R7:
  //   POST Q1: found <==> haveCommonKSubstringPred(k, str1, str2)
  {
    var k := 2;
    var str1: seq<char> := ['!'];
    var str2: seq<char> := [];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: found <==> haveCommonKSubstringPred(k, str1, str2)
  {
    var k := 0;
    var str1: seq<char> := [];
    var str2: seq<char> := [' '];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false || found == true;
    expect found == true; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   POST Q1: found <==> haveCommonKSubstringPred(k, str1, str2)
  {
    var k := 0;
    var str1: seq<char> := [];
    var str2: seq<char> := ['!'];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false || found == true;
    expect found == true; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   POST Q1: found <==> haveCommonKSubstringPred(k, str1, str2)
  {
    var k := 0;
    var str1: seq<char> := [];
    var str2: seq<char> := ['='];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false || found == true;
    expect found == true; // observed from implementation
  }

}

method TestsFormaxCommonSubstringLength()
{
  // Test case for combination {1}:
  //   PRE:  |str1| <= |str2|
  //   POST Q1: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := [];
    var str2: seq<char> := [];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0;
  }

  // Test case for combination {1}/O|str1|=1:
  //   PRE:  |str1| <= |str2|
  //   POST Q1: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := [' '];
    var str2: seq<char> := ['4'];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0;
  }

  // Test case for combination {1}/O|str1|>=2:
  //   PRE:  |str1| <= |str2|
  //   POST Q1: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := [' ', 'G'];
    var str2: seq<char> := [' ', 'G'];
    var len := maxCommonSubstringLength(str1, str2);
    expect forall k: int :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2);
    expect haveCommonKSubstringPred(len, str1, str2);
    expect len == 2; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  |str1| <= |str2|
  //   POST Q1: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := ['5'];
    var str2: seq<char> := ['5'];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0 || len == 1;
    expect len == 1; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  |str1| <= |str2|
  //   POST Q1: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := ['!'];
    var str2: seq<char> := ['!'];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0 || len == 1;
    expect len == 1; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  |str1| <= |str2|
  //   POST Q1: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := [];
    var str2: seq<char> := ['!'];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0;
  }

  // Test case for combination {1}/R7:
  //   PRE:  |str1| <= |str2|
  //   POST Q1: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := [];
    var str2: seq<char> := ['"'];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0;
  }

  // Test case for combination {1}/R8:
  //   PRE:  |str1| <= |str2|
  //   POST Q1: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := ['6'];
    var str2: seq<char> := ['6'];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0 || len == 1;
    expect len == 1; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  |str1| <= |str2|
  //   POST Q1: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := ['"'];
    var str2: seq<char> := ['"'];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0 || len == 1;
    expect len == 1; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  |str1| <= |str2|
  //   POST Q1: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := [' '];
    var str2: seq<char> := ['7'];
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
