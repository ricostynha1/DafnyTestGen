// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\StackOfInt.dfy
// Method: push
// Generated: 2026-04-21 22:51:36

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

method TestsForpush()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  !isFull()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: elems[..size] == old(elems[..size]) + [x]
  //   POST Q4: size <= elems.Length
  {
    var capacity := 3;
    var obj := new StackOfInt(capacity);
    obj.size := 2;
    obj.elems[0] := -10;
    obj.elems[1] := -1;
    obj.elems[2] := 2;
    var x := 2;
    obj.push(x);
    expect obj.Valid();
    expect obj[..] == _module.StackOfInt; // observed from implementation
  }

  // Test case for combination {1}/Bsize=0:
  //   PRE:  Valid()
  //   PRE:  !isFull()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: elems[..size] == old(elems[..size]) + [x]
  //   POST Q4: size <= elems.Length
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 0;
    obj.elems[0] := 7;
    obj.elems[1] := 6;
    var x := -10;
    obj.push(x);
    expect obj.Valid();
    expect obj[..] == _module.StackOfInt; // observed from implementation
  }

  // Test case for combination {1}/Bsize=1:
  //   PRE:  Valid()
  //   PRE:  !isFull()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: elems[..size] == old(elems[..size]) + [x]
  //   POST Q4: size <= elems.Length
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := -10;
    obj.elems[1] := -1;
    var x := 2;
    obj.push(x);
    expect obj.Valid();
    expect obj[..] == _module.StackOfInt; // observed from implementation
  }

  // Test case for combination {1}/Bcapacity=1:
  //   PRE:  Valid()
  //   PRE:  !isFull()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: elems[..size] == old(elems[..size]) + [x]
  //   POST Q4: size <= elems.Length
  {
    var capacity := 1;
    var obj := new StackOfInt(capacity);
    obj.size := 0;
    obj.elems[0] := -10;
    var x := -1;
    obj.push(x);
    expect obj.Valid();
    expect obj[..] == _module.StackOfInt; // observed from implementation
  }

}

method TestsFortop()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST Q1: res == elems[size - 1]
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 2;
    obj.elems[0] := -1;
    obj.elems[1] := 3;
    var res := obj.top();
    expect res == obj.elems[obj.size - 1];
    expect obj[..] == _module.StackOfInt; // observed from implementation
    expect res == 3; // observed from implementation
  }

  // Test case for combination {1}/Bsize=1:
  //   PRE:  Valid()
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST Q1: res == elems[size - 1]
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := -10;
    obj.elems[1] := -3;
    var res := obj.top();
    expect res == obj.elems[obj.size - 1];
    expect obj[..] == _module.StackOfInt; // observed from implementation
    expect res == -10; // observed from implementation
  }

  // Test case for combination {1}/Bcapacity=1:
  //   PRE:  Valid()
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST Q1: res == elems[size - 1]
  {
    var capacity := 1;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 2;
    var res := obj.top();
    expect res == obj.elems[obj.size - 1];
    expect obj[..] == _module.StackOfInt; // observed from implementation
    expect res == 2; // observed from implementation
  }

  // Test case for combination {1}/Ores>0:
  //   PRE:  Valid()
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST Q1: res == elems[size - 1]
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 2;
    obj.elems[0] := -9;
    obj.elems[1] := 2;
    var res := obj.top();
    expect res == obj.elems[obj.size - 1];
    expect obj[..] == _module.StackOfInt; // observed from implementation
    expect res == 2; // observed from implementation
  }

}

method TestsForpop()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: elems[..size] == old(elems[..size - 1])
  //   POST Q4: size <= elems.Length
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 2;
    obj.elems[0] := 4;
    obj.elems[1] := -10;
    obj.pop();
    expect obj.Valid();
    expect obj[..] == _module.StackOfInt; // observed from implementation
  }

  // Test case for combination {1}/Bsize=1:
  //   PRE:  Valid()
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: elems[..size] == old(elems[..size - 1])
  //   POST Q4: size <= elems.Length
  {
    var capacity := 2;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := -10;
    obj.elems[1] := -3;
    obj.pop();
    expect obj.Valid();
    expect obj[..] == _module.StackOfInt; // observed from implementation
  }

  // Test case for combination {1}/Bcapacity=1:
  //   PRE:  Valid()
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: elems[..size] == old(elems[..size - 1])
  //   POST Q4: size <= elems.Length
  {
    var capacity := 1;
    var obj := new StackOfInt(capacity);
    obj.size := 1;
    obj.elems[0] := 2;
    obj.pop();
    expect obj.Valid();
    expect obj[..] == _module.StackOfInt; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  Valid()
  //   PRE:  !isEmpty()
  //   PRE:  capacity > 0
  //   POST Q1: Valid()
  //   POST Q3: elems[..size] == old(elems[..size - 1])
  //   POST Q4: size <= elems.Length
  {
    var capacity := 10;
    var obj := new StackOfInt(capacity);
    obj.size := 2;
    obj.elems[0] := -1;
    obj.elems[1] := -2;
    obj.pop();
    expect obj.Valid();
    expect obj[..] == _module.StackOfInt; // observed from implementation
  }

}

method Main()
{
  TestsForpush();
  print "TestsForpush: all non-failing tests passed!\n";
  TestsFortop();
  print "TestsFortop: all non-failing tests passed!\n";
  TestsForpop();
  print "TestsForpop: all non-failing tests passed!\n";
}
