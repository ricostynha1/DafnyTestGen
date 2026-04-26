// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Final-Project-Dafny_tmp_tmpmcywuqox_Attempts_Quick_Sort__702_ROR_Ge.dfy
// Method: threshold
// Generated: 2026-04-24 12:13:53

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
  // Test case for combination {1}/Rel:
  //   POST Q1: (forall x: int {:trigger x in Seq_1} | x in Seq_1 :: x <= thres) && forall x: int {:trigger x in Seq_2} | x in Seq_2 :: x >= thres
  //   POST Q2: |Seq_1| + |Seq_2| == |Seq|
  //   POST Q3: multiset(Seq_1) + multiset(Seq_2) == multiset(Seq)
  {
    var thres := 53450;
    var Seq: seq<int> := [71];
    var Seq_1, Seq_2 := threshold(thres, Seq);
    // actual runtime state: Seq_1=[], Seq_2=[71]
    // expect (forall x: int | x in Seq_1 :: x <= thres) && forall x: int | x in Seq_2 :: x >= thres; // got false
    // expect |Seq_1| + |Seq_2| == |Seq|; // LHS=1, RHS=1
    // expect multiset(Seq_1) + multiset(Seq_2) == multiset(Seq); // LHS=multiset{71}, RHS=multiset{71}
  }

  // Test case for combination {1}/V1:
  //   POST Q1: (forall x: int {:trigger x in Seq_1} | x in Seq_1 :: x <= thres) && forall x: int {:trigger x in Seq_2} | x in Seq_2 :: x >= thres  // VACUOUS (forced true by other literals for this ins)
  //   POST Q2: |Seq_1| + |Seq_2| == |Seq|
  //   POST Q3: multiset(Seq_1) + multiset(Seq_2) == multiset(Seq)
  {
    var thres := 0;
    var Seq: seq<int> := [];
    var Seq_1, Seq_2 := threshold(thres, Seq);
    expect (forall x: int | x in Seq_1 :: x <= thres) && forall x: int | x in Seq_2 :: x >= thres;
    expect |Seq_1| + |Seq_2| == |Seq|;
    expect multiset(Seq_1) + multiset(Seq_2) == multiset(Seq);
    expect Seq_1[..] == []; // observed from implementation
    expect Seq_2[..] == []; // observed from implementation
  }

  // Test case for combination {1}/Othres<0:
  //   POST Q1: (forall x: int {:trigger x in Seq_1} | x in Seq_1 :: x <= thres) && forall x: int {:trigger x in Seq_2} | x in Seq_2 :: x >= thres
  //   POST Q2: |Seq_1| + |Seq_2| == |Seq|
  //   POST Q3: multiset(Seq_1) + multiset(Seq_2) == multiset(Seq)
  {
    var thres := -1;
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
    var thres := -30058;
    var Seq: seq<int> := [28, 29];
    var Seq_1, Seq_2 := threshold(thres, Seq);
    // actual runtime state: Seq_1=[28, 29], Seq_2=[]
    // expect (forall x: int | x in Seq_1 :: x <= thres) && forall x: int | x in Seq_2 :: x >= thres; // got false
    // expect |Seq_1| + |Seq_2| == |Seq|; // LHS=2, RHS=2
    // expect multiset(Seq_1) + multiset(Seq_2) == multiset(Seq); // LHS=multiset{28, 29}, RHS=multiset{28, 29}
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Othres=0/R4:
  //   POST Q1: (forall x: int {:trigger x in Seq_1} | x in Seq_1 :: x <= thres) && forall x: int {:trigger x in Seq_2} | x in Seq_2 :: x >= thres
  //   POST Q2: |Seq_1| + |Seq_2| == |Seq|
  //   POST Q3: multiset(Seq_1) + multiset(Seq_2) == multiset(Seq)
  {
    var thres := 0;
    var Seq: seq<int> := [28];
    var Seq_1, Seq_2 := threshold(thres, Seq);
    // actual runtime state: Seq_1=[28], Seq_2=[]
    // expect (forall x: int | x in Seq_1 :: x <= thres) && forall x: int | x in Seq_2 :: x >= thres; // got false
    // expect |Seq_1| + |Seq_2| == |Seq|; // LHS=1, RHS=1
    // expect multiset(Seq_1) + multiset(Seq_2) == multiset(Seq); // LHS=multiset{28}, RHS=multiset{28}
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Othres=0/R5:
  //   POST Q1: (forall x: int {:trigger x in Seq_1} | x in Seq_1 :: x <= thres) && forall x: int {:trigger x in Seq_2} | x in Seq_2 :: x >= thres
  //   POST Q2: |Seq_1| + |Seq_2| == |Seq|
  //   POST Q3: multiset(Seq_1) + multiset(Seq_2) == multiset(Seq)
  {
    var thres := 0;
    var Seq: seq<int> := [29];
    var Seq_1, Seq_2 := threshold(thres, Seq);
    // actual runtime state: Seq_1=[29], Seq_2=[]
    // expect (forall x: int | x in Seq_1 :: x <= thres) && forall x: int | x in Seq_2 :: x >= thres; // got false
    // expect |Seq_1| + |Seq_2| == |Seq|; // LHS=1, RHS=1
    // expect multiset(Seq_1) + multiset(Seq_2) == multiset(Seq); // LHS=multiset{29}, RHS=multiset{29}
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Othres=0/R6:
  //   POST Q1: (forall x: int {:trigger x in Seq_1} | x in Seq_1 :: x <= thres) && forall x: int {:trigger x in Seq_2} | x in Seq_2 :: x >= thres
  //   POST Q2: |Seq_1| + |Seq_2| == |Seq|
  //   POST Q3: multiset(Seq_1) + multiset(Seq_2) == multiset(Seq)
  {
    var thres := 0;
    var Seq: seq<int> := [27];
    var Seq_1, Seq_2 := threshold(thres, Seq);
    // actual runtime state: Seq_1=[27], Seq_2=[]
    // expect (forall x: int | x in Seq_1 :: x <= thres) && forall x: int | x in Seq_2 :: x >= thres; // got false
    // expect |Seq_1| + |Seq_2| == |Seq|; // LHS=1, RHS=1
    // expect multiset(Seq_1) + multiset(Seq_2) == multiset(Seq); // LHS=multiset{27}, RHS=multiset{27}
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Othres=0/R7:
  //   POST Q1: (forall x: int {:trigger x in Seq_1} | x in Seq_1 :: x <= thres) && forall x: int {:trigger x in Seq_2} | x in Seq_2 :: x >= thres
  //   POST Q2: |Seq_1| + |Seq_2| == |Seq|
  //   POST Q3: multiset(Seq_1) + multiset(Seq_2) == multiset(Seq)
  {
    var thres := 0;
    var Seq: seq<int> := [30];
    var Seq_1, Seq_2 := threshold(thres, Seq);
    // actual runtime state: Seq_1=[30], Seq_2=[]
    // expect (forall x: int | x in Seq_1 :: x <= thres) && forall x: int | x in Seq_2 :: x >= thres; // got false
    // expect |Seq_1| + |Seq_2| == |Seq|; // LHS=1, RHS=1
    // expect multiset(Seq_1) + multiset(Seq_2) == multiset(Seq); // LHS=multiset{30}, RHS=multiset{30}
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Othres=0/R8:
  //   POST Q1: (forall x: int {:trigger x in Seq_1} | x in Seq_1 :: x <= thres) && forall x: int {:trigger x in Seq_2} | x in Seq_2 :: x >= thres
  //   POST Q2: |Seq_1| + |Seq_2| == |Seq|
  //   POST Q3: multiset(Seq_1) + multiset(Seq_2) == multiset(Seq)
  {
    var thres := 0;
    var Seq: seq<int> := [31];
    var Seq_1, Seq_2 := threshold(thres, Seq);
    // actual runtime state: Seq_1=[31], Seq_2=[]
    // expect (forall x: int | x in Seq_1 :: x <= thres) && forall x: int | x in Seq_2 :: x >= thres; // got false
    // expect |Seq_1| + |Seq_2| == |Seq|; // LHS=1, RHS=1
    // expect multiset(Seq_1) + multiset(Seq_2) == multiset(Seq); // LHS=multiset{31}, RHS=multiset{31}
  }

}

method TestsForquickSort()
{
  // Test case for combination {1}:
  //   POST Q1: multiset(Seq) == multiset(Seq')
  {
    var Seq: seq<int> := [];
    var Seq' := quickSort(Seq);
  }

  // Test case for combination {1}/O|Seq|=1:
  //   POST Q1: multiset(Seq) == multiset(Seq')
  {
    var Seq: seq<int> := [2];
    var Seq' := quickSort(Seq);
  }

  // Test case for combination {1}/O|Seq|>=2:
  //   POST Q1: multiset(Seq) == multiset(Seq')
  {
    var Seq: seq<int> := [3, 4];
    var Seq' := quickSort(Seq);
  }

  // Test case for combination {1}/R4:
  //   POST Q1: multiset(Seq) == multiset(Seq')
  {
    var Seq: seq<int> := [5];
    var Seq' := quickSort(Seq);
  }

  // Test case for combination {1}/R5:
  //   POST Q1: multiset(Seq) == multiset(Seq')
  {
    var Seq: seq<int> := [6];
    var Seq' := quickSort(Seq);
  }

  // Test case for combination {1}/R6:
  //   POST Q1: multiset(Seq) == multiset(Seq')
  {
    var Seq: seq<int> := [7];
    var Seq' := quickSort(Seq);
  }

  // Test case for combination {1}/R7:
  //   POST Q1: multiset(Seq) == multiset(Seq')
  {
    var Seq: seq<int> := [8];
    var Seq' := quickSort(Seq);
  }

  // Test case for combination {1}/R8:
  //   POST Q1: multiset(Seq) == multiset(Seq')
  {
    var Seq: seq<int> := [9];
    var Seq' := quickSort(Seq);
  }

  // Test case for combination {1}/R9:
  //   POST Q1: multiset(Seq) == multiset(Seq')
  {
    var Seq: seq<int> := [10];
    var Seq' := quickSort(Seq);
  }

  // Test case for combination {1}/R10:
  //   POST Q1: multiset(Seq) == multiset(Seq')
  {
    var Seq: seq<int> := [11];
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
