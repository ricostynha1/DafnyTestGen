// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_tmp_tmp0wu8wmfr_Heimaverkefni 8_H8__2020_AOR_Sub.dfy
// Method: Partition
// Generated: 2026-04-24 19:44:15

// Dafny_tmp_tmp0wu8wmfr_Heimaverkefni 8_H8.dfy

method Partition(m: multiset<int>)
    returns (pre: multiset<int>, p: int, post: multiset<int>)
  requires |m| > 0
  ensures p in m
  ensures m == pre + multiset{p} + post
  ensures forall z: int {:trigger pre[z]} | z in pre :: z <= p
  ensures forall z: int {:trigger post[z]} | z in post :: z >= p
  decreases m
{
  p :| p in m;
  var m' := m;
  m' := m' - multiset{p};
  pre := multiset{};
  post := multiset{};
  while m' != multiset{}
    invariant m == m' + pre + multiset{p} + post
    invariant forall k: int {:trigger pre[k]} | k in pre :: k <= p
    invariant forall k: int {:trigger post[k]} | k in post :: k >= p
    decreases m'
  {
    var temp :| temp in m';
    m' := m' - multiset{temp};
    if temp <= p {
      pre := pre + multiset{temp};
    } else {
      post := post + multiset{temp};
    }
  }
  return pre, p, post;
}

method QuickSelect(m: multiset<int>, k: int)
    returns (pre: multiset<int>, kth: int, post: multiset<int>)
  requires 0 <= k < |m|
  ensures kth in m
  ensures m == pre + multiset{kth} + post
  ensures |pre| == k
  ensures forall z: int {:trigger pre[z]} | z in pre :: z <= kth
  ensures forall z: int {:trigger post[z]} | z in post :: z >= kth
  decreases m
{
  pre, kth, post := Partition(m);
  assert m == pre + multiset{kth} + post;
  if |pre| != k {
    if k > |pre| {
      var pre', p, post' := QuickSelect(post, k - |pre| - 1);
      assert pre' + multiset{p} + post' == post;
      pre := pre + multiset{kth} + pre';
      post := post - pre' - multiset{p};
      kth := p;
    } else if k < |pre| {
      var pre', p, post' := QuickSelect(pre, k);
      pre := pre - multiset{p} - post';
      post := post - multiset{kth} + post';
      kth := p;
    }
  } else {
    return pre, kth, post;
  }
}


method TestsForPartition()
{
  // Test case for combination {1}:
  //   PRE:  |m| > 0
  //   POST Q1: p in m
  //   POST Q2: m == pre + multiset{p} + post
  //   POST Q3: forall z: int {:trigger pre[z]} | z in pre :: z <= p
  //   POST Q4: forall z: int {:trigger post[z]} | z in post :: z >= p
  {
    var m: multiset<int> := multiset{5, 5, 5, 5, 5};
    var pre, p, post := Partition(m);
    expect p in m;
    expect forall z: int | z in pre :: z <= p;
    expect forall z: int | z in post :: z >= p;
    expect pre == multiset{5, 5, 5, 5}; // observed from implementation
    expect p == 5; // observed from implementation
    expect post == multiset{}; // observed from implementation
  }

  // Test case for combination {1}/O|m|=1:
  //   PRE:  |m| > 0
  //   POST Q1: p in m
  //   POST Q2: m == pre + multiset{p} + post
  //   POST Q3: forall z: int {:trigger pre[z]} | z in pre :: z <= p
  //   POST Q4: forall z: int {:trigger post[z]} | z in post :: z >= p
  {
    var m: multiset<int> := multiset{5};
    var pre, p, post := Partition(m);
    expect p in m;
    expect forall z: int | z in pre :: z <= p;
    expect forall z: int | z in post :: z >= p;
    expect pre == multiset{}; // observed from implementation
    expect p == 5; // observed from implementation
    expect post == multiset{}; // observed from implementation
  }

  // Test case for combination {1}/O|pre|=1:
  //   PRE:  |m| > 0
  //   POST Q1: p in m
  //   POST Q2: m == pre + multiset{p} + post
  //   POST Q3: forall z: int {:trigger pre[z]} | z in pre :: z <= p
  //   POST Q4: forall z: int {:trigger post[z]} | z in post :: z >= p
  {
    var m: multiset<int> := multiset{-2, 1, 1, 1, 2, 3, 4, 4};
    var pre, p, post := Partition(m);
    expect p in m;
    expect forall z: int | z in pre :: z <= p;
    expect forall z: int | z in post :: z >= p;
    expect pre == multiset{}; // observed from implementation
    expect p == -2; // observed from implementation
    expect post == multiset{1, 1, 1, 2, 3, 4, 4}; // observed from implementation
  }

  // Test case for combination {1}/O|pre|>=2:
  //   PRE:  |m| > 0
  //   POST Q1: p in m
  //   POST Q2: m == pre + multiset{p} + post
  //   POST Q3: forall z: int {:trigger pre[z]} | z in pre :: z <= p
  //   POST Q4: forall z: int {:trigger post[z]} | z in post :: z >= p
  {
    var m: multiset<int> := multiset{-1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 4};
    var pre, p, post := Partition(m);
    expect p in m;
    expect forall z: int | z in pre :: z <= p;
    expect forall z: int | z in post :: z >= p;
    expect pre == multiset{-1, -1, -1, -1}; // observed from implementation
    expect p == -1; // observed from implementation
    expect post == multiset{0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 4}; // observed from implementation
  }

  // Test case for combination {1}/Op=0:
  //   PRE:  |m| > 0
  //   POST Q1: p in m
  //   POST Q2: m == pre + multiset{p} + post
  //   POST Q3: forall z: int {:trigger pre[z]} | z in pre :: z <= p
  //   POST Q4: forall z: int {:trigger post[z]} | z in post :: z >= p
  {
    var m: multiset<int> := multiset{0, 5, 5};
    var pre, p, post := Partition(m);
    expect p in m;
    expect forall z: int | z in pre :: z <= p;
    expect forall z: int | z in post :: z >= p;
    expect pre == multiset{}; // observed from implementation
    expect p == 0; // observed from implementation
    expect post == multiset{5, 5}; // observed from implementation
  }

  // Test case for combination {1}/O|post|=1:
  //   PRE:  |m| > 0
  //   POST Q1: p in m
  //   POST Q2: m == pre + multiset{p} + post
  //   POST Q3: forall z: int {:trigger pre[z]} | z in pre :: z <= p
  //   POST Q4: forall z: int {:trigger post[z]} | z in post :: z >= p
  {
    var m: multiset<int> := multiset{-2, -2, -2, -2, -2, -2, -2, -2, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0};
    var pre, p, post := Partition(m);
    expect p in m;
    expect forall z: int | z in pre :: z <= p;
    expect forall z: int | z in post :: z >= p;
    expect pre == multiset{-2, -2, -2, -2, -2, -2, -2}; // observed from implementation
    expect p == -2; // observed from implementation
    expect post == multiset{-1, -1, -1, 0, 0, 0, 0, 0, 0, 0}; // observed from implementation
  }

  // Test case for combination {1}/O|post|>=2:
  //   PRE:  |m| > 0
  //   POST Q1: p in m
  //   POST Q2: m == pre + multiset{p} + post
  //   POST Q3: forall z: int {:trigger pre[z]} | z in pre :: z <= p
  //   POST Q4: forall z: int {:trigger post[z]} | z in post :: z >= p
  {
    var m: multiset<int> := multiset{-2, -2, -2, -2, -2, -2, -1, -1, 0, 0, 0, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4};
    var pre, p, post := Partition(m);
    expect p in m;
    expect forall z: int | z in pre :: z <= p;
    expect forall z: int | z in post :: z >= p;
    expect pre == multiset{-2, -2, -2, -2, -2}; // observed from implementation
    expect p == -2; // observed from implementation
    expect post == multiset{-1, -1, 0, 0, 0, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4}; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  |m| > 0
  //   POST Q1: p in m
  //   POST Q2: m == pre + multiset{p} + post
  //   POST Q3: forall z: int {:trigger pre[z]} | z in pre :: z <= p
  //   POST Q4: forall z: int {:trigger post[z]} | z in post :: z >= p
  {
    var m: multiset<int> := multiset{-2, -2, -2, -2, -2, -2, -1, -1, -1, -1, -1, -1, 0, 0, 1, 1};
    var pre, p, post := Partition(m);
    expect p in m;
    expect forall z: int | z in pre :: z <= p;
    expect forall z: int | z in post :: z >= p;
    expect pre == multiset{-2, -2, -2, -2, -2}; // observed from implementation
    expect p == -2; // observed from implementation
    expect post == multiset{-1, -1, -1, -1, -1, -1, 0, 0, 1, 1}; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  |m| > 0
  //   POST Q1: p in m
  //   POST Q2: m == pre + multiset{p} + post
  //   POST Q3: forall z: int {:trigger pre[z]} | z in pre :: z <= p
  //   POST Q4: forall z: int {:trigger post[z]} | z in post :: z >= p
  {
    var m: multiset<int> := multiset{-2, -2, -2, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1};
    var pre, p, post := Partition(m);
    expect p in m;
    expect forall z: int | z in pre :: z <= p;
    expect forall z: int | z in post :: z >= p;
    expect pre == multiset{-2, -2}; // observed from implementation
    expect p == -2; // observed from implementation
    expect post == multiset{-1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1}; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  |m| > 0
  //   POST Q1: p in m
  //   POST Q2: m == pre + multiset{p} + post
  //   POST Q3: forall z: int {:trigger pre[z]} | z in pre :: z <= p
  //   POST Q4: forall z: int {:trigger post[z]} | z in post :: z >= p
  {
    var m: multiset<int> := multiset{-2, -2, 5};
    var pre, p, post := Partition(m);
    expect p in m;
    expect forall z: int | z in pre :: z <= p;
    expect forall z: int | z in post :: z >= p;
    expect pre == multiset{-2}; // observed from implementation
    expect p == -2; // observed from implementation
    expect post == multiset{5}; // observed from implementation
  }

}

method TestsForQuickSelect()
{
  // Test case for combination {1}:
  //   PRE:  0 <= k < |m|
  //   POST Q1: kth in m
  //   POST Q2: m == pre + multiset{kth} + post
  //   POST Q3: |pre| == k
  //   POST Q4: forall z: int {:trigger pre[z]} | z in pre :: z <= kth
  //   POST Q5: forall z: int {:trigger post[z]} | z in post :: z >= kth
  {
    var m: multiset<int> := multiset{5, 5, 5, 5, 5};
    var k := 4;
    var pre, kth, post := QuickSelect(m, k);
    expect kth in m;
    expect |pre| == k;
    expect forall z: int | z in pre :: z <= kth;
    expect forall z: int | z in post :: z >= kth;
    expect pre == multiset{5, 5, 5, 5}; // observed from implementation
    expect kth == 5; // observed from implementation
    expect post == multiset{}; // observed from implementation
  }

  // Test case for combination {1}/O|m|=1:
  //   PRE:  0 <= k < |m|
  //   POST Q1: kth in m
  //   POST Q2: m == pre + multiset{kth} + post
  //   POST Q3: |pre| == k
  //   POST Q4: forall z: int {:trigger pre[z]} | z in pre :: z <= kth
  //   POST Q5: forall z: int {:trigger post[z]} | z in post :: z >= kth
  {
    var m: multiset<int> := multiset{5};
    var k := 0;
    var pre, kth, post := QuickSelect(m, k);
    expect kth in m;
    expect |pre| == k;
    expect forall z: int | z in pre :: z <= kth;
    expect forall z: int | z in post :: z >= kth;
    expect pre == multiset{}; // observed from implementation
    expect kth == 5; // observed from implementation
    expect post == multiset{}; // observed from implementation
  }

  // Test case for combination {1}/O|pre|=1:
  //   PRE:  0 <= k < |m|
  //   POST Q1: kth in m
  //   POST Q2: m == pre + multiset{kth} + post
  //   POST Q3: |pre| == k
  //   POST Q4: forall z: int {:trigger pre[z]} | z in pre :: z <= kth
  //   POST Q5: forall z: int {:trigger post[z]} | z in post :: z >= kth
  {
    var m: multiset<int> := multiset{0, 5};
    var k := 1;
    var pre, kth, post := QuickSelect(m, k);
    expect kth in m;
    expect |pre| == k;
    expect forall z: int | z in pre :: z <= kth;
    expect forall z: int | z in post :: z >= kth;
    expect pre == multiset{0}; // observed from implementation
    expect kth == 5; // observed from implementation
    expect post == multiset{}; // observed from implementation
  }

  // Test case for combination {1}/Okth=0:
  //   PRE:  0 <= k < |m|
  //   POST Q1: kth in m
  //   POST Q2: m == pre + multiset{kth} + post
  //   POST Q3: |pre| == k
  //   POST Q4: forall z: int {:trigger pre[z]} | z in pre :: z <= kth
  //   POST Q5: forall z: int {:trigger post[z]} | z in post :: z >= kth
  {
    var m: multiset<int> := multiset{0, 0};
    var k := 0;
    var pre, kth, post := QuickSelect(m, k);
    expect kth in m;
    expect |pre| == k;
    expect forall z: int | z in pre :: z <= kth;
    expect forall z: int | z in post :: z >= kth;
    expect pre == multiset{}; // observed from implementation
    expect kth == 0; // observed from implementation
    expect post == multiset{}; // observed from implementation
  }

  // Test case for combination {1}/Okth<0:
  //   PRE:  0 <= k < |m|
  //   POST Q1: kth in m
  //   POST Q2: m == pre + multiset{kth} + post
  //   POST Q3: |pre| == k
  //   POST Q4: forall z: int {:trigger pre[z]} | z in pre :: z <= kth
  //   POST Q5: forall z: int {:trigger post[z]} | z in post :: z >= kth
  {
    var m: multiset<int> := multiset{-2, 1, 2, 2, 5, 5};
    var k := 5;
    var pre, kth, post := QuickSelect(m, k);
    expect kth in m;
    expect |pre| == k;
    expect forall z: int | z in pre :: z <= kth;
    expect forall z: int | z in post :: z >= kth;
    expect pre == multiset{-2, 1, 2, 2, 5}; // observed from implementation
    expect kth == 5; // observed from implementation
    expect post == multiset{}; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|post|=1:
  //   PRE:  0 <= k < |m|
  //   POST Q1: kth in m
  //   POST Q2: m == pre + multiset{kth} + post
  //   POST Q3: |pre| == k
  //   POST Q4: forall z: int {:trigger pre[z]} | z in pre :: z <= kth
  //   POST Q5: forall z: int {:trigger post[z]} | z in post :: z >= kth
  {
    var m: multiset<int> := multiset{-2, -2, -2, -2, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 3, 3, 3, 3, 3, 3};
    var k := 0;
    var pre, kth, post := QuickSelect(m, k);
    // actual runtime state: pre=multiset{-2, -2}, kth=-2, post=multiset{-1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 3, 3, 3, 3, 3, 3}
    // expect kth in m; // got true
    // expect |pre| == k; // LHS=2, RHS=0
    // expect forall z: int | z in pre :: z <= kth; // got true
    // expect forall z: int | z in post :: z >= kth; // got true
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|post|>=2:
  //   PRE:  0 <= k < |m|
  //   POST Q1: kth in m
  //   POST Q2: m == pre + multiset{kth} + post
  //   POST Q3: |pre| == k
  //   POST Q4: forall z: int {:trigger pre[z]} | z in pre :: z <= kth
  //   POST Q5: forall z: int {:trigger post[z]} | z in post :: z >= kth
  {
    var m: multiset<int> := multiset{-1, -1, -1, -1, -1, -1, 3, 3, 3, 3, 3, 3, 3, 4};
    var k := 2;
    var pre, kth, post := QuickSelect(m, k);
    // actual runtime state: pre=multiset{-1, -1, -1, -1}, kth=-1, post=multiset{3, 3, 3, 3, 3, 3, 3, 4}
    // expect kth in m; // got true
    // expect |pre| == k; // LHS=4, RHS=2
    // expect forall z: int | z in pre :: z <= kth; // got true
    // expect forall z: int | z in post :: z >= kth; // got true
  }

  // Test case for combination {1}/R8:
  //   PRE:  0 <= k < |m|
  //   POST Q1: kth in m
  //   POST Q2: m == pre + multiset{kth} + post
  //   POST Q3: |pre| == k
  //   POST Q4: forall z: int {:trigger pre[z]} | z in pre :: z <= kth
  //   POST Q5: forall z: int {:trigger post[z]} | z in post :: z >= kth
  {
    var m: multiset<int> := multiset{-1, 5};
    var k := 0;
    var pre, kth, post := QuickSelect(m, k);
    expect kth in m;
    expect |pre| == k;
    expect forall z: int | z in pre :: z <= kth;
    expect forall z: int | z in post :: z >= kth;
    expect pre == multiset{}; // observed from implementation
    expect kth == -1; // observed from implementation
    expect post == multiset{5}; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  0 <= k < |m|
  //   POST Q1: kth in m
  //   POST Q2: m == pre + multiset{kth} + post
  //   POST Q3: |pre| == k
  //   POST Q4: forall z: int {:trigger pre[z]} | z in pre :: z <= kth
  //   POST Q5: forall z: int {:trigger post[z]} | z in post :: z >= kth
  {
    var m: multiset<int> := multiset{-1, -1, 3, 3, 3, 3};
    var k := 3;
    var pre, kth, post := QuickSelect(m, k);
    // actual runtime state: pre=multiset{-1, -1, 3, 3}, kth=3, post=multiset{3}
    // expect kth in m; // got true
    // expect |pre| == k; // LHS=4, RHS=3
    // expect forall z: int | z in pre :: z <= kth; // got true
    // expect forall z: int | z in post :: z >= kth; // got true
  }

  // Test case for combination {1}/R10:
  //   PRE:  0 <= k < |m|
  //   POST Q1: kth in m
  //   POST Q2: m == pre + multiset{kth} + post
  //   POST Q3: |pre| == k
  //   POST Q4: forall z: int {:trigger pre[z]} | z in pre :: z <= kth
  //   POST Q5: forall z: int {:trigger post[z]} | z in post :: z >= kth
  {
    var m: multiset<int> := multiset{-2, -2, -2, 3, 3, 3, 5};
    var k := 6;
    var pre, kth, post := QuickSelect(m, k);
    expect kth in m;
    expect |pre| == k;
    expect forall z: int | z in pre :: z <= kth;
    expect forall z: int | z in post :: z >= kth;
    expect pre == multiset{-2, -2, -2, 3, 3, 3}; // observed from implementation
    expect kth == 5; // observed from implementation
    expect post == multiset{}; // observed from implementation
  }

}

method Main()
{
  TestsForPartition();
  print "TestsForPartition: all non-failing tests passed!\n";
  TestsForQuickSelect();
  print "TestsForQuickSelect: all non-failing tests passed!\n";
}
