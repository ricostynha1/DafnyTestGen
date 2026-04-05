// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Software-building-and-verification-Projects_tmp_tmp5tm1srrn_CVS-projeto_handout1__1436-1438_EVR_int.dfy
// Method: query
// Generated: 2026-04-05 23:59:51

// Software-building-and-verification-Projects_tmp_tmp5tm1srrn_CVS-projeto_handout1.dfy

function sum(a: array<int>, i: int, j: int): int
  requires 0 <= i <= j <= a.Length
  reads a
  decreases j
{
  if i == j then
    0
  else
    a[j - 1] + sum(a, i, j - 1)
}

method query(a: array<int>, i: int, j: int)
    returns (res: int)
  requires 0 <= i <= j <= a.Length
  ensures res == sum(a, i, j)
  decreases a, i, j
{
  res := 0;
  var ind := j - 1;
  while ind >= i
    invariant i - 1 <= ind < j
    invariant res == sum(a, i, j) - sum(a, i, ind + 1)
    decreases ind
  {
    res := res + a[ind];
    ind := ind - 1;
  }
}

method queryFast(a: array<int>, c: array<int>, i: int, j: int)
    returns (r: int)
  requires 0 <= i <= j <= a.Length
  requires is_prefix_sum_for(a, c)
  ensures r == sum(a, i, j)
  decreases a, c, i, j
{
  var k := i;
  proof(a, 0, j, k);
  r := c[j] - c[i];
}

predicate is_prefix_sum_for(a: array<int>, c: array<int>)
  reads c, a
  decreases {c, a}, a, c
{
  a.Length + 1 == c.Length &&
  forall i: int {:trigger sum(a, 0, i)} {:trigger c[i]} :: 
    0 <= i <= a.Length ==>
      c[i] == sum(a, 0, i)
}

lemma proof(a: array<int>, i: int, j: int, k: int)
  requires 0 <= i <= k <= j <= a.Length
  ensures sum(a, i, k) + sum(a, k, j) == sum(a, i, j)
  decreases a, i, j, k

method from_array<T>(a: array<T>) returns (l: List<T>)
  ensures forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> mem(a[i], l)
  ensures forall x: T {:trigger mem(x, l)} :: mem(x, l) ==> exists y: int {:trigger a[y]} :: 0 <= y < a.Length && a[y] == x
  decreases a
{
  l := Nil;
  var i := 0 - 1;
  while i >= 0
    invariant 0 <= i + 1 <= a.Length
    invariant forall j: int {:trigger a[j]} :: i < j < a.Length ==> mem(a[j], l)
    invariant forall x: T {:trigger mem(x, l)} :: mem(x, l) ==> exists y: int {:trigger a[y]} :: i + 1 <= y < a.Length && a[y] == x
    decreases i
  {
    l := Cons(a[i], l);
    i := i - 1;
  }
}

function mem<T(==)>(x: T, l: List<T>): bool
  decreases l
{
  match l
  case Nil() =>
    false
  case Cons(h, t) =>
    h == x || mem(x, t)
}

datatype List<T> = Nil | Cons(head: T, tail: List<T>)


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  0 <= i <= j <= a.Length
  //   POST: res == sum(a, i, j)
  {
    var a := new int[0] [];
    var i := 0;
    var j := 0;
    var res := query(a, i, j);
    expect res == 0;
  }

  // Test case for combination {1}/Ba=2,i=0,j==a:
  //   PRE:  0 <= i <= j <= a.Length
  //   POST: res == sum(a, i, j)
  {
    var a := new int[2] [4, 3];
    var i := 0;
    var j := 0;
    var res := query(a, i, j);
    expect res == 0;
  }

  // Test case for combination {1}/Ba=2,i=1,j=1:
  //   PRE:  0 <= i <= j <= a.Length
  //   POST: res == sum(a, i, j)
  {
    var a := new int[2] [4, 3];
    var i := 1;
    var j := 1;
    var res := query(a, i, j);
    expect res == 0;
  }

  // Test case for combination {1}/Ba=2,i=1,j==a:
  //   PRE:  0 <= i <= j <= a.Length
  //   POST: res == sum(a, i, j)
  {
    var a := new int[2] [4, 3];
    var i := 1;
    var j := 2;
    var res := query(a, i, j);
    expect res == 3;
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
