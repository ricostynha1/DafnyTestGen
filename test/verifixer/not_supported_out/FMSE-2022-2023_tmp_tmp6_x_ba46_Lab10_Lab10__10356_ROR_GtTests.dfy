// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\not_supported\FMSE-2022-2023_tmp_tmp6_x_ba46_Lab10_Lab10__10356_ROR_Gt.dfy
// Method: insert
// Generated: 2026-04-08 21:54:39

// FMSE-2022-2023_tmp_tmp6_x_ba46_Lab10_Lab10.dfy

predicate IsOdd(x: int)
  decreases x
{
  x % 2 == 1
}

newtype Odd = n: int
  | IsOdd(n)
  witness 3

trait OddListSpec {
  var s: seq<Odd>
  var capacity: nat

  predicate Valid()
    reads this
    decreases {this}
  {
    0 <= |s| <= this.capacity &&
    forall i: int {:trigger s[i]} :: 
      0 <= i < |s| ==>
        IsOdd(s[i] as int)
  }

  method insert(index: nat, element: Odd)
    requires 0 <= index <= |s|
    requires |s| + 1 <= this.capacity
    modifies this
    ensures |s| == |old(s)| + 1
    ensures s[index] == element
    ensures old(capacity) == capacity
    ensures Valid()
    decreases index, element

  method pushFront(element: Odd)
    requires |s| + 1 <= this.capacity
    modifies this
    ensures |s| == |old(s)| + 1
    ensures s[0] == element
    ensures old(capacity) == capacity
    ensures Valid()
    decreases element

  method pushBack(element: Odd)
    requires |s| + 1 <= this.capacity
    modifies this
    ensures |s| == |old(s)| + 1
    ensures s[|s| - 1] == element
    ensures old(capacity) == capacity
    ensures Valid()
    decreases element

  method remove(element: Odd)
    requires Valid()
    requires |s| > 0
    requires element in s
    modifies this
    ensures |s| == |old(s)| - 1
    ensures old(capacity) == capacity
    ensures Valid()
    decreases element

  method removeAtIndex(index: nat)
    requires Valid()
    requires |s| > 0
    requires 0 <= index < |s|
    modifies this
    ensures |s| == |old(s)| - 1
    ensures old(capacity) == capacity
    ensures Valid()
    decreases index

  method popFront() returns (x: Odd)
    requires Valid()
    requires |s| > 0
    modifies this
    ensures old(s)[0] == x
    ensures |s| == |old(s)| - 1
    ensures old(capacity) == capacity
    ensures Valid()

  method popBack() returns (x: Odd)
    requires Valid()
    requires |s| > 0
    modifies this
    ensures old(s)[|old(s)| - 1] == x
    ensures |s| == |old(s)| - 1
    ensures old(capacity) == capacity
    ensures Valid()

  method length() returns (n: nat)
    ensures n == |s|

  method at(index: nat) returns (x: Odd)
    requires 0 <= index < |s|
    decreases index

  method BinarySearch(element: Odd) returns (index: int)
    requires forall i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < j < |s| ==> s[i] <= s[j]
    ensures 0 <= index ==> index < |s| && s[index] == element
    ensures index == -1 ==> element !in s[..]
    decreases element

  method mergedWith(l2: OddList) returns (l: OddList)
    requires Valid()
    requires l2.Valid()
    requires this.capacity >= 0
    requires l2.capacity >= 0
    requires forall i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < j < |s| ==> s[i] <= s[j]
    requires forall i: int, j: int {:trigger l2.s[j], l2.s[i]} :: 0 <= i < j < |l2.s| ==> l2.s[i] <= l2.s[j]
    ensures l.capacity == this.capacity + l2.capacity
    ensures |l.s| == |s| + |l2.s|
    decreases l2
}

class OddList extends OddListSpec {
  constructor (capacity: nat)
    ensures Valid()
    ensures |s| == 0
    ensures this.capacity == capacity
    decreases capacity
  {
    s := [];
    this.capacity := capacity;
  }

  method insert(index: nat, element: Odd)
    requires 0 <= index <= |s|
    requires |s| + 1 <= this.capacity
    modifies this
    ensures |s| == |old(s)| + 1
    ensures s[index] == element
    ensures old(capacity) == capacity
    ensures Valid()
    decreases index, element
  {
    var tail := s[index..];
    s := s[..index] + [element];
    s := s + tail;
  }

  method pushFront(element: Odd)
    requires |s| + 1 <= this.capacity
    modifies this
    ensures |s| == |old(s)| + 1
    ensures s[0] == element
    ensures old(capacity) == capacity
    ensures Valid()
    decreases element
  {
    insert(0, element);
  }

  method pushBack(element: Odd)
    requires |s| + 1 <= this.capacity
    modifies this
    ensures |s| == |old(s)| + 1
    ensures s[|s| - 1] == element
    ensures old(capacity) == capacity
    ensures Valid()
    decreases element
  {
    insert(|s|, element);
  }

  method remove(element: Odd)
    requires Valid()
    requires |s| > 0
    requires element in s
    modifies this
    ensures |s| == |old(s)| - 1
    ensures old(capacity) == capacity
    ensures Valid()
    decreases element
  {
    for i: int := 0 to |s|
      invariant 0 <= i <= |s|
      invariant forall k: int {:trigger s[k]} :: 0 <= k < i ==> s[k] != element
    {
      if s[i] == element {
        s := s[..i] + s[i + 1..];
        break;
      }
    }
  }

  method removeAtIndex(index: nat)
    requires Valid()
    requires |s| > 0
    requires 0 <= index < |s|
    modifies this
    ensures |s| == |old(s)| - 1
    ensures old(capacity) == capacity
    ensures Valid()
    decreases index
  {
    s := s[..index] + s[index + 1..];
  }

  method popFront() returns (x: Odd)
    requires Valid()
    requires |s| > 0
    modifies this
    ensures old(s)[0] == x
    ensures |s| == |old(s)| - 1
    ensures old(capacity) == capacity
    ensures Valid()
  {
    x := s[0];
    s := s[1..];
  }

  method popBack() returns (x: Odd)
    requires Valid()
    requires |s| > 0
    modifies this
    ensures old(s)[|old(s)| - 1] == x
    ensures |s| == |old(s)| - 1
    ensures old(capacity) == capacity
    ensures Valid()
  {
    x := s[|s| - 1];
    s := s[..|s| - 1];
  }

  method length() returns (n: nat)
    ensures n == |s|
  {
    return |s|;
  }

  method at(index: nat) returns (x: Odd)
    requires 0 <= index < |s|
    ensures s[index] == x
    decreases index
  {
    return s[index];
  }

  method BinarySearch(element: Odd) returns (index: int)
    requires forall i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < j < |s| ==> s[i] <= s[j]
    ensures 0 <= index ==> index < |s| && s[index] == element
    ensures index == -1 ==> element !in s[..]
    decreases element
  {
    var left, right := 0, |s|;
    while left < right
      invariant 0 <= left <= right <= |s|
      invariant element !in s[..left] && element !in s[right..]
      decreases right - left
    {
      var mid := (left + right) / 2;
      if element < s[mid] {
        right := mid;
      } else if s[mid] < element {
        left := mid + 1;
      } else {
        return mid;
      }
    }
    return -1;
  }

  method mergedWith(l2: OddList) returns (l: OddList)
    requires Valid()
    requires l2.Valid()
    requires this.capacity >= 0
    requires l2.capacity >= 0
    requires forall i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < j < |s| ==> s[i] <= s[j]
    requires forall i: int, j: int {:trigger l2.s[j], l2.s[i]} :: 0 <= i < j < |l2.s| ==> l2.s[i] <= l2.s[j]
    ensures l.capacity == this.capacity + l2.capacity
    ensures |l.s| == |s| + |l2.s|
    decreases l2
  {
    l := new OddList(this.capacity + l2.capacity);
    var i, j := 0, 0;
    while i < |s| || j < |l2.s|
      invariant 0 <= i <= |s|
      invariant 0 <= j <= |l2.s|
      invariant i + j == |l.s|
      invariant |l.s| <= l.capacity
      invariant l.capacity == this.capacity + l2.capacity
      decreases |s| - i, |l2.s| - j
    {
      if i == |s| {
        if j == |l2.s| {
          return l;
        } else {
          l.pushBack(l2.s[j]);
          j := j + 1;
        }
      } else {
        if j == |l2.s| {
          l.pushBack(s[i]);
          i := i + 1;
        } else {
          if s[i] < l2.s[j] {
            l.pushBack(s[i]);
            i := i + 1;
          } else {
            l.pushBack(l2.s[j]);
            j := j + 1;
          }
        }
      }
    }
    return l;
  }
}

trait CircularLinkedListSpec<T(==)> {
  var l: seq<T>
  var capacity: nat

  predicate Valid()
    reads this
    decreases {this}
  {
    0 <= |l| <= this.capacity
  }

  method insert(index: int, element: T)
    requires |l| + 1 <= this.capacity
    modifies this
    ensures |old(l)| == 0 ==> l == [element]
    ensures |l| == |old(l)| + 1
    ensures |old(l)| > 0 ==> l[index % |old(l)|] == element
    ensures old(capacity) == capacity
    ensures Valid()
    decreases index

  method remove(element: T)
    requires Valid()
    requires |l| > 0
    requires element in l
    modifies this
    ensures |l| == |old(l)| - 1
    ensures old(capacity) == capacity
    ensures Valid()

  method removeAtIndex(index: int)
    requires Valid()
    requires |l| > 0
    modifies this
    ensures |l| == |old(l)| - 1
    ensures old(capacity) == capacity
    ensures Valid()
    decreases index

  method length() returns (n: nat)
    ensures n == |l|

  method at(index: int) returns (x: T)
    requires |l| > 0
    ensures l[index % |l|] == x
    decreases index

  method nextAfter(index: int) returns (x: T)
    requires |l| > 0
    ensures |l| == 1 ==> x == l[0]
    ensures |l| > 1 && index % |l| == |l| - 1 ==> x == l[0]
    ensures |l| > 1 && 0 <= index && |l| < |l| - 1 ==> x == l[index % |l| + 1]
    decreases index
}

class CircularLinkedList<T(==)> extends CircularLinkedListSpec<T> {
  constructor (capacity: nat)
    requires capacity >= 0
    ensures Valid()
    ensures |l| == 0
    ensures this.capacity == capacity
    decreases capacity
  {
    l := [];
    this.capacity := capacity;
  }

  method insert(index: int, element: T)
    requires |l| + 1 <= this.capacity
    modifies this
    ensures |old(l)| == 0 ==> l == [element]
    ensures |l| == |old(l)| + 1
    ensures |old(l)| > 0 ==> l[index % |old(l)|] == element
    ensures old(capacity) == capacity
    ensures Valid()
    decreases index
  {
    if |l| > 0 {
      l := [element];
    } else {
      var actualIndex := index % |l|;
      var tail := l[actualIndex..];
      l := l[..actualIndex] + [element];
      l := l + tail;
    }
  }

  method remove(element: T)
    requires Valid()
    requires |l| > 0
    requires element in l
    modifies this
    ensures |l| == |old(l)| - 1
    ensures old(capacity) == capacity
    ensures Valid()
  {
    for i: nat := 0 to |l|
      invariant 0 <= i <= |l|
      invariant forall k: int {:trigger l[k]} :: 0 <= k < i ==> l[k] != element
    {
      if l[i] == element {
        l := l[..i] + l[i + 1..];
        break;
      }
    }
  }

  method removeAtIndex(index: int)
    requires Valid()
    requires |l| > 0
    modifies this
    ensures |l| == |old(l)| - 1
    ensures old(capacity) == capacity
    ensures Valid()
    decreases index
  {
    var actualIndex := index % |l|;
    l := l[..actualIndex] + l[actualIndex + 1..];
  }

  method length() returns (n: nat)
    ensures n == |l|
  {
    return |l|;
  }

  method at(index: int) returns (x: T)
    requires |l| > 0
    ensures l[index % |l|] == x
    decreases index
  {
    var actualIndex := index % |l|;
    return l[actualIndex];
  }

  method nextAfter(index: int) returns (x: T)
    requires |l| > 0
    ensures |l| == 1 ==> x == l[0]
    ensures |l| > 1 && index % |l| == |l| - 1 ==> x == l[0]
    ensures |l| > 1 && 0 <= index && |l| < |l| - 1 ==> x == l[index % |l| + 1]
    decreases index
  {
    if |l| == 1 {
      x := l[0];
    } else {
      var actualIndex := index % |l|;
      if actualIndex == |l| - 1 {
        x := l[0];
      } else {
        x := l[actualIndex + 1];
      }
    }
    return x;
  }

  method isIn(element: T) returns (b: bool)
    ensures |l| == 0 ==> b == false
    ensures |l| > 0 && b == true ==> exists i: int {:trigger l[i]} :: 0 <= i < |l| && l[i] == element
    ensures |l| > 0 && b == false ==> !exists i: int {:trigger l[i]} :: 0 <= i < |l| && l[i] == element
  {
    if |l| == 0 {
      b := false;
    } else {
      b := false;
      for i: nat := 0 to |l|
        invariant 0 <= i <= |l|
        invariant forall k: int {:trigger l[k]} :: 0 <= k < i ==> l[k] != element
      {
        if l[i] == element {
          b := true;
          break;
        }
      }
    }
  }
}


method GeneratedTests_insert()
{
  // Test case for combination {1}:
  //   PRE:  0 <= index <= |s|
  //   PRE:  |s| + 1 <= this.capacity
  //   POST: |s| == |old(s)| + 1
  //   POST: s[index] == element
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |s| == |old(s)| + 1
  //   ENSURES: s[index] == element
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 0;
    var obj := new OddList(capacity);
    var index := 0;
    var element := 0;
    var old_capacity := capacity;
    obj.insert(index, element);
    expect |s| == |s| + 1;
    expect s[index] == element;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/Bindex=0,capacity=0:
  //   PRE:  0 <= index <= |s|
  //   PRE:  |s| + 1 <= this.capacity
  //   POST: |s| == |old(s)| + 1
  //   POST: s[index] == element
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |s| == |old(s)| + 1
  //   ENSURES: s[index] == element
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 0;
    var obj := new OddList(capacity);
    var index := 0;
    var element := 1;
    var old_capacity := capacity;
    obj.insert(index, element);
    expect |s| == |s| + 1;
    expect s[index] == element;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/Bindex=0,capacity=1:
  //   PRE:  0 <= index <= |s|
  //   PRE:  |s| + 1 <= this.capacity
  //   POST: |s| == |old(s)| + 1
  //   POST: s[index] == element
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |s| == |old(s)| + 1
  //   ENSURES: s[index] == element
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 1;
    var obj := new OddList(capacity);
    var index := 0;
    var element := 0;
    var old_capacity := capacity;
    obj.insert(index, element);
    expect |s| == |s| + 1;
    expect s[index] == element;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/Bindex=1,capacity=0:
  //   PRE:  0 <= index <= |s|
  //   PRE:  |s| + 1 <= this.capacity
  //   POST: |s| == |old(s)| + 1
  //   POST: s[index] == element
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |s| == |old(s)| + 1
  //   ENSURES: s[index] == element
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 0;
    var obj := new OddList(capacity);
    var index := 1;
    var element := 0;
    var old_capacity := capacity;
    obj.insert(index, element);
    expect |s| == |s| + 1;
    expect s[index] == element;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

}

method GeneratedTests_pushFront()
{
  // Test case for combination {1}:
  //   PRE:  |s| + 1 <= this.capacity
  //   POST: |s| == |old(s)| + 1
  //   POST: s[0] == element
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |s| == |old(s)| + 1
  //   ENSURES: s[0] == element
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 0;
    var obj := new OddList(capacity);
    var element := 0;
    var old_capacity := capacity;
    obj.pushFront(element);
    expect |s| == |s| + 1;
    expect s[0] == element;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/Bcapacity=0:
  //   PRE:  |s| + 1 <= this.capacity
  //   POST: |s| == |old(s)| + 1
  //   POST: s[0] == element
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |s| == |old(s)| + 1
  //   ENSURES: s[0] == element
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 0;
    var obj := new OddList(capacity);
    var element := 1;
    var old_capacity := capacity;
    obj.pushFront(element);
    expect |s| == |s| + 1;
    expect s[0] == element;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/Bcapacity=1:
  //   PRE:  |s| + 1 <= this.capacity
  //   POST: |s| == |old(s)| + 1
  //   POST: s[0] == element
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |s| == |old(s)| + 1
  //   ENSURES: s[0] == element
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 1;
    var obj := new OddList(capacity);
    var element := 0;
    var old_capacity := capacity;
    obj.pushFront(element);
    expect |s| == |s| + 1;
    expect s[0] == element;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

}

method GeneratedTests_pushBack()
{
  // Test case for combination {1}:
  //   PRE:  |s| + 1 <= this.capacity
  //   POST: |s| == |old(s)| + 1
  //   POST: s[|s| - 1] == element
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |s| == |old(s)| + 1
  //   ENSURES: s[|s| - 1] == element
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 0;
    var obj := new OddList(capacity);
    var element := 0;
    var old_capacity := capacity;
    obj.pushBack(element);
    expect |s| == |s| + 1;
    expect s[|s| - 1] == element;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/Bcapacity=0:
  //   PRE:  |s| + 1 <= this.capacity
  //   POST: |s| == |old(s)| + 1
  //   POST: s[|s| - 1] == element
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |s| == |old(s)| + 1
  //   ENSURES: s[|s| - 1] == element
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 0;
    var obj := new OddList(capacity);
    var element := 1;
    var old_capacity := capacity;
    obj.pushBack(element);
    expect |s| == |s| + 1;
    expect s[|s| - 1] == element;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/Bcapacity=1:
  //   PRE:  |s| + 1 <= this.capacity
  //   POST: |s| == |old(s)| + 1
  //   POST: s[|s| - 1] == element
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |s| == |old(s)| + 1
  //   ENSURES: s[|s| - 1] == element
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 1;
    var obj := new OddList(capacity);
    var element := 0;
    var old_capacity := capacity;
    obj.pushBack(element);
    expect |s| == |s| + 1;
    expect s[|s| - 1] == element;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

}

method GeneratedTests_remove()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  |s| > 0
  //   PRE:  element in s
  //   POST: |s| == |old(s)| - 1
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |s| == |old(s)| - 1
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 0;
    var obj := new OddList(capacity);
    var element := 0;
    var old_capacity := capacity;
    obj.remove(element);
    expect |s| == |s| - 1;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/Bcapacity=0:
  //   PRE:  Valid()
  //   PRE:  |s| > 0
  //   PRE:  element in s
  //   POST: |s| == |old(s)| - 1
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |s| == |old(s)| - 1
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 0;
    var obj := new OddList(capacity);
    var element := 1;
    var old_capacity := capacity;
    obj.remove(element);
    expect |s| == |s| - 1;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/Bcapacity=1:
  //   PRE:  Valid()
  //   PRE:  |s| > 0
  //   PRE:  element in s
  //   POST: |s| == |old(s)| - 1
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |s| == |old(s)| - 1
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 1;
    var obj := new OddList(capacity);
    var element := 0;
    var old_capacity := capacity;
    obj.remove(element);
    expect |s| == |s| - 1;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

}

method GeneratedTests_removeAtIndex()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  |s| > 0
  //   PRE:  0 <= index < |s|
  //   POST: |s| == |old(s)| - 1
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |s| == |old(s)| - 1
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 0;
    var obj := new OddList(capacity);
    var index := 0;
    var old_capacity := capacity;
    obj.removeAtIndex(index);
    expect |s| == |s| - 1;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/Bindex=0,capacity=1:
  //   PRE:  Valid()
  //   PRE:  |s| > 0
  //   PRE:  0 <= index < |s|
  //   POST: |s| == |old(s)| - 1
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |s| == |old(s)| - 1
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 1;
    var obj := new OddList(capacity);
    var index := 0;
    var old_capacity := capacity;
    obj.removeAtIndex(index);
    expect |s| == |s| - 1;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/Bindex=1,capacity=0:
  //   PRE:  Valid()
  //   PRE:  |s| > 0
  //   PRE:  0 <= index < |s|
  //   POST: |s| == |old(s)| - 1
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |s| == |old(s)| - 1
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 0;
    var obj := new OddList(capacity);
    var index := 1;
    var old_capacity := capacity;
    obj.removeAtIndex(index);
    expect |s| == |s| - 1;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/Bindex=1,capacity=1:
  //   PRE:  Valid()
  //   PRE:  |s| > 0
  //   PRE:  0 <= index < |s|
  //   POST: |s| == |old(s)| - 1
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |s| == |old(s)| - 1
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 1;
    var obj := new OddList(capacity);
    var index := 1;
    var old_capacity := capacity;
    obj.removeAtIndex(index);
    expect |s| == |s| - 1;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

}

method GeneratedTests_popFront()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  |s| > 0
  //   POST: old(s)[0] == x
  //   POST: |s| == |old(s)| - 1
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: old(s)[0] == x
  //   ENSURES: |s| == |old(s)| - 1
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 0;
    var obj := new OddList(capacity);
    var old_capacity := capacity;
    var x := obj.popFront();
    expect s[0] == x;
    expect |s| == |s| - 1;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/Bcapacity=1:
  //   PRE:  Valid()
  //   PRE:  |s| > 0
  //   POST: old(s)[0] == x
  //   POST: |s| == |old(s)| - 1
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: old(s)[0] == x
  //   ENSURES: |s| == |old(s)| - 1
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 1;
    var obj := new OddList(capacity);
    var old_capacity := capacity;
    var x := obj.popFront();
    expect s[0] == x;
    expect |s| == |s| - 1;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/R3:
  //   PRE:  Valid()
  //   PRE:  |s| > 0
  //   POST: old(s)[0] == x
  //   POST: |s| == |old(s)| - 1
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: old(s)[0] == x
  //   ENSURES: |s| == |old(s)| - 1
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 2;
    var obj := new OddList(capacity);
    var old_capacity := capacity;
    var x := obj.popFront();
    expect s[0] == x;
    expect |s| == |s| - 1;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

}

method GeneratedTests_popBack()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  |s| > 0
  //   POST: old(s)[|old(s)| - 1] == x
  //   POST: |s| == |old(s)| - 1
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: old(s)[|old(s)| - 1] == x
  //   ENSURES: |s| == |old(s)| - 1
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 0;
    var obj := new OddList(capacity);
    var old_capacity := capacity;
    var x := obj.popBack();
    expect s[|s| - 1] == x;
    expect |s| == |s| - 1;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/Bcapacity=1:
  //   PRE:  Valid()
  //   PRE:  |s| > 0
  //   POST: old(s)[|old(s)| - 1] == x
  //   POST: |s| == |old(s)| - 1
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: old(s)[|old(s)| - 1] == x
  //   ENSURES: |s| == |old(s)| - 1
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 1;
    var obj := new OddList(capacity);
    var old_capacity := capacity;
    var x := obj.popBack();
    expect s[|s| - 1] == x;
    expect |s| == |s| - 1;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/R3:
  //   PRE:  Valid()
  //   PRE:  |s| > 0
  //   POST: old(s)[|old(s)| - 1] == x
  //   POST: |s| == |old(s)| - 1
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: old(s)[|old(s)| - 1] == x
  //   ENSURES: |s| == |old(s)| - 1
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 2;
    var obj := new OddList(capacity);
    var old_capacity := capacity;
    var x := obj.popBack();
    expect s[|s| - 1] == x;
    expect |s| == |s| - 1;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

}

method GeneratedTests_length()
{
  // Test case for combination {1}:
  //   POST: n == |s|
  //   ENSURES: n == |s|
  {
    var capacity := 0;
    var obj := new OddList(capacity);
    var n := obj.length();
    expect n == |s|;
  }

  // Test case for combination {1}/Bcapacity=1:
  //   POST: n == |s|
  //   ENSURES: n == |s|
  {
    var capacity := 1;
    var obj := new OddList(capacity);
    var n := obj.length();
    expect n == |s|;
  }

  // Test case for combination {1}/On>=2:
  //   POST: n == |s|
  //   ENSURES: n == |s|
  {
    var capacity := 2;
    var obj := new OddList(capacity);
    var n := obj.length();
    expect n == |s|;
  }

  // Test case for combination {1}/On=1:
  //   POST: n == |s|
  //   ENSURES: n == |s|
  {
    var capacity := 3;
    var obj := new OddList(capacity);
    var n := obj.length();
    expect n == 1;
  }

  // Test case for combination {1}/On=0:
  //   POST: n == |s|
  //   ENSURES: n == |s|
  {
    var capacity := 4;
    var obj := new OddList(capacity);
    var n := obj.length();
    expect n == 0;
  }

}

method GeneratedTests_at()
{
  // Test case for combination {1}:
  //   PRE:  0 <= index < |s|
  //   POST: s[index] == x
  //   ENSURES: s[index] == x
  {
    var capacity := 0;
    var obj := new OddList(capacity);
    var index := 0;
    var x := obj.at(index);
    expect s[index] == x;
  }

  // Test case for combination {1}/Bindex=0,capacity=1:
  //   PRE:  0 <= index < |s|
  //   POST: s[index] == x
  //   ENSURES: s[index] == x
  {
    var capacity := 1;
    var obj := new OddList(capacity);
    var index := 0;
    var x := obj.at(index);
    expect s[index] == x;
  }

  // Test case for combination {1}/Bindex=1,capacity=0:
  //   PRE:  0 <= index < |s|
  //   POST: s[index] == x
  //   ENSURES: s[index] == x
  {
    var capacity := 0;
    var obj := new OddList(capacity);
    var index := 1;
    var x := obj.at(index);
    expect s[index] == x;
  }

  // Test case for combination {1}/Bindex=1,capacity=1:
  //   PRE:  0 <= index < |s|
  //   POST: s[index] == x
  //   ENSURES: s[index] == x
  {
    var capacity := 1;
    var obj := new OddList(capacity);
    var index := 1;
    var x := obj.at(index);
    expect s[index] == x;
  }

}

method GeneratedTests_BinarySearch()
{
  // Test case for combination {3}:
  //   PRE:  forall i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < j < |s| ==> s[i] <= s[j]
  //   POST: index < |s|
  //   POST: s[index] == element
  //   POST: !(index == -1)
  //   POST: index == -1
  //   POST: element !in s[..]
  //   ENSURES: 0 <= index ==> index < |s| && s[index] == element
  //   ENSURES: index == -1 ==> element !in s[..]
  {
    var capacity := 0;
    var obj := new OddList(capacity);
    var element := 0;
    var index := obj.BinarySearch(element);
    expect index == -1;
  }

}

method GeneratedTests_insert()
{
  // Test case for combination {1}:
  //   PRE:  |l| + 1 <= this.capacity
  //   POST: l == [element]
  //   POST: |l| == |old(l)| + 1
  //   POST: l[index % |old(l)|] == element
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   POST: (0 <= |s| <= this.capacity && forall i: int {:trigger s[i]} :: 0 <= i < |s| ==> (s[i] as int % 2 == 1))
  //   ENSURES: |old(l)| == 0 ==> l == [element]
  //   ENSURES: |l| == |old(l)| + 1
  //   ENSURES: |old(l)| > 0 ==> l[index % |old(l)|] == element
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 0;
    var obj := new CircularLinkedList<int>(capacity);
    var index := 0;
    var element := 0;
    var old_capacity := capacity;
    obj.insert(index, element);
    expect l == [element];
    expect |l| == |l| + 1;
    expect l[index % |l|] == element;
    expect old_capacity == capacity;
    expect obj.Valid();
    expect (0 <= |s| <= this.capacity && forall i: int :: 0 <= i < |s| ==> (s[i] as int % 2 == 1));
  }

}

method GeneratedTests_remove()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  |l| > 0
  //   PRE:  element in l
  //   POST: |l| == |old(l)| - 1
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |l| == |old(l)| - 1
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 0;
    var obj := new CircularLinkedList<int>(capacity);
    var element := 0;
    var old_capacity := capacity;
    obj.remove(element);
    expect |l| == |l| - 1;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/Belement=0,capacity=1:
  //   PRE:  Valid()
  //   PRE:  |l| > 0
  //   PRE:  element in l
  //   POST: |l| == |old(l)| - 1
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |l| == |old(l)| - 1
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 1;
    var obj := new CircularLinkedList<int>(capacity);
    var element := 0;
    var old_capacity := capacity;
    obj.remove(element);
    expect |l| == |l| - 1;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/Belement=1,capacity=0:
  //   PRE:  Valid()
  //   PRE:  |l| > 0
  //   PRE:  element in l
  //   POST: |l| == |old(l)| - 1
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |l| == |old(l)| - 1
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 0;
    var obj := new CircularLinkedList<int>(capacity);
    var element := 1;
    var old_capacity := capacity;
    obj.remove(element);
    expect |l| == |l| - 1;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/Belement=1,capacity=1:
  //   PRE:  Valid()
  //   PRE:  |l| > 0
  //   PRE:  element in l
  //   POST: |l| == |old(l)| - 1
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |l| == |old(l)| - 1
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 1;
    var obj := new CircularLinkedList<int>(capacity);
    var element := 1;
    var old_capacity := capacity;
    obj.remove(element);
    expect |l| == |l| - 1;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

}

method GeneratedTests_removeAtIndex()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  |l| > 0
  //   POST: |l| == |old(l)| - 1
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |l| == |old(l)| - 1
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 0;
    var obj := new CircularLinkedList<int>(capacity);
    var index := 0;
    var old_capacity := capacity;
    obj.removeAtIndex(index);
    expect |l| == |l| - 1;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/Bindex=0,capacity=1:
  //   PRE:  Valid()
  //   PRE:  |l| > 0
  //   POST: |l| == |old(l)| - 1
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |l| == |old(l)| - 1
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 1;
    var obj := new CircularLinkedList<int>(capacity);
    var index := 0;
    var old_capacity := capacity;
    obj.removeAtIndex(index);
    expect |l| == |l| - 1;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/Bindex=1,capacity=0:
  //   PRE:  Valid()
  //   PRE:  |l| > 0
  //   POST: |l| == |old(l)| - 1
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |l| == |old(l)| - 1
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 0;
    var obj := new CircularLinkedList<int>(capacity);
    var index := 1;
    var old_capacity := capacity;
    obj.removeAtIndex(index);
    expect |l| == |l| - 1;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

  // Test case for combination {1}/Bindex=1,capacity=1:
  //   PRE:  Valid()
  //   PRE:  |l| > 0
  //   POST: |l| == |old(l)| - 1
  //   POST: old(capacity) == capacity
  //   POST: Valid()
  //   ENSURES: |l| == |old(l)| - 1
  //   ENSURES: old(capacity) == capacity
  //   ENSURES: Valid()
  {
    var capacity := 1;
    var obj := new CircularLinkedList<int>(capacity);
    var index := 1;
    var old_capacity := capacity;
    obj.removeAtIndex(index);
    expect |l| == |l| - 1;
    expect old_capacity == capacity;
    expect obj.Valid();
  }

}

method GeneratedTests_length()
{
  // Test case for combination {1}:
  //   POST: n == |l|
  //   ENSURES: n == |l|
  {
    var capacity := 0;
    var obj := new CircularLinkedList<int>(capacity);
    var n := obj.length();
    expect n == |l|;
  }

  // Test case for combination {1}/Bcapacity=1:
  //   POST: n == |l|
  //   ENSURES: n == |l|
  {
    var capacity := 1;
    var obj := new CircularLinkedList<int>(capacity);
    var n := obj.length();
    expect n == |l|;
  }

  // Test case for combination {1}/On>=2:
  //   POST: n == |l|
  //   ENSURES: n == |l|
  {
    var capacity := 2;
    var obj := new CircularLinkedList<int>(capacity);
    var n := obj.length();
    expect n == |l|;
  }

  // Test case for combination {1}/On=1:
  //   POST: n == |l|
  //   ENSURES: n == |l|
  {
    var capacity := 3;
    var obj := new CircularLinkedList<int>(capacity);
    var n := obj.length();
    expect n == 1;
  }

  // Test case for combination {1}/On=0:
  //   POST: n == |l|
  //   ENSURES: n == |l|
  {
    var capacity := 4;
    var obj := new CircularLinkedList<int>(capacity);
    var n := obj.length();
    expect n == 0;
  }

}

method GeneratedTests_at()
{
  // Test case for combination {1}:
  //   PRE:  |l| > 0
  //   POST: l[index % |l|] == x
  //   ENSURES: l[index % |l|] == x
  {
    var capacity := 0;
    var obj := new CircularLinkedList<int>(capacity);
    var index := 0;
    var x := obj.at(index);
    expect l[index % |l|] == x;
  }

  // Test case for combination {1}/Bindex=0,capacity=1:
  //   PRE:  |l| > 0
  //   POST: l[index % |l|] == x
  //   ENSURES: l[index % |l|] == x
  {
    var capacity := 1;
    var obj := new CircularLinkedList<int>(capacity);
    var index := 0;
    var x := obj.at(index);
    expect l[index % |l|] == x;
  }

  // Test case for combination {1}/Bindex=1,capacity=0:
  //   PRE:  |l| > 0
  //   POST: l[index % |l|] == x
  //   ENSURES: l[index % |l|] == x
  {
    var capacity := 0;
    var obj := new CircularLinkedList<int>(capacity);
    var index := 1;
    var x := obj.at(index);
    expect l[index % |l|] == x;
  }

  // Test case for combination {1}/Bindex=1,capacity=1:
  //   PRE:  |l| > 0
  //   POST: l[index % |l|] == x
  //   ENSURES: l[index % |l|] == x
  {
    var capacity := 1;
    var obj := new CircularLinkedList<int>(capacity);
    var index := 1;
    var x := obj.at(index);
    expect l[index % |l|] == x;
  }

}

method GeneratedTests_nextAfter()
{
  // Test case for combination {35}:
  //   PRE:  |l| > 0
  //   POST: x == l[0]
  //   POST: !(x == l[0])
  //   POST: x == l[index % |l| + 1]
  //   POST: !(index % |l| == |l| - 1)
  //   POST: !(0 <= index)
  //   POST: !(|l| < |l| - 1)
  //   POST: !(x == l[index % |l| + 1])
  //   ENSURES: |l| == 1 ==> x == l[0]
  //   ENSURES: |l| > 1 && index % |l| == |l| - 1 ==> x == l[0]
  //   ENSURES: |l| > 1 && 0 <= index && |l| < |l| - 1 ==> x == l[index % |l| + 1]
  {
    var capacity := 0;
    var obj := new CircularLinkedList<int>(capacity);
    var index := -1;
    var x := obj.nextAfter(index);
    expect x == l[0];
    expect !(x == l[0]);
    expect x == l[0];
    expect !(index % |l| == |l| - 1);
    expect !(0 <= index);
    expect !(|l| < |l| - 1);
    expect !(x == l[index % |l| + 1]);
  }

  // Test case for combination {36}:
  //   PRE:  |l| > 0
  //   POST: x == l[0]
  //   POST: !(x == l[0])
  //   POST: x == l[index % |l| + 1]
  //   POST: !(index % |l| == |l| - 1)
  //   POST: 0 <= index
  //   POST: !(|l| < |l| - 1)
  //   POST: !(x == l[index % |l| + 1])
  //   ENSURES: |l| == 1 ==> x == l[0]
  //   ENSURES: |l| > 1 && index % |l| == |l| - 1 ==> x == l[0]
  //   ENSURES: |l| > 1 && 0 <= index && |l| < |l| - 1 ==> x == l[index % |l| + 1]
  {
    var capacity := 0;
    var obj := new CircularLinkedList<int>(capacity);
    var index := 0;
    var x := obj.nextAfter(index);
    expect x == l[0];
    expect !(x == l[0]);
    expect x == l[0];
    expect !(index % |l| == |l| - 1);
    expect 0 <= index;
    expect !(|l| < |l| - 1);
    expect !(x == l[index % |l| + 1]);
  }

}

method GeneratedTests_isIn()
{
  // Test case for combination {42}:
  //   POST: b == false
  //   POST: 0 < |l|
  //   POST: l[(|l| - 1)] == element
  //   POST: !exists i: int {:trigger l[i]} :: 0 <= i < |l| && l[i] == element
  //   POST: l[0] == element
  //   POST: exists i :: 1 <= i < (|l| - 1) && l[i] == element
  //   ENSURES: |l| == 0 ==> b == false
  //   ENSURES: |l| > 0 && b == true ==> exists i: int {:trigger l[i]} :: 0 <= i < |l| && l[i] == element
  //   ENSURES: |l| > 0 && b == false ==> !exists i: int {:trigger l[i]} :: 0 <= i < |l| && l[i] == element
  {
    var capacity := 0;
    var obj := new CircularLinkedList<int>(capacity);
    var element := 0;
    var b := obj.isIn(element);
    expect b == true;
  }

}

method Main()
{
  GeneratedTests_insert();
  print "GeneratedTests_insert: all tests passed!\n";
  GeneratedTests_pushFront();
  print "GeneratedTests_pushFront: all tests passed!\n";
  GeneratedTests_pushBack();
  print "GeneratedTests_pushBack: all tests passed!\n";
  GeneratedTests_remove();
  print "GeneratedTests_remove: all tests passed!\n";
  GeneratedTests_removeAtIndex();
  print "GeneratedTests_removeAtIndex: all tests passed!\n";
  GeneratedTests_popFront();
  print "GeneratedTests_popFront: all tests passed!\n";
  GeneratedTests_popBack();
  print "GeneratedTests_popBack: all tests passed!\n";
  GeneratedTests_length();
  print "GeneratedTests_length: all tests passed!\n";
  GeneratedTests_at();
  print "GeneratedTests_at: all tests passed!\n";
  GeneratedTests_BinarySearch();
  print "GeneratedTests_BinarySearch: all tests passed!\n";
  GeneratedTests_insert();
  print "GeneratedTests_insert: all tests passed!\n";
  GeneratedTests_remove();
  print "GeneratedTests_remove: all tests passed!\n";
  GeneratedTests_removeAtIndex();
  print "GeneratedTests_removeAtIndex: all tests passed!\n";
  GeneratedTests_length();
  print "GeneratedTests_length: all tests passed!\n";
  GeneratedTests_at();
  print "GeneratedTests_at: all tests passed!\n";
  GeneratedTests_nextAfter();
  print "GeneratedTests_nextAfter: all tests passed!\n";
  GeneratedTests_isIn();
  print "GeneratedTests_isIn: all tests passed!\n";
}
