// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-language-server_tmp_tmpkir0kenl_Test_tutorial_maximum.dfy
// Method: Maximum
// Generated: 2026-03-25 22:38:16

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  values != []
  //   POST: max in values
  //   POST: forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= max
  {
    var values: seq<int> := [0];
    var max := Maximum(values);
    expect max == 0;
  }

  // Test case for combination {1}:
  //   PRE:  values != []
  //   POST: max in values
  //   POST: forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= max
  {
    var values: seq<int> := [0, -38];
    var max := Maximum(values);
    expect max == 0;
  }

  // Test case for combination {1}/Bvalues=3:
  //   PRE:  values != []
  //   POST: max in values
  //   POST: forall i: int {:trigger values[i]} | 0 <= i < |values| :: values[i] <= max
  {
    var values: seq<int> := [7717, 7718, 7719];
    var max := Maximum(values);
    expect max == 7719;
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
