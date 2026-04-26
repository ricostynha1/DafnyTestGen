// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Formal_Verification_With_Dafny_tmp_tmp5j79rq48_LimitedStack__2526_ROR_Eq.dfy
// Method: Init
// Generated: 2026-04-24 10:34:02

// Formal_Verification_With_Dafny_tmp_tmp5j79rq48_LimitedStack.dfy

class LimitedStack {
  var capacity: int
  var arr: array<int>
  var top: int

  predicate Valid()
    reads this
    decreases {this}
  {
    arr != null &&
    capacity > 0 &&
    capacity == arr.Length &&
    top >= -1 &&
    top < capacity
  }

  predicate Empty()
    reads this`top
    decreases {this}
  {
    top == -1
  }

  predicate Full()
    reads this`top, this`capacity
    decreases {this, this}
  {
    top == capacity - 1
  }

  method Init(c: int)
    requires c > 0
    modifies this
    ensures Valid() && Empty() && c == capacity
    ensures fresh(arr)
    decreases c
  {
    capacity := c;
    arr := new int[c];
    top := -1;
  }

  method isEmpty() returns (res: bool)
    ensures res == Empty()
  {
    if top == -1 {
      return true;
    } else {
      return false;
    }
  }

  method Peek() returns (elem: int)
    requires Valid() && !Empty()
    ensures elem == arr[top]
  {
    return arr[top];
  }

  method Push(elem: int)
    requires Valid()
    requires !Full()
    modifies this`top, this.arr
    ensures Valid() && top == old(top) + 1 && arr[top] == elem
    ensures !old(Empty()) ==> forall i: int {:trigger old(arr[i])} {:trigger arr[i]} :: 0 <= i <= old(top) ==> arr[i] == old(arr[i])
    decreases elem
  {
    top := top + 1;
    arr[top] := elem;
  }

  method Pop() returns (elem: int)
    requires Valid() && !Empty()
    modifies this`top
    ensures Valid() && top == old(top) - 1
    ensures elem == arr[old(top)]
  {
    elem := arr[top];
    top := top - 1;
    return elem;
  }

  method Shift()
    requires Valid() && !Empty()
    modifies this.arr, this`top
    ensures Valid()
    ensures forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
    ensures top == old(top) - 1
  {
    var i: int := 0;
    while i == capacity - 1
      invariant 0 <= i < capacity
      invariant top == old(top)
      invariant forall j: int {:trigger arr[j]} :: 0 <= j < i ==> arr[j] == old(arr[j + 1])
      invariant forall j: int {:trigger old(arr[j])} {:trigger arr[j]} :: i <= j < capacity ==> arr[j] == old(arr[j])
    {
      arr[i] := arr[i + 1];
      i := i + 1;
    }
    top := top - 1;
  }

  method Push2(elem: int)
    requires Valid()
    modifies this.arr, this`top
    ensures Valid() && !Empty()
    ensures arr[top] == elem
    ensures old(!Full()) ==> top == old(top) + 1 && old(Full()) ==> top == old(top)
    ensures (old(Full()) ==> arr[capacity - 1] == elem) && (old(!Full()) ==> top == old(top) + 1 && arr[top] == elem)
    ensures old(Full()) ==> forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
    decreases elem
  {
    if top == capacity - 1 {
      Shift();
      top := top + 1;
      arr[top] := elem;
    } else {
      top := top + 1;
      arr[top] := elem;
    }
  }

  method OriginalMain()
  {
    var s := new LimitedStack;
    s.Init(3);
    assert s.Empty() && !s.Full();
    s.Push(27);
    assert !s.Empty();
    var e := s.Pop();
    assert e == 27;
    assert s.top == -1;
    assert s.Empty() && !s.Full();
    s.Push(5);
    assert s.top == 0;
    assert s.capacity == 3;
    s.Push(32);
    s.Push(9);
    assert s.Full();
    assert s.arr[0] == 5;
    var e2 := s.Pop();
    assert e2 == 9 && !s.Full();
    assert s.arr[0] == 5;
    s.Push(e2);
    s.Push2(99);
    var e3 := s.Peek();
    assert e3 == 99;
    assert s.arr[0] == 32;
  }
}


method TestsForInit()
{
  // Test case for combination {1}/Rel:
  //   PRE:  c > 0
  //   POST Q1: Valid() && Empty() && c == capacity
  {
    var obj := new LimitedStack;
    obj.capacity := -1;
    var tmp_arr := new int[2] [-1, 6];
    obj.arr := tmp_arr;
    obj.top := -10;
    var c := 2;
    obj.Init(c);
    expect obj.Valid() && obj.Empty() && c == obj.capacity;
  }

  // Test case for combination {1}/Ocapacity=0:
  //   PRE:  c > 0
  //   POST Q1: Valid() && Empty() && c == capacity
  {
    var obj := new LimitedStack;
    obj.capacity := 0;
    var tmp_arr := new int[2] [-10, 6];
    obj.arr := tmp_arr;
    obj.top := -10;
    var c := 2;
    obj.Init(c);
    expect obj.Valid() && obj.Empty() && c == obj.capacity;
  }

  // Test case for combination {1}/O|arr|=1:
  //   PRE:  c > 0
  //   POST Q1: Valid() && Empty() && c == capacity
  {
    var obj := new LimitedStack;
    obj.capacity := -1;
    var tmp_arr := new int[1] [-10];
    obj.arr := tmp_arr;
    obj.top := 2;
    var c := 1;
    obj.Init(c);
    expect obj.Valid() && obj.Empty() && c == obj.capacity;
  }

  // Test case for combination {1}/Otop=0:
  //   PRE:  c > 0
  //   POST Q1: Valid() && Empty() && c == capacity
  {
    var obj := new LimitedStack;
    obj.capacity := -1;
    var tmp_arr := new int[2] [-10, 6];
    obj.arr := tmp_arr;
    obj.top := 0;
    var c := 2;
    obj.Init(c);
    expect obj.Valid() && obj.Empty() && c == obj.capacity;
  }

}

method TestsForisEmpty()
{
  // Test case for combination {1}:
  //   POST Q1: res == Empty()
  {
    var obj := new LimitedStack;
    obj.capacity := 2;
    var tmp_arr := new int[1] [6];
    obj.arr := tmp_arr;
    obj.top := -10;
    var res := obj.isEmpty();
    expect res == false;
  }

  // Test case for combination {1}/Ocapacity=0:
  //   POST Q1: res == Empty()
  {
    var obj := new LimitedStack;
    obj.capacity := 0;
    var tmp_arr := new int[1] [6];
    obj.arr := tmp_arr;
    obj.top := -1;
    var res := obj.isEmpty();
    expect res == true;
  }

  // Test case for combination {1}/Ocapacity<0:
  //   POST Q1: res == Empty()
  {
    var obj := new LimitedStack;
    obj.capacity := -10;
    var tmp_arr := new int[1] [-10];
    obj.arr := tmp_arr;
    obj.top := -9;
    var res := obj.isEmpty();
    expect res == false;
  }

  // Test case for combination {1}/O|arr|=0:
  //   POST Q1: res == Empty()
  {
    var obj := new LimitedStack;
    obj.capacity := 2;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := -10;
    var res := obj.isEmpty();
    expect res == false;
  }

  // Test case for combination {1}/O|arr|>=2:
  //   POST Q1: res == Empty()
  {
    var obj := new LimitedStack;
    obj.capacity := 3;
    var tmp_arr := new int[2] [7, -10];
    obj.arr := tmp_arr;
    obj.top := -10;
    var res := obj.isEmpty();
    expect res == false;
  }

  // Test case for combination {1}/Otop=0:
  //   POST Q1: res == Empty()
  {
    var obj := new LimitedStack;
    obj.capacity := -1;
    var tmp_arr := new int[1] [-10];
    obj.arr := tmp_arr;
    obj.top := 0;
    var res := obj.isEmpty();
    expect res == false;
  }

  // Test case for combination {1}/Otop>0:
  //   POST Q1: res == Empty()
  {
    var obj := new LimitedStack;
    obj.capacity := -9;
    var tmp_arr := new int[1] [-1];
    obj.arr := tmp_arr;
    obj.top := 10;
    var res := obj.isEmpty();
    expect res == false;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: res == Empty()
  {
    var obj := new LimitedStack;
    obj.capacity := -8;
    var tmp_arr := new int[1] [3];
    obj.arr := tmp_arr;
    obj.top := -8;
    var res := obj.isEmpty();
    expect res == false;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: res == Empty()
  {
    var obj := new LimitedStack;
    obj.capacity := -10;
    var tmp_arr := new int[1] [-9];
    obj.arr := tmp_arr;
    obj.top := -7;
    var res := obj.isEmpty();
    expect res == false;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: res == Empty()
  {
    var obj := new LimitedStack;
    obj.capacity := -2;
    var tmp_arr := new int[1] [-10];
    obj.arr := tmp_arr;
    obj.top := -6;
    var res := obj.isEmpty();
    expect res == false;
  }

}

method TestsForPeek()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  Valid() && !Empty()
  //   POST Q1: elem == arr[top]
  {
    var obj := new LimitedStack;
    obj.capacity := -1;
    var tmp_arr := new int[1] [6];
    obj.arr := tmp_arr;
    obj.top := -10;
    var elem := obj.Peek();
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.LimitedStack.Peek() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 9006
    // runtime error: at _module.__default.TestCase__14() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 7455
    // expect elem == obj.arr[obj.top];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bcapacity=1:
  //   PRE:  Valid() && !Empty()
  //   POST Q1: elem == arr[top]
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[1] [-10];
    obj.arr := tmp_arr;
    obj.top := -10;
    var elem := obj.Peek();
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.LimitedStack.Peek() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 9006
    // runtime error: at _module.__default.TestCase__15() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 7489
    // expect elem == obj.arr[obj.top];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bcapacity=2:
  //   PRE:  Valid() && !Empty()
  //   POST Q1: elem == arr[top]
  {
    var obj := new LimitedStack;
    obj.capacity := 2;
    var tmp_arr := new int[1] [-10];
    obj.arr := tmp_arr;
    obj.top := -10;
    var elem := obj.Peek();
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.LimitedStack.Peek() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 9006
    // runtime error: at _module.__default.TestCase__16() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 7523
    // expect elem == obj.arr[obj.top];
  }

  // Test case for combination {1}/Btop=0:
  //   PRE:  Valid() && !Empty()
  //   POST Q1: elem == arr[top]
  {
    var obj := new LimitedStack;
    obj.capacity := -1;
    var tmp_arr := new int[1] [-10];
    obj.arr := tmp_arr;
    obj.top := 0;
    var elem := obj.Peek();
    expect elem == obj.arr[obj.top];
    expect elem == -10; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Btop=1:
  //   PRE:  Valid() && !Empty()
  //   POST Q1: elem == arr[top]
  {
    var obj := new LimitedStack;
    obj.capacity := -1;
    var tmp_arr := new int[1] [-10];
    obj.arr := tmp_arr;
    obj.top := 1;
    var elem := obj.Peek();
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.LimitedStack.Peek() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 9006
    // runtime error: at _module.__default.TestCase__18() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 7591
    // expect elem == obj.arr[obj.top];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Ocapacity=0:
  //   PRE:  Valid() && !Empty()
  //   POST Q1: elem == arr[top]
  {
    var obj := new LimitedStack;
    obj.capacity := 0;
    var tmp_arr := new int[1] [-10];
    obj.arr := tmp_arr;
    obj.top := -10;
    var elem := obj.Peek();
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.LimitedStack.Peek() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 9006
    // runtime error: at _module.__default.TestCase__19() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 7625
    // expect elem == obj.arr[obj.top];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|arr|=0:
  //   PRE:  Valid() && !Empty()
  //   POST Q1: elem == arr[top]
  {
    var obj := new LimitedStack;
    obj.capacity := 2;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := -10;
    var elem := obj.Peek();
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.LimitedStack.Peek() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 9006
    // runtime error: at _module.__default.TestCase__20() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 7658
    // expect elem == obj.arr[obj.top];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|arr|>=2:
  //   PRE:  Valid() && !Empty()
  //   POST Q1: elem == arr[top]
  {
    var obj := new LimitedStack;
    obj.capacity := 3;
    var tmp_arr := new int[2] [-1, -10];
    obj.arr := tmp_arr;
    obj.top := -9;
    var elem := obj.Peek();
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.LimitedStack.Peek() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 9006
    // runtime error: at _module.__default.TestCase__21() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 7693
    // expect elem == obj.arr[obj.top];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Oelem>0:
  //   PRE:  Valid() && !Empty()
  //   POST Q1: elem == arr[top]
  {
    var obj := new LimitedStack;
    obj.capacity := -10;
    var tmp_arr := new int[1] [7];
    obj.arr := tmp_arr;
    obj.top := -8;
    var elem := obj.Peek();
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.LimitedStack.Peek() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 9006
    // runtime error: at _module.__default.TestCase__22() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 7727
    // expect elem == obj.arr[obj.top];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Oelem<0:
  //   PRE:  Valid() && !Empty()
  //   POST Q1: elem == arr[top]
  {
    var obj := new LimitedStack;
    obj.capacity := -9;
    var tmp_arr := new int[1] [-2];
    obj.arr := tmp_arr;
    obj.top := -7;
    var elem := obj.Peek();
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.LimitedStack.Peek() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 9006
    // runtime error: at _module.__default.TestCase__23() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 7761
    // expect elem == obj.arr[obj.top];
  }

}

method TestsForPush()
{
  // Test case for combination {1}/Rel:
  //   PRE:  Valid()
  //   PRE:  !Full()
  //   POST Q1: Valid() && top == old(top) + 1 && arr[top] == elem
  //   POST Q2: !old(Empty()) ==> forall i: int {:trigger old(arr[i])} {:trigger arr[i]} :: 0 <= i <= old(top) ==> arr[i] == old(arr[i])
  {
    var obj := new LimitedStack;
    obj.capacity := 2;
    var tmp_arr := new int[2] [-10, -1];
    obj.arr := tmp_arr;
    obj.top := -1;
    var elem := -10;
    var old_top := obj.top;
    var old_Empty := obj.Empty();
    obj.Push(elem);
    expect obj.Valid() && obj.top == old_top + 1 && obj.arr[obj.top] == elem;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Rel:
  //   PRE:  Valid()
  //   PRE:  !Full()
  //   POST Q1: Valid() && top == old(top) + 1 && arr[top] == elem
  //   POST Q2: !old(Empty()) ==> forall i: int {:trigger old(arr[i])} {:trigger arr[i]} :: 0 <= i <= old(top) ==> arr[i] == old(arr[i])
  {
    var obj := new LimitedStack;
    obj.capacity := 2;
    var tmp_arr := new int[2] [-10, -1];
    obj.arr := tmp_arr;
    obj.top := -2;
    var elem := 2;
    var old_top := obj.top;
    var old_Empty := obj.Empty();
    obj.Push(elem);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.LimitedStack.Push(BigInteger elem) in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 9015
    // runtime error: at _module.__default.TestCase__25() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 7835
    // expect obj.Valid() && obj.top == old_top + 1 && obj.arr[obj.top] == elem;
  }

  // Test case for combination {1}/Oelem=0:
  //   PRE:  Valid()
  //   PRE:  !Full()
  //   POST Q1: Valid() && top == old(top) + 1 && arr[top] == elem
  //   POST Q2: !old(Empty()) ==> forall i: int {:trigger old(arr[i])} {:trigger arr[i]} :: 0 <= i <= old(top) ==> arr[i] == old(arr[i])
  {
    var obj := new LimitedStack;
    obj.capacity := 2;
    var tmp_arr := new int[2] [-10, 10];
    obj.arr := tmp_arr;
    obj.top := -1;
    var elem := 0;
    var old_top := obj.top;
    var old_Empty := obj.Empty();
    obj.Push(elem);
    expect obj.Valid() && obj.top == old_top + 1 && obj.arr[obj.top] == elem;
    expect tmp_arr[..] == [0, 10]; // observed from implementation
  }

  // Test case for combination {1}/Oelem>0:
  //   PRE:  Valid()
  //   PRE:  !Full()
  //   POST Q1: Valid() && top == old(top) + 1 && arr[top] == elem
  //   POST Q2: !old(Empty()) ==> forall i: int {:trigger old(arr[i])} {:trigger arr[i]} :: 0 <= i <= old(top) ==> arr[i] == old(arr[i])
  {
    var obj := new LimitedStack;
    obj.capacity := 2;
    var tmp_arr := new int[2] [-1, -10];
    obj.arr := tmp_arr;
    obj.top := -1;
    var elem := 10;
    var old_top := obj.top;
    var old_Empty := obj.Empty();
    obj.Push(elem);
    expect obj.Valid() && obj.top == old_top + 1 && obj.arr[obj.top] == elem;
    expect tmp_arr[..] == [10, -10]; // observed from implementation
  }

  // Test case for combination {1}/O|arr|=1:
  //   PRE:  Valid()
  //   PRE:  !Full()
  //   POST Q1: Valid() && top == old(top) + 1 && arr[top] == elem
  //   POST Q2: !old(Empty()) ==> forall i: int {:trigger old(arr[i])} {:trigger arr[i]} :: 0 <= i <= old(top) ==> arr[i] == old(arr[i])
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[1] [-10];
    obj.arr := tmp_arr;
    obj.top := -1;
    var elem := 2;
    var old_top := obj.top;
    var old_Empty := obj.Empty();
    obj.Push(elem);
    expect obj.Valid() && obj.top == old_top + 1 && obj.arr[obj.top] == elem;
    expect tmp_arr[..] == [2]; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Oelem=0:
  //   PRE:  Valid()
  //   PRE:  !Full()
  //   POST Q1: Valid() && top == old(top) + 1 && arr[top] == elem
  //   POST Q2: !old(Empty()) ==> forall i: int {:trigger old(arr[i])} {:trigger arr[i]} :: 0 <= i <= old(top) ==> arr[i] == old(arr[i])
  {
    var obj := new LimitedStack;
    obj.capacity := 2;
    var tmp_arr := new int[2] [-10, 6];
    obj.arr := tmp_arr;
    obj.top := -2;
    var elem := 0;
    var old_top := obj.top;
    var old_Empty := obj.Empty();
    obj.Push(elem);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.LimitedStack.Push(BigInteger elem) in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 9015
    // runtime error: at _module.__default.TestCase__29() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 7974
    // expect obj.Valid() && obj.top == old_top + 1 && obj.arr[obj.top] == elem;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Oelem<0:
  //   PRE:  Valid()
  //   PRE:  !Full()
  //   POST Q1: Valid() && top == old(top) + 1 && arr[top] == elem
  //   POST Q2: !old(Empty()) ==> forall i: int {:trigger old(arr[i])} {:trigger arr[i]} :: 0 <= i <= old(top) ==> arr[i] == old(arr[i])
  {
    var obj := new LimitedStack;
    obj.capacity := 2;
    var tmp_arr := new int[2] [-1, 7];
    obj.arr := tmp_arr;
    obj.top := -2;
    var elem := -10;
    var old_top := obj.top;
    var old_Empty := obj.Empty();
    obj.Push(elem);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.LimitedStack.Push(BigInteger elem) in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 9015
    // runtime error: at _module.__default.TestCase__30() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 8009
    // expect obj.Valid() && obj.top == old_top + 1 && obj.arr[obj.top] == elem;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/O|arr|=1:
  //   PRE:  Valid()
  //   PRE:  !Full()
  //   POST Q1: Valid() && top == old(top) + 1 && arr[top] == elem
  //   POST Q2: !old(Empty()) ==> forall i: int {:trigger old(arr[i])} {:trigger arr[i]} :: 0 <= i <= old(top) ==> arr[i] == old(arr[i])
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[1] [-10];
    obj.arr := tmp_arr;
    obj.top := -2;
    var elem := -1;
    var old_top := obj.top;
    var old_Empty := obj.Empty();
    obj.Push(elem);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.LimitedStack.Push(BigInteger elem) in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 9015
    // runtime error: at _module.__default.TestCase__31() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 8043
    // expect obj.Valid() && obj.top == old_top + 1 && obj.arr[obj.top] == elem;
  }

  // Test case for combination {2}/Otop=0:
  //   PRE:  Valid()
  //   PRE:  !Full()
  //   POST Q1: Valid() && top == old(top) + 1 && arr[top] == elem
  //   POST Q2: !old(Empty()) ==> forall i: int {:trigger old(arr[i])} {:trigger arr[i]} :: 0 <= i <= old(top) ==> arr[i] == old(arr[i])
  {
    var obj := new LimitedStack;
    obj.capacity := 2;
    var tmp_arr := new int[2] [-10, 6];
    obj.arr := tmp_arr;
    obj.top := 0;
    var elem := 2;
    var old_top := obj.top;
    var old_Empty := obj.Empty();
    obj.Push(elem);
    expect obj.Valid() && obj.top == old_top + 1 && obj.arr[obj.top] == elem;
    expect tmp_arr[..] == [-10, 2]; // observed from implementation
  }

  // Test case for combination {2}/Otop>0:
  //   PRE:  Valid()
  //   PRE:  !Full()
  //   POST Q1: Valid() && top == old(top) + 1 && arr[top] == elem
  //   POST Q2: !old(Empty()) ==> forall i: int {:trigger old(arr[i])} {:trigger arr[i]} :: 0 <= i <= old(top) ==> arr[i] == old(arr[i])
  {
    var obj := new LimitedStack;
    obj.capacity := 4;
    var tmp_arr := new int[4] [-9, -10, -1, 18];
    obj.arr := tmp_arr;
    obj.top := 2;
    var elem := -2;
    var old_top := obj.top;
    var old_Empty := obj.Empty();
    obj.Push(elem);
    expect obj.Valid() && obj.top == old_top + 1 && obj.arr[obj.top] == elem;
    expect tmp_arr[..] == [-9, -10, -1, -2]; // observed from implementation
  }

}

method TestsForPop()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  Valid() && !Empty()
  //   POST Q1: Valid() && top == old(top) - 1
  //   POST Q2: elem == arr[old(top)]
  {
    var obj := new LimitedStack;
    obj.capacity := 2;
    var tmp_arr := new int[2] [-10, -1];
    obj.arr := tmp_arr;
    obj.top := 2;
    var old_top := obj.top;
    var check_elem := obj.arr[old_top];
    var elem := obj.Pop();
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.TestCase__34() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 8147
    // runtime error: at _module.__default._Main(ISequence`1 args) in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 8876
    // expect elem == obj.arr[old_top];
    // expect obj.Valid() && obj.top == old_top - 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|arr|=1:
  //   PRE:  Valid() && !Empty()
  //   POST Q1: Valid() && top == old(top) - 1
  //   POST Q2: elem == arr[old(top)]
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[1] [10];
    obj.arr := tmp_arr;
    obj.top := 1;
    var old_top := obj.top;
    var check_elem := obj.arr[old_top];
    var elem := obj.Pop();
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.TestCase__35() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 8192
    // runtime error: at _module.__default._Main(ISequence`1 args) in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 8878
    // expect elem == obj.arr[old_top];
    // expect obj.Valid() && obj.top == old_top - 1;
  }

  // Test case for combination {1}/Otop=0:
  //   PRE:  Valid() && !Empty()
  //   POST Q1: Valid() && top == old(top) - 1
  //   POST Q2: elem == arr[old(top)]
  {
    var obj := new LimitedStack;
    obj.capacity := 2;
    var tmp_arr := new int[2] [-10, 6];
    obj.arr := tmp_arr;
    obj.top := 0;
    var old_top := obj.top;
    var check_elem := obj.arr[old_top];
    var elem := obj.Pop();
    expect elem == obj.arr[old_top];
    expect obj.Valid() && obj.top == old_top - 1;
    expect check_elem == -10; // observed from implementation
    expect elem == -10; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Oelem<0:
  //   PRE:  Valid() && !Empty()
  //   POST Q1: Valid() && top == old(top) - 1
  //   POST Q2: elem == arr[old(top)]
  {
    var obj := new LimitedStack;
    obj.capacity := 2;
    var tmp_arr := new int[2] [-1, -10];
    obj.arr := tmp_arr;
    obj.top := 2;
    var old_top := obj.top;
    var check_elem := obj.arr[old_top];
    var elem := obj.Pop();
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.TestCase__37() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 8284
    // runtime error: at _module.__default._Main(ISequence`1 args) in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 8882
    // expect elem == obj.arr[old_top];
    // expect obj.Valid() && obj.top == old_top - 1;
  }

}

method TestsForShift()
{
  // Test case for combination {1}/Rel:
  //   PRE:  Valid() && !Empty()
  //   POST Q1: Valid()
  //   POST Q2: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  //   POST Q3: top == old(top) - 1
  //   POST Q4: top >= -1
  //   POST Q5: top < capacity
  //   POST Q6: forall i: int {:trigger arr[i]} :: 0 <= i && i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  {
    var obj := new LimitedStack;
    obj.capacity := 2;
    var tmp_arr := new int[2] [-10, -1];
    obj.arr := tmp_arr;
    obj.top := 2;
    obj.Shift();
    expect obj.top == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|arr|=1:
  //   PRE:  Valid() && !Empty()
  //   POST Q1: Valid()
  //   POST Q2: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  //   POST Q3: top == old(top) - 1
  //   POST Q4: top >= -1
  //   POST Q5: top < capacity
  //   POST Q6: forall i: int {:trigger arr[i]} :: 0 <= i && i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[1] [10];
    obj.arr := tmp_arr;
    obj.top := 1;
    obj.Shift();
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.LimitedStack.Shift() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 9032
    // runtime error: at _module.__default.TestCase__39() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 8355
    // expect obj.top == 0;
  }

  // Test case for combination {1}/Otop=0:
  //   PRE:  Valid() && !Empty()
  //   POST Q1: Valid()
  //   POST Q2: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  //   POST Q3: top == old(top) - 1
  //   POST Q4: top >= -1
  //   POST Q5: top < capacity
  //   POST Q6: forall i: int {:trigger arr[i]} :: 0 <= i && i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  {
    var obj := new LimitedStack;
    obj.capacity := 2;
    var tmp_arr := new int[2] [-10, 6];
    obj.arr := tmp_arr;
    obj.top := 0;
    obj.Shift();
    expect obj.top == -1;
  }

}

method TestsForPush2()
{
  // Test case for combination {5}/Rel:
  //   PRE:  Valid()
  //   POST Q1: Valid() && !Empty()
  //   POST Q2: arr[top] == elem
  //   POST Q3: old(!Full()) ==> top == old(top) + 1 && old(Full()) ==> top == old(top)
  //   POST Q4: (old(Full()) ==> arr[capacity - 1] == elem) && (old(!Full()) ==> top == old(top) + 1 && arr[top] == elem)
  //   POST Q5: old(Full()) ==> forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  {
    var obj := new LimitedStack;
    obj.capacity := 3;
    var tmp_arr := new int[3] [-10, -1, 7];
    obj.arr := tmp_arr;
    obj.top := 2;
    var elem := 2;
    var old_Full := !obj.Full();
    var old_top := obj.top;
    var old_Full2 := obj.Full();
    obj.Push2(elem);
    expect obj.arr[obj.top] == elem;
    expect old_Full ==> obj.top == old_top + 1 && old_Full2 ==> obj.top == old_top;
    expect (old_Full2 ==> obj.arr[obj.capacity - 1] == elem) && (old_Full ==> obj.top == old_top + 1 && obj.arr[obj.top] == elem);
    expect tmp_arr[..] == [-10, -1, 2]; // observed from implementation
  }

  // Test case for combination {7}/Rel:
  //   PRE:  Valid()
  //   POST Q1: Valid() && !Empty()
  //   POST Q2: arr[top] == elem
  //   POST Q3: old(!Full()) ==> top == old(top) + 1 && old(Full()) ==> top == old(top)
  //   POST Q4: (old(Full()) ==> arr[capacity - 1] == elem) && (old(!Full()) ==> top == old(top) + 1 && arr[top] == elem)
  //   POST Q5: old(Full()) ==> forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  {
    var obj := new LimitedStack;
    obj.capacity := 2;
    var tmp_arr := new int[2] [-10, -1];
    obj.arr := tmp_arr;
    obj.top := -1;
    var elem := -1;
    var old_Full := !obj.Full();
    var old_top := obj.top;
    var old_Full2 := obj.Full();
    obj.Push2(elem);
    expect obj.arr[obj.top] == elem;
    expect old_Full ==> obj.top == old_top + 1 && old_Full2 ==> obj.top == old_top;
    expect (old_Full2 ==> obj.arr[obj.capacity - 1] == elem) && (old_Full ==> obj.top == old_top + 1 && obj.arr[obj.top] == elem);
    expect tmp_arr[..] == [-1, -1]; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {5}/Oelem=0:
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q2: !Empty()
  //   POST Q3: arr[top] == elem
  //   POST Q4: old(!Full())
  //   POST Q5: top == old(top) + 1
  //   POST Q6: old(Full())
  //   POST Q7: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  //   POST Q8: forall i: int {:trigger arr[i]} :: 0 <= i && i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  {
    var obj := new LimitedStack;
    obj.capacity := 3;
    var tmp_arr := new int[3] [-10, 7, -7];
    obj.arr := tmp_arr;
    obj.top := 2;
    var elem := 0;
    var old_Full := !obj.Full();
    var old_Full2 := obj.Full();
    obj.Push2(elem);
    // actual runtime state: obj=_module.LimitedStack, tmp_arr=[-10, 7, 0]
    // expect obj.top == 0; // LHS=2, RHS=0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {5}/Oelem<0:
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q2: !Empty()
  //   POST Q3: arr[top] == elem
  //   POST Q4: old(!Full())
  //   POST Q5: top == old(top) + 1
  //   POST Q6: old(Full())
  //   POST Q7: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  //   POST Q8: forall i: int {:trigger arr[i]} :: 0 <= i && i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  {
    var obj := new LimitedStack;
    obj.capacity := 4;
    var tmp_arr := new int[4] [-1, 3, 7, 19];
    obj.arr := tmp_arr;
    obj.top := 3;
    var elem := -10;
    var old_Full := !obj.Full();
    var old_Full2 := obj.Full();
    obj.Push2(elem);
    // actual runtime state: obj=_module.LimitedStack, tmp_arr=[-1, 3, 7, -10]
    // expect obj.top == 0; // LHS=3, RHS=0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {5}/O|arr|=1:
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q2: !Empty()
  //   POST Q3: arr[top] == elem
  //   POST Q4: old(!Full())
  //   POST Q5: top == old(top) + 1
  //   POST Q6: old(Full())
  //   POST Q7: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  //   POST Q8: forall i: int {:trigger arr[i]} :: 0 <= i && i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[1] [2];
    obj.arr := tmp_arr;
    obj.top := 0;
    var elem := -10;
    var old_Full := !obj.Full();
    var old_Full2 := obj.Full();
    obj.Push2(elem);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.LimitedStack.Shift() in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 9032
    // runtime error: at _module.LimitedStack.Push2(BigInteger elem) in C:\cygwin64\tmp\DafnyCBT_y4uqrxsky3w\runner.cs:line 9040
    // expect obj.top == 0;
  }

  // Test case for combination {7}/Oelem=0:
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q2: !Empty()
  //   POST Q3: arr[top] == elem
  //   POST Q4: old(!Full())
  //   POST Q5: top == old(top) + 1
  //   POST Q6: old(Full())
  //   POST Q7: top == old(top)
  //   POST Q8: arr[capacity - 1] == elem
  //   POST Q9: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  {
    var obj := new LimitedStack;
    obj.capacity := 2;
    var tmp_arr := new int[2] [-10, 6];
    obj.arr := tmp_arr;
    obj.top := -1;
    var elem := 0;
    var old_Full := !obj.Full();
    var old_Full2 := obj.Full();
    obj.Push2(elem);
    expect obj.top == 0;
    expect tmp_arr[..] == [0, 6]; // observed from implementation
  }

  // Test case for combination {7}/Oelem>0:
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q2: !Empty()
  //   POST Q3: arr[top] == elem
  //   POST Q4: old(!Full())
  //   POST Q5: top == old(top) + 1
  //   POST Q6: old(Full())
  //   POST Q7: top == old(top)
  //   POST Q8: arr[capacity - 1] == elem
  //   POST Q9: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  {
    var obj := new LimitedStack;
    obj.capacity := 2;
    var tmp_arr := new int[2] [-1, -10];
    obj.arr := tmp_arr;
    obj.top := -1;
    var elem := 10;
    var old_Full := !obj.Full();
    var old_Full2 := obj.Full();
    obj.Push2(elem);
    expect obj.top == 0;
    expect tmp_arr[..] == [10, -10]; // observed from implementation
  }

  // Test case for combination {7}/O|arr|=1:
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q2: !Empty()
  //   POST Q3: arr[top] == elem
  //   POST Q4: old(!Full())
  //   POST Q5: top == old(top) + 1
  //   POST Q6: old(Full())
  //   POST Q7: top == old(top)
  //   POST Q8: arr[capacity - 1] == elem
  //   POST Q9: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[1] [-10];
    obj.arr := tmp_arr;
    obj.top := -1;
    var elem := 2;
    var old_Full := !obj.Full();
    var old_Full2 := obj.Full();
    obj.Push2(elem);
    expect obj.top == 0;
    expect tmp_arr[..] == [2]; // observed from implementation
  }

  // Test case for combination {7}/Otop=0:
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q2: !Empty()
  //   POST Q3: arr[top] == elem
  //   POST Q4: old(!Full())
  //   POST Q5: top == old(top) + 1
  //   POST Q6: old(Full())
  //   POST Q7: top == old(top)
  //   POST Q8: arr[capacity - 1] == elem
  //   POST Q9: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  {
    var obj := new LimitedStack;
    obj.capacity := 2;
    var tmp_arr := new int[2] [-10, 6];
    obj.arr := tmp_arr;
    obj.top := 0;
    var elem := 2;
    var old_Full := !obj.Full();
    var old_Full2 := obj.Full();
    obj.Push2(elem);
    expect obj.top == 1;
    expect tmp_arr[..] == [-10, 2]; // observed from implementation
  }

  // Test case for combination {7}/Otop>0:
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q2: !Empty()
  //   POST Q3: arr[top] == elem
  //   POST Q4: old(!Full())
  //   POST Q5: top == old(top) + 1
  //   POST Q6: old(Full())
  //   POST Q7: top == old(top)
  //   POST Q8: arr[capacity - 1] == elem
  //   POST Q9: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  {
    var obj := new LimitedStack;
    obj.capacity := 4;
    var tmp_arr := new int[4] [-9, -5, -10, 18];
    obj.arr := tmp_arr;
    obj.top := 2;
    var elem := -10;
    var old_Full := !obj.Full();
    var old_Full2 := obj.Full();
    obj.Push2(elem);
    expect obj.top == 3;
    expect tmp_arr[..] == [-9, -5, -10, -10]; // observed from implementation
  }

}

method Main()
{
  TestsForInit();
  print "TestsForInit: all non-failing tests passed!\n";
  TestsForisEmpty();
  print "TestsForisEmpty: all non-failing tests passed!\n";
  TestsForPeek();
  print "TestsForPeek: all non-failing tests passed!\n";
  TestsForPush();
  print "TestsForPush: all non-failing tests passed!\n";
  TestsForPop();
  print "TestsForPop: all non-failing tests passed!\n";
  TestsForShift();
  print "TestsForShift: all non-failing tests passed!\n";
  TestsForPush2();
  print "TestsForPush2: all non-failing tests passed!\n";
}
