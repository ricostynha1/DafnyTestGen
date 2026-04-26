// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafleet_tmp_tmpa2e4kb9v_0001-0050_0003-longest-substring-without-repeating-characters__1537_VER_n.dfy
// Method: lengthOfLongestSubstring
// Generated: 2026-04-24 19:34:54

// dafleet_tmp_tmpa2e4kb9v_0001-0050_0003-longest-substring-without-repeating-characters.dfy

function length(iv: interval): int
  decreases iv
{
  iv.1 - iv.0
}

predicate valid_interval(s: string, iv: interval)
  decreases s, iv
{
  0 <= iv.0 <= iv.1 <= |s| &&
  forall i: int, j: int {:trigger s[j], s[i]} | iv.0 <= i < j < iv.1 :: 
    s[i] != s[j]
}

method lengthOfLongestSubstring(s: string) returns (n: int, best_iv: interval)
  ensures valid_interval(s, best_iv) && length(best_iv) == n
  ensures forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  decreases s
{
  var lo, hi := 0, 0;
  var char_set: set<char> := {};
  n, best_iv := 0, (0, 0);
  while n < |s|
    invariant 0 <= lo <= hi <= |s|
    invariant valid_interval(s, (lo, hi))
    invariant char_set == set i: int {:trigger s[i]} | lo <= i < hi :: s[i]
    invariant valid_interval(s, best_iv) && length(best_iv) == n
    invariant forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} {:trigger iv.1} | iv.1 <= hi && valid_interval(s, iv) :: length(iv) <= n
    invariant forall iv: interval {:trigger valid_interval(s, iv)} {:trigger iv.0} {:trigger iv.1} | iv.1 > hi && iv.0 < lo :: !valid_interval(s, iv)
    decreases |s| - hi, |s| - lo
  {
    if s[hi] !in char_set {
      char_set := char_set + {s[hi]};
      hi := hi + 1;
      if hi - lo > n {
        n := hi - lo;
        best_iv := (lo, hi);
      }
    } else {
      char_set := char_set - {s[lo]};
      lo := lo + 1;
    }
  }
}

method lengthOfLongestSubstring'(s: string) returns (n: int, best_iv: interval)
  ensures valid_interval(s, best_iv) && length(best_iv) == n
  ensures forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  decreases s
{
  var lo, hi := 0, 0;
  var char_to_index: map<char, int> := map[];
  n, best_iv := 0, (0, 0);
  while |s| - lo > n
    invariant 0 <= lo <= hi <= |s|
    invariant valid_interval(s, (lo, hi))
    invariant forall i: int {:trigger s[i]} | 0 <= i < hi :: s[i] in char_to_index
    invariant forall c: char {:trigger char_to_index[c]} {:trigger c in char_to_index} | c in char_to_index :: var i: int := char_to_index[c]; 0 <= i < hi && s[i] == c && forall i': int {:trigger s[i']} | i < i' < hi :: s[i'] != c
    invariant valid_interval(s, best_iv) && length(best_iv) == n
    invariant forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} {:trigger iv.1} | iv.1 <= hi && valid_interval(s, iv) :: length(iv) <= n
    invariant forall iv: interval {:trigger valid_interval(s, iv)} {:trigger iv.0} {:trigger iv.1} | iv.1 > hi && iv.0 < lo :: !valid_interval(s, iv)
    decreases |s| - hi
  {
    if s[hi] in char_to_index && char_to_index[s[hi]] >= lo {
      lo := char_to_index[s[hi]] + 1;
    }
    char_to_index := char_to_index[s[hi] := hi];
    hi := hi + 1;
    if hi - lo > n {
      n := hi - lo;
      best_iv := (lo, hi);
    }
  }
}

type interval = iv: (int, int)
  | iv.0 <= iv.1
  witness (0, 0)


method TestsForlengthOfLongestSubstring()
{
  // Test case for combination {1}:
  //   POST Q1: valid_interval(s, best_iv) && length(best_iv) == n
  //   POST Q2: forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  {
    var s: seq<char> := [];
    var n, best_iv := lengthOfLongestSubstring(s);
    expect valid_interval(s, best_iv) && length(best_iv) == n;
    expect forall iv: interval  | valid_interval(s, iv) :: length(iv) <= n;
  }

  // Test case for combination {1}/O|s|=1:
  //   POST Q1: valid_interval(s, best_iv) && length(best_iv) == n
  //   POST Q2: forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  {
    var s: seq<char> := [' '];
    var n, best_iv := lengthOfLongestSubstring(s);
    expect valid_interval(s, best_iv) && length(best_iv) == n;
    expect forall iv: interval  | valid_interval(s, iv) :: length(iv) <= n;
  }

  // Test case for combination {1}/O|s|>=2:
  //   POST Q1: valid_interval(s, best_iv) && length(best_iv) == n
  //   POST Q2: forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  {
    var s: seq<char> := [' ', '4'];
    var n, best_iv := lengthOfLongestSubstring(s);
    expect valid_interval(s, best_iv) && length(best_iv) == n;
    expect forall iv: interval  | valid_interval(s, iv) :: length(iv) <= n;
  }

  // Test case for combination {1}/On>0:
  //   POST Q1: valid_interval(s, best_iv) && length(best_iv) == n
  //   POST Q2: forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  {
    var s: seq<char> := ['!'];
    var n, best_iv := lengthOfLongestSubstring(s);
    expect valid_interval(s, best_iv) && length(best_iv) == n;
    expect forall iv: interval  | valid_interval(s, iv) :: length(iv) <= n;
  }

  // Test case for combination {1}/On<0:
  //   POST Q1: valid_interval(s, best_iv) && length(best_iv) == n
  //   POST Q2: forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  {
    var s: seq<char> := ['"'];
    var n, best_iv := lengthOfLongestSubstring(s);
    expect valid_interval(s, best_iv) && length(best_iv) == n;
    expect forall iv: interval  | valid_interval(s, iv) :: length(iv) <= n;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: valid_interval(s, best_iv) && length(best_iv) == n
  //   POST Q2: forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  {
    var s: seq<char> := ['#'];
    var n, best_iv := lengthOfLongestSubstring(s);
    expect valid_interval(s, best_iv) && length(best_iv) == n;
    expect forall iv: interval  | valid_interval(s, iv) :: length(iv) <= n;
  }

  // Test case for combination {1}/R7:
  //   POST Q1: valid_interval(s, best_iv) && length(best_iv) == n
  //   POST Q2: forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  {
    var s: seq<char> := ['$'];
    var n, best_iv := lengthOfLongestSubstring(s);
    expect valid_interval(s, best_iv) && length(best_iv) == n;
    expect forall iv: interval  | valid_interval(s, iv) :: length(iv) <= n;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: valid_interval(s, best_iv) && length(best_iv) == n
  //   POST Q2: forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  {
    var s: seq<char> := ['%'];
    var n, best_iv := lengthOfLongestSubstring(s);
    expect valid_interval(s, best_iv) && length(best_iv) == n;
    expect forall iv: interval  | valid_interval(s, iv) :: length(iv) <= n;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: valid_interval(s, best_iv) && length(best_iv) == n
  //   POST Q2: forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  {
    var s: seq<char> := ['&'];
    var n, best_iv := lengthOfLongestSubstring(s);
    expect valid_interval(s, best_iv) && length(best_iv) == n;
    expect forall iv: interval  | valid_interval(s, iv) :: length(iv) <= n;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: valid_interval(s, best_iv) && length(best_iv) == n
  //   POST Q2: forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  {
    var s: seq<char> := ['\U{0027}'];
    var n, best_iv := lengthOfLongestSubstring(s);
    expect valid_interval(s, best_iv) && length(best_iv) == n;
    expect forall iv: interval  | valid_interval(s, iv) :: length(iv) <= n;
  }

}

method TestsForlengthOfLongestSubstring'()
{
  // Test case for combination {1}:
  //   POST Q1: valid_interval(s, best_iv) && length(best_iv) == n
  //   POST Q2: forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  {
    var s: seq<char> := [];
    var n, best_iv := lengthOfLongestSubstring'(s);
    expect valid_interval(s, best_iv) && length(best_iv) == n;
    expect forall iv: interval  | valid_interval(s, iv) :: length(iv) <= n;
  }

  // Test case for combination {1}/O|s|=1:
  //   POST Q1: valid_interval(s, best_iv) && length(best_iv) == n
  //   POST Q2: forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  {
    var s: seq<char> := [' '];
    var n, best_iv := lengthOfLongestSubstring'(s);
    expect valid_interval(s, best_iv) && length(best_iv) == n;
    expect forall iv: interval  | valid_interval(s, iv) :: length(iv) <= n;
  }

  // Test case for combination {1}/O|s|>=2:
  //   POST Q1: valid_interval(s, best_iv) && length(best_iv) == n
  //   POST Q2: forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  {
    var s: seq<char> := [' ', '4'];
    var n, best_iv := lengthOfLongestSubstring'(s);
    expect valid_interval(s, best_iv) && length(best_iv) == n;
    expect forall iv: interval  | valid_interval(s, iv) :: length(iv) <= n;
  }

  // Test case for combination {1}/On>0:
  //   POST Q1: valid_interval(s, best_iv) && length(best_iv) == n
  //   POST Q2: forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  {
    var s: seq<char> := ['!'];
    var n, best_iv := lengthOfLongestSubstring'(s);
    expect valid_interval(s, best_iv) && length(best_iv) == n;
    expect forall iv: interval  | valid_interval(s, iv) :: length(iv) <= n;
  }

  // Test case for combination {1}/On<0:
  //   POST Q1: valid_interval(s, best_iv) && length(best_iv) == n
  //   POST Q2: forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  {
    var s: seq<char> := ['"'];
    var n, best_iv := lengthOfLongestSubstring'(s);
    expect valid_interval(s, best_iv) && length(best_iv) == n;
    expect forall iv: interval  | valid_interval(s, iv) :: length(iv) <= n;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: valid_interval(s, best_iv) && length(best_iv) == n
  //   POST Q2: forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  {
    var s: seq<char> := ['#'];
    var n, best_iv := lengthOfLongestSubstring'(s);
    expect valid_interval(s, best_iv) && length(best_iv) == n;
    expect forall iv: interval  | valid_interval(s, iv) :: length(iv) <= n;
  }

  // Test case for combination {1}/R7:
  //   POST Q1: valid_interval(s, best_iv) && length(best_iv) == n
  //   POST Q2: forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  {
    var s: seq<char> := ['$'];
    var n, best_iv := lengthOfLongestSubstring'(s);
    expect valid_interval(s, best_iv) && length(best_iv) == n;
    expect forall iv: interval  | valid_interval(s, iv) :: length(iv) <= n;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: valid_interval(s, best_iv) && length(best_iv) == n
  //   POST Q2: forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  {
    var s: seq<char> := ['%'];
    var n, best_iv := lengthOfLongestSubstring'(s);
    expect valid_interval(s, best_iv) && length(best_iv) == n;
    expect forall iv: interval  | valid_interval(s, iv) :: length(iv) <= n;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: valid_interval(s, best_iv) && length(best_iv) == n
  //   POST Q2: forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  {
    var s: seq<char> := ['&'];
    var n, best_iv := lengthOfLongestSubstring'(s);
    expect valid_interval(s, best_iv) && length(best_iv) == n;
    expect forall iv: interval  | valid_interval(s, iv) :: length(iv) <= n;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: valid_interval(s, best_iv) && length(best_iv) == n
  //   POST Q2: forall iv: interval {:trigger length(iv)} {:trigger valid_interval(s, iv)} | valid_interval(s, iv) :: length(iv) <= n
  {
    var s: seq<char> := ['\U{0027}'];
    var n, best_iv := lengthOfLongestSubstring'(s);
    expect valid_interval(s, best_iv) && length(best_iv) == n;
    expect forall iv: interval  | valid_interval(s, iv) :: length(iv) <= n;
  }

}

method Main()
{
  TestsForlengthOfLongestSubstring();
  print "TestsForlengthOfLongestSubstring: all tests passed!\n";
  TestsForlengthOfLongestSubstring'();
  print "TestsForlengthOfLongestSubstring': all tests passed!\n";
}
