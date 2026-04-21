// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Software-building-and-verification-Projects_tmp_tmp5tm1srrn_CVS-projeto_aula3.dfy
// Method: Fib
// Generated: 2026-04-08 19:18:17

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
  if n == 0 {
    return 1;
  }
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


method Passing()
{
  // Test case for combination {1}:
  //   POST: r == fib(n)
  //   ENSURES: r == fib(n)
  {
    var n := 0;
    var r := Fib(n);
    expect r == 1;
  }

  // Test case for combination {2}:
  //   POST: r == fib(n)
  //   ENSURES: r == fib(n)
  {
    var n := 1;
    var r := Fib(n);
    expect r == 1;
  }

  // Test case for combination {2}/Or=1:
  //   POST: r == fib(n)
  //   ENSURES: r == fib(n)
  {
    var n := 2;
    var r := Fib(n);
    expect r == 2;
  }

  // Test case for combination {2}/Or=0:
  //   POST: r == fib(n)
  //   ENSURES: r == fib(n)
  {
    var n := 3;
    var r := Fib(n);
    expect r == 3;
  }

  // Test case for combination {1}:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: 0 < arr.Length
  //   POST: arr[0] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[1] [38];
    var max := maxArray(arr);
    expect max == 38;
  }

  // Test case for combination {2}:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: exists x :: 1 <= x < (arr.Length - 1) && arr[x] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[4] [-1, 0, 0, 0];
    var max := maxArray(arr);
    expect max == 0;
  }

  // Test case for combination {3}:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: 0 < arr.Length
  //   POST: arr[(arr.Length - 1)] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[1] [0];
    var max := maxArray(arr);
    expect max == 0;
  }

  // Test case for combination {1}/Barr=2:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: 0 < arr.Length
  //   POST: arr[0] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[2] [7719, 7718];
    var max := maxArray(arr);
    expect max == 7719;
  }

  // Test case for combination {1}/Omax>0:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: 0 < arr.Length
  //   POST: arr[0] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[2] [7720, -38];
    var max := maxArray(arr);
    expect max == 7720;
  }

  // Test case for combination {1}/Omax<0:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: 0 < arr.Length
  //   POST: arr[0] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[3] [-39, -40, -40];
    var max := maxArray(arr);
    expect max == -39;
  }

  // Test case for combination {1}/Omax=0:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: 0 < arr.Length
  //   POST: arr[0] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[4] [0, -1, -39, -7720];
    var max := maxArray(arr);
    expect max == 0;
  }

  // Test case for combination {2}/Omax>0:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: exists x :: 1 <= x < (arr.Length - 1) && arr[x] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[4] [-38, 7720, -21238, -2437];
    var max := maxArray(arr);
    expect max == 7720;
  }

  // Test case for combination {2}/Omax<0:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: exists x :: 1 <= x < (arr.Length - 1) && arr[x] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[3] [-40, -39, -40];
    var max := maxArray(arr);
    expect max == -39;
  }

  // Test case for combination {2}/Omax=0:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: exists x :: 1 <= x < (arr.Length - 1) && arr[x] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[6] [-1, 0, 0, 0, 0, -39];
    var max := maxArray(arr);
    expect max == 0;
  }

  // Test case for combination {3}/Omax>0:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: 0 < arr.Length
  //   POST: arr[(arr.Length - 1)] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[2] [-7719, 39];
    var max := maxArray(arr);
    expect max == 39;
  }

  // Test case for combination {3}/Omax<0:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: 0 < arr.Length
  //   POST: arr[(arr.Length - 1)] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[3] [-40, -40, -39];
    var max := maxArray(arr);
    expect max == -39;
  }

  // Test case for combination {3}/Omax=0:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: 0 < arr.Length
  //   POST: arr[(arr.Length - 1)] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[4] [-1, -39, -7720, 0];
    var max := maxArray(arr);
    expect max == 0;
  }

  // Test case for combination {1}:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: 0 < arr.Length
  //   POST: arr[0] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[1] [38];
    var max := maxArrayReverse(arr);
    expect max == 38;
  }

  // Test case for combination {2}:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: exists x :: 1 <= x < (arr.Length - 1) && arr[x] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[4] [-1, 0, 0, 0];
    var max := maxArrayReverse(arr);
    expect max == 0;
  }

  // Test case for combination {3}:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: 0 < arr.Length
  //   POST: arr[(arr.Length - 1)] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[1] [0];
    var max := maxArrayReverse(arr);
    expect max == 0;
  }

  // Test case for combination {1}/Barr=2:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: 0 < arr.Length
  //   POST: arr[0] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[2] [7719, 7718];
    var max := maxArrayReverse(arr);
    expect max == 7719;
  }

  // Test case for combination {1}/Omax>0:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: 0 < arr.Length
  //   POST: arr[0] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[2] [7720, -38];
    var max := maxArrayReverse(arr);
    expect max == 7720;
  }

  // Test case for combination {1}/Omax<0:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: 0 < arr.Length
  //   POST: arr[0] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[3] [-39, -40, -40];
    var max := maxArrayReverse(arr);
    expect max == -39;
  }

  // Test case for combination {1}/Omax=0:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: 0 < arr.Length
  //   POST: arr[0] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[4] [0, -1, -39, -7720];
    var max := maxArrayReverse(arr);
    expect max == 0;
  }

  // Test case for combination {2}/Omax>0:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: exists x :: 1 <= x < (arr.Length - 1) && arr[x] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[4] [-38, 7720, -21238, -2437];
    var max := maxArrayReverse(arr);
    expect max == 7720;
  }

  // Test case for combination {2}/Omax<0:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: exists x :: 1 <= x < (arr.Length - 1) && arr[x] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[3] [-40, -39, -40];
    var max := maxArrayReverse(arr);
    expect max == -39;
  }

  // Test case for combination {2}/Omax=0:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: exists x :: 1 <= x < (arr.Length - 1) && arr[x] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[6] [-1, 0, 0, 0, 0, -39];
    var max := maxArrayReverse(arr);
    expect max == 0;
  }

  // Test case for combination {3}/Omax>0:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: 0 < arr.Length
  //   POST: arr[(arr.Length - 1)] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[2] [-7719, 39];
    var max := maxArrayReverse(arr);
    expect max == 39;
  }

  // Test case for combination {3}/Omax<0:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: 0 < arr.Length
  //   POST: arr[(arr.Length - 1)] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[3] [-40, -40, -39];
    var max := maxArrayReverse(arr);
    expect max == -39;
  }

  // Test case for combination {3}/Omax=0:
  //   PRE:  arr.Length > 0
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   POST: 0 < arr.Length
  //   POST: arr[(arr.Length - 1)] == max
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length ==> arr[i] <= max
  //   ENSURES: exists x: int {:trigger arr[x]} :: 0 <= x < arr.Length && arr[x] == max
  {
    var arr := new int[4] [-1, -39, -7720, 0];
    var max := maxArrayReverse(arr);
    expect max == 0;
  }

  // Test case for combination {1}:
  //   POST: n == 0
  //   POST: r == 0
  //   ENSURES: r == sum(n)
  {
    var n := 0;
    var r := sumBackwards(n);
    expect r == 0;
  }

  // Test case for combination {2}:
  //   POST: !(n == 0)
  //   POST: r == n + sum(n - 1)
  //   ENSURES: r == sum(n)
  {
    var n := 1;
    var r := sumBackwards(n);
    expect !(n == 0);
    expect r == 1;
  }

  // Test case for combination {2}/Or=1:
  //   POST: !(n == 0)
  //   POST: r == n + sum(n - 1)
  //   ENSURES: r == sum(n)
  {
    var n := 2;
    var r := sumBackwards(n);
    expect r == 3;
  }

  // Test case for combination {2}/Or=0:
  //   POST: !(n == 0)
  //   POST: r == n + sum(n - 1)
  //   ENSURES: r == sum(n)
  {
    var n := 3;
    var r := sumBackwards(n);
    expect r == 6;
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
