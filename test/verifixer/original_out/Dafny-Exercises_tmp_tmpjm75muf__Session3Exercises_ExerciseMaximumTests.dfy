// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Dafny-Exercises_tmp_tmpjm75muf__Session3Exercises_ExerciseMaximum.dfy
// Method: mmaximum1
// Generated: 2026-04-08 19:08:48

// Dafny-Exercises_tmp_tmpjm75muf__Session3Exercises_ExerciseMaximum.dfy

method mmaximum1(v: array<int>) returns (i: int)
  requires v.Length > 0
  ensures 0 <= i < v.Length
  ensures forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  decreases v
{
  var j := 1;
  i := 0;
  while j < v.Length
    invariant 0 <= j <= v.Length
    invariant 0 <= i < j
    invariant forall k: int {:trigger v[k]} :: 0 <= k < j ==> v[i] >= v[k]
    decreases v.Length - j
  {
    if v[j] > v[i] {
      i := j;
    }
    j := j + 1;
  }
}

method mmaximum2(v: array<int>) returns (i: int)
  requires v.Length > 0
  ensures 0 <= i < v.Length
  ensures forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  decreases v
{
  var j := v.Length - 2;
  i := v.Length - 1;
  while j >= 0
    invariant 0 <= i < v.Length
    invariant -1 <= j < v.Length - 1
    invariant forall k: int {:trigger v[k]} :: v.Length > k > j ==> v[k] <= v[i]
    decreases j
  {
    if v[j] > v[i] {
      i := j;
    }
    j := j - 1;
  }
}

method mfirstMaximum(v: array<int>) returns (i: int)
  requires v.Length > 0
  ensures 0 <= i < v.Length
  ensures forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  ensures forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  decreases v
{
  var j := 1;
  i := 0;
  while j < v.Length
    invariant 0 <= j <= v.Length
    invariant 0 <= i < j
    invariant forall k: int {:trigger v[k]} :: 0 <= k < j ==> v[i] >= v[k]
    invariant forall k: int {:trigger v[k]} :: 0 <= k < i ==> v[i] > v[k]
    decreases v.Length - j
  {
    if v[j] > v[i] {
      i := j;
    }
    j := j + 1;
  }
}

method mlastMaximum(v: array<int>) returns (i: int)
  requires v.Length > 0
  ensures 0 <= i < v.Length
  ensures forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  ensures forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  decreases v
{
  var j := v.Length - 2;
  i := v.Length - 1;
  while j >= 0
    invariant -1 <= j < v.Length - 1
    invariant 0 <= i < v.Length
    invariant forall k: int {:trigger v[k]} :: v.Length > k > j ==> v[k] <= v[i]
    invariant forall k: int {:trigger v[k]} :: v.Length > k > i ==> v[k] < v[i]
    decreases j
  {
    if v[j] > v[i] {
      i := j;
    }
    j := j - 1;
  }
}

method mmaxvalue1(v: array<int>) returns (m: int)
  requires v.Length > 0
  ensures m in v[..]
  ensures forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  decreases v
{
  var i := mmaximum1(v);
  m := v[i];
}

method mmaxvalue2(v: array<int>) returns (m: int)
  requires v.Length > 0
  ensures m in v[..]
  ensures forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  decreases v
{
  var i := mmaximum2(v);
  m := v[i];
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   ENSURES: 0 <= i < v.Length
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [-38];
    var i := mmaximum1(v);
    expect i == 0;
  }

  // Test case for combination {1}/Bv=2:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   ENSURES: 0 <= i < v.Length
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[2] [7719, 7720];
    var i := mmaximum1(v);
    expect i == 1;
  }

  // Test case for combination {1}/Bv=3:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   ENSURES: 0 <= i < v.Length
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[3] [-12385, -12384, -12383];
    var i := mmaximum1(v);
    expect i == 2;
  }

  // Test case for combination {1}:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   ENSURES: 0 <= i < v.Length
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [-38];
    var i := mmaximum2(v);
    expect i == 0;
  }

  // Test case for combination {1}/Bv=2:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   ENSURES: 0 <= i < v.Length
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[2] [7719, 7720];
    var i := mmaximum2(v);
    expect i == 1;
  }

  // Test case for combination {1}/Bv=3:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   ENSURES: 0 <= i < v.Length
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[3] [-12385, -12384, -12383];
    var i := mmaximum2(v);
    expect i == 2;
  }

  // Test case for combination {1}/Oi>0:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   ENSURES: 0 <= i < v.Length
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[4] [-38, -21238, -2437, 7719];
    var i := mmaximum2(v);
    expect i == 3;
  }

  // Test case for combination {1}/Oi=0:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   ENSURES: 0 <= i < v.Length
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[5] [7719, -38, -21238, -2437, -8855];
    var i := mmaximum2(v);
    expect i == 0;
  }

  // Test case for combination {1}:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  //   ENSURES: 0 <= i < v.Length
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   ENSURES: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  {
    var v := new int[1] [0];
    var i := mfirstMaximum(v);
    expect i == 0;
  }

  // Test case for combination {1}/Bv=2:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  //   ENSURES: 0 <= i < v.Length
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   ENSURES: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  {
    var v := new int[2] [57702, 57703];
    var i := mfirstMaximum(v);
    expect i == 1;
  }

  // Test case for combination {1}/Bv=3:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  //   ENSURES: 0 <= i < v.Length
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   ENSURES: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  {
    var v := new int[3] [7717, 7718, 7719];
    var i := mfirstMaximum(v);
    expect i == 2;
  }

  // Test case for combination {1}/Oi>0:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  //   ENSURES: 0 <= i < v.Length
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   ENSURES: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  {
    var v := new int[4] [7719, 0, 0, 7720];
    var i := mfirstMaximum(v);
    expect i == 3;
  }

  // Test case for combination {1}/Oi=0:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  //   ENSURES: 0 <= i < v.Length
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   ENSURES: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  {
    var v := new int[5] [7719, -38, -21238, -2437, -8855];
    var i := mfirstMaximum(v);
    expect i == 0;
  }

  // Test case for combination {1}:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  //   ENSURES: 0 <= i < v.Length
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   ENSURES: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[1] [-38];
    var i := mlastMaximum(v);
    expect i == 0;
  }

  // Test case for combination {1}/Bv=2:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  //   ENSURES: 0 <= i < v.Length
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   ENSURES: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[2] [7719, 7718];
    var i := mlastMaximum(v);
    expect i == 0;
  }

  // Test case for combination {1}/Bv=3:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  //   ENSURES: 0 <= i < v.Length
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   ENSURES: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[3] [23676, 23674, 23675];
    var i := mlastMaximum(v);
    expect i == 0;
  }

  // Test case for combination {1}/Oi>0:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  //   ENSURES: 0 <= i < v.Length
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   ENSURES: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[4] [-38, 7719, 7718, 5281];
    var i := mlastMaximum(v);
    expect i == 1;
  }

  // Test case for combination {1}/Oi=0:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  //   ENSURES: 0 <= i < v.Length
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   ENSURES: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[8] [23676, 15956, 23675, 23675, 23675, -8855, -11797, -8365];
    var i := mlastMaximum(v);
    expect i == 0;
  }

  // Test case for combination {1}:
  //   PRE:  v.Length > 0
  //   POST: m in v[..]
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  //   ENSURES: m in v[..]
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[1] [0];
    var m := mmaxvalue1(v);
    expect m == 0;
  }

  // Test case for combination {1}/Bv=2:
  //   PRE:  v.Length > 0
  //   POST: m in v[..]
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  //   ENSURES: m in v[..]
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[2] [-1, 0];
    var m := mmaxvalue1(v);
    expect m == 0;
  }

  // Test case for combination {1}/Bv=3:
  //   PRE:  v.Length > 0
  //   POST: m in v[..]
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  //   ENSURES: m in v[..]
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[3] [28955, 28956, 28957];
    var m := mmaxvalue1(v);
    expect m == 28957;
  }

  // Test case for combination {1}/Om>0:
  //   PRE:  v.Length > 0
  //   POST: m in v[..]
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  //   ENSURES: m in v[..]
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[4] [-38, -21238, -2437, 7720];
    var m := mmaxvalue1(v);
    expect m == 7720;
  }

  // Test case for combination {1}/Om<0:
  //   PRE:  v.Length > 0
  //   POST: m in v[..]
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  //   ENSURES: m in v[..]
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[5] [-39, -39, -39, -39, -39];
    var m := mmaxvalue1(v);
    expect m == -39;
  }

  // Test case for combination {1}/Om=0:
  //   PRE:  v.Length > 0
  //   POST: m in v[..]
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  //   ENSURES: m in v[..]
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[6] [-38, -7719, -21238, -2437, -8855, 0];
    var m := mmaxvalue1(v);
    expect m == 0;
  }

  // Test case for combination {1}:
  //   PRE:  v.Length > 0
  //   POST: m in v[..]
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  //   ENSURES: m in v[..]
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[1] [0];
    var m := mmaxvalue2(v);
    expect m == 0;
  }

  // Test case for combination {1}/Bv=2:
  //   PRE:  v.Length > 0
  //   POST: m in v[..]
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  //   ENSURES: m in v[..]
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[2] [-1, 0];
    var m := mmaxvalue2(v);
    expect m == 0;
  }

  // Test case for combination {1}/Bv=3:
  //   PRE:  v.Length > 0
  //   POST: m in v[..]
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  //   ENSURES: m in v[..]
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[3] [28955, 28956, 28957];
    var m := mmaxvalue2(v);
    expect m == 28957;
  }

  // Test case for combination {1}/Om>0:
  //   PRE:  v.Length > 0
  //   POST: m in v[..]
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  //   ENSURES: m in v[..]
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[4] [-38, -21238, -2437, 7720];
    var m := mmaxvalue2(v);
    expect m == 7720;
  }

  // Test case for combination {1}/Om<0:
  //   PRE:  v.Length > 0
  //   POST: m in v[..]
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  //   ENSURES: m in v[..]
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[5] [-39, -39, -39, -39, -39];
    var m := mmaxvalue2(v);
    expect m == -39;
  }

  // Test case for combination {1}/Om=0:
  //   PRE:  v.Length > 0
  //   POST: m in v[..]
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  //   ENSURES: m in v[..]
  //   ENSURES: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[6] [-38, -7719, -21238, -2437, -8855, 0];
    var m := mmaxvalue2(v);
    expect m == 0;
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
