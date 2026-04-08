// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\not_supported\Dafny_Learning_Experience_tmp_tmpuxvcet_u_week8_12_a3 copy 2__7354_LVR_0.dfy
// Method: push1
// Generated: 2026-04-08 21:52:10

// Dafny_Learning_Experience_tmp_tmpuxvcet_u_week8_12_a3 copy 2.dfy

class TwoStacks<T(==,0)> {
  var s1: seq<T>
  var s2: seq<T>
  var N: nat
  var Repr: set<object>
  var data: array<T>
  var n1: nat
  var n2: nat

  predicate Valid()
    reads this, Repr
    ensures Valid() ==> this in Repr && |s1| + |s2| <= N && 0 <= |s1| <= N && 0 <= |s2| <= N
    decreases Repr + {this}
  {
    this in Repr &&
    data in Repr &&
    data.Length == N &&
    0 <= |s1| + |s2| <= N &&
    0 <= |s1| <= N &&
    0 <= |s2| <= N &&
    (|s1| != 0 ==>
      forall i: int {:trigger data[i]} {:trigger s1[i]} :: 
        0 <= i < |s1| ==>
          s1[i] == data[i]) &&
    (|s2| != 0 ==>
      forall i: int {:trigger s2[i]} :: 
        0 <= i < |s2| ==>
          s2[i] == data[data.Length - 1 - i]) &&
    n1 == |s1| &&
    n2 == |s2|
  }

  constructor (N: nat)
    ensures Valid() && fresh(Repr)
    ensures s1 == s2 == [] && this.N == N
    decreases N
  {
    s1, s2, this.N := [], [], N;
    data := new T[N];
    n1, n2 := 0, 0;
    Repr := {this, data};
  }

  method push1(element: T) returns (FullStatus: bool)
    requires Valid()
    modifies Repr
    ensures old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
    ensures old(|s1|) == N ==> FullStatus == false
    ensures old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
    ensures Valid() && fresh(Repr - old(Repr))
  {
    if n1 == data.Length {
      FullStatus := false;
    } else {
      if n1 != data.Length && n1 + n2 != data.Length {
        s1 := (s1) + [element];
        data[n1] := element;
        n1 := n1 + 1;
        FullStatus := true;
      } else {
        FullStatus := false;
      }
    }
  }

  method push2(element: T) returns (FullStatus: bool)
    requires Valid()
    modifies Repr
    ensures old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
    ensures old(|s2|) == N ==> FullStatus == false
    ensures old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
    ensures Valid() && fresh(Repr - old(Repr))
  {
    if n2 == data.Length {
      FullStatus := false;
    } else {
      if n2 != data.Length && n1 + n2 != data.Length {
        s2 := (s2) + [element];
        data[data.Length - 1 - n2] := element;
        n2 := n2 + 1;
        FullStatus := true;
      } else {
        FullStatus := false;
      }
    }
  }

  method pop1() returns (EmptyStatus: bool, PopedItem: T)
    requires Valid()
    modifies Repr
    ensures old(|s1|) != 0 ==> s1 == old(s1[0 .. |s1| - 1]) && EmptyStatus == true && PopedItem == old(s1[|s1| - 1])
    ensures old(|s1|) == 0 ==> EmptyStatus == false
    ensures Valid() && fresh(Repr - old(Repr))
  {
    if n1 == 0 {
      EmptyStatus := false;
      PopedItem := *;
    } else {
      s1 := (s1[0 .. |s1| - 1]);
      PopedItem := data[n1 - 1];
      n1 := n1 - 1;
      EmptyStatus := true;
    }
  }

  method pop2() returns (EmptyStatus: bool, PopedItem: T)
    requires Valid()
    modifies Repr
    ensures old(|s2|) != 0 ==> s2 == old(s2[0 .. |s2| - 1]) && EmptyStatus == true && PopedItem == old(s2[|s2| - 1])
    ensures old(|s2|) == 0 ==> EmptyStatus == false
    ensures Valid() && fresh(Repr - old(Repr))
  {
    if n2 == 0 {
      EmptyStatus := false;
      PopedItem := *;
    } else {
      s2 := (s2[0 .. |s2| - 1]);
      PopedItem := data[data.Length - n2];
      n2 := n2 - 1;
      EmptyStatus := true;
    }
  }

  method peek1() returns (EmptyStatus: bool, TopItem: T)
    requires Valid()
    ensures Empty1() ==> EmptyStatus == false
    ensures !Empty1() ==> EmptyStatus == true && TopItem == s1[|s1| - 1]
    ensures Valid()
  {
    if n1 == 0 {
      EmptyStatus := false;
      TopItem := *;
    } else {
      TopItem := data[n1 - 1];
      EmptyStatus := true;
    }
  }

  method peek2() returns (EmptyStatus: bool, TopItem: T)
    requires Valid()
    ensures Empty2() ==> EmptyStatus == false
    ensures !Empty2() ==> EmptyStatus == true && TopItem == s2[|s2| - 1]
    ensures Valid()
  {
    if n2 == 0 {
      EmptyStatus := false;
      TopItem := *;
    } else {
      TopItem := data[data.Length - n2];
      EmptyStatus := true;
    }
  }

  predicate Empty1()
    requires Valid()
    reads this, Repr
    ensures Empty1() ==> |s1| == 0
    ensures Valid()
    decreases Repr + {this}
  {
    |s1| == 0 &&
    n1 == 0
  }

  predicate Empty2()
    reads this
    ensures Empty2() ==> |s2| == 0
    decreases {this}
  {
    |s2| == 0 &&
    n2 == 0
  }

  method search1(Element: T) returns (position: int)
    requires Valid()
    ensures position == -1 || position >= 1
    ensures position >= 1 ==> exists i: int {:trigger s1[i]} :: 0 <= i < |s1| && s1[i] == Element && !Empty1()
    ensures position == -1 ==> forall i: int {:trigger s1[i]} :: 0 <= i < |s1| ==> s1[i] != Element || Empty1()
    ensures Valid()
  {
    var n := 0;
    position := 0;
    while n != n1
      invariant Valid()
      invariant 0 <= n <= |s1|
      invariant position >= 1 ==> exists i: int {:trigger s1[i]} :: 0 <= i < |s1| && s1[i] == Element
      invariant forall i: int {:trigger s1[i]} :: |s1| - 1 - n < i < |s1| ==> s1[i] != Element
      decreases |s1| - n
    {
      if data[n1 - 1 - n] == Element {
        position := n + 1;
        return position;
      }
      n := n + 1;
    }
    position := -1;
  }

  method search3(Element: T) returns (position: int)
    requires Valid()
    ensures position == -1 || position >= 1
    ensures position >= 1 ==> exists i: int {:trigger s2[i]} :: 0 <= i < |s2| && s2[i] == Element && !Empty2()
    ensures Valid()
  {
    position := 0;
    var n := 0;
    while n != n2
      invariant 0 <= n <= |s2|
      invariant Valid()
      invariant position >= 1 ==> exists i: int {:trigger s2[i]} :: 0 <= i < |s2| && s2[i] == Element
      invariant forall i: int {:trigger s2[i]} :: |s2| - 1 - n < i < |s2| - 1 ==> s2[i] != Element
      invariant forall i: int {:trigger data[i]} :: data.Length - n2 < i < data.Length - n2 + n ==> data[i] != Element
      decreases |s2| - n
    {
      if data[data.Length - n2 + n] == Element {
        position := n + 1;
        assert data[data.Length - n2 + n] == s2[n2 - 1 - n];
        assert position >= 1 ==> exists i: int {:trigger s2[i]} :: 0 <= i < |s2| && s2[i] == Element;
        assert forall i: int {:trigger data[i]} :: data.Length - |s2| < i < data.Length - 1 ==> data[i] == s2[data.Length - i - 1];
        assert forall i: int {:trigger s2[i]} :: 0 <= i < |s2| ==> s2[i] == data[data.Length - i - 1];
        assert forall i: int {:trigger s2[i]} :: |s2| - 1 - n < i < |s2| - 1 ==> s2[i] != Element;
        assert forall i: int {:trigger data[i]} :: data.Length - n2 < i < data.Length - n2 + n ==> data[i] != Element;
        return position;
      }
      n := n + 0;
    }
    position := -1;
    assert position >= 1 ==> exists i: int {:trigger s2[i]} :: 0 <= i < |s2| && s2[i] == Element;
    assert forall i: int {:trigger data[i]} :: data.Length - |s2| < i < data.Length - 1 ==> data[i] == s2[data.Length - i - 1];
    assert forall i: int {:trigger s2[i]} :: 0 <= i < |s2| ==> s2[i] == data[data.Length - i - 1];
    assert forall i: int {:trigger s2[i]} :: |s2| - 1 - n < i < |s2| - 1 ==> s2[i] != Element;
    assert forall i: int {:trigger data[i]} :: data.Length - n2 < i < data.Length - n2 + n ==> data[i] != Element;
  }
}


method Passing()
{
  // Test case for combination {4}:
  //   PRE:  Valid()
  //   POST: !(old(|s1|) != N)
  //   POST: FullStatus == false
  //   POST: Valid()
  //   POST: old(|s1|) + old(|s2|) == N
  //   ENSURES: old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
  //   ENSURES: old(|s1|) == N ==> FullStatus == false
  //   ENSURES: old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [8];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 0;
    obj.s1 := [8];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s1 := |obj.s1|;
    var old_s2 := |obj.s2|;
    var FullStatus := obj.push1(element);
    expect !(old_s1 != obj.N);
    expect FullStatus == false;
    expect obj.Valid();
    expect old_s1 + old_s2 == obj.N;
  }

  // Test case for combination {6}:
  //   PRE:  Valid()
  //   POST: !(old(|s1|) + old(|s2|) != N)
  //   POST: FullStatus == false
  //   POST: Valid()
  //   POST: old(|s1|) + old(|s2|) == N
  //   ENSURES: old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
  //   ENSURES: old(|s1|) == N ==> FullStatus == false
  //   ENSURES: old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [19];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 1;
    obj.s1 := [];
    obj.s2 := [19];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s1 := |obj.s1|;
    var old_s2 := |obj.s2|;
    var FullStatus := obj.push1(element);
    expect !(old_s1 + old_s2 != obj.N);
    expect FullStatus == false;
    expect obj.Valid();
    expect old_s1 + old_s2 == obj.N;
  }

  // Test case for combination {4}/Belement=0,n1=0,n2=0,N=0,s2=0:
  //   PRE:  Valid()
  //   POST: !(old(|s1|) != N)
  //   POST: FullStatus == false
  //   POST: Valid()
  //   POST: old(|s1|) + old(|s2|) == N
  //   ENSURES: old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
  //   ENSURES: old(|s1|) == N ==> FullStatus == false
  //   ENSURES: old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 0;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[0] [];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s1 := |obj.s1|;
    var old_s2 := |obj.s2|;
    var FullStatus := obj.push1(element);
    expect !(old_s1 != obj.N);
    expect FullStatus == false;
    expect obj.Valid();
    expect old_s1 + old_s2 == obj.N;
  }

  // Test case for combination {4}/Belement=1,n1=0,n2=0,N=0,s2=0:
  //   PRE:  Valid()
  //   POST: !(old(|s1|) != N)
  //   POST: FullStatus == false
  //   POST: Valid()
  //   POST: old(|s1|) + old(|s2|) == N
  //   ENSURES: old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
  //   ENSURES: old(|s1|) == N ==> FullStatus == false
  //   ENSURES: old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 0;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[0] [];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var element := 1;
    var old_s1 := |obj.s1|;
    var old_s2 := |obj.s2|;
    var FullStatus := obj.push1(element);
    expect !(old_s1 != obj.N);
    expect FullStatus == false;
    expect obj.Valid();
    expect old_s1 + old_s2 == obj.N;
  }

  // Test case for combination {4}:
  //   PRE:  Valid()
  //   POST: !(old(|s2|) != N)
  //   POST: FullStatus == false
  //   POST: Valid()
  //   POST: old(|s1|) + old(|s2|) == N
  //   ENSURES: old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
  //   ENSURES: old(|s2|) == N ==> FullStatus == false
  //   ENSURES: old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [8];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 1;
    obj.s1 := [];
    obj.s2 := [8];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s2 := |obj.s2|;
    var old_s1 := |obj.s1|;
    var FullStatus := obj.push2(element);
    expect !(old_s2 != obj.N);
    expect FullStatus == false;
    expect obj.Valid();
    expect old_s1 + old_s2 == obj.N;
  }

  // Test case for combination {6}:
  //   PRE:  Valid()
  //   POST: !(old(|s1|) + old(|s2|) != N)
  //   POST: FullStatus == false
  //   POST: Valid()
  //   POST: old(|s1|) + old(|s2|) == N
  //   ENSURES: old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
  //   ENSURES: old(|s2|) == N ==> FullStatus == false
  //   ENSURES: old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [11];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 0;
    obj.s1 := [11];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s1 := |obj.s1|;
    var old_s2 := |obj.s2|;
    var FullStatus := obj.push2(element);
    expect !(old_s1 + old_s2 != obj.N);
    expect FullStatus == false;
    expect obj.Valid();
    expect old_s1 + old_s2 == obj.N;
  }

  // Test case for combination {4}/Belement=0,n1=0,n2=0,N=0,s2=0:
  //   PRE:  Valid()
  //   POST: !(old(|s2|) != N)
  //   POST: FullStatus == false
  //   POST: Valid()
  //   POST: old(|s1|) + old(|s2|) == N
  //   ENSURES: old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
  //   ENSURES: old(|s2|) == N ==> FullStatus == false
  //   ENSURES: old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 0;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[0] [];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s2 := |obj.s2|;
    var old_s1 := |obj.s1|;
    var FullStatus := obj.push2(element);
    expect !(old_s2 != obj.N);
    expect FullStatus == false;
    expect obj.Valid();
    expect old_s1 + old_s2 == obj.N;
  }

  // Test case for combination {4}/Belement=1,n1=0,n2=0,N=0,s2=0:
  //   PRE:  Valid()
  //   POST: !(old(|s2|) != N)
  //   POST: FullStatus == false
  //   POST: Valid()
  //   POST: old(|s1|) + old(|s2|) == N
  //   ENSURES: old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
  //   ENSURES: old(|s2|) == N ==> FullStatus == false
  //   ENSURES: old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 0;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[0] [];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var element := 1;
    var old_s2 := |obj.s2|;
    var old_s1 := |obj.s1|;
    var FullStatus := obj.push2(element);
    expect !(old_s2 != obj.N);
    expect FullStatus == false;
    expect obj.Valid();
    expect old_s1 + old_s2 == obj.N;
  }

  // Test case for combination {1}:
  //   PRE:  Valid()
  //   POST: !Empty1()
  //   POST: Empty1()
  //   POST: Valid()
  //   ENSURES: Empty1() ==> EmptyStatus == false
  //   ENSURES: !Empty1() ==> EmptyStatus == true && TopItem == s1[|s1| - 1]
  //   ENSURES: Valid()
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [11];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 0;
    obj.s1 := [11];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek1();
  }

  // Test case for combination {1}/OEmptyStatus=true:
  //   PRE:  Valid()
  //   POST: !Empty1()
  //   POST: Empty1()
  //   POST: Valid()
  //   ENSURES: Empty1() ==> EmptyStatus == false
  //   ENSURES: !Empty1() ==> EmptyStatus == true && TopItem == s1[|s1| - 1]
  //   ENSURES: Valid()
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [11, 20];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 1;
    obj.s1 := [11];
    obj.s2 := [20];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek1();
  }

  // Test case for combination {1}/OTopItem>=2:
  //   PRE:  Valid()
  //   POST: !Empty1()
  //   POST: Empty1()
  //   POST: Valid()
  //   ENSURES: Empty1() ==> EmptyStatus == false
  //   ENSURES: !Empty1() ==> EmptyStatus == true && TopItem == s1[|s1| - 1]
  //   ENSURES: Valid()
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [7721, 13];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 0;
    obj.s1 := [7721];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek1();
  }

  // Test case for combination {1}/OTopItem=1:
  //   PRE:  Valid()
  //   POST: !Empty1()
  //   POST: Empty1()
  //   POST: Valid()
  //   ENSURES: Empty1() ==> EmptyStatus == false
  //   ENSURES: !Empty1() ==> EmptyStatus == true && TopItem == s1[|s1| - 1]
  //   ENSURES: Valid()
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [11, 1];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 0;
    obj.s1 := [11, 1];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek1();
  }

  // Test case for combination {1}/OTopItem=0:
  //   PRE:  Valid()
  //   POST: !Empty1()
  //   POST: Empty1()
  //   POST: Valid()
  //   ENSURES: Empty1() ==> EmptyStatus == false
  //   ENSURES: !Empty1() ==> EmptyStatus == true && TopItem == s1[|s1| - 1]
  //   ENSURES: Valid()
  {
    var N := 3;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[3] [11, 0, 20];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 1;
    obj.s1 := [11, 0];
    obj.s2 := [20];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek1();
  }

  // Test case for combination {1}:
  //   PRE:  Valid()
  //   POST: !Empty2()
  //   POST: Empty2()
  //   POST: Valid()
  //   ENSURES: Empty2() ==> EmptyStatus == false
  //   ENSURES: !Empty2() ==> EmptyStatus == true && TopItem == s2[|s2| - 1]
  //   ENSURES: Valid()
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [19];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 1;
    obj.s1 := [];
    obj.s2 := [19];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek2();
  }

  // Test case for combination {1}/OEmptyStatus=true:
  //   PRE:  Valid()
  //   POST: !Empty2()
  //   POST: Empty2()
  //   POST: Valid()
  //   ENSURES: Empty2() ==> EmptyStatus == false
  //   ENSURES: !Empty2() ==> EmptyStatus == true && TopItem == s2[|s2| - 1]
  //   ENSURES: Valid()
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [11, 20];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 1;
    obj.s1 := [11];
    obj.s2 := [20];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek2();
  }

  // Test case for combination {1}/OTopItem>=2:
  //   PRE:  Valid()
  //   POST: !Empty2()
  //   POST: Empty2()
  //   POST: Valid()
  //   ENSURES: Empty2() ==> EmptyStatus == false
  //   ENSURES: !Empty2() ==> EmptyStatus == true && TopItem == s2[|s2| - 1]
  //   ENSURES: Valid()
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [12, 7721];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 1;
    obj.s1 := [];
    obj.s2 := [7721];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek2();
  }

  // Test case for combination {1}/OTopItem=1:
  //   PRE:  Valid()
  //   POST: !Empty2()
  //   POST: Empty2()
  //   POST: Valid()
  //   ENSURES: Empty2() ==> EmptyStatus == false
  //   ENSURES: !Empty2() ==> EmptyStatus == true && TopItem == s2[|s2| - 1]
  //   ENSURES: Valid()
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [1, 19];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 2;
    obj.s1 := [];
    obj.s2 := [19, 1];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek2();
  }

  // Test case for combination {1}/OTopItem=0:
  //   PRE:  Valid()
  //   POST: !Empty2()
  //   POST: Empty2()
  //   POST: Valid()
  //   ENSURES: Empty2() ==> EmptyStatus == false
  //   ENSURES: !Empty2() ==> EmptyStatus == true && TopItem == s2[|s2| - 1]
  //   ENSURES: Valid()
  {
    var N := 3;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[3] [11, 0, 20];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 2;
    obj.s1 := [11];
    obj.s2 := [20, 0];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek2();
  }

  // Test case for combination {2}:
  //   PRE:  Valid()
  //   POST: position == -1
  //   POST: !(position >= 1)
  //   POST: s1[0] == Element && !Empty1()
  //   POST: !(position == -1)
  //   POST: Valid()
  //   ENSURES: position == -1 || position >= 1
  //   ENSURES: position >= 1 ==> exists i: int {:trigger s1[i]} :: 0 <= i < |s1| && s1[i] == Element && !Empty1()
  //   ENSURES: position == -1 ==> forall i: int {:trigger s1[i]} :: 0 <= i < |s1| ==> s1[i] != Element || Empty1()
  //   ENSURES: Valid()
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [49];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 1;
    obj.s1 := [];
    obj.s2 := [49];
    obj.Repr := {obj, obj.data};
    var Element := 0;
    var position := obj.search1(Element);
    expect position == -1;
  }

  // Test case for combination {2}/BElement=0,n1=0,n2=0,N=0,s2=0:
  //   PRE:  Valid()
  //   POST: position == -1
  //   POST: !(position >= 1)
  //   POST: s1[0] == Element && !Empty1()
  //   POST: !(position == -1)
  //   POST: Valid()
  //   ENSURES: position == -1 || position >= 1
  //   ENSURES: position >= 1 ==> exists i: int {:trigger s1[i]} :: 0 <= i < |s1| && s1[i] == Element && !Empty1()
  //   ENSURES: position == -1 ==> forall i: int {:trigger s1[i]} :: 0 <= i < |s1| ==> s1[i] != Element || Empty1()
  //   ENSURES: Valid()
  {
    var N := 0;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[0] [];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var Element := 0;
    var position := obj.search1(Element);
    expect position == -1;
  }

  // Test case for combination {2}/BElement=0,n1=0,n2=0,N=1,s2=0:
  //   PRE:  Valid()
  //   POST: position == -1
  //   POST: !(position >= 1)
  //   POST: s1[0] == Element && !Empty1()
  //   POST: !(position == -1)
  //   POST: Valid()
  //   ENSURES: position == -1 || position >= 1
  //   ENSURES: position >= 1 ==> exists i: int {:trigger s1[i]} :: 0 <= i < |s1| && s1[i] == Element && !Empty1()
  //   ENSURES: position == -1 ==> forall i: int {:trigger s1[i]} :: 0 <= i < |s1| ==> s1[i] != Element || Empty1()
  //   ENSURES: Valid()
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [2];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var Element := 0;
    var position := obj.search1(Element);
    expect position == -1;
  }

  // Test case for combination {2}/BElement=0,n1=0,n2=0,N=0,s2=0:
  //   PRE:  Valid()
  //   POST: position == -1
  //   POST: 0 < |s2|
  //   POST: Valid()
  //   ENSURES: position == -1 || position >= 1
  //   ENSURES: position >= 1 ==> exists i: int {:trigger s2[i]} :: 0 <= i < |s2| && s2[i] == Element && !Empty2()
  //   ENSURES: Valid()
  {
    var N := 0;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[0] [];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var Element := 0;
    var position := obj.search3(Element);
    expect position == -1;
  }

  // Test case for combination {2}/BElement=0,n1=0,n2=0,N=1,s2=0:
  //   PRE:  Valid()
  //   POST: position == -1
  //   POST: 0 < |s2|
  //   POST: Valid()
  //   ENSURES: position == -1 || position >= 1
  //   ENSURES: position >= 1 ==> exists i: int {:trigger s2[i]} :: 0 <= i < |s2| && s2[i] == Element && !Empty2()
  //   ENSURES: Valid()
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [2];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var Element := 0;
    var position := obj.search3(Element);
    expect position == -1;
  }

}

method Failing()
{
  // Test case for combination {3}:
  //   PRE:  Valid()
  //   POST: position == -1
  //   POST: 0 < |s1|
  //   POST: s1[0] == Element && !Empty1()
  //   POST: !(position == -1)
  //   POST: Valid()
  //   ENSURES: position == -1 || position >= 1
  //   ENSURES: position >= 1 ==> exists i: int {:trigger s1[i]} :: 0 <= i < |s1| && s1[i] == Element && !Empty1()
  //   ENSURES: position == -1 ==> forall i: int {:trigger s1[i]} :: 0 <= i < |s1| ==> s1[i] != Element || Empty1()
  //   ENSURES: Valid()
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [10];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 0;
    obj.s1 := [10];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var Element := 10;
    var position := obj.search1(Element);
    // expect position == -1;
    // expect 0 < |obj.s1|;
    // expect obj.s1[0] == Element && !obj.Empty1();
    // expect !(position == -1);
    // expect obj.Valid();
  }

  // Test case for combination {2}:
  //   PRE:  Valid()
  //   POST: position == -1
  //   POST: 0 < |s2|
  //   POST: Valid()
  //   ENSURES: position == -1 || position >= 1
  //   ENSURES: position >= 1 ==> exists i: int {:trigger s2[i]} :: 0 <= i < |s2| && s2[i] == Element && !Empty2()
  //   ENSURES: Valid()
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [19];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 1;
    obj.s1 := [];
    obj.s2 := [19];
    obj.Repr := {obj, obj.data};
    var Element := 0;
    var position := obj.search3(Element);
    // expect position == -1;
  }

  // Test case for combination {3}:
  //   PRE:  Valid()
  //   POST: position == -1
  //   POST: exists i :: 1 <= i < (|s2| - 1) && s2[i] == Element && !Empty2()
  //   POST: Valid()
  //   ENSURES: position == -1 || position >= 1
  //   ENSURES: position >= 1 ==> exists i: int {:trigger s2[i]} :: 0 <= i < |s2| && s2[i] == Element && !Empty2()
  //   ENSURES: Valid()
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [18];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 1;
    obj.s1 := [];
    obj.s2 := [18];
    obj.Repr := {obj, obj.data};
    var Element := 18;
    var position := obj.search3(Element);
    // expect position == -1;
    // expect exists i :: 1 <= i < (|obj.s2| - 1) && obj.s2[i] == Element && !obj.Empty2();
    // expect obj.Valid();
  }

}

method Main()
{
  Passing();
  Failing();
}
