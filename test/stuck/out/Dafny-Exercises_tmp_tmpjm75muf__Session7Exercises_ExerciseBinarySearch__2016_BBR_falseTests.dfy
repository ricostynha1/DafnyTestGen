// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\stuck\in\Dafny-Exercises_tmp_tmpjm75muf__Session7Exercises_ExerciseBinarySearch__2016_BBR_false.dfy
// Method: binarySearch
// Generated: 2026-04-22 19:33:46

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


method Passing()
{
  // Test case for combination {1}/Rel:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[1] [10];
    var elem := 10;
    var p := binarySearch(v, elem);
    expect p == 0;
  }

  // Test case for combination {1}/Bp=-1:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[1] [-3];
    var elem := -10;
    var p := binarySearch(v, elem);
    expect p == -1;
  }

  // Test case for combination {1}/O|v|=0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[0] [];
    var elem := -10;
    var p := binarySearch(v, elem);
    expect p == -1;
  }

  // Test case for combination {1}/O|v|>=2:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[2] [-7, -4];
    var elem := -10;
    var p := binarySearch(v, elem);
    expect p == -1;
  }

  // Test case for combination {1}/Oelem=0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[1] [10];
    var elem := 0;
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
    var v := new int[2] [-8, -8];
    var elem := -8;
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
    var v := new int[1] [9];
    var elem := -9;
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
    var v := new int[1] [-1];
    var elem := -10;
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
    var v := new int[1] [8];
    var elem := 7;
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
    var v := new int[1] [-1];
    var elem := -9;
    var p := binarySearch(v, elem);
    expect p == -1;
  }

  // Test case for combination {1}:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: b == (elem in v[0 .. v.Length])
  {
    var v := new int[1] [-10];
    var elem := -10;
    var b := search(v, elem);
    expect b == true;
  }

  // Test case for combination {1}/O|v|=0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: b == (elem in v[0 .. v.Length])
  {
    var v := new int[0] [];
    var elem := -10;
    var b := search(v, elem);
    expect b == false;
  }

  // Test case for combination {1}/O|v|>=2:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: b == (elem in v[0 .. v.Length])
  {
    var v := new int[2] [-6, -6];
    var elem := -9;
    var b := search(v, elem);
    expect b == false;
  }

  // Test case for combination {1}/Oelem=0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: b == (elem in v[0 .. v.Length])
  {
    var v := new int[1] [-10];
    var elem := 0;
    var b := search(v, elem);
    expect b == false;
  }

  // Test case for combination {1}/Oelem>0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: b == (elem in v[0 .. v.Length])
  {
    var v := new int[1] [10];
    var elem := 10;
    var b := search(v, elem);
    expect b == true;
  }

  // Test case for combination {1}/R6:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: b == (elem in v[0 .. v.Length])
  {
    var v := new int[1] [-10];
    var elem := -8;
    var b := search(v, elem);
    expect b == false;
  }

  // Test case for combination {1}/R7:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: b == (elem in v[0 .. v.Length])
  {
    var v := new int[1] [10];
    var elem := -7;
    var b := search(v, elem);
    expect b == false;
  }

  // Test case for combination {1}/R8:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: b == (elem in v[0 .. v.Length])
  {
    var v := new int[1] [9];
    var elem := -10;
    var b := search(v, elem);
    expect b == false;
  }

  // Test case for combination {1}/R9:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: b == (elem in v[0 .. v.Length])
  {
    var v := new int[1] [-9];
    var elem := -9;
    var b := search(v, elem);
    expect b == true;
  }

  // Test case for combination {1}/R10:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: b == (elem in v[0 .. v.Length])
  {
    var v := new int[1] [10];
    var elem := -10;
    var b := search(v, elem);
    expect b == false;
  }

  // Test case for combination {1}/Rel:
  //   PRE:  sorted(v[0 .. v.Length])
  //   PRE:  0 <= c <= f + 1 <= v.Length
  //   PRE:  forall k: int {:trigger v[k]} :: 0 <= k < c ==> v[k] <= elem
  //   PRE:  forall k: int {:trigger v[k]} :: f < k < v.Length ==> v[k] > elem
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[4] [-6, -6, -6, -6];
    var elem := -6;
    var c := 4;
    var f := 3;
    var p := binarySearchRec(v, elem, c, f);
    expect p == 3;
  }

  // Test case for combination {1}/Bc=0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   PRE:  0 <= c <= f + 1 <= v.Length
  //   PRE:  forall k: int {:trigger v[k]} :: 0 <= k < c ==> v[k] <= elem
  //   PRE:  forall k: int {:trigger v[k]} :: f < k < v.Length ==> v[k] > elem
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[1] [-4];
    var elem := -10;
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
    var v := new int[3] [-7, -7, -7];
    var elem := -7;
    var c := 1;
    var f := 2;
    var p := binarySearchRec(v, elem, c, f);
    expect p == 2;
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
    var v := new int[3] [-8, 4, 5];
    var elem := 4;
    var c := 2;
    var f := 2;
    var p := binarySearchRec(v, elem, c, f);
    expect p == 1;
  }

  // Test case for combination {1}/Bp=0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   PRE:  0 <= c <= f + 1 <= v.Length
  //   PRE:  forall k: int {:trigger v[k]} :: 0 <= k < c ==> v[k] <= elem
  //   PRE:  forall k: int {:trigger v[k]} :: f < k < v.Length ==> v[k] > elem
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[3] [-10, -3, -3];
    var elem := -10;
    var c := 1;
    var f := 2;
    var p := binarySearchRec(v, elem, c, f);
    expect p == 0;
  }

  // Test case for combination {1}/O|v|=0:
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
    var elem := -10;
    var c := 0;
    var f := -1;
    var p := binarySearchRec(v, elem, c, f);
    expect p == -1;
  }

  // Test case for combination {1}/Oelem=0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   PRE:  0 <= c <= f + 1 <= v.Length
  //   PRE:  forall k: int {:trigger v[k]} :: 0 <= k < c ==> v[k] <= elem
  //   PRE:  forall k: int {:trigger v[k]} :: f < k < v.Length ==> v[k] > elem
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[3] [-1, -1, 3];
    var elem := 0;
    var c := 2;
    var f := 2;
    var p := binarySearchRec(v, elem, c, f);
    expect p == 1;
  }

  // Test case for combination {1}/Of=0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   PRE:  0 <= c <= f + 1 <= v.Length
  //   PRE:  forall k: int {:trigger v[k]} :: 0 <= k < c ==> v[k] <= elem
  //   PRE:  forall k: int {:trigger v[k]} :: f < k < v.Length ==> v[k] > elem
  //   POST Q1: -1 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: forall u: int {:trigger v[u]} :: 0 <= u <= p ==> v[u] <= elem
  //   POST Q4: forall w: int {:trigger v[w]} :: p < w < v.Length ==> v[w] > elem
  {
    var v := new int[1] [-10];
    var elem := -10;
    var c := 1;
    var f := 0;
    var p := binarySearchRec(v, elem, c, f);
    expect p == 0;
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
    var v := new int[3] [-10, -8, -8];
    var elem := -8;
    var c := 3;
    var f := 2;
    var p := binarySearchRec(v, elem, c, f);
    expect p == 2;
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
    var v := new int[3] [-10, -10, -10];
    var elem := -9;
    var c := 3;
    var f := 2;
    var p := binarySearchRec(v, elem, c, f);
    expect p == 2;
  }

  // Test case for combination {2}/Rel:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: 0 <= p
  //   POST Q2: p <= v.Length
  //   POST Q3: b == (elem in v[0 .. v.Length])
  //   POST Q4: !b
  //   POST Q5: forall u: int {:trigger v[u]} :: 0 <= u < p ==> v[u] < elem
  //   POST Q6: forall w: int {:trigger v[w]} :: p <= w < v.Length ==> v[w] > elem
  {
    var v := new int[1] [9];
    var elem := 10;
    var b, p := otherbSearch(v, elem);
    expect b == false;
    expect p == 1;
  }

  // Test case for combination {3}/Rel:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: 0 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: b == (elem in v[0 .. v.Length])
  //   POST Q4: b
  //   POST Q5: v[p] == elem
  {
    var v := new int[2] [-10, -9];
    var elem := -10;
    var b, p := otherbSearch(v, elem);
    expect b == true;
    expect p == 0;
  }

  // Test case for combination {3}/Bp=1:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: 0 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: b == (elem in v[0 .. v.Length])
  //   POST Q4: b
  //   POST Q5: v[p] == elem
  {
    var v := new int[2] [-10, -10];
    var elem := -10;
    var b, p := otherbSearch(v, elem);
    expect b == true || b == true;
    expect p == 1 || p == 0;
    expect b == true; // observed from implementation
    expect p == 1; // observed from implementation
  }

  // Test case for combination {2}/O|v|>=2:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: 0 <= p
  //   POST Q2: p <= v.Length
  //   POST Q3: b == (elem in v[0 .. v.Length])
  //   POST Q4: !b
  //   POST Q5: forall u: int {:trigger v[u]} :: 0 <= u < p ==> v[u] < elem
  //   POST Q6: forall w: int {:trigger v[w]} :: p <= w < v.Length ==> v[w] > elem
  {
    var v := new int[2] [-10, -9];
    var elem := 10;
    var b, p := otherbSearch(v, elem);
    expect b == false;
    expect p == 2;
  }

  // Test case for combination {2}/Oelem=0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: 0 <= p
  //   POST Q2: p <= v.Length
  //   POST Q3: b == (elem in v[0 .. v.Length])
  //   POST Q4: !b
  //   POST Q5: forall u: int {:trigger v[u]} :: 0 <= u < p ==> v[u] < elem
  //   POST Q6: forall w: int {:trigger v[w]} :: p <= w < v.Length ==> v[w] > elem
  {
    var v := new int[1] [-10];
    var elem := 0;
    var b, p := otherbSearch(v, elem);
    expect b == false;
    expect p == 1;
  }

  // Test case for combination {3}/O|v|=1:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: 0 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: b == (elem in v[0 .. v.Length])
  //   POST Q4: b
  //   POST Q5: v[p] == elem
  {
    var v := new int[1] [-10];
    var elem := -10;
    var b, p := otherbSearch(v, elem);
    expect b == true;
    expect p == 0;
  }

  // Test case for combination {3}/Oelem=0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: 0 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: b == (elem in v[0 .. v.Length])
  //   POST Q4: b
  //   POST Q5: v[p] == elem
  {
    var v := new int[4] [-5, -4, -3, 0];
    var elem := 0;
    var b, p := otherbSearch(v, elem);
    expect b == true;
    expect p == 3;
  }

  // Test case for combination {3}/Oelem>0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: 0 <= p
  //   POST Q2: p < v.Length
  //   POST Q3: b == (elem in v[0 .. v.Length])
  //   POST Q4: b
  //   POST Q5: v[p] == elem
  {
    var v := new int[1] [10];
    var elem := 10;
    var b, p := otherbSearch(v, elem);
    expect b == true;
    expect p == 0;
  }

}

method Failing()
{
  // Test case for combination {2}/Bp=0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: 0 <= p
  //   POST Q2: p <= v.Length
  //   POST Q3: b == (elem in v[0 .. v.Length])
  //   POST Q4: !b
  //   POST Q5: forall u: int {:trigger v[u]} :: 0 <= u < p ==> v[u] < elem
  //   POST Q6: forall w: int {:trigger v[w]} :: p <= w < v.Length ==> v[w] > elem
  {
    var v := new int[1] [-9];
    var elem := -10;
    var b, p := otherbSearch(v, elem);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.otherbSearch(BigInteger[] v, BigInteger elem, Boolean& b, BigInteger& p) in C:\cygwin64\tmp\DafnyTestGen_r1kdzphfcwf\runner.cs:line 6661
    // runtime error: at _module.__default.TestCase__32() in C:\cygwin64\tmp\DafnyTestGen_r1kdzphfcwf\runner.cs:line 7885
    // expect b == false;
    // expect p == 0;
  }

  // Test case for combination {2}/O|v|=0:
  //   PRE:  sorted(v[0 .. v.Length])
  //   POST Q1: 0 <= p
  //   POST Q2: p <= v.Length
  //   POST Q3: b == (elem in v[0 .. v.Length])
  //   POST Q4: !b
  //   POST Q5: forall u: int {:trigger v[u]} :: 0 <= u < p ==> v[u] < elem
  //   POST Q6: forall w: int {:trigger v[w]} :: p <= w < v.Length ==> v[w] > elem
  {
    var v := new int[0] [];
    var elem := -10;
    var b, p := otherbSearch(v, elem);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.otherbSearch(BigInteger[] v, BigInteger elem, Boolean& b, BigInteger& p) in C:\cygwin64\tmp\DafnyTestGen_r1kdzphfcwf\runner.cs:line 6661
    // runtime error: at _module.__default.TestCase__34() in C:\cygwin64\tmp\DafnyTestGen_r1kdzphfcwf\runner.cs:line 7965
    // expect b == false;
    // expect p == 0;
  }

}

method Main()
{
  Passing();
  Failing();
}
