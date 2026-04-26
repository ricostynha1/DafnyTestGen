// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Software-building-and-verification-Projects_tmp_tmp5tm1srrn_CVS-projeto_aula3__162-192_SDL.dfy
// Method: Fib
// Generated: 2026-04-24 14:22:57

// Software-building-and-verification-Projects_tmp_tmp5tm1srrn_CVS-projeto_aula3.dfy

function fib(n: nat): nat
  decreases n
{
  if n == 0 then
    1
  else if n == 1 then
    1
  else
    fib(n - 1) + fib(n - 2)
}

method Fib(n: nat) returns (r: nat)
  ensures r == fib(n)
  decreases n
{
  var next := 2;
  r := 1;
  var i := 1;
  while i < n
    invariant next == fib(i + 1)
    invariant r == fib(i)
    invariant 1 <= i <= n
    decreases n - i
  {
    var tmp := next;
    next := next + r;
    r := tmp;
    i := i + 1;
  }
  assert r == fib(n);
  return r;
}

function add(l: List<int>): int
  decreases l
{
  match l
  case Nil() =>
    0
  case Cons(x, xs) =>
    x + add(xs)
}

method addImp(l: List<int>) returns (r: int)
  ensures r == add(l)
  decreases l
{
  r := 0;
  var ll := l;
  while ll != Nil
    invariant r == add(l) - add(ll)
    decreases ll
  {
    r := r + ll.head;
    ll := ll.tail;
  }
  assert r == add(l);
}

method maxArray(arr: array<int>) returns (max: int)
  requires arr.Length > 0
  ensures forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  ensures exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  decreases arr
{
  max := arr[0];
  var index := 1;
  while index < arr.Length
    invariant 0 <= index <= arr.Length
    invariant forall i: int {:trigger arr[i]} :: 0 <= i < index ==> arr[i] <= max
    invariant exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
    decreases arr.Length - index
  {
    if arr[index] > max {
      max := arr[index];
    }
    index := index + 1;
  }
}

method maxArrayReverse(arr: array<int>) returns (max: int)
  requires arr.Length > 0
  ensures forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  ensures exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  decreases arr
{
  var ind := arr.Length - 1;
  max := arr[ind];
  while ind > 0
    invariant 0 <= ind <= arr.Length
    invariant forall i: int {:trigger arr[i]} :: ind <= i < arr.Length ==> arr[i] <= max
    invariant exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
    decreases ind - 0
  {
    if arr[ind - 1] > max {
      max := arr[ind - 1];
    }
    ind := ind - 1;
  }
}

function sum(n: nat): nat
  decreases n
{
  if n == 0 then
    0
  else
    n + sum(n - 1)
}

method sumBackwards(n: nat) returns (r: nat)
  ensures r == sum(n)
  decreases n
{
  var i := n;
  r := 0;
  while i > 0
    invariant 0 <= i <= n
    invariant r == sum(n) - sum(i)
    decreases i - 0
  {
    r := r + i;
    i := i - 1;
  }
}

datatype List<T> = Nil | Cons(head: T, tail: List<T>)


method TestsForFib()
{
  // Test case for combination {1}:
  //   POST Q1: r == fib(n)
  {
    var n := 0;
    var r := Fib(n);
    expect r == 1;
  }

  // Test case for combination {2}:
  //   POST Q1: r == fib(n)
  {
    var n := 1;
    var r := Fib(n);
    expect r == 1;
  }

  // Test case for combination {3}:
  //   POST Q1: r == fib(n)
  {
    var n := 10;
    var r := Fib(n);
    expect r == 89;
  }

  // Test case for combination {3}/Bn=2:
  //   POST Q1: r == fib(n)
  {
    var n := 2;
    var r := Fib(n);
    expect r == 2;
  }

  // Test case for combination {3}/Bn=3:
  //   POST Q1: r == fib(n)
  {
    var n := 3;
    var r := Fib(n);
    expect r == 3;
  }

  // Test case for combination {3}/R4:
  //   POST Q1: r == fib(n)
  {
    var n := 9;
    var r := Fib(n);
    expect r == 55;
  }

  // Test case for combination {3}/R5:
  //   POST Q1: r == fib(n)
  {
    var n := 8;
    var r := Fib(n);
    expect r == 34;
  }

  // Test case for combination {3}/R6:
  //   POST Q1: r == fib(n)
  {
    var n := 7;
    var r := Fib(n);
    expect r == 21;
  }

  // Test case for combination {3}/R7:
  //   POST Q1: r == fib(n)
  {
    var n := 4;
    var r := Fib(n);
    expect r == 5;
  }

  // Test case for combination {3}/R8:
  //   POST Q1: r == fib(n)
  {
    var n := 5;
    var r := Fib(n);
    expect r == 8;
  }

}

method TestsFormaxArray()
{
  // Test case for combination {1}:
  //   PRE:  arr.Length > 0
  //   POST Q1: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST Q2: 0 <= (arr.Length - 1)
  //   POST Q3: arr[0] == max
  {
    var arr := new int[1] [2];
    var max := maxArray(arr);
    expect max == 2;
  }

  // Test case for combination {2}:
  //   PRE:  arr.Length > 0
  //   POST Q1: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST Q2: exists x :: 1 <= x < (arr.Length - 1) && arr[x] == max
  {
    var arr := new int[3] [-10, 8, -1];
    var max := maxArray(arr);
    expect max == 8;
  }

  // Test case for combination {3}/V1:
  //   PRE:  arr.Length > 0
  //   POST Q1: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max  // VACUOUS (forced true by other literals for this ins)
  //   POST Q2: 0 <= (arr.Length - 1)
  //   POST Q3: arr[(arr.Length - 1)] == max
  {
    var arr := new int[1] [-10];
    var max := maxArray(arr);
    expect max == -10;
  }

  // Test case for combination {1}/O|arr|>=2:
  //   PRE:  arr.Length > 0
  //   POST Q1: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST Q2: 0 <= (arr.Length - 1)
  //   POST Q3: arr[0] == max
  {
    var arr := new int[2] [10, 10];
    var max := maxArray(arr);
    expect max == 10;
  }

  // Test case for combination {1}/Omax=0:
  //   PRE:  arr.Length > 0
  //   POST Q1: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST Q2: 0 <= (arr.Length - 1)
  //   POST Q3: arr[0] == max
  {
    var arr := new int[1] [0];
    var max := maxArray(arr);
    expect max == 0;
  }

  // Test case for combination {2}/Omax=0:
  //   PRE:  arr.Length > 0
  //   POST Q1: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST Q2: exists x :: 1 <= x < (arr.Length - 1) && arr[x] == max
  {
    var arr := new int[8] [-10, -1, -4, 0, 0, 0, 0, -7644];
    var max := maxArray(arr);
    expect max == 0;
  }

  // Test case for combination {2}/Omax<0:
  //   PRE:  arr.Length > 0
  //   POST Q1: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST Q2: exists x :: 1 <= x < (arr.Length - 1) && arr[x] == max
  {
    var arr := new int[3] [-9, -6, -10];
    var max := maxArray(arr);
    expect max == -6;
  }

  // Test case for combination {1}/R5:
  //   PRE:  arr.Length > 0
  //   POST Q1: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST Q2: 0 <= (arr.Length - 1)
  //   POST Q3: arr[0] == max
  {
    var arr := new int[1] [10];
    var max := maxArray(arr);
    expect max == 10;
  }

  // Test case for combination {1}/R6:
  //   PRE:  arr.Length > 0
  //   POST Q1: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST Q2: 0 <= (arr.Length - 1)
  //   POST Q3: arr[0] == max
  {
    var arr := new int[1] [7];
    var max := maxArray(arr);
    expect max == 7;
  }

}

method TestsFormaxArrayReverse()
{
  // Test case for combination {1}:
  //   PRE:  arr.Length > 0
  //   POST Q1: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST Q2: 0 <= (arr.Length - 1)
  //   POST Q3: arr[0] == max
  {
    var arr := new int[1] [2];
    var max := maxArrayReverse(arr);
    expect max == 2;
  }

  // Test case for combination {2}:
  //   PRE:  arr.Length > 0
  //   POST Q1: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST Q2: exists x :: 1 <= x < (arr.Length - 1) && arr[x] == max
  {
    var arr := new int[3] [-10, 8, -1];
    var max := maxArrayReverse(arr);
    expect max == 8;
  }

  // Test case for combination {3}/V1:
  //   PRE:  arr.Length > 0
  //   POST Q1: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max  // VACUOUS (forced true by other literals for this ins)
  //   POST Q2: 0 <= (arr.Length - 1)
  //   POST Q3: arr[(arr.Length - 1)] == max
  {
    var arr := new int[1] [-10];
    var max := maxArrayReverse(arr);
    expect max == -10;
  }

  // Test case for combination {1}/O|arr|>=2:
  //   PRE:  arr.Length > 0
  //   POST Q1: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST Q2: 0 <= (arr.Length - 1)
  //   POST Q3: arr[0] == max
  {
    var arr := new int[2] [10, 10];
    var max := maxArrayReverse(arr);
    expect max == 10;
  }

  // Test case for combination {1}/Omax=0:
  //   PRE:  arr.Length > 0
  //   POST Q1: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST Q2: 0 <= (arr.Length - 1)
  //   POST Q3: arr[0] == max
  {
    var arr := new int[1] [0];
    var max := maxArrayReverse(arr);
    expect max == 0;
  }

  // Test case for combination {2}/Omax=0:
  //   PRE:  arr.Length > 0
  //   POST Q1: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST Q2: exists x :: 1 <= x < (arr.Length - 1) && arr[x] == max
  {
    var arr := new int[8] [-10, -1, -4, 0, 0, 0, 0, -7644];
    var max := maxArrayReverse(arr);
    expect max == 0;
  }

  // Test case for combination {2}/Omax<0:
  //   PRE:  arr.Length > 0
  //   POST Q1: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST Q2: exists x :: 1 <= x < (arr.Length - 1) && arr[x] == max
  {
    var arr := new int[3] [-9, -6, -10];
    var max := maxArrayReverse(arr);
    expect max == -6;
  }

  // Test case for combination {1}/R5:
  //   PRE:  arr.Length > 0
  //   POST Q1: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST Q2: 0 <= (arr.Length - 1)
  //   POST Q3: arr[0] == max
  {
    var arr := new int[1] [10];
    var max := maxArrayReverse(arr);
    expect max == 10;
  }

  // Test case for combination {1}/R6:
  //   PRE:  arr.Length > 0
  //   POST Q1: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST Q2: 0 <= (arr.Length - 1)
  //   POST Q3: arr[0] == max
  {
    var arr := new int[1] [7];
    var max := maxArrayReverse(arr);
    expect max == 7;
  }

}

method TestsForsumBackwards()
{
  // Test case for combination {1}:
  //   POST Q1: r == sum(n)
  {
    var n := 0;
    var r := sumBackwards(n);
    expect r == 0;
  }

  // Test case for combination {2}:
  //   POST Q1: r == sum(n)
  {
    var n := 10;
    var r := sumBackwards(n);
    expect r == 55;
  }

  // Test case for combination {2}/Bn=1:
  //   POST Q1: r == sum(n)
  {
    var n := 1;
    var r := sumBackwards(n);
    expect r == 1;
  }

  // Test case for combination {2}/Bn=2:
  //   POST Q1: r == sum(n)
  {
    var n := 2;
    var r := sumBackwards(n);
    expect r == 3;
  }

  // Test case for combination {2}/R4:
  //   POST Q1: r == sum(n)
  {
    var n := 9;
    var r := sumBackwards(n);
    expect r == 45;
  }

  // Test case for combination {2}/R5:
  //   POST Q1: r == sum(n)
  {
    var n := 8;
    var r := sumBackwards(n);
    expect r == 36;
  }

  // Test case for combination {2}/R6:
  //   POST Q1: r == sum(n)
  {
    var n := 7;
    var r := sumBackwards(n);
    expect r == 28;
  }

  // Test case for combination {2}/R7:
  //   POST Q1: r == sum(n)
  {
    var n := 3;
    var r := sumBackwards(n);
    expect r == 6;
  }

  // Test case for combination {2}/R8:
  //   POST Q1: r == sum(n)
  {
    var n := 4;
    var r := sumBackwards(n);
    expect r == 10;
  }

  // Test case for combination {2}/R9:
  //   POST Q1: r == sum(n)
  {
    var n := 6;
    var r := sumBackwards(n);
    expect r == 21;
  }

}

method Main()
{
  TestsForFib();
  print "TestsForFib: all non-failing tests passed!\n";
  TestsFormaxArray();
  print "TestsFormaxArray: all non-failing tests passed!\n";
  TestsFormaxArrayReverse();
  print "TestsFormaxArrayReverse: all non-failing tests passed!\n";
  TestsForsumBackwards();
  print "TestsForsumBackwards: all non-failing tests passed!\n";
}
