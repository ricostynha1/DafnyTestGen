// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\StackOfIntTests.dfy
// Method: push
// Generated: 2026-04-11 12:11:31

// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\StackOfInt.dfy
// Method: push
// Generated: 2026-04-10 22:51:59

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
  //   PRE:  !isFull()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == (elems[..size]) + [x]
  //   ENSURES: elems[..size] == (elems[..size]) + [x]
  {
    var capacity := 1;
    var obj := new StackOfInt(capacity);
    obj.size := 0;
    obj.elems[0] := 13;
    var x := 5;
    var old_elems_size := obj.elems[..obj.size];
    obj.push(x);
    expect obj.Valid();
    expect obj.size == 1;
    expect obj.elems[..obj.size] == old_elems_size + [x];
  }

  // Test case for combination {1}/Bx=0,size=0,elems=1,capacity=1:
  //   PRE:  !isFull()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == (elems[..size]) + [x]
  //   ENSURES: elems[..size] == (elems[..size]) + [x]
  {
    var capacity := 1;
    var obj := new StackOfInt(capacity);
    obj.size := 0;
    obj.elems[0] := 8;
    var x := 0;
    var old_elems_size := obj.elems[..obj.size];
    obj.push(x);
    expect obj.Valid();
    expect obj.size == 1;
    expect obj.elems[..obj.size] == old_elems_size + [x];
  }

  // Test case for combination {1}/Bx=0,size=0,elems=2,capacity=2:
  //   PRE:  !isFull()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == (elems[..size]) + [x]
  //   ENSURES: elems[..size] == (elems[..size]) + [x]
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 0;
    obj.elems[0] := 6;
    obj.elems[1] := 5;
    var x := 0;
    var old_elems_size := obj.elems[..obj.size];
    obj.push(x);
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size + [x];
  }

  // Test case for combination {1}/Bx=0,size=1,elems=2,capacity=2:
  //   PRE:  !isFull()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == (elems[..size]) + [x]
  //   ENSURES: elems[..size] == (elems[..size]) + [x]
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 6;
    obj.elems[1] := 5;
    var x := 0;
    var old_elems_size := obj.elems[..obj.size];
    obj.push(x);
    expect obj.Valid();
    expect obj.size == 2;
    expect obj.elems[..obj.size] == old_elems_size + [x];
  }

  // Test case for combination {1}/Osize>=2:
  //   PRE:  !isFull()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == (elems[..size]) + [x]
  //   ENSURES: elems[..size] == (elems[..size]) + [x]
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 16;
    obj.elems[1] := 15;
    var x := 7;
    var old_elems_size := obj.elems[..obj.size];
    obj.push(x);
    expect obj.Valid();
    expect obj.size == 2;
    expect obj.elems[..obj.size] == old_elems_size + [x];
  }

  // Test case for combination {1}/Osize=1:
  //   PRE:  !isFull()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == (elems[..size]) + [x]
  //   ENSURES: elems[..size] == (elems[..size]) + [x]
  {
    var capacity := 1;
    var obj := new StackOfInt(capacity);
    obj.size := 0;
    obj.elems[0] := 15;
    var x := 6;
    var old_elems_size := obj.elems[..obj.size];
    obj.push(x);
    expect obj.Valid();
    expect obj.size == 1;
    expect obj.elems[..obj.size] == old_elems_size + [x];
  }

  // Test case for combination {1}:
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

  // Test case for combination {1}/Bsize=1,elems=2,capacity=2:
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
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: res == elems[size - 1]
  //   ENSURES: res == elems[size - 1]
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 2;
    obj.elems[0] := 8;
    obj.elems[1] := 21239;
    var res := obj.top();
    expect res == 21239;
  }

  // Test case for combination {1}/Ores<0:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: res == elems[size - 1]
  //   ENSURES: res == elems[size - 1]
  {
    var capacity := 3;
    var obj := new StackOfInt(capacity);
    obj.size := 3;
    obj.elems[0] := 9;
    obj.elems[1] := 11;
    obj.elems[2] := -1;
    var res := obj.top();
    expect res == -1;
  }

  // Test case for combination {1}/Ores=0:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: res == elems[size - 1]
  //   ENSURES: res == elems[size - 1]
  {
    var capacity := 4;
    var obj := new StackOfInt(capacity);
    obj.size := 4;
    obj.elems[0] := 11;
    obj.elems[1] := 10;
    obj.elems[2] := 12;
    obj.elems[3] := 0;
    var res := obj.top();
    expect res == 0;
  }

  // Test case for combination {1}:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == (elems[..size - 1])
  //   ENSURES: elems[..size] == (elems[..size - 1])
  {
    var capacity := 1;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 11;
    var old_elems_size_1 := obj.elems[..obj.size - 1];
    obj.pop();
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size_1;
  }

  // Test case for combination {1}/Bsize=1,elems=2,capacity=2:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == (elems[..size - 1])
  //   ENSURES: elems[..size] == (elems[..size - 1])
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 4;
    obj.elems[1] := 3;
    var old_elems_size_1 := obj.elems[..obj.size - 1];
    obj.pop();
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size_1;
  }

  // Test case for combination {1}/Osize>=2:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == (elems[..size - 1])
  //   ENSURES: elems[..size] == (elems[..size - 1])
  {
    var capacity := 3;
    var obj := new StackOfInt(capacity);
    obj.size := 3;
    obj.elems[0] := 15;
    obj.elems[1] := 17;
    obj.elems[2] := 16;
    var old_elems_size_1 := obj.elems[..obj.size - 1];
    obj.pop();
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size_1;
  }

  // Test case for combination {1}/Osize=1:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == (elems[..size - 1])
  //   ENSURES: elems[..size] == (elems[..size - 1])
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 2;
    obj.elems[0] := 6;
    obj.elems[1] := 15;
    var old_elems_size_1 := obj.elems[..obj.size - 1];
    obj.pop();
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size_1;
  }

  // Test case for combination {1}/Osize=0:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == (elems[..size - 1])
  //   ENSURES: elems[..size] == (elems[..size - 1])
  {
    var capacity := 4;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 10;
    obj.elems[1] := 11;
    obj.elems[2] := 12;
    obj.elems[3] := 13;
    var old_elems_size_1 := obj.elems[..obj.size - 1];
    obj.pop();
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size_1;
  }

  // Test case for combination {1}:
  //   PRE:  !isFull()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == old(elems[..size]) + [x]
  //   ENSURES: elems[..size] == old(elems[..size]) + [x]
  {
    var capacity := 1;
    var obj := new StackOfInt(capacity);
    obj.size := 0;
    obj.elems[0] := 13;
    var x := 5;
    var old_elems_size := obj.elems[..obj.size];
    obj.push(x);
    expect obj.Valid();
    expect obj.size == 1;
    expect obj.elems[..obj.size] == old_elems_size + [x];
  }

  // Test case for combination {1}/Bx=0,size=0,elems=1,capacity=1:
  //   PRE:  !isFull()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == old(elems[..size]) + [x]
  //   ENSURES: elems[..size] == old(elems[..size]) + [x]
  {
    var capacity := 1;
    var obj := new StackOfInt(capacity);
    obj.size := 0;
    obj.elems[0] := 8;
    var x := 0;
    var old_elems_size := obj.elems[..obj.size];
    obj.push(x);
    expect obj.Valid();
    expect obj.size == 1;
    expect obj.elems[..obj.size] == old_elems_size + [x];
  }

  // Test case for combination {1}/Bx=0,size=0,elems=2,capacity=2:
  //   PRE:  !isFull()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == old(elems[..size]) + [x]
  //   ENSURES: elems[..size] == old(elems[..size]) + [x]
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 0;
    obj.elems[0] := 6;
    obj.elems[1] := 5;
    var x := 0;
    var old_elems_size := obj.elems[..obj.size];
    obj.push(x);
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size + [x];
  }

  // Test case for combination {1}/Bx=0,size=1,elems=2,capacity=2:
  //   PRE:  !isFull()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == old(elems[..size]) + [x]
  //   ENSURES: elems[..size] == old(elems[..size]) + [x]
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 6;
    obj.elems[1] := 5;
    var x := 0;
    var old_elems_size := obj.elems[..obj.size];
    obj.push(x);
    expect obj.Valid();
    expect obj.size == 2;
    expect obj.elems[..obj.size] == old_elems_size + [x];
  }

  // Test case for combination {1}/Osize>=2:
  //   PRE:  !isFull()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == old(elems[..size]) + [x]
  //   ENSURES: elems[..size] == old(elems[..size]) + [x]
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 16;
    obj.elems[1] := 15;
    var x := 7;
    var old_elems_size := obj.elems[..obj.size];
    obj.push(x);
    expect obj.Valid();
    expect obj.size == 2;
    expect obj.elems[..obj.size] == old_elems_size + [x];
  }

  // Test case for combination {1}/Osize=1:
  //   PRE:  !isFull()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == old(elems[..size]) + [x]
  //   ENSURES: elems[..size] == old(elems[..size]) + [x]
  {
    var capacity := 1;
    var obj := new StackOfInt(capacity);
    obj.size := 0;
    obj.elems[0] := 15;
    var x := 6;
    var old_elems_size := obj.elems[..obj.size];
    obj.push(x);
    expect obj.Valid();
    expect obj.size == 1;
    expect obj.elems[..obj.size] == old_elems_size + [x];
  }

  // Test case for combination {1}:
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

  // Test case for combination {1}/Bsize=1,elems=2,capacity=2:
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
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: res == elems[size - 1]
  //   ENSURES: res == elems[size - 1]
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 2;
    obj.elems[0] := 8;
    obj.elems[1] := 21239;
    var res := obj.top();
    expect res == 21239;
  }

  // Test case for combination {1}/Ores<0:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: res == elems[size - 1]
  //   ENSURES: res == elems[size - 1]
  {
    var capacity := 3;
    var obj := new StackOfInt(capacity);
    obj.size := 3;
    obj.elems[0] := 9;
    obj.elems[1] := 11;
    obj.elems[2] := -1;
    var res := obj.top();
    expect res == -1;
  }

  // Test case for combination {1}/Ores=0:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: res == elems[size - 1]
  //   ENSURES: res == elems[size - 1]
  {
    var capacity := 4;
    var obj := new StackOfInt(capacity);
    obj.size := 4;
    obj.elems[0] := 11;
    obj.elems[1] := 10;
    obj.elems[2] := 12;
    obj.elems[3] := 0;
    var res := obj.top();
    expect res == 0;
  }

  // Test case for combination {1}:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == (elems[..size - 1])
  //   ENSURES: elems[..size] == (elems[..size - 1])
  {
    var capacity := 1;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 11;
    var old_elems_size_1 := obj.elems[..obj.size - 1];
    obj.pop();
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size_1;
  }

  // Test case for combination {1}/Bsize=1,elems=2,capacity=2:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == (elems[..size - 1])
  //   ENSURES: elems[..size] == (elems[..size - 1])
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 4;
    obj.elems[1] := 3;
    var old_elems_size_1 := obj.elems[..obj.size - 1];
    obj.pop();
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size_1;
  }

  // Test case for combination {1}/Osize>=2:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == (elems[..size - 1])
  //   ENSURES: elems[..size] == (elems[..size - 1])
  {
    var capacity := 3;
    var obj := new StackOfInt(capacity);
    obj.size := 3;
    obj.elems[0] := 15;
    obj.elems[1] := 17;
    obj.elems[2] := 16;
    var old_elems_size_1 := obj.elems[..obj.size - 1];
    obj.pop();
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size_1;
  }

  // Test case for combination {1}/Osize=1:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == (elems[..size - 1])
  //   ENSURES: elems[..size] == (elems[..size - 1])
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 2;
    obj.elems[0] := 6;
    obj.elems[1] := 15;
    var old_elems_size_1 := obj.elems[..obj.size - 1];
    obj.pop();
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size_1;
  }

  // Test case for combination {1}/Osize=0:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == (elems[..size - 1])
  //   ENSURES: elems[..size] == (elems[..size - 1])
  {
    var capacity := 4;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 10;
    obj.elems[1] := 11;
    obj.elems[2] := 12;
    obj.elems[3] := 13;
    var old_elems_size_1 := obj.elems[..obj.size - 1];
    obj.pop();
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size_1;
  }

  // Test case for combination {1}:
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

  // Test case for combination {1}/Bsize=1,elems=2,capacity=2:
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
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: res == elems[size - 1]
  //   ENSURES: res == elems[size - 1]
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 2;
    obj.elems[0] := 8;
    obj.elems[1] := 21239;
    var res := obj.top();
    expect res == 21239;
  }

  // Test case for combination {1}/Ores<0:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: res == elems[size - 1]
  //   ENSURES: res == elems[size - 1]
  {
    var capacity := 3;
    var obj := new StackOfInt(capacity);
    obj.size := 3;
    obj.elems[0] := 9;
    obj.elems[1] := 11;
    obj.elems[2] := -1;
    var res := obj.top();
    expect res == -1;
  }

  // Test case for combination {1}/Ores=0:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: res == elems[size - 1]
  //   ENSURES: res == elems[size - 1]
  {
    var capacity := 4;
    var obj := new StackOfInt(capacity);
    obj.size := 4;
    obj.elems[0] := 11;
    obj.elems[1] := 10;
    obj.elems[2] := 12;
    obj.elems[3] := 0;
    var res := obj.top();
    expect res == 0;
  }

  // Test case for combination {1}:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == (elems[..size - 1])
  //   ENSURES: elems[..size] == (elems[..size - 1])
  {
    var capacity := 1;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 11;
    var old_elems_size_1 := obj.elems[..obj.size - 1];
    obj.pop();
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size_1;
  }

  // Test case for combination {1}/Bsize=1,elems=2,capacity=2:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == (elems[..size - 1])
  //   ENSURES: elems[..size] == (elems[..size - 1])
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 4;
    obj.elems[1] := 3;
    var old_elems_size_1 := obj.elems[..obj.size - 1];
    obj.pop();
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size_1;
  }

  // Test case for combination {1}/Osize>=2:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == (elems[..size - 1])
  //   ENSURES: elems[..size] == (elems[..size - 1])
  {
    var capacity := 3;
    var obj := new StackOfInt(capacity);
    obj.size := 3;
    obj.elems[0] := 15;
    obj.elems[1] := 17;
    obj.elems[2] := 16;
    var old_elems_size_1 := obj.elems[..obj.size - 1];
    obj.pop();
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size_1;
  }

  // Test case for combination {1}/Osize=1:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == (elems[..size - 1])
  //   ENSURES: elems[..size] == (elems[..size - 1])
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 2;
    obj.elems[0] := 6;
    obj.elems[1] := 15;
    var old_elems_size_1 := obj.elems[..obj.size - 1];
    obj.pop();
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size_1;
  }

  // Test case for combination {1}/Osize=0:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == (elems[..size - 1])
  //   ENSURES: elems[..size] == (elems[..size - 1])
  {
    var capacity := 4;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 10;
    obj.elems[1] := 11;
    obj.elems[2] := 12;
    obj.elems[3] := 13;
    var old_elems_size_1 := obj.elems[..obj.size - 1];
    obj.pop();
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size_1;
  }

  // Test case for combination {1}:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == old(elems[..size - 1])
  //   ENSURES: elems[..size] == old(elems[..size - 1])
  {
    var capacity := 1;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 11;
    var old_elems_size_1 := obj.elems[..obj.size - 1];
    obj.pop();
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size_1;
  }

  // Test case for combination {1}/Bsize=1,elems=2,capacity=2:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == old(elems[..size - 1])
  //   ENSURES: elems[..size] == old(elems[..size - 1])
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 4;
    obj.elems[1] := 3;
    var old_elems_size_1 := obj.elems[..obj.size - 1];
    obj.pop();
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size_1;
  }

  // Test case for combination {1}/Osize>=2:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == old(elems[..size - 1])
  //   ENSURES: elems[..size] == old(elems[..size - 1])
  {
    var capacity := 3;
    var obj := new StackOfInt(capacity);
    obj.size := 3;
    obj.elems[0] := 15;
    obj.elems[1] := 17;
    obj.elems[2] := 16;
    var old_elems_size_1 := obj.elems[..obj.size - 1];
    obj.pop();
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size_1;
  }

  // Test case for combination {1}/Osize=1:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == old(elems[..size - 1])
  //   ENSURES: elems[..size] == old(elems[..size - 1])
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 2;
    obj.elems[0] := 6;
    obj.elems[1] := 15;
    var old_elems_size_1 := obj.elems[..obj.size - 1];
    obj.pop();
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size_1;
  }

  // Test case for combination {1}/Osize=0:
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST: elems[..size] == old(elems[..size - 1])
  //   ENSURES: elems[..size] == old(elems[..size - 1])
  {
    var capacity := 4;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 10;
    obj.elems[1] := 11;
    obj.elems[2] := 12;
    obj.elems[3] := 13;
    var old_elems_size_1 := obj.elems[..obj.size - 1];
    obj.pop();
    expect obj.Valid();
    expect obj.elems[..obj.size] == old_elems_size_1;
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
