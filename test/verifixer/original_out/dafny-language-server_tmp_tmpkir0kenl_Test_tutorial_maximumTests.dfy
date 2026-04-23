// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-language-server_tmp_tmpkir0kenl_Test_tutorial_maximum.dfy
// Method: Maximum
// Generated: 2026-04-22 21:31:35

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
    if values[idx] > max {
      max := values[idx];
    }
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
  // Test case for combination {1}/Rel:
  //   PRE:  values != []
  //   POST Q1: max in values
  //   POST Q2: forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= max
  {
    var values: seq<int> := [-10, -9];
    var max := Maximum(values);
    expect max == -9;
  }

  // Test case for combination {1}/O|values|=1:
  //   PRE:  values != []
  //   POST Q1: max in values
  //   POST Q2: forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= max
  {
    var values: seq<int> := [-10];
    var max := Maximum(values);
    expect max == -10;
  }

  // Test case for combination {1}/Omax=0:
  //   PRE:  values != []
  //   POST Q1: max in values
  //   POST Q2: forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= max
  {
    var values: seq<int> := [-1, -10, -6, 0];
    var max := Maximum(values);
    expect max == 0;
  }

  // Test case for combination {1}/Omax>0:
  //   PRE:  values != []
  //   POST Q1: max in values
  //   POST Q2: forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= max
  {
    var values: seq<int> := [4];
    var max := Maximum(values);
    expect max == 4;
  }

}

method Main()
{
  TestsForMaximum();
  print "TestsForMaximum: all non-failing tests passed!\n";
}
