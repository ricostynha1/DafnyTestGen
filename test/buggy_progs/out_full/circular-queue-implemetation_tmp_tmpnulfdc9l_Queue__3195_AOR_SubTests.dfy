// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\circular-queue-implemetation_tmp_tmpnulfdc9l_Queue__3195_AOR_Sub.dfy
// Method: insert
// Generated: 2026-04-24 09:26:00

// circular-queue-implemetation_tmp_tmpnulfdc9l_Queue.dfy

method Main()
{
  var circularQueue := new Queue();
  assert circularQueue.circularQueue.Length == 0;
  assert circularQueue.Content == [];
  assert circularQueue.Content != [1];
  var isQueueEmpty := circularQueue.isEmpty();
  assert isQueueEmpty == true;
  var queueSize := circularQueue.size();
  assert queueSize == 0;
  circularQueue.auxInsertEmptyQueue(2);
  assert circularQueue.Content == [2];
  assert circularQueue.counter == 1;
  assert circularQueue.circularQueue.Length == 1;
  assert circularQueue.front == 0;
  assert circularQueue.rear == 1;
  assert circularQueue.rear != 2;
  assert circularQueue.front != 2;
  circularQueue.auxInsertEndQueue(4);
  assert circularQueue.Content == [2, 4];
  assert circularQueue.counter == 2;
  assert circularQueue.front == 0;
  assert circularQueue.rear == 2;
  circularQueue.auxInsertEndQueue(4);
  assert circularQueue.Content == [2, 4, 4];
  assert circularQueue.counter == 3;
  circularQueue.auxInsertEndQueue(56);
  assert circularQueue.Content == [2, 4, 4, 56];
  assert circularQueue.counter == 4;
  var contains56 := circularQueue.contains(56);
  assert contains56 == true;
  var contains4 := circularQueue.contains(4);
  assert contains4 == true;
  var item := circularQueue.remove();
  assert item == 2;
  assert (0 + 1) % 6 == 1;
  assert (1 + 1) % 6 == 2;
  assert (2 + 1) % 6 == 3;
  assert (3 + 1) % 6 == 4;
  assert (4 + 1) % 6 == 5;
  assert (5 + 1) % 6 == 0;
  assert (0 + 1) % 6 == 1;
}

class {:autocontracts} Queue {
  var circularQueue: array<int>
  var rear: nat
  var front: nat
  var counter: nat
  var Content: seq<int>

  predicate Valid()
    reads this, Repr
    ensures Valid() ==> this in Repr
    decreases Repr + {this}
  {
    this in Repr &&
    null !in Repr &&
    circularQueue in Repr &&
    0 <= counter <= circularQueue.Length &&
    0 <= front &&
    0 <= rear &&
    Content == circularQueue[..]
  }

  constructor ()
    ensures Valid()
    ensures fresh(Repr)
    ensures circularQueue.Length == 0
    ensures front == 0 && rear == 0
    ensures Content == []
    ensures counter == 0
  {
    circularQueue := new int[0];
    rear := 0;
    front := 0;
    Content := [];
    counter := 0;
    new;
    Repr := {this};
    if !(circularQueue in Repr) {
      Repr := Repr + {circularQueue};
    }
  }

  method insert(item: int)
    requires Valid()
    modifies Repr
    ensures Valid()
    ensures fresh(Repr - old(Repr))
    decreases item
  {
    if !(circularQueue in Repr) {
      Repr := Repr + {circularQueue};
    }
  }

  method auxInsertEmptyQueue(item: int)
    requires Valid()
    requires front == 0 && rear == 0 && circularQueue.Length == 0
    modifies Repr
    ensures Valid()
    ensures fresh(Repr - old(Repr))
    ensures circularQueue.Length == 1
    ensures Content == [item]
    ensures |Content| == 1
    ensures rear == 1
    ensures counter == old(counter) + 1
    ensures front == 0
    decreases item
  {
    counter := counter + 1;
    var queueInsert: array<int>;
    queueInsert := new int[circularQueue.Length - 1];
    queueInsert[0] := item;
    circularQueue := queueInsert;
    Content := [item];
    rear := rear + 1;
    if !(circularQueue in Repr) {
      Repr := Repr + {circularQueue};
    }
  }

  method auxInsertEndQueue(item: int)
    requires Valid()
    requires front == 0 && rear == circularQueue.Length && circularQueue.Length >= 1
    modifies Repr
    ensures Valid()
    ensures fresh(Repr - old(Repr))
    ensures Content == old(Content) + [item]
    ensures |Content| == old(|Content|) + 1
    ensures front == 0
    ensures rear == old(rear) + 1
    ensures counter == old(counter) + 1
    decreases item

  method auxInsertSpaceQueue(item: int)
    requires Valid()
    requires rear < front && front < circularQueue.Length
    modifies Repr
    ensures Valid()
    ensures fresh(Repr - old(Repr))
    ensures rear == old(rear) + 1
    ensures counter == old(counter) + 1
    ensures Content == old(Content[0 .. rear]) + [item] + old(Content[rear + 1 .. circularQueue.Length])
    ensures |Content| == old(|Content|) + 1
    decreases item

  method auxInsertInitQueue(item: int)
    requires Valid()
    modifies Repr
    ensures Valid()
    ensures fresh(Repr - old(Repr))
    decreases item

  method auxInsertBetweenQueue(item: int)
    requires Valid()
    modifies Repr
    ensures Valid()
    ensures fresh(Repr - old(Repr))
    decreases item

  method remove() returns (item: int)
    requires Valid()
    requires front < circularQueue.Length
    requires circularQueue.Length > 0
    modifies Repr
    ensures Valid()
    ensures fresh(Repr - old(Repr))
    ensures rear <= |old(Content)|
    ensures circularQueue.Length > 0
    ensures item == old(Content)[old(front)]
    ensures front == (old(front) + 1) % circularQueue.Length
    ensures old(front) < rear ==> Content == old(Content)[old(front) .. rear]
    ensures old(front) > rear ==> Content == old(Content)[0 .. rear] + old(Content)[old(front) .. |old(Content)|]

  method size() returns (size: nat)
    requires Valid()
    ensures size == counter
  {
    size := counter;
  }

  method isEmpty() returns (isEmpty: bool)
    requires Valid()
    ensures isEmpty == true ==> counter == 0
    ensures isEmpty == false ==> counter != 0
  {
    isEmpty := if counter == 0 then true else false;
  }

  method contains(item: int) returns (contains: bool)
    requires Valid()
    ensures contains == true ==> item in circularQueue[..]
    ensures contains == false ==> item !in circularQueue[..]
    decreases item
  {
    var i: nat := 0;
    contains := false;
    while i < circularQueue.Length
      invariant 0 <= i <= circularQueue.Length
      invariant !contains ==> forall j: int {:trigger circularQueue[j]} :: 0 <= j < i ==> circularQueue[j] != item
      decreases circularQueue.Length - i
    {
      if circularQueue[i] == item {
        contains := true;
        break;
      }
      i := i + 1;
    }
  }

  method mergeQueues(otherQueue: Queue) returns (mergedQueue: Queue)
    requires Valid()
    modifies Repr
    ensures Valid()
    ensures fresh(Repr - old(Repr))
    decreases otherQueue
  {
    var newQueueSize: int := otherQueue.circularQueue.Length + circularQueue.Length;
    var newFront: int := front;
    var newRear: int := otherQueue.rear;
    var tmp: array<int> := new int[newQueueSize];
    forall i: int | 0 <= i < circularQueue.Length {
      tmp[i] := circularQueue[i];
    }
    mergedQueue := new Queue();
    if !(circularQueue in Repr) {
      Repr := Repr + {circularQueue};
    }
  }

  var Repr: set<object?>
}


method TestsForinsert()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [7, -10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [7];
    obj.Repr := {obj, obj.circularQueue};
    var item := 2;
    obj.insert(item);
    expect obj.Valid();
  }

  // Test case for combination {1}/Brear=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-10, 9];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 0;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [9];
    obj.Repr := {obj, obj.circularQueue};
    var item := 2;
    obj.insert(item);
    expect obj.Valid();
  }

  // Test case for combination {1}/Brear=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-10, -1];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 1;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [-4];
    obj.Repr := {obj, obj.circularQueue};
    var item := -1;
    obj.insert(item);
    expect obj.Valid();
  }

  // Test case for combination {1}/Bfront=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [4, 7];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 0;
    obj.counter := 2;
    obj.Content := [7];
    obj.Repr := {obj, obj.circularQueue};
    var item := -10;
    obj.insert(item);
    expect obj.Valid();
  }

  // Test case for combination {1}/Bfront=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-10, 4];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 1;
    obj.counter := 2;
    obj.Content := [-8];
    obj.Repr := {obj, obj.circularQueue};
    var item := -10;
    obj.insert(item);
    expect obj.Valid();
  }

  // Test case for combination {1}/Bcounter=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 0;
    obj.Content := [9];
    obj.Repr := {obj, obj.circularQueue};
    var item := -1;
    obj.insert(item);
    expect obj.Valid();
  }

  // Test case for combination {1}/Bcounter=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [-1];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 1;
    obj.Content := [2];
    obj.Repr := {obj, obj.circularQueue};
    var item := -1;
    obj.insert(item);
    expect obj.Valid();
  }

  // Test case for combination {1}/Oitem=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-2, -3];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [-3];
    obj.Repr := {obj, obj.circularQueue};
    var item := 0;
    obj.insert(item);
    expect obj.Valid();
  }

  // Test case for combination {1}/O|circularQueue|=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[0] [];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 0;
    obj.Content := [6];
    obj.Repr := {obj, obj.circularQueue};
    var item := -1;
    obj.insert(item);
    expect obj.Valid();
  }

  // Test case for combination {1}/O|Content|=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-10, -1];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [];
    obj.Repr := {obj, obj.circularQueue};
    var item := -1;
    obj.insert(item);
    expect obj.Valid();
  }

}

method TestsForauxInsertInitQueue()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [7, -10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [7];
    obj.Repr := {obj, obj.circularQueue};
    var item := 2;
    // obj.auxInsertInitQueue(item);
  }

  // Test case for combination {1}/Brear=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-10, 9];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 0;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [9];
    obj.Repr := {obj, obj.circularQueue};
    var item := 2;
    // obj.auxInsertInitQueue(item);
  }

  // Test case for combination {1}/Brear=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-10, -1];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 1;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [-4];
    obj.Repr := {obj, obj.circularQueue};
    var item := -1;
    // obj.auxInsertInitQueue(item);
  }

  // Test case for combination {1}/Bfront=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [4, 7];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 0;
    obj.counter := 2;
    obj.Content := [7];
    obj.Repr := {obj, obj.circularQueue};
    var item := -10;
    // obj.auxInsertInitQueue(item);
  }

  // Test case for combination {1}/Bfront=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-10, 4];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 1;
    obj.counter := 2;
    obj.Content := [-8];
    obj.Repr := {obj, obj.circularQueue};
    var item := -10;
    // obj.auxInsertInitQueue(item);
  }

  // Test case for combination {1}/Bcounter=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 0;
    obj.Content := [9];
    obj.Repr := {obj, obj.circularQueue};
    var item := -1;
    // obj.auxInsertInitQueue(item);
  }

  // Test case for combination {1}/Bcounter=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [-1];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 1;
    obj.Content := [2];
    obj.Repr := {obj, obj.circularQueue};
    var item := -1;
    // obj.auxInsertInitQueue(item);
  }

  // Test case for combination {1}/Oitem=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-2, -3];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [-3];
    obj.Repr := {obj, obj.circularQueue};
    var item := 0;
    // obj.auxInsertInitQueue(item);
  }

  // Test case for combination {1}/O|circularQueue|=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[0] [];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 0;
    obj.Content := [6];
    obj.Repr := {obj, obj.circularQueue};
    var item := -1;
    // obj.auxInsertInitQueue(item);
  }

  // Test case for combination {1}/O|Content|=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-10, -1];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [];
    obj.Repr := {obj, obj.circularQueue};
    var item := -1;
    // obj.auxInsertInitQueue(item);
  }

}

method TestsForauxInsertBetweenQueue()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [7, -10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [7];
    obj.Repr := {obj, obj.circularQueue};
    var item := 2;
    // obj.auxInsertBetweenQueue(item);
  }

  // Test case for combination {1}/Brear=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-10, 9];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 0;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [9];
    obj.Repr := {obj, obj.circularQueue};
    var item := 2;
    // obj.auxInsertBetweenQueue(item);
  }

  // Test case for combination {1}/Brear=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-10, -1];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 1;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [-4];
    obj.Repr := {obj, obj.circularQueue};
    var item := -1;
    // obj.auxInsertBetweenQueue(item);
  }

  // Test case for combination {1}/Bfront=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [4, 7];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 0;
    obj.counter := 2;
    obj.Content := [7];
    obj.Repr := {obj, obj.circularQueue};
    var item := -10;
    // obj.auxInsertBetweenQueue(item);
  }

  // Test case for combination {1}/Bfront=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-10, 4];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 1;
    obj.counter := 2;
    obj.Content := [-8];
    obj.Repr := {obj, obj.circularQueue};
    var item := -10;
    // obj.auxInsertBetweenQueue(item);
  }

  // Test case for combination {1}/Bcounter=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 0;
    obj.Content := [9];
    obj.Repr := {obj, obj.circularQueue};
    var item := -1;
    // obj.auxInsertBetweenQueue(item);
  }

  // Test case for combination {1}/Bcounter=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [-1];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 1;
    obj.Content := [2];
    obj.Repr := {obj, obj.circularQueue};
    var item := -1;
    // obj.auxInsertBetweenQueue(item);
  }

  // Test case for combination {1}/Oitem=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-2, -3];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [-3];
    obj.Repr := {obj, obj.circularQueue};
    var item := 0;
    // obj.auxInsertBetweenQueue(item);
  }

  // Test case for combination {1}/O|circularQueue|=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[0] [];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 0;
    obj.Content := [6];
    obj.Repr := {obj, obj.circularQueue};
    var item := -1;
    // obj.auxInsertBetweenQueue(item);
  }

  // Test case for combination {1}/O|Content|=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-10, -1];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [];
    obj.Repr := {obj, obj.circularQueue};
    var item := -1;
    // obj.auxInsertBetweenQueue(item);
  }

}

method TestsForremove()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  front < circularQueue.Length
  //   PRE:  circularQueue.Length > 0
  //   POST Q1: Valid()
  //   POST Q3: rear <= |old(Content)|
  //   POST Q4: circularQueue.Length > 0
  //   POST Q5: item == old(Content)[old(front)]
  //   POST Q6: front == (old(front) + 1) % circularQueue.Length
  //   POST Q7: old(front) < rear
  //   POST Q8: Content == old(Content)[old(front) .. rear]
  //   POST Q9: old(front) >= rear
  //   POST Q10: old(front) <= rear
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [-2];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 0;
    obj.front := 0;
    obj.counter := 1;
    obj.Content := [-1];
    obj.Repr := {obj, obj.circularQueue};
    // var item := obj.remove();
    // expect item == -1;
  }

  // Test case for combination {3}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  front < circularQueue.Length
  //   PRE:  circularQueue.Length > 0
  //   POST Q1: Valid()
  //   POST Q3: rear <= |old(Content)|
  //   POST Q4: circularQueue.Length > 0
  //   POST Q5: item == old(Content)[old(front)]
  //   POST Q6: front == (old(front) + 1) % circularQueue.Length
  //   POST Q7: old(front) < rear
  //   POST Q8: Content == old(Content)[old(front) .. rear]
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [-8];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 2;
    obj.front := 0;
    obj.counter := 1;
    obj.Content := [-7, -2];
    obj.Repr := {obj, obj.circularQueue};
    // var item := obj.remove();
    // expect item == -7;
  }

  // Test case for combination {1}/Bcounter=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  front < circularQueue.Length
  //   PRE:  circularQueue.Length > 0
  //   POST Q1: Valid()
  //   POST Q3: rear <= |old(Content)|
  //   POST Q4: circularQueue.Length > 0
  //   POST Q5: item == old(Content)[old(front)]
  //   POST Q6: front == (old(front) + 1) % circularQueue.Length
  //   POST Q7: old(front) < rear
  //   POST Q8: Content == old(Content)[old(front) .. rear]
  //   POST Q9: old(front) >= rear
  //   POST Q10: old(front) <= rear
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [-2];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 0;
    obj.front := 0;
    obj.counter := 0;
    obj.Content := [-1];
    obj.Repr := {obj, obj.circularQueue};
    // var item := obj.remove();
    // expect item == -1;
  }

  // Test case for combination {3}/Brear=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  front < circularQueue.Length
  //   PRE:  circularQueue.Length > 0
  //   POST Q1: Valid()
  //   POST Q3: rear <= |old(Content)|
  //   POST Q4: circularQueue.Length > 0
  //   POST Q5: item == old(Content)[old(front)]
  //   POST Q6: front == (old(front) + 1) % circularQueue.Length
  //   POST Q7: old(front) < rear
  //   POST Q8: Content == old(Content)[old(front) .. rear]
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [-10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 1;
    obj.front := 0;
    obj.counter := 1;
    obj.Content := [-9];
    obj.Repr := {obj, obj.circularQueue};
    // var item := obj.remove();
    // expect item == -9;
  }

  // Test case for combination {3}/Bcounter=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  front < circularQueue.Length
  //   PRE:  circularQueue.Length > 0
  //   POST Q1: Valid()
  //   POST Q3: rear <= |old(Content)|
  //   POST Q4: circularQueue.Length > 0
  //   POST Q5: item == old(Content)[old(front)]
  //   POST Q6: front == (old(front) + 1) % circularQueue.Length
  //   POST Q7: old(front) < rear
  //   POST Q8: Content == old(Content)[old(front) .. rear]
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [2];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 2;
    obj.front := 0;
    obj.counter := 0;
    obj.Content := [3, -10];
    obj.Repr := {obj, obj.circularQueue};
    // var item := obj.remove();
    // expect item == 3;
  }

  // Test case for combination {1}/O|Content|=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  front < circularQueue.Length
  //   PRE:  circularQueue.Length > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: rear <= |old(Content)|
  //   POST Q6: circularQueue.Length > 0
  //   POST Q7: item == old(Content)[old(front)]
  //   POST Q8: front == (old(front) + 1) % circularQueue.Length
  //   POST Q9: old(front) < rear ==> Content == old(Content)[old(front) .. rear]
  //   POST Q10: old(front) > rear ==> Content == old(Content)[0 .. rear] + old(Content)[old(front) .. |old(Content)|]
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [-10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 0;
    obj.front := 0;
    obj.counter := 1;
    obj.Content := [];
    obj.Repr := {obj, obj.circularQueue};
    // var item := obj.remove();
    // expect item == old_Content[old_front];
  }

  // Test case for combination {1}/O|Content|>=2:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  front < circularQueue.Length
  //   PRE:  circularQueue.Length > 0
  //   POST Q1: Valid()
  //   POST Q3: rear <= |old(Content)|
  //   POST Q4: circularQueue.Length > 0
  //   POST Q5: item == old(Content)[old(front)]
  //   POST Q6: front == (old(front) + 1) % circularQueue.Length
  //   POST Q7: old(front) < rear
  //   POST Q8: Content == old(Content)[old(front) .. rear]
  //   POST Q9: old(front) >= rear
  //   POST Q10: old(front) <= rear
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [-1];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 0;
    obj.front := 0;
    obj.counter := 1;
    obj.Content := [-10, -1];
    obj.Repr := {obj, obj.circularQueue};
    // var item := obj.remove();
    // expect item == -10;
  }

  // Test case for combination {1}/Oitem=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  front < circularQueue.Length
  //   PRE:  circularQueue.Length > 0
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: rear <= |old(Content)|
  //   POST Q6: circularQueue.Length > 0
  //   POST Q7: item == old(Content)[old(front)]
  //   POST Q8: front == (old(front) + 1) % circularQueue.Length
  //   POST Q9: old(front) < rear ==> Content == old(Content)[old(front) .. rear]
  //   POST Q10: old(front) > rear ==> Content == old(Content)[0 .. rear] + old(Content)[old(front) .. |old(Content)|]
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [2];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 0;
    obj.front := 0;
    obj.counter := 1;
    obj.Content := [];
    obj.Repr := {obj, obj.circularQueue};
    // var item := obj.remove();
    // expect item == old_Content[old_front];
  }

  // Test case for combination {3}/Oitem=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  front < circularQueue.Length
  //   PRE:  circularQueue.Length > 0
  //   POST Q1: Valid()
  //   POST Q3: rear <= |old(Content)|
  //   POST Q4: circularQueue.Length > 0
  //   POST Q5: item == old(Content)[old(front)]
  //   POST Q6: front == (old(front) + 1) % circularQueue.Length
  //   POST Q7: old(front) < rear
  //   POST Q8: Content == old(Content)[old(front) .. rear]
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [-7];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 2;
    obj.front := 0;
    obj.counter := 1;
    obj.Content := [0, -3];
    obj.Repr := {obj, obj.circularQueue};
    // var item := obj.remove();
    // expect item == 0;
  }

  // Test case for combination {1}/R6:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  front < circularQueue.Length
  //   PRE:  circularQueue.Length > 0
  //   POST Q1: Valid()
  //   POST Q3: rear <= |old(Content)|
  //   POST Q4: circularQueue.Length > 0
  //   POST Q5: item == old(Content)[old(front)]
  //   POST Q6: front == (old(front) + 1) % circularQueue.Length
  //   POST Q7: old(front) < rear
  //   POST Q8: Content == old(Content)[old(front) .. rear]
  //   POST Q9: old(front) >= rear
  //   POST Q10: old(front) <= rear
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [-3];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 0;
    obj.front := 0;
    obj.counter := 1;
    obj.Content := [-4];
    obj.Repr := {obj, obj.circularQueue};
    // var item := obj.remove();
    // expect item == -4;
  }

}

method TestsForsize()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: size == counter
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-10, 6];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [-10, 6];
    obj.Repr := {obj, obj.circularQueue};
    var size := obj.size();
    expect size == 2;
  }

  // Test case for combination {1}/Brear=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: size == counter
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-1, -10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 0;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [-1, -10];
    obj.Repr := {obj, obj.circularQueue};
    var size := obj.size();
    expect size == 2;
  }

  // Test case for combination {1}/Brear=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: size == counter
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-1, -10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 1;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [-1, -10];
    obj.Repr := {obj, obj.circularQueue};
    var size := obj.size();
    expect size == 2;
  }

  // Test case for combination {1}/Bfront=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: size == counter
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-1, -10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 0;
    obj.counter := 2;
    obj.Content := [-1, -10];
    obj.Repr := {obj, obj.circularQueue};
    var size := obj.size();
    expect size == 2;
  }

  // Test case for combination {1}/Bfront=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: size == counter
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-1, -10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 1;
    obj.counter := 2;
    obj.Content := [-1, -10];
    obj.Repr := {obj, obj.circularQueue};
    var size := obj.size();
    expect size == 2;
  }

  // Test case for combination {1}/O|circularQueue|=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: size == counter
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[0] [];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 2;
    obj.counter := 0;
    obj.Content := [];
    obj.Repr := {obj, obj.circularQueue};
    var size := obj.size();
    expect size == 0;
  }

  // Test case for combination {1}/O|circularQueue|=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: size == counter
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [-10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 1;
    obj.Content := [-10];
    obj.Repr := {obj, obj.circularQueue};
    var size := obj.size();
    expect size == 1;
  }

  // Test case for combination {1}/R8:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: size == counter
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-2, 7];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 9;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [-2, 7];
    obj.Repr := {obj, obj.circularQueue};
    var size := obj.size();
    expect size == 2;
  }

  // Test case for combination {1}/R9:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: size == counter
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [6, 8];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 9;
    obj.counter := 2;
    obj.Content := [6, 8];
    obj.Repr := {obj, obj.circularQueue};
    var size := obj.size();
    expect size == 2;
  }

  // Test case for combination {1}/R10:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: size == counter
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-9, -5];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [-9, -5];
    obj.Repr := {obj, obj.circularQueue};
    var size := obj.size();
    expect size == 2;
  }

}

method TestsForisEmpty()
{
  // Test case for combination {2}/Rel:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: isEmpty != true
  //   POST Q2: isEmpty == false
  //   POST Q3: counter != 0
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-10, 6];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [-10, 6];
    obj.Repr := {obj, obj.circularQueue};
    var isEmpty := obj.isEmpty();
    expect isEmpty == false;
  }

  // Test case for combination {3}/Rel:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: isEmpty == true
  //   POST Q2: counter == 0
  //   POST Q3: isEmpty != false
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [-10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 0;
    obj.Content := [-10];
    obj.Repr := {obj, obj.circularQueue};
    var isEmpty := obj.isEmpty();
    expect isEmpty == true;
  }

  // Test case for combination {2}/Brear=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: isEmpty != true
  //   POST Q2: isEmpty == false
  //   POST Q3: counter != 0
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-10, 6];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 0;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [-10, 6];
    obj.Repr := {obj, obj.circularQueue};
    var isEmpty := obj.isEmpty();
    expect isEmpty == false;
  }

  // Test case for combination {2}/Brear=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: isEmpty != true
  //   POST Q2: isEmpty == false
  //   POST Q3: counter != 0
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-10, 6];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 1;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [-10, 6];
    obj.Repr := {obj, obj.circularQueue};
    var isEmpty := obj.isEmpty();
    expect isEmpty == false;
  }

  // Test case for combination {2}/Bfront=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: isEmpty != true
  //   POST Q2: isEmpty == false
  //   POST Q3: counter != 0
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-10, 10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 0;
    obj.counter := 2;
    obj.Content := [-10, 10];
    obj.Repr := {obj, obj.circularQueue};
    var isEmpty := obj.isEmpty();
    expect isEmpty == false;
  }

  // Test case for combination {2}/Bfront=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: isEmpty != true
  //   POST Q2: isEmpty == false
  //   POST Q3: counter != 0
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-10, 10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 1;
    obj.counter := 2;
    obj.Content := [-10, 10];
    obj.Repr := {obj, obj.circularQueue};
    var isEmpty := obj.isEmpty();
    expect isEmpty == false;
  }

  // Test case for combination {2}/Bcounter=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: isEmpty != true
  //   POST Q2: isEmpty == false
  //   POST Q3: counter != 0
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [-10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 1;
    obj.Content := [-10];
    obj.Repr := {obj, obj.circularQueue};
    var isEmpty := obj.isEmpty();
    expect isEmpty == false;
  }

  // Test case for combination {2}/Bcounter=circularQueue_len-1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: isEmpty != true
  //   POST Q2: isEmpty == false
  //   POST Q3: counter != 0
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[3] [-1, -10, -1];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 9;
    obj.front := 9;
    obj.counter := 2;
    obj.Content := [-1, -10, -1];
    obj.Repr := {obj, obj.circularQueue};
    var isEmpty := obj.isEmpty();
    expect isEmpty == false;
  }

  // Test case for combination {3}/Brear=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: isEmpty == true
  //   POST Q2: counter == 0
  //   POST Q3: isEmpty != false
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [-10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 0;
    obj.front := 10;
    obj.counter := 0;
    obj.Content := [-10];
    obj.Repr := {obj, obj.circularQueue};
    var isEmpty := obj.isEmpty();
    expect isEmpty == true;
  }

  // Test case for combination {3}/Brear=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: isEmpty == true
  //   POST Q2: counter == 0
  //   POST Q3: isEmpty != false
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [-10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 1;
    obj.front := 10;
    obj.counter := 0;
    obj.Content := [-10];
    obj.Repr := {obj, obj.circularQueue};
    var isEmpty := obj.isEmpty();
    expect isEmpty == true;
  }

}

method TestsForcontains()
{
  // Test case for combination {2}/Rel:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: contains == true ==> item in circularQueue[..]
  //   POST Q2: contains == false ==> item !in circularQueue[..]
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [6, 7];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [6, 7];
    obj.Repr := {obj, obj.circularQueue};
    var item := -10;
    var contains := obj.contains(item);
    expect contains == true ==> item in obj.circularQueue[..];
    expect contains == false ==> item !in obj.circularQueue[..];
  }

  // Test case for combination {2}/Brear=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: contains != true
  //   POST Q2: contains == false
  //   POST Q3: item !in circularQueue[..]
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-10, 6];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 0;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [-10, 6];
    obj.Repr := {obj, obj.circularQueue};
    var item := -1;
    var contains := obj.contains(item);
    expect contains == false || contains == true;
  }

  // Test case for combination {2}/Brear=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: contains != true
  //   POST Q2: contains == false
  //   POST Q3: item !in circularQueue[..]
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-1, -10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 1;
    obj.front := 10;
    obj.counter := 2;
    obj.Content := [-1, -10];
    obj.Repr := {obj, obj.circularQueue};
    var item := -1;
    var contains := obj.contains(item);
    expect contains == false || contains == true;
  }

  // Test case for combination {2}/Bfront=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: contains != true
  //   POST Q2: contains == false
  //   POST Q3: item !in circularQueue[..]
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-10, -1];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 0;
    obj.counter := 2;
    obj.Content := [-10, -1];
    obj.Repr := {obj, obj.circularQueue};
    var item := -1;
    var contains := obj.contains(item);
    expect contains == false || contains == true;
  }

  // Test case for combination {2}/Bfront=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: contains != true
  //   POST Q2: contains == false
  //   POST Q3: item !in circularQueue[..]
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[2] [-10, -1];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 1;
    obj.counter := 2;
    obj.Content := [-10, -1];
    obj.Repr := {obj, obj.circularQueue};
    var item := -1;
    var contains := obj.contains(item);
    expect contains == false || contains == true;
  }

  // Test case for combination {2}/Bcounter=0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: contains != true
  //   POST Q2: contains == false
  //   POST Q3: item !in circularQueue[..]
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [-10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 0;
    obj.Content := [-10];
    obj.Repr := {obj, obj.circularQueue};
    var item := -10;
    var contains := obj.contains(item);
    expect contains == false || contains == true;
  }

  // Test case for combination {2}/Bcounter=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: contains != true
  //   POST Q2: contains == false
  //   POST Q3: item !in circularQueue[..]
  {
    var obj := new Queue();
    var tmp_circularQueue := new int[1] [-10];
    obj.circularQueue := tmp_circularQueue;
    obj.rear := 10;
    obj.front := 10;
    obj.counter := 1;
    obj.Content := [-10];
    obj.Repr := {obj, obj.circularQueue};
    var item := 2;
    var contains := obj.contains(item);
    expect contains == false || contains == true;
  }

}
