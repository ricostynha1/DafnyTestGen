// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Final-Project-Dafny_tmp_tmpmcywuqox_Attempts_Quick_Sort__702_ROR_Ge.dfy
// Method: threshold
// Generated: 2026-04-25 00:10:35

// Final-Project-Dafny_tmp_tmpmcywuqox_Attempts_Quick_Sort.dfy

predicate quickSorted(Seq: seq<int>)
  decreases Seq
{
  forall idx_1: int, idx_2: int {:trigger Seq[idx_2], Seq[idx_1]} :: 
    0 <= idx_1 < idx_2 < |Seq| ==>
      Seq[idx_1] <= Seq[idx_2]
}

method threshold(thres: int, Seq: seq<int>)
    returns (Seq_1: seq<int>, Seq_2: seq<int>)
  ensures (forall x: int {:trigger x in Seq_1} | x in Seq_1 :: x <= thres) && forall x: int {:trigger x in Seq_2} | x in Seq_2 :: x >= thres
  ensures |Seq_1| + |Seq_2| == |Seq|
  ensures multiset(Seq_1) + multiset(Seq_2) == multiset(Seq)
  decreases thres, Seq
{
  Seq_1 := [];
  Seq_2 := [];
  var i := 0;
  while i < |Seq|
    invariant i <= |Seq|
    invariant (forall x: int {:trigger x in Seq_1} | x in Seq_1 :: x <= thres) && forall x: int {:trigger x in Seq_2} | x in Seq_2 :: x >= thres
    invariant |Seq_1| + |Seq_2| == i
    invariant multiset(Seq[..i]) == multiset(Seq_1) + multiset(Seq_2)
    decreases |Seq| - i
  {
    if Seq[i] >= thres {
      Seq_1 := Seq_1 + [Seq[i]];
    } else {
      Seq_2 := Seq_2 + [Seq[i]];
    }
    assert Seq[..i] + [Seq[i]] == Seq[..i + 1];
    i := i + 1;
  }
  assert Seq[..|Seq|] == Seq;
}

lemma Lemma_1(Seq_1: seq, Seq_2: seq)
  requires multiset(Seq_1) == multiset(Seq_2)
  ensures forall x {:trigger x in Seq_2} {:trigger x in Seq_1} | x in Seq_1 :: x in Seq_2
  decreases Seq_1, Seq_2
{
  forall x | x in Seq_1
    ensures x in multiset(Seq_1)
  {
    var i := 0;
    while i < |Seq_1|
      invariant 0 <= i <= |Seq_1|
      invariant forall idx_1: int {:trigger Seq_1[idx_1]} | 0 <= idx_1 < i :: Seq_1[idx_1] in multiset(Seq_1)
      decreases |Seq_1| - i
    {
      i := i + 1;
    }
  }
}

method quickSort(Seq: seq<int>) returns (Seq': seq<int>)
  ensures multiset(Seq) == multiset(Seq')
  decreases |Seq|
{
  if |Seq| == 0 {
    return [];
  } else if |Seq| == 1 {
    return Seq;
  } else {
    var Seq_1, Seq_2 := threshold(Seq[0], Seq[1..]);
    var Seq_1' := quickSort(Seq_1);
    Lemma_1(Seq_1', Seq_1);
    var Seq_2' := quickSort(Seq_2);
    Lemma_1(Seq_2', Seq_2);
    assert Seq == [Seq[0]] + Seq[1..];
    return Seq_1' + [Seq[0]] + Seq_2';
  }
}


method TestsForthreshold()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   POST Q1: (forall x: int {:trigger x in Seq_1} | x in Seq_1 :: x <= thres) && forall x: int {:trigger x in Seq_2} | x in Seq_2 :: x >= thres
  //   POST Q2: |Seq_1| + |Seq_2| == |Seq|
  //   POST Q3: multiset(Seq_1) + multiset(Seq_2) == multiset(Seq)
  {
    var thres := -10;
    var Seq: seq<int> := [9];
    var Seq_1, Seq_2 := threshold(thres, Seq);
    // actual runtime state: Seq_1=[9], Seq_2=[]
    // expect (forall x: int | x in Seq_1 :: x <= thres) && forall x: int | x in Seq_2 :: x >= thres; // got false
    // expect |Seq_1| + |Seq_2| == |Seq|; // LHS=1, RHS=1
    // expect multiset(Seq_1) + multiset(Seq_2) == multiset(Seq); // LHS=multiset{9}, RHS=multiset{9}
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Othres=0:
  //   POST Q1: (forall x: int {:trigger x in Seq_1} | x in Seq_1 :: x <= thres) && forall x: int {:trigger x in Seq_2} | x in Seq_2 :: x >= thres
  //   POST Q2: |Seq_1| + |Seq_2| == |Seq|
  //   POST Q3: multiset(Seq_1) + multiset(Seq_2) == multiset(Seq)
  {
    var thres := 0;
    var Seq: seq<int> := [-9];
    var Seq_1, Seq_2 := threshold(thres, Seq);
    // actual runtime state: Seq_1=[], Seq_2=[-9]
    // expect (forall x: int | x in Seq_1 :: x <= thres) && forall x: int | x in Seq_2 :: x >= thres; // got false
    // expect |Seq_1| + |Seq_2| == |Seq|; // LHS=1, RHS=1
    // expect multiset(Seq_1) + multiset(Seq_2) == multiset(Seq); // LHS=multiset{-9}, RHS=multiset{-9}
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Othres>0:
  //   POST Q1: (forall x: int {:trigger x in Seq_1} | x in Seq_1 :: x <= thres) && forall x: int {:trigger x in Seq_2} | x in Seq_2 :: x >= thres
  //   POST Q2: |Seq_1| + |Seq_2| == |Seq|
  //   POST Q3: multiset(Seq_1) + multiset(Seq_2) == multiset(Seq)
  {
    var thres := 2;
    var Seq: seq<int> := [-5];
    var Seq_1, Seq_2 := threshold(thres, Seq);
    // actual runtime state: Seq_1=[], Seq_2=[-5]
    // expect (forall x: int | x in Seq_1 :: x <= thres) && forall x: int | x in Seq_2 :: x >= thres; // got false
    // expect |Seq_1| + |Seq_2| == |Seq|; // LHS=1, RHS=1
    // expect multiset(Seq_1) + multiset(Seq_2) == multiset(Seq); // LHS=multiset{-5}, RHS=multiset{-5}
  }

  // Test case for combination {1}/O|Seq|=0:
  //   POST Q1: (forall x: int {:trigger x in Seq_1} | x in Seq_1 :: x <= thres) && forall x: int {:trigger x in Seq_2} | x in Seq_2 :: x >= thres
  //   POST Q2: |Seq_1| + |Seq_2| == |Seq|
  //   POST Q3: multiset(Seq_1) + multiset(Seq_2) == multiset(Seq)
  {
    var thres := -10;
    var Seq: seq<int> := [];
    var Seq_1, Seq_2 := threshold(thres, Seq);
    expect (forall x: int | x in Seq_1 :: x <= thres) && forall x: int | x in Seq_2 :: x >= thres;
    expect |Seq_1| + |Seq_2| == |Seq|;
    expect multiset(Seq_1) + multiset(Seq_2) == multiset(Seq);
    expect Seq_1[..] == []; // observed from implementation
    expect Seq_2[..] == []; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|Seq|>=2:
  //   POST Q1: (forall x: int {:trigger x in Seq_1} | x in Seq_1 :: x <= thres) && forall x: int {:trigger x in Seq_2} | x in Seq_2 :: x >= thres
  //   POST Q2: |Seq_1| + |Seq_2| == |Seq|
  //   POST Q3: multiset(Seq_1) + multiset(Seq_2) == multiset(Seq)
  {
    var thres := -2;
    var Seq: seq<int> := [-10, -3];
    var Seq_1, Seq_2 := threshold(thres, Seq);
    // actual runtime state: Seq_1=[], Seq_2=[-10, -3]
    // expect (forall x: int | x in Seq_1 :: x <= thres) && forall x: int | x in Seq_2 :: x >= thres; // got false
    // expect |Seq_1| + |Seq_2| == |Seq|; // LHS=2, RHS=2
    // expect multiset(Seq_1) + multiset(Seq_2) == multiset(Seq); // LHS=multiset{-10, -3}, RHS=multiset{-10, -3}
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   POST Q1: (forall x: int {:trigger x in Seq_1} | x in Seq_1 :: x <= thres) && forall x: int {:trigger x in Seq_2} | x in Seq_2 :: x >= thres
  //   POST Q2: |Seq_1| + |Seq_2| == |Seq|
  //   POST Q3: multiset(Seq_1) + multiset(Seq_2) == multiset(Seq)
  {
    var thres := -3;
    var Seq: seq<int> := [8];
    var Seq_1, Seq_2 := threshold(thres, Seq);
    // actual runtime state: Seq_1=[8], Seq_2=[]
    // expect (forall x: int | x in Seq_1 :: x <= thres) && forall x: int | x in Seq_2 :: x >= thres; // got false
    // expect |Seq_1| + |Seq_2| == |Seq|; // LHS=1, RHS=1
    // expect multiset(Seq_1) + multiset(Seq_2) == multiset(Seq); // LHS=multiset{8}, RHS=multiset{8}
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   POST Q1: (forall x: int {:trigger x in Seq_1} | x in Seq_1 :: x <= thres) && forall x: int {:trigger x in Seq_2} | x in Seq_2 :: x >= thres
  //   POST Q2: |Seq_1| + |Seq_2| == |Seq|
  //   POST Q3: multiset(Seq_1) + multiset(Seq_2) == multiset(Seq)
  {
    var thres := 5;
    var Seq: seq<int> := [7];
    var Seq_1, Seq_2 := threshold(thres, Seq);
    // actual runtime state: Seq_1=[7], Seq_2=[]
    // expect (forall x: int | x in Seq_1 :: x <= thres) && forall x: int | x in Seq_2 :: x >= thres; // got false
    // expect |Seq_1| + |Seq_2| == |Seq|; // LHS=1, RHS=1
    // expect multiset(Seq_1) + multiset(Seq_2) == multiset(Seq); // LHS=multiset{7}, RHS=multiset{7}
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   POST Q1: (forall x: int {:trigger x in Seq_1} | x in Seq_1 :: x <= thres) && forall x: int {:trigger x in Seq_2} | x in Seq_2 :: x >= thres
  //   POST Q2: |Seq_1| + |Seq_2| == |Seq|
  //   POST Q3: multiset(Seq_1) + multiset(Seq_2) == multiset(Seq)
  {
    var thres := -9;
    var Seq: seq<int> := [3];
    var Seq_1, Seq_2 := threshold(thres, Seq);
    // actual runtime state: Seq_1=[3], Seq_2=[]
    // expect (forall x: int | x in Seq_1 :: x <= thres) && forall x: int | x in Seq_2 :: x >= thres; // got false
    // expect |Seq_1| + |Seq_2| == |Seq|; // LHS=1, RHS=1
    // expect multiset(Seq_1) + multiset(Seq_2) == multiset(Seq); // LHS=multiset{3}, RHS=multiset{3}
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   POST Q1: (forall x: int {:trigger x in Seq_1} | x in Seq_1 :: x <= thres) && forall x: int {:trigger x in Seq_2} | x in Seq_2 :: x >= thres
  //   POST Q2: |Seq_1| + |Seq_2| == |Seq|
  //   POST Q3: multiset(Seq_1) + multiset(Seq_2) == multiset(Seq)
  {
    var thres := -9;
    var Seq: seq<int> := [-8];
    var Seq_1, Seq_2 := threshold(thres, Seq);
    // actual runtime state: Seq_1=[-8], Seq_2=[]
    // expect (forall x: int | x in Seq_1 :: x <= thres) && forall x: int | x in Seq_2 :: x >= thres; // got false
    // expect |Seq_1| + |Seq_2| == |Seq|; // LHS=1, RHS=1
    // expect multiset(Seq_1) + multiset(Seq_2) == multiset(Seq); // LHS=multiset{-8}, RHS=multiset{-8}
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   POST Q1: (forall x: int {:trigger x in Seq_1} | x in Seq_1 :: x <= thres) && forall x: int {:trigger x in Seq_2} | x in Seq_2 :: x >= thres
  //   POST Q2: |Seq_1| + |Seq_2| == |Seq|
  //   POST Q3: multiset(Seq_1) + multiset(Seq_2) == multiset(Seq)
  {
    var thres := -9;
    var Seq: seq<int> := [6];
    var Seq_1, Seq_2 := threshold(thres, Seq);
    // actual runtime state: Seq_1=[6], Seq_2=[]
    // expect (forall x: int | x in Seq_1 :: x <= thres) && forall x: int | x in Seq_2 :: x >= thres; // got false
    // expect |Seq_1| + |Seq_2| == |Seq|; // LHS=1, RHS=1
    // expect multiset(Seq_1) + multiset(Seq_2) == multiset(Seq); // LHS=multiset{6}, RHS=multiset{6}
  }

}

method TestsForquickSort()
{
  // Test case for combination {1}:
  //   POST Q1: multiset(Seq) == multiset(Seq')
  {
    var Seq: seq<int> := [-1];
    var Seq' := quickSort(Seq);
  }

  // Test case for combination {1}/O|Seq|=0:
  //   POST Q1: multiset(Seq) == multiset(Seq')
  {
    var Seq: seq<int> := [];
    var Seq' := quickSort(Seq);
  }

  // Test case for combination {1}/O|Seq|>=2:
  //   POST Q1: multiset(Seq) == multiset(Seq')
  {
    var Seq: seq<int> := [6, -1];
    var Seq' := quickSort(Seq);
  }

  // Test case for combination {1}/R4:
  //   POST Q1: multiset(Seq) == multiset(Seq')
  {
    var Seq: seq<int> := [-10];
    var Seq' := quickSort(Seq);
  }

  // Test case for combination {1}/R5:
  //   POST Q1: multiset(Seq) == multiset(Seq')
  {
    var Seq: seq<int> := [-9];
    var Seq' := quickSort(Seq);
  }

  // Test case for combination {1}/R6:
  //   POST Q1: multiset(Seq) == multiset(Seq')
  {
    var Seq: seq<int> := [-8];
    var Seq' := quickSort(Seq);
  }

  // Test case for combination {1}/R7:
  //   POST Q1: multiset(Seq) == multiset(Seq')
  {
    var Seq: seq<int> := [-7];
    var Seq' := quickSort(Seq);
  }

  // Test case for combination {1}/R8:
  //   POST Q1: multiset(Seq) == multiset(Seq')
  {
    var Seq: seq<int> := [-6];
    var Seq' := quickSort(Seq);
  }

  // Test case for combination {1}/R9:
  //   POST Q1: multiset(Seq) == multiset(Seq')
  {
    var Seq: seq<int> := [-5];
    var Seq' := quickSort(Seq);
  }

  // Test case for combination {1}/R10:
  //   POST Q1: multiset(Seq) == multiset(Seq')
  {
    var Seq: seq<int> := [-4];
    var Seq' := quickSort(Seq);
  }

}

method Main()
{
  TestsForthreshold();
  print "TestsForthreshold: all non-failing tests passed!\n";
  TestsForquickSort();
  print "TestsForquickSort: all non-failing tests passed!\n";
}
