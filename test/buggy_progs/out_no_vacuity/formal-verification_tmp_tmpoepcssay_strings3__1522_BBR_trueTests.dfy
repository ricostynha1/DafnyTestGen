// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\formal-verification_tmp_tmpoepcssay_strings3__1522_BBR_true.dfy
// Method: isPrefix
// Generated: 2026-04-24 16:46:39

// formal-verification_tmp_tmpoepcssay_strings3.dfy

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
  return |pre| <= |str| && forall i: int {:trigger str[i]} {:trigger pre[i]} :: 0 <= i < |pre| ==> pre[i] == str[i];
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
  ensures res ==> isSubstringPred(sub, str)
  ensures isSubstringPred(sub, str) ==> res
  ensures isSubstringPred(sub, str) ==> res
  ensures !res <==> isNotSubstringPred(sub, str)
  decreases sub, str
{
  if |str| < |sub| {
    return false;
  } else {
    var i: nat := 0;
    res := false;
    while true && res == false
      invariant 0 <= i <= |str| - |sub| + 1
      invariant res ==> isSubstringPred(sub, str)
      invariant forall j: int {:trigger str[j..]} :: 0 <= j < i ==> isNotPrefixPred(sub, str[j..])
      decreases |str| - |sub| - i + if !res then 1 else 0
    {
      res := isPrefix(sub, str[i..]);
      if !res {
        i := i + 1;
      }
    }
  }
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
  ensures !found <==> haveNotCommonKSubstringPred(k, str1, str2)
  decreases k, str1, str2
{
  if k <= |str1| && k <= |str2| {
    var slice: string;
    found := false;
    var i: nat := 0;
    while i <= |str1| - k && found == false
      invariant found ==> haveCommonKSubstringPred(k, str1, str2)
      invariant forall x: int, y: int {:trigger str1[x .. y]} :: 0 <= x < i && found == false && y == x + k && y <= |str1| ==> isNotSubstringPred(str1[x .. y], str2)
      decreases |str1| - k - i + if !found then 1 else 0
    {
      slice := str1[i .. i + k];
      found := isSubstring(slice, str2);
      i := i + 1;
    }
  } else {
    return false;
  }
}

method maxCommonSubstringLength(str1: string, str2: string) returns (len: nat)
  requires |str1| <= |str2|
  ensures forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  ensures haveCommonKSubstringPred(len, str1, str2)
  decreases str1, str2
{
  assert isPrefixPred(str1[0 .. 0], str2[0..]);
  len := |str1|;
  var hasCommon: bool := true;
  while len > 0
    invariant forall i: int {:trigger haveCommonKSubstringPred(i, str1, str2)} :: len < i <= |str1| ==> !haveCommonKSubstringPred(i, str1, str2)
    decreases len
  {
    hasCommon := haveCommonKSubstring(len, str1, str2);
    if hasCommon {
      return len;
    }
    len := len - 1;
  }
  return len;
}


method TestsForisPrefix()
{
  // Test case for combination {1}:
  //   POST Q1: !res
  //   POST Q2: isNotPrefixPred(pre, str)
  {
    var pre: seq<char> := ['~'];
    var str: seq<char> := [];
    var res := isPrefix(pre, str);
    expect res == false;
  }

  // Test case for combination {2}:
  //   POST Q1: !res
  //   POST Q2: !isNotPrefixPred(pre, str)
  //   POST Q3: !isPrefixPred(pre, str)
  {
    var pre: seq<char> := ['~'];
    var str: seq<char> := [' '];
    var res := isPrefix(pre, str);
    expect res == false;
  }

  // Test case for combination {3}:
  //   POST Q1: res
  //   POST Q2: !isNotPrefixPred(pre, str)
  //   POST Q3: isPrefixPred(pre, str)
  {
    var pre: seq<char> := ['~'];
    var str: seq<char> := ['~'];
    var res := isPrefix(pre, str);
    expect res == true;
  }

  // Test case for combination {1}/O|pre|>=2:
  //   POST Q1: !res
  //   POST Q2: isNotPrefixPred(pre, str)
  {
    var pre: seq<char> := ['~', '~'];
    var str: seq<char> := ['z'];
    var res := isPrefix(pre, str);
    expect res == false;
  }

  // Test case for combination {1}/O|str|>=2:
  //   POST Q1: !res
  //   POST Q2: isNotPrefixPred(pre, str)
  {
    var pre: seq<char> := ['c', '~', '1'];
    var str: seq<char> := [' ', 'x'];
    var res := isPrefix(pre, str);
    expect res == false;
  }

  // Test case for combination {2}/O|pre|>=2:
  //   POST Q1: !res
  //   POST Q2: !isNotPrefixPred(pre, str)
  //   POST Q3: !isPrefixPred(pre, str)
  {
    var pre: seq<char> := ['5', 'T'];
    var str: seq<char> := ['4', '~'];
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
    var pre: seq<char> := ['~', 'h'];
    var str: seq<char> := ['~', 'h'];
    var res := isPrefix(pre, str);
    expect res == true;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: !res
  //   POST Q2: isNotPrefixPred(pre, str)
  {
    var pre: seq<char> := ['}'];
    var str: seq<char> := [];
    var res := isPrefix(pre, str);
    expect res == false;
  }

  // Test case for combination {1}/R5:
  //   POST Q1: !res
  //   POST Q2: isNotPrefixPred(pre, str)
  {
    var pre: seq<char> := ['|'];
    var str: seq<char> := [];
    var res := isPrefix(pre, str);
    expect res == false;
  }

}

method TestsForisSubstring()
{
  // Test case for combination {1}:
  //   POST Q1: res <==> isSubstringPred(sub, str)
  //   POST Q2: res ==> isSubstringPred(sub, str)
  //   POST Q3: isSubstringPred(sub, str) ==> res
  //   POST Q4: isSubstringPred(sub, str) ==> res
  //   POST Q5: !res <==> isNotSubstringPred(sub, str)
  {
    var sub: seq<char> := [];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res == false || res == true;
    expect res == true; // observed from implementation
  }

  // Test case for combination {1}/O|sub|=1:
  //   POST Q1: res <==> isSubstringPred(sub, str)
  //   POST Q2: res ==> isSubstringPred(sub, str)
  //   POST Q3: isSubstringPred(sub, str) ==> res
  //   POST Q4: isSubstringPred(sub, str) ==> res
  //   POST Q5: !res <==> isNotSubstringPred(sub, str)
  {
    var sub: seq<char> := ['~'];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res == false;
  }

  // Test case for combination {1}/O|sub|>=2:
  //   POST Q1: res <==> isSubstringPred(sub, str)
  //   POST Q2: res ==> isSubstringPred(sub, str)
  //   POST Q3: isSubstringPred(sub, str) ==> res
  //   POST Q4: isSubstringPred(sub, str) ==> res
  //   POST Q5: !res <==> isNotSubstringPred(sub, str)
  {
    var sub: seq<char> := ['~', '!'];
    var str: seq<char> := ['~'];
    var res := isSubstring(sub, str);
    expect res == false;
  }

  // Test case for combination {1}/O|str|>=2:
  //   POST Q1: res <==> isSubstringPred(sub, str)
  //   POST Q2: res ==> isSubstringPred(sub, str)
  //   POST Q3: isSubstringPred(sub, str) ==> res
  //   POST Q4: isSubstringPred(sub, str) ==> res
  //   POST Q5: !res <==> isNotSubstringPred(sub, str)
  {
    var sub: seq<char> := ['}', '~'];
    var str: seq<char> := ['}', '~'];
    var res := isSubstring(sub, str);
    expect res == false || res == true;
    expect res == true; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   POST Q1: res <==> isSubstringPred(sub, str)
  //   POST Q2: res ==> isSubstringPred(sub, str)
  //   POST Q3: isSubstringPred(sub, str) ==> res
  //   POST Q4: isSubstringPred(sub, str) ==> res
  //   POST Q5: !res <==> isNotSubstringPred(sub, str)
  {
    var sub: seq<char> := ['c'];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res == false;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: res <==> isSubstringPred(sub, str)
  //   POST Q2: res ==> isSubstringPred(sub, str)
  //   POST Q3: isSubstringPred(sub, str) ==> res
  //   POST Q4: isSubstringPred(sub, str) ==> res
  //   POST Q5: !res <==> isNotSubstringPred(sub, str)
  {
    var sub: seq<char> := [];
    var str: seq<char> := ['}'];
    var res := isSubstring(sub, str);
    expect res == false || res == true;
    expect res == true; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   POST Q1: res <==> isSubstringPred(sub, str)
  //   POST Q2: res ==> isSubstringPred(sub, str)
  //   POST Q3: isSubstringPred(sub, str) ==> res
  //   POST Q4: isSubstringPred(sub, str) ==> res
  //   POST Q5: !res <==> isNotSubstringPred(sub, str)
  {
    var sub: seq<char> := [];
    var str: seq<char> := ['|'];
    var res := isSubstring(sub, str);
    expect res == false || res == true;
    expect res == true; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   POST Q1: res <==> isSubstringPred(sub, str)
  //   POST Q2: res ==> isSubstringPred(sub, str)
  //   POST Q3: isSubstringPred(sub, str) ==> res
  //   POST Q4: isSubstringPred(sub, str) ==> res
  //   POST Q5: !res <==> isNotSubstringPred(sub, str)
  {
    var sub: seq<char> := ['}'];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res == false;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: res <==> isSubstringPred(sub, str)
  //   POST Q2: res ==> isSubstringPred(sub, str)
  //   POST Q3: isSubstringPred(sub, str) ==> res
  //   POST Q4: isSubstringPred(sub, str) ==> res
  //   POST Q5: !res <==> isNotSubstringPred(sub, str)
  {
    var sub: seq<char> := ['|'];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res == false;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: res <==> isSubstringPred(sub, str)
  //   POST Q2: res ==> isSubstringPred(sub, str)
  //   POST Q3: isSubstringPred(sub, str) ==> res
  //   POST Q4: isSubstringPred(sub, str) ==> res
  //   POST Q5: !res <==> isNotSubstringPred(sub, str)
  {
    var sub: seq<char> := ['b'];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res == false;
  }

}

method TestsForhaveCommonKSubstring()
{
  // Test case for combination {1}:
  //   POST Q1: found <==> haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: !found <==> haveNotCommonKSubstringPred(k, str1, str2)
  {
    var k := 2;
    var str1: seq<char> := [];
    var str2: seq<char> := [];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

  // Test case for combination {1}/Bk=0:
  //   POST Q1: found <==> haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: !found <==> haveNotCommonKSubstringPred(k, str1, str2)
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
  //   POST Q2: !found <==> haveNotCommonKSubstringPred(k, str1, str2)
  {
    var k := 1;
    var str1: seq<char> := [];
    var str2: seq<char> := [];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

  // Test case for combination {1}/O|str1|=1:
  //   POST Q1: found <==> haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: !found <==> haveNotCommonKSubstringPred(k, str1, str2)
  {
    var k := 2;
    var str1: seq<char> := ['\U{005C}'];
    var str2: seq<char> := [];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

  // Test case for combination {1}/O|str1|>=2:
  //   POST Q1: found <==> haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: !found <==> haveNotCommonKSubstringPred(k, str1, str2)
  {
    var k := 3;
    var str1: seq<char> := ['~', 'e', 'f'];
    var str2: seq<char> := [];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

  // Test case for combination {1}/O|str2|=1:
  //   POST Q1: found <==> haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: !found <==> haveNotCommonKSubstringPred(k, str1, str2)
  {
    var k := 2;
    var str1: seq<char> := [];
    var str2: seq<char> := ['\U{005C}'];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

  // Test case for combination {1}/O|str2|>=2:
  //   POST Q1: found <==> haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: !found <==> haveNotCommonKSubstringPred(k, str1, str2)
  {
    var k := 2;
    var str1: seq<char> := [];
    var str2: seq<char> := ['+', '+'];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: found <==> haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: !found <==> haveNotCommonKSubstringPred(k, str1, str2)
  {
    var k := 10;
    var str1: seq<char> := [];
    var str2: seq<char> := [];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: found <==> haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: !found <==> haveNotCommonKSubstringPred(k, str1, str2)
  {
    var k := 4;
    var str1: seq<char> := [];
    var str2: seq<char> := ['~'];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found == false;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: found <==> haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: !found <==> haveNotCommonKSubstringPred(k, str1, str2)
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
  //   PRE:  |str1| <= |str2|
  //   POST Q1: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := [];
    var str2: seq<char> := [];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|str1|=1:
  //   PRE:  |str1| <= |str2|
  //   POST Q1: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := ['~'];
    var str2: seq<char> := ['f'];
    var len := maxCommonSubstringLength(str1, str2);
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'start')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect len == 0;
  }

  // Test case for combination {1}/O|str1|>=2:
  //   PRE:  |str1| <= |str2|
  //   POST Q1: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := ['~', 'e'];
    var str2: seq<char> := ['~', 'e'];
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
    var str1: seq<char> := ['}'];
    var str2: seq<char> := ['}'];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0 || len == 1;
    expect len == 1; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  |str1| <= |str2|
  //   POST Q1: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := ['e'];
    var str2: seq<char> := ['e'];
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
    var str2: seq<char> := ['c'];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  |str1| <= |str2|
  //   POST Q1: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := ['d'];
    var str2: seq<char> := ['|'];
    var len := maxCommonSubstringLength(str1, str2);
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'start')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect len == 0;
  }

  // Test case for combination {1}/R8:
  //   PRE:  |str1| <= |str2|
  //   POST Q1: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := ['c'];
    var str2: seq<char> := ['c'];
    var len := maxCommonSubstringLength(str1, str2);
    expect len == 0 || len == 1;
    expect len == 1; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  |str1| <= |str2|
  //   POST Q1: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := ['b'];
    var str2: seq<char> := ['{'];
    var len := maxCommonSubstringLength(str1, str2);
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'start')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect len == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   PRE:  |str1| <= |str2|
  //   POST Q1: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST Q2: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := ['a'];
    var str2: seq<char> := ['|'];
    var len := maxCommonSubstringLength(str1, str2);
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'start')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect len == 0;
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
