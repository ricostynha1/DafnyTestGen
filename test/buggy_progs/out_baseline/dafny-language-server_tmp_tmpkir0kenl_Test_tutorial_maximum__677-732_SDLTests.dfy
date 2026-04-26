// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-language-server_tmp_tmpkir0kenl_Test_tutorial_maximum__677-732_SDL.dfy
// Method: Maximum
// Generated: 2026-04-24 19:57:18

// dafny-language-server_tmp_tmpkir0kenl_Test_tutorial_maximum.dfy

method Maximum(values: seq<int>) returns (max: int)
  requires values != []
  ensures max in values
  ensures forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= max
  decreases values
{
  max := values[0];
  var idx := 0;
  while idx < |values|
    invariant max in values
    invariant idx <= |values|
    invariant forall j: int {:trigger values[j]} | 0 <= j < idx :: values[j] <= max
    decreases |values| - idx
  {
    idx := idx + 1;
  }
}

lemma MaximumIsUnique(values: seq<int>, m1: int, m2: int)
  requires m1 in values && forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= m1
  requires m2 in values && forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= m2
  ensures m1 == m2
  decreases values, m1, m2
{
}


method TestsForMaximum()
{
  // Test case for combination {1}:
  //   PRE:  values != []
  //   POST Q1: max in values
  //   POST Q2: forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= max
  {
    var values: seq<int> := [0];
    var max := Maximum(values);
    expect max == 0;
  }

  // Test case for combination {1}/O|values|>=2:
  //   PRE:  values != []
  //   POST Q1: max in values
  //   POST Q2: forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= max
  {
    var values: seq<int> := [-1, -176];
    var max := Maximum(values);
    expect max == -1;
  }

  // Test case for combination {1}/Omax>0:
  //   PRE:  values != []
  //   POST Q1: max in values
  //   POST Q2: forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= max
  {
    var values: seq<int> := [576];
    var max := Maximum(values);
    expect max == 576;
  }

  // Test case for combination {1}/R4:
  //   PRE:  values != []
  //   POST Q1: max in values
  //   POST Q2: forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= max
  {
    var values: seq<int> := [-2];
    var max := Maximum(values);
    expect max == -2;
  }

  // Test case for combination {1}/R5:
  //   PRE:  values != []
  //   POST Q1: max in values
  //   POST Q2: forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= max
  {
    var values: seq<int> := [176];
    var max := Maximum(values);
    expect max == 176;
  }

  // Test case for combination {1}/R6:
  //   PRE:  values != []
  //   POST Q1: max in values
  //   POST Q2: forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= max
  {
    var values: seq<int> := [-3];
    var max := Maximum(values);
    expect max == -3;
  }

  // Test case for combination {1}/R7:
  //   PRE:  values != []
  //   POST Q1: max in values
  //   POST Q2: forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= max
  {
    var values: seq<int> := [-4];
    var max := Maximum(values);
    expect max == -4;
  }

  // Test case for combination {1}/R8:
  //   PRE:  values != []
  //   POST Q1: max in values
  //   POST Q2: forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= max
  {
    var values: seq<int> := [-5];
    var max := Maximum(values);
    expect max == -5;
  }

  // Test case for combination {1}/R9:
  //   PRE:  values != []
  //   POST Q1: max in values
  //   POST Q2: forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= max
  {
    var values: seq<int> := [1];
    var max := Maximum(values);
    expect max == 1;
  }

  // Test case for combination {1}/R10:
  //   PRE:  values != []
  //   POST Q1: max in values
  //   POST Q2: forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= max
  {
    var values: seq<int> := [-6];
    var max := Maximum(values);
    expect max == -6;
  }

}

method Main()
{
  TestsForMaximum();
  print "TestsForMaximum: all non-failing tests passed!\n";
}
