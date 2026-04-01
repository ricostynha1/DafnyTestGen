// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Trab1-Metodos-Formais_tmp_tmp_8fa4trr_circular-array.dfy
// Method: Enqueue
// Generated: 2026-04-01 22:34:23

// Trab1-Metodos-Formais_tmp_tmp_8fa4trr_circular-array.dfy

method OriginalMain()
{
  var q := new CircularArray.EmptyQueue(10);
  assert q.IsEmpty();
  q.Enqueue(1);
  assert !q.IsEmpty();
  assert q.Size() == 1;
  assert q.Contains(1);
  var e1 := q.GetAt(0);
  assert e1 == 1;
  q.Enqueue(2);
  assert q.Size() == 2;
  assert q.Contains(2);
  var e2 := q.GetAt(1);
  assert e2 == 2;
  var e := q.Dequeue();
  assert e == 1;
  assert q.Size() == 1;
  assert !q.Contains(1);
  q.Enqueue(3);
  assert q.Size() == 2;
  assert q.Contains(3);
  e := q.Dequeue();
  assert e == 2;
  assert q.Size() == 1;
  assert !q.Contains(2);
  e := q.Dequeue();
  assert e == 3;
  assert q.Size() == 0;
  assert !q.Contains(3);
  assert q.IsEmpty();
  assert q.Size() == 0;
}

class {:autocontracts} CircularArray {
  var arr: array<int>
  var start: nat
  var size: nat
  var Capacity: nat
  var Elements: seq<int>

  predicate Valid()
    reads this, Repr
    ensures Valid() ==> this in Repr
    decreases Repr + {this}
  {
    this in Repr &&
    null !in Repr &&
    arr in Repr &&
    0 <= start < arr.Length &&
    0 <= size <= arr.Length &&
    Capacity == arr.Length &&
    Elements == if start + size <= arr.Length then arr[start .. start + size] else arr[start..] + arr[..size - (arr.Length - start)]
  }

  constructor EmptyQueue(capacity: nat)
    requires capacity > 0
    ensures Valid()
    ensures fresh(Repr)
    ensures Elements == []
    ensures Capacity == capacity
    decreases capacity
  {
    arr := new int[capacity];
    start := 0;
    size := 0;
    Capacity := capacity;
    Elements := [];
    new;
    Repr := {this};
    if !(arr in Repr) {
      Repr := Repr + {arr};
    }
  }

  method Enqueue(e: int)
    requires Valid()
    requires !IsFull()
    modifies Repr
    ensures Valid()
    ensures fresh(Repr - old(Repr))
    ensures Elements == old(Elements) + [e]
    decreases e
  {
    arr[(start + size) % arr.Length] := e;
    size := size + 1;
    Elements := Elements + [e];
    if !(arr in Repr) {
      Repr := Repr + {arr};
    }
  }

  method Dequeue() returns (e: int)
    requires Valid()
    requires !IsEmpty()
    modifies Repr
    ensures Valid()
    ensures fresh(Repr - old(Repr))
    ensures Elements == old(Elements)[1..]
    ensures e == old(Elements)[0]
  {
    e := arr[start];
    if start + 1 < arr.Length {
      start := start + 1;
    } else {
      start := 0;
    }
    size := size - 1;
    Elements := Elements[1..];
    if !(arr in Repr) {
      Repr := Repr + {arr};
    }
  }

  predicate Contains(e: int)
    requires Valid()
    reads Repr
    ensures Contains(e) == (e in Elements)
    decreases Repr, e
  {
    if start + size < arr.Length then
      e in arr[start .. start + size]
    else
      e in arr[start..] + arr[..size - (arr.Length - start)]
  }

  function Size(): nat
    requires Valid()
    reads Repr
    ensures Size() == |Elements|
    decreases Repr
  {
    size
  }

  predicate IsEmpty()
    requires Valid()
    reads Repr
    ensures IsEmpty() <==> |Elements| == 0
    decreases Repr
  {
    size == 0
  }

  predicate IsFull()
    requires Valid()
    reads Repr
    ensures IsFull() <==> |Elements| == Capacity
    decreases Repr
  {
    size == arr.Length
  }

  method GetAt(i: nat) returns (e: int)
    requires Valid()
    requires i < size
    ensures e == Elements[i]
    decreases i
  {
    e := arr[(start + i) % arr.Length];
  }

  method AsSequence() returns (s: seq<int>)
    requires Valid()
    ensures s == Elements
  {
    s := if start + size <= arr.Length then arr[start .. start + size] else arr[start..] + arr[..size - (arr.Length - start)];
  }

  method Concatenate(q1: CircularArray) returns (q2: CircularArray)
    requires Valid()
    requires q1.Valid()
    requires q1 != this
    modifies Repr
    ensures Valid()
    ensures fresh(Repr - old(Repr))
    ensures fresh(q2)
    ensures q2.Capacity == Capacity + q1.Capacity
    ensures q2.Elements == Elements + q1.Elements
    decreases q1
  {
    q2 := new CircularArray.EmptyQueue(arr.Length + q1.arr.Length);
    var s1 := AsSequence();
    var s2 := q1.AsSequence();
    var both := s1 + s2;
    forall i: int | 0 <= i < size {
      q2.arr[i] := both[i];
    }
    q2.size := size + q1.size;
    q2.start := 0;
    q2.Elements := Elements + q1.Elements;
    print q2.arr.Length;
    print q2.size;
    if !(arr in Repr) {
      Repr := Repr + {arr};
    }
  }

  var Repr: set<object?>
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  capacity > 0
  //   POST: s == Elements
  {
    var capacity := 1;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[1] [4];
    obj.arr := tmp_arr;
    obj.start := 0;
    obj.size := 0;
    obj.Capacity := 1;
    obj.Elements := [];
    obj.Repr := {obj, obj.arr};
    expect obj.Valid(); // PRE-CHECK
    expect capacity > 0; // PRE-CHECK
    var s := obj.AsSequence();
    expect s == [];
  }

  // Test case for combination {1}/Bstart=0,size==arr,capacity=2,Capacity=1:
  //   PRE:  Valid()
  //   PRE:  capacity > 0
  //   POST: s == Elements
  {
    var capacity := 2;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[1] [2];
    obj.arr := tmp_arr;
    obj.start := 0;
    obj.size := 0;
    obj.Capacity := 1;
    obj.Elements := [];
    obj.Repr := {obj, obj.arr};
    expect obj.Valid(); // PRE-CHECK
    expect capacity > 0; // PRE-CHECK
    var s := obj.AsSequence();
    expect s == [];
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
