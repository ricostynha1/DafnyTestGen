// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\StackOfInt.dfy
// Method: push
// Generated: 2026-04-16 22:32:18

/* 
* Formal specification and verification of a Stack with limited capacity.
* Used to illustration the verification of object-oriented programs.
* Defficulty: Low.
* TODO: Dynamic capacity.
* FEUP, MIEIC, MFES, 2019/20.
*/

class {:autocontracts} StackOfInt
{
    const elems: array<int> // immutable (pointer)
    var size : nat // used size

    predicate Valid()
    {
        size <= elems.Length
    }


    constructor (capacity: nat := 100)
      requires capacity > 0
      ensures elems.Length == capacity && size == 0
    {
        elems := new int[capacity];
        size := 0; 
    }

    predicate  isEmpty()
    {
        size == 0
    }
    
    predicate  isFull()
    {
        size == elems.Length
    }

    method push(x : int)
      requires !isFull()
      ensures elems[..size] == old(elems[..size]) + [x]
    {
        elems[size] := x;
        size := size + 1;
    }

    method  top() returns (res : int)
      requires !isEmpty()
      ensures res == elems[size-1]
    {
         res := elems[size-1];
    }
    
    method pop() 
      requires !isEmpty()
      ensures elems[..size] == old(elems[..size-1])
    {
         size := size-1;
    }
}

// A simple test case.
method testStack()
{
    var s := new StackOfInt(3);
    assert s.isEmpty();
    s.push(1);
    s.push(2);
    s.push(3);
    var x := s.top();
    assert x == 3;
    assert s.isFull();
    s.pop();
    var y := s.top();
    assert y == 2;
    print "top = ", y, " \n";
}

method Passing()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  !isFull()
  //   PRE:  capacity > 0
  //   POST: Valid()
  //   POST: elems[..size] == old(elems[..size]) + [x]
  //   POST: size <= elems.Length
  //   ENSURES: Valid()
  //   ENSURES: elems[..size] == old(elems[..size]) + [x]
  {
    var capacity := 1;
    var obj := new StackOfInt(capacity);
    obj.size := 0;
    obj.elems[0] := 4;
    var x := 0;
    obj.push(x);
    expect obj.Valid();
  }

  // Test case for combination {1}/Bx=0,size=0,elems=2,capacity=2:
  //   PRE:  Valid()
  //   PRE:  !isFull()
  //   PRE:  capacity > 0
  //   POST: Valid()
  //   POST: elems[..size] == old(elems[..size]) + [x]
  //   POST: size <= elems.Length
  //   ENSURES: Valid()
  //   ENSURES: elems[..size] == old(elems[..size]) + [x]
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 0;
    obj.elems[0] := 4;
    obj.elems[1] := 3;
    var x := 0;
    obj.push(x);
    expect obj.Valid();
  }

  // Test case for combination {1}/Bx=0,size=1,elems=2,capacity=2:
  //   PRE:  Valid()
  //   PRE:  !isFull()
  //   PRE:  capacity > 0
  //   POST: Valid()
  //   POST: elems[..size] == old(elems[..size]) + [x]
  //   POST: size <= elems.Length
  //   ENSURES: Valid()
  //   ENSURES: elems[..size] == old(elems[..size]) + [x]
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 4;
    obj.elems[1] := 3;
    var x := 0;
    obj.push(x);
    expect obj.Valid();
  }

  // Test case for combination {1}/Bx=1,size=0,elems=1,capacity=1:
  //   PRE:  Valid()
  //   PRE:  !isFull()
  //   PRE:  capacity > 0
  //   POST: Valid()
  //   POST: elems[..size] == old(elems[..size]) + [x]
  //   POST: size <= elems.Length
  //   ENSURES: Valid()
  //   ENSURES: elems[..size] == old(elems[..size]) + [x]
  {
    var capacity := 1;
    var obj := new StackOfInt(capacity);
    obj.size := 0;
    obj.elems[0] := 2;
    var x := 1;
    obj.push(x);
    expect obj.Valid();
  }

  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: res == elems[size - 1]
  //   ENSURES: res == elems[size - 1]
  {
    var capacity := 1;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 4;
    var res := obj.top();
    expect res == 4;
  }

  // Test case for combination {1}/Bsize==elems_len,elems=2,capacity=2:
  //   PRE:  Valid()
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: res == elems[size - 1]
  //   ENSURES: res == elems[size - 1]
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 2;
    obj.elems[0] := 4;
    obj.elems[1] := 3;
    var res := obj.top();
    expect res == 3;
  }

  // Test case for combination {1}/Bsize=1,elems=2,capacity=2:
  //   PRE:  Valid()
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: res == elems[size - 1]
  //   ENSURES: res == elems[size - 1]
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 4;
    obj.elems[1] := 3;
    var res := obj.top();
    expect res == 4;
  }

  // Test case for combination {1}/Ores>0:
  //   PRE:  Valid()
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: res == elems[size - 1]
  //   ENSURES: res == elems[size - 1]
  {
    var capacity := 3;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 6;
    obj.elems[1] := 9;
    obj.elems[2] := 13;
    var res := obj.top();
    expect res == 6;
  }

  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: Valid()
  //   POST: elems[..size] == old(elems[..size - 1])
  //   POST: size <= elems.Length
  //   ENSURES: Valid()
  //   ENSURES: elems[..size] == old(elems[..size - 1])
  {
    var capacity := 1;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 4;
    obj.pop();
    expect obj.Valid();
  }

  // Test case for combination {1}/Bsize==elems_len,elems=2,capacity=2:
  //   PRE:  Valid()
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: Valid()
  //   POST: elems[..size] == old(elems[..size - 1])
  //   POST: size <= elems.Length
  //   ENSURES: Valid()
  //   ENSURES: elems[..size] == old(elems[..size - 1])
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 2;
    obj.elems[0] := 4;
    obj.elems[1] := 3;
    obj.pop();
    expect obj.Valid();
  }

  // Test case for combination {1}/Bsize=1,elems=2,capacity=2:
  //   PRE:  Valid()
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: Valid()
  //   POST: elems[..size] == old(elems[..size - 1])
  //   POST: size <= elems.Length
  //   ENSURES: Valid()
  //   ENSURES: elems[..size] == old(elems[..size - 1])
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 4;
    obj.elems[1] := 3;
    obj.pop();
    expect obj.Valid();
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
