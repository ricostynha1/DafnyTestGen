// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\not_supported\Dafny_tmp_tmp0wu8wmfr_Heimaverkefni 8_H8__2022-2034_CIR.dfy
// Method: Partition
// Generated: 2026-04-05 22:48:58

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
      post := post + multiset{} + post';
      kth := p;
    }
  } else {
    return pre, kth, post;
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  |m| > 0
  //   POST: p in m
  //   POST: m == pre + multiset{p} + post
  //   POST: forall z: int {:trigger pre[z]} | z in pre :: z <= p
  //   POST: forall z: int {:trigger post[z]} | z in post :: z >= p
  {
    var m: multiset<int> := multiset{1, 3, 5};
    var pre, p, post := Partition(m);
    expect p in m;
    expect m == multiset{1, 3, 5};
    expect forall z: int | z in pre :: z <= p;
    expect forall z: int | z in post :: z >= p;
  }

  // Test case for combination {1}/Bm=1:
  //   PRE:  |m| > 0
  //   POST: p in m
  //   POST: m == pre + multiset{p} + post
  //   POST: forall z: int {:trigger pre[z]} | z in pre :: z <= p
  //   POST: forall z: int {:trigger post[z]} | z in post :: z >= p
  {
    var m: multiset<int> := multiset{5};
    var pre, p, post := Partition(m);
    expect p in m;
    expect m == multiset{5};
    expect forall z: int | z in pre :: z <= p;
    expect forall z: int | z in post :: z >= p;
  }

  // Test case for combination {1}/Bm=2:
  //   PRE:  |m| > 0
  //   POST: p in m
  //   POST: m == pre + multiset{p} + post
  //   POST: forall z: int {:trigger pre[z]} | z in pre :: z <= p
  //   POST: forall z: int {:trigger post[z]} | z in post :: z >= p
  {
    var m: multiset<int> := multiset{-2, 5};
    var pre, p, post := Partition(m);
    expect p in m;
    expect m == multiset{-2, 5};
    expect forall z: int | z in pre :: z <= p;
    expect forall z: int | z in post :: z >= p;
  }

  // Test case for combination {1}/Bm=3:
  //   PRE:  |m| > 0
  //   POST: p in m
  //   POST: m == pre + multiset{p} + post
  //   POST: forall z: int {:trigger pre[z]} | z in pre :: z <= p
  //   POST: forall z: int {:trigger post[z]} | z in post :: z >= p
  {
    var m: multiset<int> := multiset{2, 4, 4};
    var pre, p, post := Partition(m);
    expect p in m;
    expect m == multiset{2, 4, 4};
    expect forall z: int | z in pre :: z <= p;
    expect forall z: int | z in post :: z >= p;
  }

  // Test case for combination {1}:
  //   PRE:  0 <= k < |m|
  //   POST: kth in m
  //   POST: m == pre + multiset{kth} + post
  //   POST: |pre| == k
  //   POST: forall z: int {:trigger pre[z]} | z in pre :: z <= kth
  //   POST: forall z: int {:trigger post[z]} | z in post :: z >= kth
  {
    var m: multiset<int> := multiset{1, 3, 5};
    var k := 2;
    var pre, kth, post := QuickSelect(m, k);
    expect kth in m;
    expect m == multiset{1, 3, 5};
    expect |pre| == k;
    expect forall z: int | z in pre :: z <= kth;
    expect forall z: int | z in post :: z >= kth;
  }

  // Test case for combination {1}/Bm=1,k=0:
  //   PRE:  0 <= k < |m|
  //   POST: kth in m
  //   POST: m == pre + multiset{kth} + post
  //   POST: |pre| == k
  //   POST: forall z: int {:trigger pre[z]} | z in pre :: z <= kth
  //   POST: forall z: int {:trigger post[z]} | z in post :: z >= kth
  {
    var m: multiset<int> := multiset{5};
    var k := 0;
    var pre, kth, post := QuickSelect(m, k);
    expect kth in m;
    expect m == multiset{5};
    expect |pre| == k;
    expect forall z: int | z in pre :: z <= kth;
    expect forall z: int | z in post :: z >= kth;
  }

  // Test case for combination {1}/Bm=2,k=0:
  //   PRE:  0 <= k < |m|
  //   POST: kth in m
  //   POST: m == pre + multiset{kth} + post
  //   POST: |pre| == k
  //   POST: forall z: int {:trigger pre[z]} | z in pre :: z <= kth
  //   POST: forall z: int {:trigger post[z]} | z in post :: z >= kth
  {
    var m: multiset<int> := multiset{-2, 5};
    var k := 0;
    var pre, kth, post := QuickSelect(m, k);
    expect kth in m;
    expect m == multiset{-2, 5};
    expect |pre| == k;
    expect forall z: int | z in pre :: z <= kth;
    expect forall z: int | z in post :: z >= kth;
  }

  // Test case for combination {1}/Bm=2,k=1:
  //   PRE:  0 <= k < |m|
  //   POST: kth in m
  //   POST: m == pre + multiset{kth} + post
  //   POST: |pre| == k
  //   POST: forall z: int {:trigger pre[z]} | z in pre :: z <= kth
  //   POST: forall z: int {:trigger post[z]} | z in post :: z >= kth
  {
    var m: multiset<int> := multiset{-2, 5};
    var k := 1;
    var pre, kth, post := QuickSelect(m, k);
    expect kth in m;
    expect m == multiset{-2, 5};
    expect |pre| == k;
    expect forall z: int | z in pre :: z <= kth;
    expect forall z: int | z in post :: z >= kth;
  }

}

method Failing()
{
  // (no failing tests)
}

method Main()
{
  Passing();
  Failing();
}
