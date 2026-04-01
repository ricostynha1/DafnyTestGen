// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\not_supported\Formal-Verification_tmp_tmpuyt21wjt_Dafny_strings1__426_VER_str.dfy
// Method: isPrefix
// Generated: 2026-04-01 13:53:59

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
    if str[i] != str[i] {
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
  while i >= 0
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


method Passing()
{
  // Test case for combination {2}:
  //   POST: !res
  //   POST: res == isPrefixPredicate(pre, str)
  {
    var pre: seq<char> := [' '];
    var str: seq<char> := [];
    var res := isPrefix(pre, str);
    expect res == false;
  }

  // Test case for combination {1}/Bpre=2,str=3:
  //   POST: !(|pre| > |str|)
  //   POST: res == isPrefixPredicate(pre, str)
  {
    var pre: seq<char> := [' ', '!'];
    var str: seq<char> := [' ', '!', '"'];
    var res := isPrefix(pre, str);
    expect res == true;
  }

  // Test case for combination {1}:
  //   POST: res == isSubstringPredicate(sub, str)
  {
    var sub: seq<char> := [];
    var str: seq<char> := [];
    var res := isSubstring(sub, str);
    expect res == true;
  }

  // Test case for combination {1}/Bsub=0,str=1:
  //   POST: res == isSubstringPredicate(sub, str)
  {
    var sub: seq<char> := [];
    var str: seq<char> := [' '];
    var res := isSubstring(sub, str);
    expect res == true;
  }

  // Test case for combination {1}/Bsub=0,str=2:
  //   POST: res == isSubstringPredicate(sub, str)
  {
    var sub: seq<char> := [];
    var str: seq<char> := [' ', '!'];
    var res := isSubstring(sub, str);
    expect res == true;
  }

  // Test case for combination {1}/Bsub=0,str=3:
  //   POST: res == isSubstringPredicate(sub, str)
  {
    var sub: seq<char> := [];
    var str: seq<char> := [' ', '"', '!'];
    var res := isSubstring(sub, str);
    expect res == true;
  }

  // Test case for combination {1}:
  //   POST: |str1| < k || |str2| < k ==> !found
  //   POST: haveCommonKSubstringPredicate(k, str1, str2) == found
  {
    var k := 0;
    var str1: seq<char> := [];
    var str2: seq<char> := [];
    var found := haveCommonKSubstring(k, str1, str2);
    // expect found == true; // (actual runtime value — not uniquely determined by spec)
    expect |str1| < k || |str2| < k ==> !found;
    expect haveCommonKSubstringPredicate(k, str1, str2) == found;
  }

  // Test case for combination {1}/Bk=1,str1=3,str2=0:
  //   POST: |str1| < k || |str2| < k ==> !found
  //   POST: haveCommonKSubstringPredicate(k, str1, str2) == found
  {
    var k := 1;
    var str1: seq<char> := [' ', '"', '!'];
    var str2: seq<char> := [];
    var found := haveCommonKSubstring(k, str1, str2);
    // expect found == false; // (actual runtime value — not uniquely determined by spec)
    expect |str1| < k || |str2| < k ==> !found;
    expect haveCommonKSubstringPredicate(k, str1, str2) == found;
  }

  // Test case for combination {1}/Bk=1,str1=2,str2=3:
  //   POST: |str1| < k || |str2| < k ==> !found
  //   POST: haveCommonKSubstringPredicate(k, str1, str2) == found
  {
    var k := 1;
    var str1: seq<char> := [' ', '!'];
    var str2: seq<char> := [' ', '!', '"'];
    var found := haveCommonKSubstring(k, str1, str2);
    // expect found == true; // (actual runtime value — not uniquely determined by spec)
    expect |str1| < k || |str2| < k ==> !found;
    expect haveCommonKSubstringPredicate(k, str1, str2) == found;
  }

  // Test case for combination {1}:
  //   POST: len <= |str1| && len <= |str2|
  //   POST: len >= 0
  //   POST: maxCommonSubstringPredicate(str1, str2, len)
  {
    var str1: seq<char> := [];
    var str2: seq<char> := [];
    var len := maxCommonSubstringLength(str1, str2);
    // expect len == 0; // (actual runtime value — not uniquely determined by spec)
    expect len <= |str1| && len <= |str2|;
    expect len >= 0;
    expect maxCommonSubstringPredicate(str1, str2, len);
  }

  // Test case for combination {1}/Bstr1=0,str2=1:
  //   POST: len <= |str1| && len <= |str2|
  //   POST: len >= 0
  //   POST: maxCommonSubstringPredicate(str1, str2, len)
  {
    var str1: seq<char> := [];
    var str2: seq<char> := [' '];
    var len := maxCommonSubstringLength(str1, str2);
    // expect len == 0; // (actual runtime value — not uniquely determined by spec)
    expect len <= |str1| && len <= |str2|;
    expect len >= 0;
    expect maxCommonSubstringPredicate(str1, str2, len);
  }

  // Test case for combination {1}/Bstr1=0,str2=2:
  //   POST: len <= |str1| && len <= |str2|
  //   POST: len >= 0
  //   POST: maxCommonSubstringPredicate(str1, str2, len)
  {
    var str1: seq<char> := [];
    var str2: seq<char> := [' ', '!'];
    var len := maxCommonSubstringLength(str1, str2);
    // expect len == 0; // (actual runtime value — not uniquely determined by spec)
    expect len <= |str1| && len <= |str2|;
    expect len >= 0;
    expect maxCommonSubstringPredicate(str1, str2, len);
  }

  // Test case for combination {1}/Bstr1=0,str2=3:
  //   POST: len <= |str1| && len <= |str2|
  //   POST: len >= 0
  //   POST: maxCommonSubstringPredicate(str1, str2, len)
  {
    var str1: seq<char> := [];
    var str2: seq<char> := [' ', '!', '"'];
    var len := maxCommonSubstringLength(str1, str2);
    // expect len == 0; // (actual runtime value — not uniquely determined by spec)
    expect len <= |str1| && len <= |str2|;
    expect len >= 0;
    expect maxCommonSubstringPredicate(str1, str2, len);
  }

}

method Failing()
{
  // Test case for combination {1,2}:
  //   POST: !(|pre| > |str|)
  //   POST: res == isPrefixPredicate(pre, str)
  //   POST: !res
  {
    var pre: seq<char> := [];
    var str: seq<char> := [];
    var res := isPrefix(pre, str);
    // expect res == false;
  }

  // Test case for combination {1}/Bk=1,str1=3,str2=1:
  //   POST: |str1| < k || |str2| < k ==> !found
  //   POST: haveCommonKSubstringPredicate(k, str1, str2) == found
  {
    var k := 1;
    var str1: seq<char> := ['!', ' ', '"'];
    var str2: seq<char> := ['F'];
    var found := haveCommonKSubstring(k, str1, str2);
    // expect |str1| < k || |str2| < k ==> !found;
    // expect haveCommonKSubstringPredicate(k, str1, str2) == found;
  }

}

method Main()
{
  Passing();
  Failing();
}
