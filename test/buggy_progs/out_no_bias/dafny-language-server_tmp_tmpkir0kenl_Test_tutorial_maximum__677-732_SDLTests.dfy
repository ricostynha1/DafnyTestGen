// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-language-server_tmp_tmpkir0kenl_Test_tutorial_maximum__677-732_SDL.dfy
// Method: Maximum
// Generated: 2026-04-24 11:54:17

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
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  values != []
  //   POST Q1: max in values
  //   POST Q2: forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= max
  {
    var values: seq<int> := [16082, 16083];
    var max := Maximum(values);
    // expect max == 16083; // got 16082
  }

  // Test case for combination {1}/V2:
  //   PRE:  values != []
  //   POST Q1: max in values
  //   POST Q2: forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= max  // VACUOUS (forced true by other literals for this ins)
  {
    var values: seq<int> := [0];
    var max := Maximum(values);
    expect max == 0;
  }

  // Test case for combination {1}/Omax<0:
  //   PRE:  values != []
  //   POST Q1: max in values
  //   POST Q2: forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= max
  {
    var values: seq<int> := [-1];
    var max := Maximum(values);
    expect max == -1;
  }

}

method Main()
{
  TestsForMaximum();
  print "TestsForMaximum: all non-failing tests passed!\n";
}
