// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny-Exercises_tmp_tmpjm75muf__Session7Exercises_ExerciseBinarySearch__2016_BBR_false.dfy
// Method: binarySearch
// Generated: 2026-04-24 19:54:16

// Dafny-Exercises_tmp_tmpjm75muf__Session7Exercises_ExerciseBinarySearch.dfy

predicate sorted(s: seq<int>)
  decreases s
{
  forall u: int, w: int {:trigger s[w], s[u]} :: 
    0 <= u < w < |s| ==>
      s[u] <= s[w]
}

method binarySearch(v: array<int>, elem: int) returns (p: int)
  requires sorted(v[0 .. v.Length])
  ensures -1 <= p < v.Length
  ensures (forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem) && forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  decreases v, elem
{
  var c, f := 0, v.Length - 1;
  while c <= f
    invariant 0 <= c <= v.Length && -1 <= f <= v.Length - 1 && c <= f + 1
    invariant (forall u: int {:trigger v[u]} :: 0 <= u < c ==> v[u] <= elem) && forall w: int {:trigger v[w]} :: f < w < v.Length ==> v[w] > elem
    decreases f - c
  {
    var m := (c + f) / 2;
    if v[m] <= elem {
      c := m + 1;
    } else {
      f := m - 1;
    }
  }
  p := c - 1;
}

method search(v: array<int>, elem: int) returns (b: bool)
  requires sorted(v[0 .. v.Length])
  ensures b == (elem in v[0 .. v.Length])
  decreases v, elem
{
  var p := binarySearch(v, elem);
  if p == -1 {
    b := false;
  } else {
    b := v[p] == elem;
  }
}

method {:tailrecursion false} binarySearchRec(v: array<int>, elem: int, c: int, f: int)
    returns (p: int)
  requires sorted(v[0 .. v.Length])
  requires 0 <= c <= f + 1 <= v.Length
  requires forall k: int {:trigger v[k]} :: 0 <= k < c ==> v[k] <= elem
  requires forall k: int {:trigger v[k]} :: f < k < v.Length ==> v[k] > elem
  ensures -1 <= p < v.Length
  ensures (forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem) && forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  decreases f - c
{
  if c == f + 1 {
    p := c - 1;
  } else {
    var m := (c + f) / 2;
    if v[m] <= elem {
      p := binarySearchRec(v, elem, m + 1, f);
    } else {
      p := binarySearchRec(v, elem, c, m - 1);
    }
  }
}

method otherbSearch(v: array<int>, elem: int)
    returns (b: bool, p: int)
  requires sorted(v[0 .. v.Length])
  ensures 0 <= p <= v.Length
  ensures b == (elem in v[0 .. v.Length])
  ensures b ==> p < v.Length && v[p] == elem
  ensures !b ==> (forall u: int {:trigger v[u]} :: 0 <= u < p ==> v[u] < elem) && forall w: int {:trigger v[w]} :: p <= w < v.Length ==> v[w] > elem
  decreases v, elem
{
  p := binarySearch(v, elem);
  if false {
    b := false;
    p := p + 1;
  } else {
    b := v[p] == elem;
    p := p + if b then 0 else 1;
  }
}


method TestsForbinarySearch()
{
  // Test case for combination {1}:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[0] [];
    var elem := 0;
    var p := binarySearch(v, elem);
    expect p == -1;
  }

  // Test case for combination {1}/Bp=0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[1] [-1];
    var elem := -1;
    var p := binarySearch(v, elem);
    expect p == 0;
  }

  // Test case for combination {1}/O|v|>=2:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[2] [0, 0];
    var elem := -2;
    var p := binarySearch(v, elem);
    expect p == -1;
  }

  // Test case for combination {1}/Oelem>0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[0] [];
    var elem := 401;
    var p := binarySearch(v, elem);
    expect p == -1;
  }

  // Test case for combination {1}/Op>0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[2] [-178, -178];
    var elem := -178;
    var p := binarySearch(v, elem);
    expect p == 1;
  }

  // Test case for combination {1}/R6:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[0] [];
    var elem := -179;
    var p := binarySearch(v, elem);
    expect p == -1;
  }

  // Test case for combination {1}/R7:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[1] [-179];
    var elem := -180;
    var p := binarySearch(v, elem);
    expect p == -1;
  }

  // Test case for combination {1}/R8:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[0] [];
    var elem := -181;
    var p := binarySearch(v, elem);
    expect p == -1;
  }

  // Test case for combination {1}/R9:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[0] [];
    var elem := -182;
    var p := binarySearch(v, elem);
    expect p == -1;
  }

  // Test case for combination {1}/R10:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[0] [];
    var elem := -183;
    var p := binarySearch(v, elem);
    expect p == -1;
  }

}

method TestsForsearch()
{
  // Test case for combination {1}:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: b == (elem in v[0 .. v.Length])
  {
    var v := new int[0] [];
    var elem := 0;
    var b := search(v, elem);
    expect b == false;
  }

  // Test case for combination {1}/O|v|=1:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: b == (elem in v[0 .. v.Length])
  {
    var v := new int[1] [2];
    var elem := 0;
    var b := search(v, elem);
    expect b == false;
  }

  // Test case for combination {1}/O|v|>=2:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: b == (elem in v[0 .. v.Length])
  {
    var v := new int[2] [-400, 175];
    var elem := 1;
    var b := search(v, elem);
    expect b == false;
  }

  // Test case for combination {1}/Oelem<0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: b == (elem in v[0 .. v.Length])
  {
    var v := new int[0] [];
    var elem := -1;
    var b := search(v, elem);
    expect b == false;
  }

  // Test case for combination {1}/Ob=true:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: b == (elem in v[0 .. v.Length])
  {
    var v := new int[1] [-2];
    var elem := -2;
    var b := search(v, elem);
    expect b == true;
  }

  // Test case for combination {1}/R6:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: b == (elem in v[0 .. v.Length])
  {
    var v := new int[0] [];
    var elem := 15;
    var b := search(v, elem);
    expect b == false;
  }

  // Test case for combination {1}/R7:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: b == (elem in v[0 .. v.Length])
  {
    var v := new int[0] [];
    var elem := 16;
    var b := search(v, elem);
    expect b == false;
  }

  // Test case for combination {1}/R8:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: b == (elem in v[0 .. v.Length])
  {
    var v := new int[0] [];
    var elem := 17;
    var b := search(v, elem);
    expect b == false;
  }

  // Test case for combination {1}/R9:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: b == (elem in v[0 .. v.Length])
  {
    var v := new int[0] [];
    var elem := 18;
    var b := search(v, elem);
    expect b == false;
  }

  // Test case for combination {1}/R10:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: b == (elem in v[0 .. v.Length])
  {
    var v := new int[0] [];
    var elem := 19;
    var b := search(v, elem);
    expect b == false;
  }

}

method TestsForbinarySearchRec()
{
  // Test case for combination {1}:
  //   PRE:  sorted(v[0 .. v.Length])
  //   PRE:  0 <= c <= f + 1 <= v.Length
  //   PRE:  forall k: int {:trigger v[k]} :: 0 <= k < c ==> v[k] <= elem
  //   PRE:  forall k: int {:trigger v[k]} :: f < k < v.Length ==> v[k] > elem
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[0] [];
    var elem := 0;
    var c := 0;
    var f := -1;
    var p := binarySearchRec(v, elem, c, f);
    expect p == -1;
  }

  // Test case for combination {1}/Bc=1:
  //   PRE:  sorted(v[0 .. v.Length])
  //   PRE:  0 <= c <= f + 1 <= v.Length
  //   PRE:  forall k: int {:trigger v[k]} :: 0 <= k < c ==> v[k] <= elem
  //   PRE:  forall k: int {:trigger v[k]} :: f < k < v.Length ==> v[k] > elem
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[1] [-175];
    var elem := 0;
    var c := 1;
    var f := 0;
    var p := binarySearchRec(v, elem, c, f);
    expect p == 0;
  }

  // Test case for combination {1}/Bc=f:
  //   PRE:  sorted(v[0 .. v.Length])
  //   PRE:  0 <= c <= f + 1 <= v.Length
  //   PRE:  forall k: int {:trigger v[k]} :: 0 <= k < c ==> v[k] <= elem
  //   PRE:  forall k: int {:trigger v[k]} :: f < k < v.Length ==> v[k] > elem
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[1] [400];
    var elem := -1;
    var c := 0;
    var f := 0;
    var p := binarySearchRec(v, elem, c, f);
    expect p == -1;
  }

  // Test case for combination {1}/Bc=f-1:
  //   PRE:  sorted(v[0 .. v.Length])
  //   PRE:  0 <= c <= f + 1 <= v.Length
  //   PRE:  forall k: int {:trigger v[k]} :: 0 <= k < c ==> v[k] <= elem
  //   PRE:  forall k: int {:trigger v[k]} :: f < k < v.Length ==> v[k] > elem
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[2] [0, 0];
    var elem := -2;
    var c := 0;
    var f := 1;
    var p := binarySearchRec(v, elem, c, f);
    expect p == -1;
  }

  // Test case for combination {1}/Oelem>0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   PRE:  0 <= c <= f + 1 <= v.Length
  //   PRE:  forall k: int {:trigger v[k]} :: 0 <= k < c ==> v[k] <= elem
  //   PRE:  forall k: int {:trigger v[k]} :: f < k < v.Length ==> v[k] > elem
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[0] [];
    var elem := 1;
    var c := 0;
    var f := -1;
    var p := binarySearchRec(v, elem, c, f);
    expect p == -1;
  }

  // Test case for combination {1}/Op>0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   PRE:  0 <= c <= f + 1 <= v.Length
  //   PRE:  forall k: int {:trigger v[k]} :: 0 <= k < c ==> v[k] <= elem
  //   PRE:  forall k: int {:trigger v[k]} :: f < k < v.Length ==> v[k] > elem
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[2] [-178, -178];
    var elem := -178;
    var c := 0;
    var f := 1;
    var p := binarySearchRec(v, elem, c, f);
    expect p == 1;
  }

  // Test case for combination {1}/R7:
  //   PRE:  sorted(v[0 .. v.Length])
  //   PRE:  0 <= c <= f + 1 <= v.Length
  //   PRE:  forall k: int {:trigger v[k]} :: 0 <= k < c ==> v[k] <= elem
  //   PRE:  forall k: int {:trigger v[k]} :: f < k < v.Length ==> v[k] > elem
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[0] [];
    var elem := -179;
    var c := 0;
    var f := -1;
    var p := binarySearchRec(v, elem, c, f);
    expect p == -1;
  }

  // Test case for combination {1}/R8:
  //   PRE:  sorted(v[0 .. v.Length])
  //   PRE:  0 <= c <= f + 1 <= v.Length
  //   PRE:  forall k: int {:trigger v[k]} :: 0 <= k < c ==> v[k] <= elem
  //   PRE:  forall k: int {:trigger v[k]} :: f < k < v.Length ==> v[k] > elem
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[0] [];
    var elem := -180;
    var c := 0;
    var f := -1;
    var p := binarySearchRec(v, elem, c, f);
    expect p == -1;
  }

  // Test case for combination {1}/R9:
  //   PRE:  sorted(v[0 .. v.Length])
  //   PRE:  0 <= c <= f + 1 <= v.Length
  //   PRE:  forall k: int {:trigger v[k]} :: 0 <= k < c ==> v[k] <= elem
  //   PRE:  forall k: int {:trigger v[k]} :: f < k < v.Length ==> v[k] > elem
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[0] [];
    var elem := -181;
    var c := 0;
    var f := -1;
    var p := binarySearchRec(v, elem, c, f);
    expect p == -1;
  }

  // Test case for combination {1}/R10:
  //   PRE:  sorted(v[0 .. v.Length])
  //   PRE:  0 <= c <= f + 1 <= v.Length
  //   PRE:  forall k: int {:trigger v[k]} :: 0 <= k < c ==> v[k] <= elem
  //   PRE:  forall k: int {:trigger v[k]} :: f < k < v.Length ==> v[k] > elem
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[1] [-2];
    var elem := -2;
    var c := 1;
    var f := 0;
    var p := binarySearchRec(v, elem, c, f);
    expect p == 0;
  }

}

method TestsForotherbSearch()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: 0 <= p
  //   POST Q2: p <= v.Length
  //   POST Q3: b == (elem in v[0 .. v.Length])
  //   POST Q4: !b
  //   POST Q5: forall u: int {:trigger v[u]} :: 0 <= u < p ==> v[u] < elem
  //   POST Q6: forall w: int {:trigger v[w]} :: p <= w < v.Length ==> v[w] > elem
  {
    var v := new int[0] [];
    var elem := 0;
    var b, p := otherbSearch(v, elem);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.otherbSearch(BigInteger[] v, BigInteger elem, Boolean& b, BigInteger& p) in C:\cygwin64\tmp\DafnyCBT_j0tyoxajbqm\runner.cs:line 6663
    // runtime error: at _module.__default.TestCase__30() in C:\cygwin64\tmp\DafnyCBT_j0tyoxajbqm\runner.cs:line 7771
    // expect b == false;
    // expect p == 0;
  }

  // Test case for combination {3}:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: 0 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: b == (elem in v[0 .. v.Length])
  //   POST Q4: b
  //   POST Q5: v[p] == elem
  {
    var v := new int[1] [175];
    var elem := 175;
    var b, p := otherbSearch(v, elem);
    expect b == true;
    expect p == 0;
  }

  // Test case for combination {2}/Bp=1:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: 0 <= p
  //   POST Q2: p <= v.Length
  //   POST Q3: b == (elem in v[0 .. v.Length])
  //   POST Q4: !b
  //   POST Q5: forall u: int {:trigger v[u]} :: 0 <= u < p ==> v[u] < elem
  //   POST Q6: forall w: int {:trigger v[w]} :: p <= w < v.Length ==> v[w] > elem
  {
    var v := new int[1] [-2];
    var elem := -1;
    var b, p := otherbSearch(v, elem);
    expect b == false;
    expect p == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bp=v_len-1:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: 0 <= p
  //   POST Q2: p <= v.Length
  //   POST Q3: b == (elem in v[0 .. v.Length])
  //   POST Q4: !b
  //   POST Q5: forall u: int {:trigger v[u]} :: 0 <= u < p ==> v[u] < elem
  //   POST Q6: forall w: int {:trigger v[w]} :: p <= w < v.Length ==> v[w] > elem
  {
    var v := new int[1] [-1];
    var elem := -2;
    var b, p := otherbSearch(v, elem);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.otherbSearch(BigInteger[] v, BigInteger elem, Boolean& b, BigInteger& p) in C:\cygwin64\tmp\DafnyCBT_j0tyoxajbqm\runner.cs:line 6663
    // runtime error: at _module.__default.TestCase__33() in C:\cygwin64\tmp\DafnyCBT_j0tyoxajbqm\runner.cs:line 7900
    // expect b == false;
    // expect p == 0;
  }

  // Test case for combination {3}/Bp=1:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: 0 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: b == (elem in v[0 .. v.Length])
  //   POST Q4: b
  //   POST Q5: v[p] == elem
  {
    var v := new int[2] [-400, 175];
    var elem := 175;
    var b, p := otherbSearch(v, elem);
    expect b == true;
    expect p == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/O|v|>=2:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: 0 <= p
  //   POST Q2: p <= v.Length
  //   POST Q3: b == (elem in v[0 .. v.Length])
  //   POST Q4: !b
  //   POST Q5: forall u: int {:trigger v[u]} :: 0 <= u < p ==> v[u] < elem
  //   POST Q6: forall w: int {:trigger v[w]} :: p <= w < v.Length ==> v[w] > elem
  {
    var v := new int[2] [0, 0];
    var elem := -2;
    var b, p := otherbSearch(v, elem);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.otherbSearch(BigInteger[] v, BigInteger elem, Boolean& b, BigInteger& p) in C:\cygwin64\tmp\DafnyCBT_j0tyoxajbqm\runner.cs:line 6663
    // runtime error: at _module.__default.TestCase__35() in C:\cygwin64\tmp\DafnyCBT_j0tyoxajbqm\runner.cs:line 7988
    // expect b == false;
    // expect p == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Oelem>0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: 0 <= p
  //   POST Q2: p <= v.Length
  //   POST Q3: b == (elem in v[0 .. v.Length])
  //   POST Q4: !b
  //   POST Q5: forall u: int {:trigger v[u]} :: 0 <= u < p ==> v[u] < elem
  //   POST Q6: forall w: int {:trigger v[w]} :: p <= w < v.Length ==> v[w] > elem
  {
    var v := new int[0] [];
    var elem := 176;
    var b, p := otherbSearch(v, elem);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.otherbSearch(BigInteger[] v, BigInteger elem, Boolean& b, BigInteger& p) in C:\cygwin64\tmp\DafnyCBT_j0tyoxajbqm\runner.cs:line 6663
    // runtime error: at _module.__default.TestCase__36() in C:\cygwin64\tmp\DafnyCBT_j0tyoxajbqm\runner.cs:line 8030
    // expect b == false;
    // expect p == 0;
  }

  // Test case for combination {3}/Oelem=0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: 0 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: b == (elem in v[0 .. v.Length])
  //   POST Q4: b
  //   POST Q5: v[p] == elem
  {
    var v := new int[1] [0];
    var elem := 0;
    var b, p := otherbSearch(v, elem);
    expect b == true;
    expect p == 0;
  }

  // Test case for combination {3}/Oelem<0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: 0 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: b == (elem in v[0 .. v.Length])
  //   POST Q4: b
  //   POST Q5: v[p] == elem
  {
    var v := new int[1] [-1];
    var elem := -1;
    var b, p := otherbSearch(v, elem);
    expect b == true;
    expect p == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R6:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: 0 <= p
  //   POST Q2: p <= v.Length
  //   POST Q3: b == (elem in v[0 .. v.Length])
  //   POST Q4: !b
  //   POST Q5: forall u: int {:trigger v[u]} :: 0 <= u < p ==> v[u] < elem
  //   POST Q6: forall w: int {:trigger v[w]} :: p <= w < v.Length ==> v[w] > elem
  {
    var v := new int[0] [];
    var elem := -3;
    var b, p := otherbSearch(v, elem);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.otherbSearch(BigInteger[] v, BigInteger elem, Boolean& b, BigInteger& p) in C:\cygwin64\tmp\DafnyCBT_j0tyoxajbqm\runner.cs:line 6663
    // runtime error: at _module.__default.TestCase__39() in C:\cygwin64\tmp\DafnyCBT_j0tyoxajbqm\runner.cs:line 8158
    // expect b == false;
    // expect p == 0;
  }

}

method Main()
{
  TestsForbinarySearch();
  print "TestsForbinarySearch: all non-failing tests passed!\n";
  TestsForsearch();
  print "TestsForsearch: all non-failing tests passed!\n";
  TestsForbinarySearchRec();
  print "TestsForbinarySearchRec: all non-failing tests passed!\n";
  TestsForotherbSearch();
  print "TestsForotherbSearch: all non-failing tests passed!\n";
}
