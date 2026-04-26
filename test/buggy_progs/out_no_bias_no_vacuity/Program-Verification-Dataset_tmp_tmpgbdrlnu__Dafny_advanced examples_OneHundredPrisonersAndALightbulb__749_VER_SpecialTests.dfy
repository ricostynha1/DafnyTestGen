// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_advanced examples_OneHundredPrisonersAndALightbulb__749_VER_Special.dfy
// Method: CardinalitySubsetLt
// Generated: 2026-04-24 22:40:40

// Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_advanced examples_OneHundredPrisonersAndALightbulb.dfy

method CardinalitySubsetLt<T>(A: set<T>, B: set<T>)
  requires A < B
  ensures |A| < |B|
  decreases B
{
  var b :| b in B && b !in A;
  var B' := B - {b};
  assert |B| == |B'| + 1;
  if A < B' {
    CardinalitySubsetLt(A, B');
  } else {
    assert A == B';
  }
}

method strategy<T>(P: set<T>, Special: T) returns (count: int)
  requires |P| > 1 && Special in P
  ensures count == |P| - 1
  decreases *
{
  count := 0;
  var I := {};
  var S := {};
  var switch := false;
  while count < |P| - 1
    invariant count <= |P| - 1
    invariant count > 0 ==> Special in I
    invariant Special !in S && S < P && S <= I <= P
    invariant if switch then |S| == count + 1 else |S| == count
    decreases *
  {
    var p :| Special in P;
    I := I + {p};
    if p == Special {
      if switch {
        switch := false;
        count := count + 1;
      }
    } else {
      if p !in S && !switch {
        S := S + {p};
        switch := true;
      }
    }
  }
  CardinalitySubsetLt(S, I);
  if I < P {
    CardinalitySubsetLt(I, P);
  }
  assert P <= I;
  assert I == P;
}


method TestsForCardinalitySubsetLt()
  decreases *
{
  // Test case for combination {1}:
  //   PRE:  A < B
  //   POST Q1: |A| < |B|
  {
    var A: set<int> := {};
    var B: set<int> := {-2, -1, 0, 1, 3, 4, 5};
    CardinalitySubsetLt<int>(A, B);
  }

  // Test case for combination {1}/O|A|=1:
  //   PRE:  A < B
  //   POST Q1: |A| < |B|
  {
    var A: set<int> := {0};
    var B: set<int> := {-1, 0, 3, 4};
    CardinalitySubsetLt<int>(A, B);
  }

  // Test case for combination {1}/O|A|>=2:
  //   PRE:  A < B
  //   POST Q1: |A| < |B|
  {
    var A: set<int> := {0, 4};
    var B: set<int> := {-1, 0, 1, 3, 4};
    CardinalitySubsetLt<int>(A, B);
  }

  // Test case for combination {1}/O|B|=1:
  //   PRE:  A < B
  //   POST Q1: |A| < |B|
  {
    var A: set<int> := {};
    var B: set<int> := {3};
    CardinalitySubsetLt<int>(A, B);
  }

  // Test case for combination {1}/R5:
  //   PRE:  A < B
  //   POST Q1: |A| < |B|
  {
    var A: set<int> := {};
    var B: set<int> := {-1, 5};
    CardinalitySubsetLt<int>(A, B);
  }

  // Test case for combination {1}/R6:
  //   PRE:  A < B
  //   POST Q1: |A| < |B|
  {
    var A: set<int> := {-1, 0};
    var B: set<int> := {-1, 0, 3, 4};
    CardinalitySubsetLt<int>(A, B);
  }

  // Test case for combination {1}/R7:
  //   PRE:  A < B
  //   POST Q1: |A| < |B|
  {
    var A: set<int> := {-1};
    var B: set<int> := {-1, 2};
    CardinalitySubsetLt<int>(A, B);
  }

  // Test case for combination {1}/R8:
  //   PRE:  A < B
  //   POST Q1: |A| < |B|
  {
    var A: set<int> := {0, 4};
    var B: set<int> := {0, 3, 4};
    CardinalitySubsetLt<int>(A, B);
  }

  // Test case for combination {1}/R9:
  //   PRE:  A < B
  //   POST Q1: |A| < |B|
  {
    var A: set<int> := {-1, 0, 3};
    var B: set<int> := {-1, 0, 3, 4};
    CardinalitySubsetLt<int>(A, B);
  }

  // Test case for combination {1}/R10:
  //   PRE:  A < B
  //   POST Q1: |A| < |B|
  {
    var A: set<int> := {-2, -1};
    var B: set<int> := {-2, -1, 1, 3};
    CardinalitySubsetLt<int>(A, B);
  }

}

method TestsForstrategy()
  decreases *
{
  // Test case for combination {1}:
  //   PRE:  |P| > 1 && Special in P
  //   POST Q1: count == |P| - 1
  {
    var P: set<int> := {-2, -1, 0, 1, 2, 3, 4, 5};
    var Special := 3;
    var count := strategy<int>(P, Special);
    expect count == |P| - 1;
  }

  // Test case for combination {1}/OSpecial=0:
  //   PRE:  |P| > 1 && Special in P
  //   POST Q1: count == |P| - 1
  {
    var P: set<int> := {-2, -1, 0, 1, 2, 3, 4, 5};
    var Special := 0;
    var count := strategy<int>(P, Special);
    expect count == |P| - 1;
  }

  // Test case for combination {1}/OSpecial=1:
  //   PRE:  |P| > 1 && Special in P
  //   POST Q1: count == |P| - 1
  {
    var P: set<int> := {-2, -1, 0, 1, 2, 3, 4, 5};
    var Special := 1;
    var count := strategy<int>(P, Special);
    expect count == |P| - 1;
  }

  // Test case for combination {1}/R4:
  //   PRE:  |P| > 1 && Special in P
  //   POST Q1: count == |P| - 1
  {
    var P: set<int> := {-2, -1, 0, 1, 2, 3, 4, 5};
    var Special := 2;
    var count := strategy<int>(P, Special);
    expect count == |P| - 1;
  }

  // Test case for combination {1}/R5:
  //   PRE:  |P| > 1 && Special in P
  //   POST Q1: count == |P| - 1
  {
    var P: set<int> := {-2, -1, 0, 1, 2, 3, 4, 5};
    var Special := 4;
    var count := strategy<int>(P, Special);
    expect count == |P| - 1;
  }

  // Test case for combination {1}/R6:
  //   PRE:  |P| > 1 && Special in P
  //   POST Q1: count == |P| - 1
  {
    var P: set<int> := {-2, -1, 0, 1, 2, 3, 4, 5};
    var Special := 5;
    var count := strategy<int>(P, Special);
    expect count == |P| - 1;
  }

  // Test case for combination {1}/R7:
  //   PRE:  |P| > 1 && Special in P
  //   POST Q1: count == |P| - 1
  {
    var P: set<int> := {-2, -1, 0, 1, 2, 3, 4, 5};
    var Special := -1;
    var count := strategy<int>(P, Special);
    expect count == |P| - 1;
  }

  // Test case for combination {1}/R8:
  //   PRE:  |P| > 1 && Special in P
  //   POST Q1: count == |P| - 1
  {
    var P: set<int> := {-2, -1, 0, 1, 2, 3, 4, 5};
    var Special := -2;
    var count := strategy<int>(P, Special);
    expect count == |P| - 1;
  }

  // Test case for combination {1}/R9:
  //   PRE:  |P| > 1 && Special in P
  //   POST Q1: count == |P| - 1
  {
    var P: set<int> := {-2, 0, 1, 2, 3, 4, 5};
    var Special := 3;
    var count := strategy<int>(P, Special);
    expect count == |P| - 1;
  }

  // Test case for combination {1}/R10:
  //   PRE:  |P| > 1 && Special in P
  //   POST Q1: count == |P| - 1
  {
    var P: set<int> := {-2, 1, 2, 3, 4, 5};
    var Special := 3;
    var count := strategy<int>(P, Special);
    expect count == |P| - 1;
  }

}

method Main()
  decreases *
{
  TestsForCardinalitySubsetLt();
  print "TestsForCardinalitySubsetLt: all tests passed!\n";
  TestsForstrategy();
  print "TestsForstrategy: all tests passed!\n";
}
