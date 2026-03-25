// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\not_supported\formal-verification_tmp_tmpoepcssay_strings3__1473-1844_CBE.dfy
// Method: isPrefix
// Generated: 2026-03-25 22:44:16

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
  var i: nat := 0;
  res := false;
  while i <= |str| - |sub| && res == false
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


method Passing()
{
  // Test case for combination {1}:
  //   POST: res <==> isSubstringPred(sub, str)
  //   POST: res ==> isSubstringPred(sub, str)
  //   POST: isSubstringPred(sub, str) ==> res
  //   POST: isSubstringPred(sub, str) ==> res
  //   POST: !res <==> isNotSubstringPred(sub, str)
  {
    var sub: seq<char> := [];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res <==> isSubstringPred(sub, str);
    expect res ==true; // == > isSubstringPred(sub, str)
    expect isSubstringPred(sub, str) ==> res;
    expect isSubstringPred(sub, str) ==> res;
    expect !res <==> isNotSubstringPred(sub, str);
  }

  // Test case for combination {1}:
  //   POST: res <==> isSubstringPred(sub, str)
  //   POST: res ==> isSubstringPred(sub, str)
  //   POST: isSubstringPred(sub, str) ==> res
  //   POST: isSubstringPred(sub, str) ==> res
  //   POST: !res <==> isNotSubstringPred(sub, str)
  {
    var sub: seq<char> := [' '];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res <==> isSubstringPred(sub, str);
    expect res ==false; // == > isSubstringPred(sub, str)
    expect isSubstringPred(sub, str) ==> res;
    expect isSubstringPred(sub, str) ==> res;
    expect !res <==> isNotSubstringPred(sub, str);
  }

  // Test case for combination {1}/Bsub=3,str=1:
  //   POST: res <==> isSubstringPred(sub, str)
  //   POST: res ==> isSubstringPred(sub, str)
  //   POST: isSubstringPred(sub, str) ==> res
  //   POST: isSubstringPred(sub, str) ==> res
  //   POST: !res <==> isNotSubstringPred(sub, str)
  {
    var sub: seq<char> := ['!', ' ', '"'];
    var str: seq<char> := ['F'];
    var res := isSubstring(sub, str);
    expect res <==> isSubstringPred(sub, str);
    expect res ==false; // == > isSubstringPred(sub, str)
    expect isSubstringPred(sub, str) ==> res;
    expect isSubstringPred(sub, str) ==> res;
    expect !res <==> isNotSubstringPred(sub, str);
  }

  // Test case for combination {1}/Bsub=3,str=0:
  //   POST: res <==> isSubstringPred(sub, str)
  //   POST: res ==> isSubstringPred(sub, str)
  //   POST: isSubstringPred(sub, str) ==> res
  //   POST: isSubstringPred(sub, str) ==> res
  //   POST: !res <==> isNotSubstringPred(sub, str)
  {
    var sub: seq<char> := [' ', '"', '!'];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res <==> isSubstringPred(sub, str);
    expect res ==false; // == > isSubstringPred(sub, str)
    expect isSubstringPred(sub, str) ==> res;
    expect isSubstringPred(sub, str) ==> res;
    expect !res <==> isNotSubstringPred(sub, str);
  }

  // Test case for combination {1}:
  //   POST: found <==> haveCommonKSubstringPred(k, str1, str2)
  //   POST: !found <==> haveNotCommonKSubstringPred(k, str1, str2)
  {
    var k := 0;
    var str1: seq<char> := [];
    var str2: seq<char> := [];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found <==> haveCommonKSubstringPred(k, str1, str2);
    expect !found <==> haveNotCommonKSubstringPred(k, str1, str2);
  }

  // Test case for combination {1}:
  //   POST: found <==> haveCommonKSubstringPred(k, str1, str2)
  //   POST: !found <==> haveNotCommonKSubstringPred(k, str1, str2)
  {
    var k := 1;
    var str1: seq<char> := ['U'];
    var str2: seq<char> := ['U'];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found <==> haveCommonKSubstringPred(k, str1, str2);
    expect !found <==> haveNotCommonKSubstringPred(k, str1, str2);
  }

  // Test case for combination {1}/Bk=1,str1=3,str2=1:
  //   POST: found <==> haveCommonKSubstringPred(k, str1, str2)
  //   POST: !found <==> haveNotCommonKSubstringPred(k, str1, str2)
  {
    var k := 1;
    var str1: seq<char> := ['!', ' ', '"'];
    var str2: seq<char> := ['F'];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found <==> haveCommonKSubstringPred(k, str1, str2);
    expect !found <==> haveNotCommonKSubstringPred(k, str1, str2);
  }

  // Test case for combination {1}/Bk=1,str1=3,str2=0:
  //   POST: found <==> haveCommonKSubstringPred(k, str1, str2)
  //   POST: !found <==> haveNotCommonKSubstringPred(k, str1, str2)
  {
    var k := 1;
    var str1: seq<char> := [' ', '"', '!'];
    var str2: seq<char> := [];
    var found := haveCommonKSubstring(k, str1, str2);
    expect found <==> haveCommonKSubstringPred(k, str1, str2);
    expect !found <==> haveNotCommonKSubstringPred(k, str1, str2);
  }

  // Test case for combination {1}:
  //   PRE:  |str1| <= |str2|
  //   POST: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := [];
    var str2: seq<char> := [];
    var len := maxCommonSubstringLength(str1, str2);
    expect forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2);
    expect haveCommonKSubstringPred(len, str1, str2);
  }

  // Test case for combination {1}:
  //   PRE:  |str1| <= |str2|
  //   POST: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := ['U'];
    var str2: seq<char> := ['U'];
    var len := maxCommonSubstringLength(str1, str2);
    expect forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2);
    expect haveCommonKSubstringPred(len, str1, str2);
  }

  // Test case for combination {1}/Bstr1=2,str2=3:
  //   PRE:  |str1| <= |str2|
  //   POST: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := [' ', '!'];
    var str2: seq<char> := [' ', '!', '"'];
    var len := maxCommonSubstringLength(str1, str2);
    expect forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2);
    expect haveCommonKSubstringPred(len, str1, str2);
  }

  // Test case for combination {1}/Bstr1=2,str2=2:
  //   PRE:  |str1| <= |str2|
  //   POST: forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2)
  //   POST: haveCommonKSubstringPred(len, str1, str2)
  {
    var str1: seq<char> := [' ', '!'];
    var str2: seq<char> := ['+', ','];
    var len := maxCommonSubstringLength(str1, str2);
    expect forall k: int {:trigger haveCommonKSubstringPred(k, str1, str2)} :: len < k <= |str1| ==> !haveCommonKSubstringPred(k, str1, str2);
    expect haveCommonKSubstringPred(len, str1, str2);
  }

}

method Failing()
{
  // Test case for combination {2}:
  //   POST: !res
  //   POST: isNotPrefixPred(pre, str)
  //   POST: !isPrefixPred(pre, str)
  {
    var pre: seq<char> := [];
    var str: seq<char> := [];
    var res := isPrefix(pre, str);
    // expect !res;
    // expect isNotPrefixPred(pre, str);
    // expect !isPrefixPred(pre, str);
  }

  // Test case for combination {2}:
  //   POST: !res
  //   POST: isNotPrefixPred(pre, str)
  //   POST: !isPrefixPred(pre, str)
  {
    var pre: seq<char> := [' '];
    var str: seq<char> := [' '];
    var res := isPrefix(pre, str);
    // expect !res;
    // expect isNotPrefixPred(pre, str);
    // expect !isPrefixPred(pre, str);
  }

}

method Main()
{
  Passing();
  Failing();
}
