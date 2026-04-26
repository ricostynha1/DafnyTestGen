// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Trab1-Metodos-Formais_tmp_tmp_8fa4trr_circular-array__2805-2805_AOI.dfy
// Method: Enqueue
// Generated: 2026-04-24 14:30:49

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
    s := if start + -size <= arr.Length then arr[start .. start + size] else arr[start..] + arr[..size - (arr.Length - start)];
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


method TestsForEnqueue()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  !IsFull()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Elements == old(Elements) + [e]
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[4] [-10, 8, 5, -1];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 2;
    obj.Capacity := 4;
    obj.Elements := [5, -1];
    obj.Repr := {obj, obj.arr};
    var e := -1;
    var old_Elements := obj.Elements;
    obj.Enqueue(e);
    expect obj.Valid();
    expect tmp_arr[..] == [-1, 8, 5, -1]; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  !IsFull()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Elements == old(Elements) + [e]
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-10, -1, -4];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 2;
    obj.Capacity := 3;
    obj.Elements := [-7];
    obj.Repr := {obj, obj.arr};
    var e := -10;
    var old_Elements := obj.Elements;
    obj.Enqueue(e);
    // actual runtime state: tmp_arr=[-10, -10, -4]
    // expect obj.Valid(); // got false
  }

  // Test case for combination {1}/Be=arr_len:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  !IsFull()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Elements == old(Elements) + [e]
  {
    var capacity := 9;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[4] [-9, 9, 4, -7];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 2;
    obj.Capacity := 4;
    obj.Elements := [4, -7];
    obj.Repr := {obj, obj.arr};
    var e := 4;
    var old_Elements := obj.Elements;
    obj.Enqueue(e);
    expect obj.Valid();
    expect tmp_arr[..] == [4, 9, 4, -7]; // observed from implementation
  }

  // Test case for combination {1}/Be=arr_len-1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  !IsFull()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Elements == old(Elements) + [e]
  {
    var capacity := 9;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[4] [-10, 5, 2, 9];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 2;
    obj.Capacity := 4;
    obj.Elements := [2, 9];
    obj.Repr := {obj, obj.arr};
    var e := 3;
    var old_Elements := obj.Elements;
    obj.Enqueue(e);
    expect obj.Valid();
    expect tmp_arr[..] == [3, 5, 2, 9]; // observed from implementation
  }

  // Test case for combination {1}/Bstart=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  !IsFull()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Elements == old(Elements) + [e]
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-10, 5, -4];
    obj.arr := tmp_arr;
    obj.start := 0;
    obj.size := 2;
    obj.Capacity := 3;
    obj.Elements := [-10, 5];
    obj.Repr := {obj, obj.arr};
    var e := -10;
    var old_Elements := obj.Elements;
    obj.Enqueue(e);
    expect obj.Valid();
    expect tmp_arr[..] == [-10, 5, -10]; // observed from implementation
  }

  // Test case for combination {1}/Bstart=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  !IsFull()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Elements == old(Elements) + [e]
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-1, -1, -10];
    obj.arr := tmp_arr;
    obj.start := 1;
    obj.size := 2;
    obj.Capacity := 3;
    obj.Elements := [-1, -10];
    obj.Repr := {obj, obj.arr};
    var e := -10;
    var old_Elements := obj.Elements;
    obj.Enqueue(e);
    expect obj.Valid();
    expect tmp_arr[..] == [-10, -1, -10]; // observed from implementation
  }

  // Test case for combination {1}/Bstart=arr_len-1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  !IsFull()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Elements == old(Elements) + [e]
  {
    var capacity := 9;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-10, 10, 10];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 1;
    obj.Capacity := 3;
    obj.Elements := [10];
    obj.Repr := {obj, obj.arr};
    var e := -9;
    var old_Elements := obj.Elements;
    obj.Enqueue(e);
    expect obj.Valid();
    expect tmp_arr[..] == [-9, 10, 10]; // observed from implementation
  }

  // Test case for combination {1}/Bsize=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  !IsFull()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Elements == old(Elements) + [e]
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-1, 6, -10];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 0;
    obj.Capacity := 3;
    obj.Elements := [];
    obj.Repr := {obj, obj.arr};
    var e := 2;
    var old_Elements := obj.Elements;
    obj.Enqueue(e);
    expect obj.Valid();
    expect tmp_arr[..] == [-1, 6, 2]; // observed from implementation
  }

  // Test case for combination {1}/Bcapacity=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  !IsFull()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Elements == old(Elements) + [e]
  {
    var capacity := 1;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[4] [-10, 5, -1, 9];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 2;
    obj.Capacity := 4;
    obj.Elements := [-1, 9];
    obj.Repr := {obj, obj.arr};
    var e := -10;
    var old_Elements := obj.Elements;
    obj.Enqueue(e);
    expect obj.Valid();
  }

  // Test case for combination {1}/Bcapacity=2:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  !IsFull()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Elements == old(Elements) + [e]
  {
    var capacity := 2;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[4] [-10, 5, 9, 9];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 2;
    obj.Capacity := 4;
    obj.Elements := [9, 9];
    obj.Repr := {obj, obj.arr};
    var e := -10;
    var old_Elements := obj.Elements;
    obj.Enqueue(e);
    expect obj.Valid();
  }

}

method TestsForDequeue()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  !IsEmpty()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Elements == old(Elements)[1..]
  //   POST Q6: e == old(Elements)[0]
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-6, -1, 2];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 3;
    obj.Capacity := 3;
    obj.Elements := [];
    obj.Repr := {obj, obj.arr};
    var old_Elements := obj.Elements;
    var e := obj.Dequeue();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'start')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect obj.Valid();
    // expect e == old_Elements[0];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bstart=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  !IsEmpty()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Elements == old(Elements)[1..]
  //   POST Q6: e == old(Elements)[0]
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[2] [-6, -4];
    obj.arr := tmp_arr;
    obj.start := 1;
    obj.size := 2;
    obj.Capacity := 2;
    obj.Elements := [];
    obj.Repr := {obj, obj.arr};
    var old_Elements := obj.Elements;
    var e := obj.Dequeue();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'start')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect obj.Valid();
    // expect e == old_Elements[0];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bsize=arr_len-1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  !IsEmpty()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Elements == old(Elements)[1..]
  //   POST Q6: e == old(Elements)[0]
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [2, -10, -7];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 2;
    obj.Capacity := 3;
    obj.Elements := [];
    obj.Repr := {obj, obj.arr};
    var old_Elements := obj.Elements;
    var e := obj.Dequeue();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'start')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect obj.Valid();
    // expect e == old_Elements[0];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bcapacity=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  !IsEmpty()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Elements == old(Elements)[1..]
  //   POST Q6: e == old(Elements)[0]
  {
    var capacity := 1;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [7, -6, -1];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 3;
    obj.Capacity := 3;
    obj.Elements := [];
    obj.Repr := {obj, obj.arr};
    var old_Elements := obj.Elements;
    var e := obj.Dequeue();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'start')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect obj.Valid();
    // expect e == old_Elements[0];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bcapacity=2:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  !IsEmpty()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Elements == old(Elements)[1..]
  //   POST Q6: e == old(Elements)[0]
  {
    var capacity := 2;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [7, -6, -1];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 3;
    obj.Capacity := 3;
    obj.Elements := [];
    obj.Repr := {obj, obj.arr};
    var old_Elements := obj.Elements;
    var e := obj.Dequeue();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'start')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect obj.Valid();
    // expect e == old_Elements[0];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R6:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  !IsEmpty()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Elements == old(Elements)[1..]
  //   POST Q6: e == old(Elements)[0]
  {
    var capacity := 9;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-5, 8, -8];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 3;
    obj.Capacity := 3;
    obj.Elements := [];
    obj.Repr := {obj, obj.arr};
    var old_Elements := obj.Elements;
    var e := obj.Dequeue();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'start')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect obj.Valid();
    // expect e == old_Elements[0];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R7:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  !IsEmpty()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Elements == old(Elements)[1..]
  //   POST Q6: e == old(Elements)[0]
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-7, -3, -9];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 2;
    obj.Capacity := 3;
    obj.Elements := [];
    obj.Repr := {obj, obj.arr};
    var old_Elements := obj.Elements;
    var e := obj.Dequeue();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'start')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect obj.Valid();
    // expect e == old_Elements[0];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R8:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  !IsEmpty()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Elements == old(Elements)[1..]
  //   POST Q6: e == old(Elements)[0]
  {
    var capacity := 9;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-8, 9, 3];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 2;
    obj.Capacity := 3;
    obj.Elements := [];
    obj.Repr := {obj, obj.arr};
    var old_Elements := obj.Elements;
    var e := obj.Dequeue();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'start')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect obj.Valid();
    // expect e == old_Elements[0];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R9:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  !IsEmpty()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Elements == old(Elements)[1..]
  //   POST Q6: e == old(Elements)[0]
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [8, -2, 4];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 3;
    obj.Capacity := 3;
    obj.Elements := [];
    obj.Repr := {obj, obj.arr};
    var old_Elements := obj.Elements;
    var e := obj.Dequeue();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'start')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect obj.Valid();
    // expect e == old_Elements[0];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R10:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  !IsEmpty()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Elements == old(Elements)[1..]
  //   POST Q6: e == old(Elements)[0]
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-9, 10, -10];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 3;
    obj.Capacity := 3;
    obj.Elements := [];
    obj.Repr := {obj, obj.arr};
    var old_Elements := obj.Elements;
    var e := obj.Dequeue();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'start')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect obj.Valid();
    // expect e == old_Elements[0];
  }

}

method TestsForGetAt()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  i < size
  //   PRE:  capacity > 0
  //   POST Q1: e == Elements[i]
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-10, -1, 5];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 3;
    obj.Capacity := 3;
    obj.Elements := [-1];
    obj.Repr := {obj, obj.arr};
    var i := 2;
    var e := obj.GetAt(i);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at System.Collections.Immutable.ImmutableArray`1.get_Item(Int32 index)
    // runtime error: at Dafny.Sequence`1.Select(BigInteger index) in C:\cygwin64\tmp\DafnyCBT_du2yale05nu\runner.cs:line 2416
    // expect e == obj.Elements[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bi=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  i < size
  //   PRE:  capacity > 0
  //   POST Q1: e == Elements[i]
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [2, 2, -10];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 2;
    obj.Capacity := 3;
    obj.Elements := [-4];
    obj.Repr := {obj, obj.arr};
    var i := 0;
    var e := obj.GetAt(i);
    // actual runtime state: e=-10
    // expect e == -4; // LHS=-10, RHS=-4
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bi=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  i < size
  //   PRE:  capacity > 0
  //   POST Q1: e == Elements[i]
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-1, -10, 8];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 3;
    obj.Capacity := 3;
    obj.Elements := [5];
    obj.Repr := {obj, obj.arr};
    var i := 1;
    var e := obj.GetAt(i);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at System.Collections.Immutable.ImmutableArray`1.get_Item(Int32 index)
    // runtime error: at Dafny.Sequence`1.Select(BigInteger index) in C:\cygwin64\tmp\DafnyCBT_du2yale05nu\runner.cs:line 2416
    // expect e == obj.Elements[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bstart=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  i < size
  //   PRE:  capacity > 0
  //   POST Q1: e == Elements[i]
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-1, -7, -1];
    obj.arr := tmp_arr;
    obj.start := 0;
    obj.size := 3;
    obj.Capacity := 3;
    obj.Elements := [-10];
    obj.Repr := {obj, obj.arr};
    var i := 2;
    var e := obj.GetAt(i);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at System.Collections.Immutable.ImmutableArray`1.get_Item(Int32 index)
    // runtime error: at Dafny.Sequence`1.Select(BigInteger index) in C:\cygwin64\tmp\DafnyCBT_du2yale05nu\runner.cs:line 2416
    // expect e == obj.Elements[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bstart=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  i < size
  //   PRE:  capacity > 0
  //   POST Q1: e == Elements[i]
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-10, 8, -6];
    obj.arr := tmp_arr;
    obj.start := 1;
    obj.size := 3;
    obj.Capacity := 3;
    obj.Elements := [7];
    obj.Repr := {obj, obj.arr};
    var i := 2;
    var e := obj.GetAt(i);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at System.Collections.Immutable.ImmutableArray`1.get_Item(Int32 index)
    // runtime error: at Dafny.Sequence`1.Select(BigInteger index) in C:\cygwin64\tmp\DafnyCBT_du2yale05nu\runner.cs:line 2416
    // expect e == obj.Elements[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bsize=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  i < size
  //   PRE:  capacity > 0
  //   POST Q1: e == Elements[i]
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-10, 2, 8];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 1;
    obj.Capacity := 3;
    obj.Elements := [-6];
    obj.Repr := {obj, obj.arr};
    var i := 0;
    var e := obj.GetAt(i);
    // actual runtime state: e=8
    // expect e == -6; // LHS=8, RHS=-6
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bcapacity=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  i < size
  //   PRE:  capacity > 0
  //   POST Q1: e == Elements[i]
  {
    var capacity := 1;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-10, -4, -6];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 3;
    obj.Capacity := 3;
    obj.Elements := [7];
    obj.Repr := {obj, obj.arr};
    var i := 2;
    var e := obj.GetAt(i);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at System.Collections.Immutable.ImmutableArray`1.get_Item(Int32 index)
    // runtime error: at Dafny.Sequence`1.Select(BigInteger index) in C:\cygwin64\tmp\DafnyCBT_du2yale05nu\runner.cs:line 2416
    // expect e == obj.Elements[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bcapacity=2:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  i < size
  //   PRE:  capacity > 0
  //   POST Q1: e == Elements[i]
  {
    var capacity := 2;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-10, -4, -6];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 3;
    obj.Capacity := 3;
    obj.Elements := [7];
    obj.Repr := {obj, obj.arr};
    var i := 2;
    var e := obj.GetAt(i);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at System.Collections.Immutable.ImmutableArray`1.get_Item(Int32 index)
    // runtime error: at Dafny.Sequence`1.Select(BigInteger index) in C:\cygwin64\tmp\DafnyCBT_du2yale05nu\runner.cs:line 2416
    // expect e == obj.Elements[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/BCapacity=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  i < size
  //   PRE:  capacity > 0
  //   POST Q1: e == Elements[i]
  {
    var capacity := 2;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[1] [-10];
    obj.arr := tmp_arr;
    obj.start := 0;
    obj.size := 1;
    obj.Capacity := 1;
    obj.Elements := [6];
    obj.Repr := {obj, obj.arr};
    var i := 0;
    var e := obj.GetAt(i);
    // actual runtime state: e=-10
    // expect e == 6; // LHS=-10, RHS=6
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|Elements|=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  i < size
  //   PRE:  capacity > 0
  //   POST Q1: e == Elements[i]
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [6, 7, -10];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 3;
    obj.Capacity := 3;
    obj.Elements := [];
    obj.Repr := {obj, obj.arr};
    var i := 2;
    var e := obj.GetAt(i);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at System.Collections.Immutable.ImmutableArray`1.get_Item(Int32 index)
    // runtime error: at Dafny.Sequence`1.Select(BigInteger index) in C:\cygwin64\tmp\DafnyCBT_du2yale05nu\runner.cs:line 2416
    // expect e == obj.Elements[i];
  }

}

method TestsForAsSequence()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  capacity > 0
  //   POST Q1: s == Elements
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-1, 7, 2];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 2;
    obj.Capacity := 3;
    obj.Elements := [2];
    obj.Repr := {obj, obj.arr};
    var s := obj.AsSequence();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect s == [2];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bstart=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  capacity > 0
  //   POST Q1: s == Elements
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[2] [-2, -10];
    obj.arr := tmp_arr;
    obj.start := 0;
    obj.size := 2;
    obj.Capacity := 2;
    obj.Elements := [-1];
    obj.Repr := {obj, obj.arr};
    var s := obj.AsSequence();
    // actual runtime state: s=[-2, -10]
    // expect s == [-1]; // LHS=[-2, -10], RHS=[-1]
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bstart=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  capacity > 0
  //   POST Q1: s == Elements
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[2] [-1, -10];
    obj.arr := tmp_arr;
    obj.start := 1;
    obj.size := 2;
    obj.Capacity := 2;
    obj.Elements := [-7];
    obj.Repr := {obj, obj.arr};
    var s := obj.AsSequence();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect s == [-7];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bsize=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  capacity > 0
  //   POST Q1: s == Elements
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-1, 7, -10];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 0;
    obj.Capacity := 3;
    obj.Elements := [2];
    obj.Repr := {obj, obj.arr};
    var s := obj.AsSequence();
    // actual runtime state: s=[]
    // expect s == [2]; // LHS=[], RHS=[2]
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bsize=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  capacity > 0
  //   POST Q1: s == Elements
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [2, -10, -1];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 1;
    obj.Capacity := 3;
    obj.Elements := [8];
    obj.Repr := {obj, obj.arr};
    var s := obj.AsSequence();
    // actual runtime state: s=[-1]
    // expect s == [8]; // LHS=[-1], RHS=[8]
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bcapacity=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  capacity > 0
  //   POST Q1: s == Elements
  {
    var capacity := 1;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-1, -10, -7];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 2;
    obj.Capacity := 3;
    obj.Elements := [2];
    obj.Repr := {obj, obj.arr};
    var s := obj.AsSequence();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect s == [2];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bcapacity=2:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  capacity > 0
  //   POST Q1: s == Elements
  {
    var capacity := 2;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-1, -10, -7];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 2;
    obj.Capacity := 3;
    obj.Elements := [2];
    obj.Repr := {obj, obj.arr};
    var s := obj.AsSequence();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect s == [2];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/BCapacity=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  capacity > 0
  //   POST Q1: s == Elements
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[1] [-10];
    obj.arr := tmp_arr;
    obj.start := 0;
    obj.size := 1;
    obj.Capacity := 1;
    obj.Elements := [7];
    obj.Repr := {obj, obj.arr};
    var s := obj.AsSequence();
    // actual runtime state: s=[-10]
    // expect s == [7]; // LHS=[-10], RHS=[7]
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|Elements|=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  capacity > 0
  //   POST Q1: s == Elements
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [-10, 10, -10];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 2;
    obj.Capacity := 3;
    obj.Elements := [];
    obj.Repr := {obj, obj.arr};
    var s := obj.AsSequence();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect s == [];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|Elements|>=2:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  capacity > 0
  //   POST Q1: s == Elements
  {
    var capacity := 10;
    var obj := new CircularArray.EmptyQueue(capacity);
    var tmp_arr := new int[3] [3, -2, -6];
    obj.arr := tmp_arr;
    obj.start := 2;
    obj.size := 2;
    obj.Capacity := 3;
    obj.Elements := [-8, -1];
    obj.Repr := {obj, obj.arr};
    var s := obj.AsSequence();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect s == [-8, -1];
  }

}

method Main()
{
  TestsForEnqueue();
  print "TestsForEnqueue: all non-failing tests passed!\n";
  TestsForDequeue();
  print "TestsForDequeue: all non-failing tests passed!\n";
  TestsForGetAt();
  print "TestsForGetAt: all non-failing tests passed!\n";
  TestsForAsSequence();
  print "TestsForAsSequence: all non-failing tests passed!\n";
}
