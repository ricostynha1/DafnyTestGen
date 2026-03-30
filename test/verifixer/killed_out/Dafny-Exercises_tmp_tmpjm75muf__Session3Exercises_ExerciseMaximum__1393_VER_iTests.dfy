// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Dafny-Exercises_tmp_tmpjm75muf__Session3Exercises_ExerciseMaximum__1393_VER_i.dfy
// Method: mmaximum1
// Generated: 2026-03-26 14:58:51

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
    j := i + 1;
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
  {
    var v := new int[1] [-38];
    var i := mmaximum1(v);
    expect i == 0;
  }

  // Test case for combination {1}:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[2] [-38, 7719];
    var i := mmaximum1(v);
    expect i == 1;
  }

  // Test case for combination {1}/Bv=3:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[3] [-12385, -12384, -12383];
    var i := mmaximum1(v);
    expect i == 2;
  }

  // Test case for combination {1}:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[1] [-38];
    var i := mmaximum2(v);
    expect i == 0;
  }

  // Test case for combination {1}:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[2] [-38, 7719];
    var i := mmaximum2(v);
    expect i == 1;
  }

  // Test case for combination {1}/Bv=3:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  {
    var v := new int[3] [-12385, -12384, -12383];
    var i := mmaximum2(v);
    expect i == 2;
  }

  // Test case for combination {1}:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  {
    var v := new int[1] [0];
    var i := mfirstMaximum(v);
    expect i == 0;
  }

  // Test case for combination {1}:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  {
    var v := new int[2] [-7720, -7719];
    var i := mfirstMaximum(v);
    expect i == 1;
  }

  // Test case for combination {1}/Bv=3:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST: forall l: int {:trigger v[l]} :: 0 <= l < i ==> v[i] > v[l]
  {
    var v := new int[3] [7717, 7718, 7719];
    var i := mfirstMaximum(v);
    expect i == 2;
  }

  // Test case for combination {1}:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[1] [-38];
    var i := mlastMaximum(v);
    expect i == 0;
  }

  // Test case for combination {1}:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[2] [-38, -39];
    var i := mlastMaximum(v);
    expect i == 0;
  }

  // Test case for combination {1}/Bv=3:
  //   PRE:  v.Length > 0
  //   POST: 0 <= i < v.Length
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> v[i] >= v[k]
  //   POST: forall l: int {:trigger v[l]} :: i < l < v.Length ==> v[i] > v[l]
  {
    var v := new int[3] [23676, 23674, 23675];
    var i := mlastMaximum(v);
    expect i == 0;
  }

  // Test case for combination {1}:
  //   PRE:  v.Length > 0
  //   POST: m in v[..]
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[1] [0];
    var m := mmaxvalue1(v);
    expect m == 0;
  }

  // Test case for combination {1}:
  //   PRE:  v.Length > 0
  //   POST: m in v[..]
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[2] [-38, 0];
    var m := mmaxvalue1(v);
    expect m == 0;
  }

  // Test case for combination {1}/Bv=3:
  //   PRE:  v.Length > 0
  //   POST: m in v[..]
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[3] [28955, 28956, 28957];
    var m := mmaxvalue1(v);
    expect m == 28957;
  }

  // Test case for combination {1}:
  //   PRE:  v.Length > 0
  //   POST: m in v[..]
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[1] [0];
    var m := mmaxvalue2(v);
    expect m == 0;
  }

  // Test case for combination {1}:
  //   PRE:  v.Length > 0
  //   POST: m in v[..]
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[2] [-38, 0];
    var m := mmaxvalue2(v);
    expect m == 0;
  }

  // Test case for combination {1}/Bv=3:
  //   PRE:  v.Length > 0
  //   POST: m in v[..]
  //   POST: forall k: int {:trigger v[k]} :: 0 <= k < v.Length ==> m >= v[k]
  {
    var v := new int[3] [28955, 28956, 28957];
    var m := mmaxvalue2(v);
    expect m == 28957;
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
