// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Formal_Verification_With_Dafny_tmp_tmp5j79rq48_LimitedStack__2526_ROR_Eq.dfy
// Method: Init
// Generated: 2026-04-08 16:17:45

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  c > 0
  //   POST: Valid()
  //   POST: Empty()
  //   ENSURES: Valid() && Empty() && c == capacity
  {
    var obj := new LimitedStack;
    obj.capacity := 0;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := 0;
    var c := 1;
    obj.Init(c);
    expect obj.Valid();
    expect obj.Empty();
  }

  // Test case for combination {1}/Bc=1,capacity=0,arr=0,top=1:
  //   PRE:  c > 0
  //   POST: Valid()
  //   POST: Empty()
  //   ENSURES: Valid() && Empty() && c == capacity
  {
    var obj := new LimitedStack;
    obj.capacity := 0;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := 1;
    var c := 1;
    obj.Init(c);
    expect obj.Valid();
    expect obj.Empty();
  }

  // Test case for combination {1}/Bc=1,capacity=0,arr=1,top=0:
  //   PRE:  c > 0
  //   POST: Valid()
  //   POST: Empty()
  //   ENSURES: Valid() && Empty() && c == capacity
  {
    var obj := new LimitedStack;
    obj.capacity := 0;
    var tmp_arr := new int[1] [3];
    obj.arr := tmp_arr;
    obj.top := 0;
    var c := 1;
    obj.Init(c);
    expect obj.Valid();
    expect obj.Empty();
  }

  // Test case for combination {1}/Bc=1,capacity=0,arr=1,top=1:
  //   PRE:  c > 0
  //   POST: Valid()
  //   POST: Empty()
  //   ENSURES: Valid() && Empty() && c == capacity
  {
    var obj := new LimitedStack;
    obj.capacity := 0;
    var tmp_arr := new int[1] [3];
    obj.arr := tmp_arr;
    obj.top := 1;
    var c := 1;
    obj.Init(c);
    expect obj.Valid();
    expect obj.Empty();
  }

  // Test case for combination {1}/Ocapacity>0:
  //   PRE:  c > 0
  //   POST: Valid()
  //   POST: Empty()
  //   ENSURES: Valid() && Empty() && c == capacity
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := 3;
    var c := 2;
    obj.Init(c);
    expect obj.Valid();
    expect obj.Empty();
  }

  // Test case for combination {1}/Ocapacity<0:
  //   PRE:  c > 0
  //   POST: Valid()
  //   POST: Empty()
  //   ENSURES: Valid() && Empty() && c == capacity
  {
    var obj := new LimitedStack;
    obj.capacity := 0;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := 4;
    var c := 1;
    obj.Init(c);
    expect obj.Valid();
    expect obj.Empty();
  }

  // Test case for combination {1}/Ocapacity=0:
  //   PRE:  c > 0
  //   POST: Valid()
  //   POST: Empty()
  //   ENSURES: Valid() && Empty() && c == capacity
  {
    var obj := new LimitedStack;
    obj.capacity := 5;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := 6;
    var c := 1;
    obj.Init(c);
    expect obj.Valid();
    expect obj.Empty();
  }

  // Test case for combination {1}:
  //   POST: res == Empty()
  //   ENSURES: res == Empty()
  {
    var obj := new LimitedStack;
    obj.capacity := 0;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := 0;
    var res := obj.isEmpty();
    expect res == false;
  }

  // Test case for combination {1}/Bcapacity=0,arr=0,top=1:
  //   POST: res == Empty()
  //   ENSURES: res == Empty()
  {
    var obj := new LimitedStack;
    obj.capacity := 0;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := 1;
    var res := obj.isEmpty();
    expect res == false;
  }

  // Test case for combination {1}/Bcapacity=0,arr=1,top=0:
  //   POST: res == Empty()
  //   ENSURES: res == Empty()
  {
    var obj := new LimitedStack;
    obj.capacity := 0;
    var tmp_arr := new int[1] [2];
    obj.arr := tmp_arr;
    obj.top := 0;
    var res := obj.isEmpty();
    expect res == false;
  }

  // Test case for combination {1}/Bcapacity=0,arr=1,top=1:
  //   POST: res == Empty()
  //   ENSURES: res == Empty()
  {
    var obj := new LimitedStack;
    obj.capacity := 0;
    var tmp_arr := new int[1] [2];
    obj.arr := tmp_arr;
    obj.top := 1;
    var res := obj.isEmpty();
    expect res == false;
  }

  // Test case for combination {1}/Ores=true:
  //   POST: res == Empty()
  //   ENSURES: res == Empty()
  {
    var obj := new LimitedStack;
    obj.capacity := 0;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := -1;
    var res := obj.isEmpty();
    expect res == true;
  }

  // Test case for combination {1}/Ores=false:
  //   POST: res == Empty()
  //   ENSURES: res == Empty()
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[1] [3];
    obj.arr := tmp_arr;
    obj.top := 2;
    var res := obj.isEmpty();
    expect res == false;
  }

  // Test case for combination {1}:
  //   PRE:  Valid() && !Empty()
  //   POST: elem == arr[top]
  //   ENSURES: elem == arr[top]
  {
    var obj := new LimitedStack;
    obj.capacity := 0;
    var tmp_arr := new int[1] [3];
    obj.arr := tmp_arr;
    obj.top := 0;
    var elem := obj.Peek();
    expect elem == 3;
  }

  // Test case for combination {1}/Bcapacity=1,arr=1,top=0:
  //   PRE:  Valid() && !Empty()
  //   POST: elem == arr[top]
  //   ENSURES: elem == arr[top]
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[1] [2];
    obj.arr := tmp_arr;
    obj.top := 0;
    var elem := obj.Peek();
    expect elem == 2;
  }

  // Test case for combination {1}/Bcapacity=1,arr=2,top=0:
  //   PRE:  Valid() && !Empty()
  //   POST: elem == arr[top]
  //   ENSURES: elem == arr[top]
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[2] [4, 3];
    obj.arr := tmp_arr;
    obj.top := 0;
    var elem := obj.Peek();
    expect elem == 4;
  }

  // Test case for combination {1}/Bcapacity=1,arr=2,top=1:
  //   PRE:  Valid() && !Empty()
  //   POST: elem == arr[top]
  //   ENSURES: elem == arr[top]
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[2] [4, 3];
    obj.arr := tmp_arr;
    obj.top := 1;
    var elem := obj.Peek();
    expect elem == 3;
  }

  // Test case for combination {1}/Oelem>0:
  //   PRE:  Valid() && !Empty()
  //   POST: elem == arr[top]
  //   ENSURES: elem == arr[top]
  {
    var obj := new LimitedStack;
    obj.capacity := 4;
    var tmp_arr := new int[1] [1];
    obj.arr := tmp_arr;
    obj.top := 0;
    var elem := obj.Peek();
    expect elem == 1;
  }

  // Test case for combination {1}/Oelem<0:
  //   PRE:  Valid() && !Empty()
  //   POST: elem == arr[top]
  //   ENSURES: elem == arr[top]
  {
    var obj := new LimitedStack;
    obj.capacity := 5;
    var tmp_arr := new int[1] [-1];
    obj.arr := tmp_arr;
    obj.top := 0;
    var elem := obj.Peek();
    expect elem == -1;
  }

  // Test case for combination {1}/Oelem=0:
  //   PRE:  Valid() && !Empty()
  //   POST: elem == arr[top]
  //   ENSURES: elem == arr[top]
  {
    var obj := new LimitedStack;
    obj.capacity := 6;
    var tmp_arr := new int[1] [0];
    obj.arr := tmp_arr;
    obj.top := 0;
    var elem := obj.Peek();
    expect elem == 0;
  }

  // Test case for combination {1}/Belem=0,capacity=1,arr=1,top=-1:
  //   PRE:  Valid()
  //   PRE:  !Full()
  //   POST: Valid()
  //   POST: top == old(top) + 1
  //   ENSURES: Valid() && top == old(top) + 1 && arr[top] == elem
  //   ENSURES: !old(Empty()) ==> forall i: int {:trigger old(arr[i])} {:trigger arr[i]} :: 0 <= i <= old(top) ==> arr[i] == old(arr[i])
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[1] [2];
    obj.arr := tmp_arr;
    obj.top := -1;
    var elem := 0;
    var old_top := obj.top;
    obj.Push(elem);
    expect obj.Valid();
    expect obj.top == old_top + 1;
  }

  // Test case for combination {1}/Bcapacity=1,arr=1,top=0:
  //   PRE:  Valid() && !Empty()
  //   POST: Valid()
  //   POST: top == old(top) - 1
  //   ENSURES: Valid() && top == old(top) - 1
  //   ENSURES: elem == arr[old(top)]
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[1] [2];
    obj.arr := tmp_arr;
    obj.top := 0;
    var old_top := obj.top;
    var elem := obj.Pop();
    expect obj.Valid();
    expect obj.top == old_top - 1;
  }

  // Test case for combination {1}:
  //   PRE:  Valid() && !Empty()
  //   POST: Valid()
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  //   POST: top == old(top) - 1
  //   ENSURES: Valid()
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  //   ENSURES: top == old(top) - 1
  {
    var obj := new LimitedStack;
    obj.capacity := 0;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := 0;
    obj.Shift();
    expect obj.top == -1;
  }

  // Test case for combination {1}/Otop>0:
  //   PRE:  Valid() && !Empty()
  //   POST: Valid()
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  //   POST: top == old(top) - 1
  //   ENSURES: Valid()
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  //   ENSURES: top == old(top) - 1
  {
    var obj := new LimitedStack;
    obj.capacity := -1;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := 2;
    obj.Shift();
    expect obj.top == 1;
  }

  // Test case for combination {1}/Otop<0:
  //   PRE:  Valid() && !Empty()
  //   POST: Valid()
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  //   POST: top == old(top) - 1
  //   ENSURES: Valid()
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  //   ENSURES: top == old(top) - 1
  {
    var obj := new LimitedStack;
    obj.capacity := -1;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := -2;
    obj.Shift();
    expect obj.top == -3;
  }

  // Test case for combination {1}/Otop=0:
  //   PRE:  Valid() && !Empty()
  //   POST: Valid()
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  //   POST: top == old(top) - 1
  //   ENSURES: Valid()
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  //   ENSURES: top == old(top) - 1
  {
    var obj := new LimitedStack;
    obj.capacity := 2;
    var tmp_arr := new int[1] [10];
    obj.arr := tmp_arr;
    obj.top := 1;
    obj.Shift();
    expect obj.top == 0;
  }

  // Test case for combination {1}/Belem=0,capacity=1,arr=1,top=-1:
  //   PRE:  Valid()
  //   POST: Valid()
  //   POST: !Empty()
  //   POST: arr[top] == elem
  //   POST: !old(!Full())
  //   POST: !old(Full())
  //   ENSURES: Valid() && !Empty()
  //   ENSURES: arr[top] == elem
  //   ENSURES: old(!Full()) ==> top == old(top) + 1 && old(Full()) ==> top == old(top)
  //   ENSURES: (old(Full()) ==> arr[capacity - 1] == elem) && (old(!Full()) ==> top == old(top) + 1 && arr[top] == elem)
  //   ENSURES: old(Full()) ==> forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[1] [0];
    obj.arr := tmp_arr;
    obj.top := -1;
    var elem := 0;
    var old_Full := !obj.Full();
    var old_Full2 := obj.Full();
    obj.Push2(elem);
    expect obj.top == 0;
  }

  // Test case for combination {1}/Otop=0:
  //   PRE:  Valid()
  //   POST: Valid()
  //   POST: !Empty()
  //   POST: arr[top] == elem
  //   POST: !old(!Full())
  //   POST: !old(Full())
  //   ENSURES: Valid() && !Empty()
  //   ENSURES: arr[top] == elem
  //   ENSURES: old(!Full()) ==> top == old(top) + 1 && old(Full()) ==> top == old(top)
  //   ENSURES: (old(Full()) ==> arr[capacity - 1] == elem) && (old(!Full()) ==> top == old(top) + 1 && arr[top] == elem)
  //   ENSURES: old(Full()) ==> forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[1] [13];
    obj.arr := tmp_arr;
    obj.top := -1;
    var elem := 13;
    var old_Full := !obj.Full();
    var old_Full2 := obj.Full();
    obj.Push2(elem);
    expect obj.top == 0;
  }

}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  !Full()
  //   POST: Valid()
  //   POST: top == old(top) + 1
  //   ENSURES: Valid() && top == old(top) + 1 && arr[top] == elem
  //   ENSURES: !old(Empty()) ==> forall i: int {:trigger old(arr[i])} {:trigger arr[i]} :: 0 <= i <= old(top) ==> arr[i] == old(arr[i])
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := 1;
    var elem := 0;
    var old_top := obj.top;
    obj.Push(elem);
    // expect obj.Valid();
    // expect obj.top == old_top + 1;
  }

  // Test case for combination {1}/Belem=0,capacity=1,arr=0,top=-1:
  //   PRE:  Valid()
  //   PRE:  !Full()
  //   POST: Valid()
  //   POST: top == old(top) + 1
  //   ENSURES: Valid() && top == old(top) + 1 && arr[top] == elem
  //   ENSURES: !old(Empty()) ==> forall i: int {:trigger old(arr[i])} {:trigger arr[i]} :: 0 <= i <= old(top) ==> arr[i] == old(arr[i])
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := -1;
    var elem := 0;
    var old_top := obj.top;
    obj.Push(elem);
    // expect obj.Valid();
    // expect obj.top == old_top + 1;
  }

  // Test case for combination {1}/Belem=0,capacity=1,arr=1,top=1:
  //   PRE:  Valid()
  //   PRE:  !Full()
  //   POST: Valid()
  //   POST: top == old(top) + 1
  //   ENSURES: Valid() && top == old(top) + 1 && arr[top] == elem
  //   ENSURES: !old(Empty()) ==> forall i: int {:trigger old(arr[i])} {:trigger arr[i]} :: 0 <= i <= old(top) ==> arr[i] == old(arr[i])
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[1] [2];
    obj.arr := tmp_arr;
    obj.top := 1;
    var elem := 0;
    var old_top := obj.top;
    obj.Push(elem);
    // expect obj.Valid();
    // expect obj.top == old_top + 1;
  }

  // Test case for combination {1}/Otop>0:
  //   PRE:  Valid()
  //   PRE:  !Full()
  //   POST: Valid()
  //   POST: top == old(top) + 1
  //   ENSURES: Valid() && top == old(top) + 1 && arr[top] == elem
  //   ENSURES: !old(Empty()) ==> forall i: int {:trigger old(arr[i])} {:trigger arr[i]} :: 0 <= i <= old(top) ==> arr[i] == old(arr[i])
  {
    var obj := new LimitedStack;
    obj.capacity := 0;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := 0;
    var elem := 1;
    var old_top := obj.top;
    obj.Push(elem);
    // expect obj.Valid();
    // expect obj.top == old_top + 1;
  }

  // Test case for combination {1}/Otop<0:
  //   PRE:  Valid()
  //   PRE:  !Full()
  //   POST: Valid()
  //   POST: top == old(top) + 1
  //   ENSURES: Valid() && top == old(top) + 1 && arr[top] == elem
  //   ENSURES: !old(Empty()) ==> forall i: int {:trigger old(arr[i])} {:trigger arr[i]} :: 0 <= i <= old(top) ==> arr[i] == old(arr[i])
  {
    var obj := new LimitedStack;
    obj.capacity := -1;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := -3;
    var elem := 0;
    var old_top := obj.top;
    obj.Push(elem);
    // expect obj.Valid();
    // expect obj.top == old_top + 1;
  }

  // Test case for combination {1}/Otop=0:
  //   PRE:  Valid()
  //   PRE:  !Full()
  //   POST: Valid()
  //   POST: top == old(top) + 1
  //   ENSURES: Valid() && top == old(top) + 1 && arr[top] == elem
  //   ENSURES: !old(Empty()) ==> forall i: int {:trigger old(arr[i])} {:trigger arr[i]} :: 0 <= i <= old(top) ==> arr[i] == old(arr[i])
  {
    var obj := new LimitedStack;
    obj.capacity := -2;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := -2;
    var elem := 0;
    obj.Push(elem);
    // expect obj.top == 0;
  }

  // Test case for combination {1}:
  //   PRE:  Valid() && !Empty()
  //   POST: Valid()
  //   POST: top == old(top) - 1
  //   ENSURES: Valid() && top == old(top) - 1
  //   ENSURES: elem == arr[old(top)]
  {
    var obj := new LimitedStack;
    obj.capacity := 0;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := 0;
    var old_top := obj.top;
    var elem := obj.Pop();
    // expect obj.Valid();
    // expect obj.top == old_top - 1;
  }

  // Test case for combination {1}/Bcapacity=1,arr=0,top=0:
  //   PRE:  Valid() && !Empty()
  //   POST: Valid()
  //   POST: top == old(top) - 1
  //   ENSURES: Valid() && top == old(top) - 1
  //   ENSURES: elem == arr[old(top)]
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := 0;
    var old_top := obj.top;
    var elem := obj.Pop();
    // expect obj.Valid();
    // expect obj.top == old_top - 1;
  }

  // Test case for combination {1}/Bcapacity=1,arr=0,top=1:
  //   PRE:  Valid() && !Empty()
  //   POST: Valid()
  //   POST: top == old(top) - 1
  //   ENSURES: Valid() && top == old(top) - 1
  //   ENSURES: elem == arr[old(top)]
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := 1;
    var old_top := obj.top;
    var elem := obj.Pop();
    // expect obj.Valid();
    // expect obj.top == old_top - 1;
  }

  // Test case for combination {1}/Oelem>0:
  //   PRE:  Valid() && !Empty()
  //   POST: Valid()
  //   POST: top == old(top) - 1
  //   ENSURES: Valid() && top == old(top) - 1
  //   ENSURES: elem == arr[old(top)]
  {
    var obj := new LimitedStack;
    obj.capacity := 0;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := -2;
    var old_top := obj.top;
    var elem := obj.Pop();
    // expect obj.Valid();
    // expect obj.top == old_top - 1;
  }

  // Test case for combination {1}/Oelem<0:
  //   PRE:  Valid() && !Empty()
  //   POST: Valid()
  //   POST: top == old(top) - 1
  //   ENSURES: Valid() && top == old(top) - 1
  //   ENSURES: elem == arr[old(top)]
  {
    var obj := new LimitedStack;
    obj.capacity := 0;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := -3;
    var old_top := obj.top;
    var elem := obj.Pop();
    // expect obj.Valid();
    // expect obj.top == old_top - 1;
  }

  // Test case for combination {1}/Oelem=0:
  //   PRE:  Valid() && !Empty()
  //   POST: Valid()
  //   POST: top == old(top) - 1
  //   ENSURES: Valid() && top == old(top) - 1
  //   ENSURES: elem == arr[old(top)]
  {
    var obj := new LimitedStack;
    obj.capacity := 0;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := -4;
    var old_top := obj.top;
    var elem := obj.Pop();
    // expect obj.Valid();
    // expect obj.top == old_top - 1;
  }

  // Test case for combination {1}/Otop>0:
  //   PRE:  Valid() && !Empty()
  //   POST: Valid()
  //   POST: top == old(top) - 1
  //   ENSURES: Valid() && top == old(top) - 1
  //   ENSURES: elem == arr[old(top)]
  {
    var obj := new LimitedStack;
    obj.capacity := 3;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := 2;
    var old_top := obj.top;
    var elem := obj.Pop();
    // expect obj.Valid();
    // expect obj.top == old_top - 1;
  }

  // Test case for combination {1}/Otop<0:
  //   PRE:  Valid() && !Empty()
  //   POST: Valid()
  //   POST: top == old(top) - 1
  //   ENSURES: Valid() && top == old(top) - 1
  //   ENSURES: elem == arr[old(top)]
  {
    var obj := new LimitedStack;
    obj.capacity := 5;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := 4;
    var old_top := obj.top;
    var elem := obj.Pop();
    // expect obj.Valid();
    // expect obj.top == old_top - 1;
  }

  // Test case for combination {1}/Otop=0:
  //   PRE:  Valid() && !Empty()
  //   POST: Valid()
  //   POST: top == old(top) - 1
  //   ENSURES: Valid() && top == old(top) - 1
  //   ENSURES: elem == arr[old(top)]
  {
    var obj := new LimitedStack;
    obj.capacity := 7;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := 6;
    var old_top := obj.top;
    var elem := obj.Pop();
    // expect obj.Valid();
    // expect obj.top == old_top - 1;
  }

  // Test case for combination {1}/Bcapacity=1,arr=0,top=0:
  //   PRE:  Valid() && !Empty()
  //   POST: Valid()
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  //   POST: top == old(top) - 1
  //   ENSURES: Valid()
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  //   ENSURES: top == old(top) - 1
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := 0;
    obj.Shift();
    // expect obj.top == -1;
  }

  // Test case for combination {1}/Bcapacity=1,arr=0,top=1:
  //   PRE:  Valid() && !Empty()
  //   POST: Valid()
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  //   POST: top == old(top) - 1
  //   ENSURES: Valid()
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  //   ENSURES: top == old(top) - 1
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[0] [];
    obj.arr := tmp_arr;
    obj.top := 1;
    obj.Shift();
    // expect obj.top == 0;
  }

  // Test case for combination {1}/Bcapacity=1,arr=1,top=0:
  //   PRE:  Valid() && !Empty()
  //   POST: Valid()
  //   POST: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  //   POST: top == old(top) - 1
  //   ENSURES: Valid()
  //   ENSURES: forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  //   ENSURES: top == old(top) - 1
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[1] [2];
    obj.arr := tmp_arr;
    obj.top := 0;
    obj.Shift();
    // expect obj.top == -1;
  }

  // Test case for combination {1}:
  //   PRE:  Valid()
  //   POST: Valid()
  //   POST: !Empty()
  //   POST: arr[top] == elem
  //   POST: !old(!Full())
  //   POST: !old(Full())
  //   ENSURES: Valid() && !Empty()
  //   ENSURES: arr[top] == elem
  //   ENSURES: old(!Full()) ==> top == old(top) + 1 && old(Full()) ==> top == old(top)
  //   ENSURES: (old(Full()) ==> arr[capacity - 1] == elem) && (old(!Full()) ==> top == old(top) + 1 && arr[top] == elem)
  //   ENSURES: old(Full()) ==> forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[1] [21];
    obj.arr := tmp_arr;
    obj.top := -21239;
    var elem := 10;
    var old_Full := !obj.Full();
    var old_Full2 := obj.Full();
    obj.Push2(elem);
    // expect obj.top == -21238;
  }

  // Test case for combination {1}/Belem=0,capacity=1,arr=1,top=0:
  //   PRE:  Valid()
  //   POST: Valid()
  //   POST: !Empty()
  //   POST: arr[top] == elem
  //   POST: !old(!Full())
  //   POST: !old(Full())
  //   ENSURES: Valid() && !Empty()
  //   ENSURES: arr[top] == elem
  //   ENSURES: old(!Full()) ==> top == old(top) + 1 && old(Full()) ==> top == old(top)
  //   ENSURES: (old(Full()) ==> arr[capacity - 1] == elem) && (old(!Full()) ==> top == old(top) + 1 && arr[top] == elem)
  //   ENSURES: old(Full()) ==> forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[1] [0];
    obj.arr := tmp_arr;
    obj.top := 0;
    var elem := 0;
    var old_Full := !obj.Full();
    var old_Full2 := obj.Full();
    obj.Push2(elem);
    // expect obj.Valid();
    // expect !obj.Empty();
    // expect obj.arr[obj.top] == elem;
    // expect !old_Full;
    // expect !old_Full2;
  }

  // Test case for combination {1}/Belem=0,capacity=1,arr=1,top=1:
  //   PRE:  Valid()
  //   POST: Valid()
  //   POST: !Empty()
  //   POST: arr[top] == elem
  //   POST: !old(!Full())
  //   POST: !old(Full())
  //   ENSURES: Valid() && !Empty()
  //   ENSURES: arr[top] == elem
  //   ENSURES: old(!Full()) ==> top == old(top) + 1 && old(Full()) ==> top == old(top)
  //   ENSURES: (old(Full()) ==> arr[capacity - 1] == elem) && (old(!Full()) ==> top == old(top) + 1 && arr[top] == elem)
  //   ENSURES: old(Full()) ==> forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[1] [3];
    obj.arr := tmp_arr;
    obj.top := 1;
    var elem := 0;
    var old_Full := !obj.Full();
    var old_Full2 := obj.Full();
    obj.Push2(elem);
    // expect obj.top == 2;
  }

  // Test case for combination {1}/Otop>0:
  //   PRE:  Valid()
  //   POST: Valid()
  //   POST: !Empty()
  //   POST: arr[top] == elem
  //   POST: !old(!Full())
  //   POST: !old(Full())
  //   ENSURES: Valid() && !Empty()
  //   ENSURES: arr[top] == elem
  //   ENSURES: old(!Full()) ==> top == old(top) + 1 && old(Full()) ==> top == old(top)
  //   ENSURES: (old(Full()) ==> arr[capacity - 1] == elem) && (old(!Full()) ==> top == old(top) + 1 && arr[top] == elem)
  //   ENSURES: old(Full()) ==> forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[1] [11];
    obj.arr := tmp_arr;
    obj.top := 0;
    var elem := 11;
    var old_Full := !obj.Full();
    var old_Full2 := obj.Full();
    obj.Push2(elem);
    // expect obj.Valid();
    // expect !obj.Empty();
    // expect obj.arr[obj.top] == elem;
    // expect !old_Full;
    // expect !old_Full2;
  }

  // Test case for combination {1}/Otop<0:
  //   PRE:  Valid()
  //   POST: Valid()
  //   POST: !Empty()
  //   POST: arr[top] == elem
  //   POST: !old(!Full())
  //   POST: !old(Full())
  //   ENSURES: Valid() && !Empty()
  //   ENSURES: arr[top] == elem
  //   ENSURES: old(!Full()) ==> top == old(top) + 1 && old(Full()) ==> top == old(top)
  //   ENSURES: (old(Full()) ==> arr[capacity - 1] == elem) && (old(!Full()) ==> top == old(top) + 1 && arr[top] == elem)
  //   ENSURES: old(Full()) ==> forall i: int {:trigger arr[i]} :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1])
  {
    var obj := new LimitedStack;
    obj.capacity := 1;
    var tmp_arr := new int[1] [23];
    obj.arr := tmp_arr;
    obj.top := -21240;
    var elem := 12;
    var old_Full := !obj.Full();
    var old_Full2 := obj.Full();
    obj.Push2(elem);
    // expect obj.top == -21239;
  }

}

method Main()
{
  Passing();
  Failing();
}
