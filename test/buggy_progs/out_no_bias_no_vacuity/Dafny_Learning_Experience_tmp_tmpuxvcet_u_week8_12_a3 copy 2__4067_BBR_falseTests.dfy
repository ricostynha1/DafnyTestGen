// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_Learning_Experience_tmp_tmpuxvcet_u_week8_12_a3 copy 2__4067_BBR_false.dfy
// Method: push1
// Generated: 2026-04-24 21:51:42

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
    if false {
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
      n := n + 1;
    }
    position := -1;
    assert position >= 1 ==> exists i: int {:trigger s2[i]} :: 0 <= i < |s2| && s2[i] == Element;
    assert forall i: int {:trigger data[i]} :: data.Length - |s2| < i < data.Length - 1 ==> data[i] == s2[data.Length - i - 1];
    assert forall i: int {:trigger s2[i]} :: 0 <= i < |s2| ==> s2[i] == data[data.Length - i - 1];
    assert forall i: int {:trigger s2[i]} :: |s2| - 1 - n < i < |s2| - 1 ==> s2[i] != Element;
    assert forall i: int {:trigger data[i]} :: data.Length - n2 < i < data.Length - n2 + n ==> data[i] != Element;
  }
}


method TestsForpush1()
{
  // Test case for combination {3}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
  //   POST Q2: old(|s1|) == N ==> FullStatus == false
  //   POST Q3: old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
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
    var old_s12 := obj.s1;
    var FullStatus := obj.push1(element);
    expect old_s1 == obj.N ==> FullStatus == false;
    expect old_s1 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect FullStatus == false; // observed from implementation
  }

  // Test case for combination {6}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
  //   POST Q2: old(|s1|) == N ==> FullStatus == false
  //   POST Q3: old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
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
    var old_s1 := |obj.s1|;
    var old_s2 := |obj.s2|;
    var old_s12 := obj.s1;
    var FullStatus := obj.push1(element);
    expect old_s1 == obj.N ==> FullStatus == false;
    expect old_s1 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect FullStatus == false; // observed from implementation
  }

  // Test case for combination {8}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
  //   POST Q2: old(|s1|) == N ==> FullStatus == false
  //   POST Q3: old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [11, 13];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 1;
    obj.s1 := [11];
    obj.s2 := [13];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s1 := |obj.s1|;
    var old_s2 := |obj.s2|;
    var old_s12 := obj.s1;
    var FullStatus := obj.push1(element);
    expect old_s1 == obj.N ==> FullStatus == false;
    expect old_s1 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect FullStatus == false; // observed from implementation
  }

  // Test case for combination {9}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
  //   POST Q2: old(|s1|) == N ==> FullStatus == false
  //   POST Q3: old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [5];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s1 := |obj.s1|;
    var old_s2 := |obj.s2|;
    var old_s12 := obj.s1;
    var FullStatus := obj.push1(element);
    expect old_s1 == obj.N ==> FullStatus == false;
    expect old_s1 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect tmp_data[..] == [0]; // observed from implementation
    expect FullStatus == true; // observed from implementation
  }

  // Test case for combination {10}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
  //   POST Q2: old(|s1|) == N ==> FullStatus == false
  //   POST Q3: old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [13, 10];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 1;
    obj.s1 := [];
    obj.s2 := [10];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s1 := |obj.s1|;
    var old_s2 := |obj.s2|;
    var old_s12 := obj.s1;
    var FullStatus := obj.push1(element);
    expect old_s1 == obj.N ==> FullStatus == false;
    expect old_s1 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect tmp_data[..] == [0, 10]; // observed from implementation
    expect FullStatus == true; // observed from implementation
  }

  // Test case for combination {11}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
  //   POST Q2: old(|s1|) == N ==> FullStatus == false
  //   POST Q3: old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [10, 25];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 0;
    obj.s1 := [10];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s1 := |obj.s1|;
    var old_s2 := |obj.s2|;
    var old_s12 := obj.s1;
    var FullStatus := obj.push1(element);
    expect old_s1 == obj.N ==> FullStatus == false;
    expect old_s1 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect tmp_data[..] == [10, 0]; // observed from implementation
    expect FullStatus == true; // observed from implementation
  }

  // Test case for combination {12}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
  //   POST Q2: old(|s1|) == N ==> FullStatus == false
  //   POST Q3: old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 4;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[4] [11, 47, 48, 13];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 1;
    obj.s1 := [11];
    obj.s2 := [13];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s1 := |obj.s1|;
    var old_s2 := |obj.s2|;
    var old_s12 := obj.s1;
    var FullStatus := obj.push1(element);
    expect old_s1 == obj.N ==> FullStatus == false;
    expect old_s1 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect tmp_data[..] == [11, 0, 48, 13]; // observed from implementation
    expect FullStatus == true; // observed from implementation
  }

  // Test case for combination {1}:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
  //   POST Q2: old(|s1|) == N ==> FullStatus == false
  //   POST Q3: old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
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
    var old_s12 := obj.s1;
    var FullStatus := obj.push1(element);
    expect old_s1 == obj.N ==> FullStatus == false;
    expect old_s1 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect FullStatus == false; // observed from implementation
  }

  // Test case for combination {1}/Oelement=1:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
  //   POST Q2: old(|s1|) == N ==> FullStatus == false
  //   POST Q3: old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
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
    var old_s12 := obj.s1;
    var FullStatus := obj.push1(element);
    expect old_s1 == obj.N ==> FullStatus == false;
    expect old_s1 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect FullStatus == false; // observed from implementation
  }

  // Test case for combination {1}/Oelement>=2:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
  //   POST Q2: old(|s1|) == N ==> FullStatus == false
  //   POST Q3: old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
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
    var element := 2;
    var old_s1 := |obj.s1|;
    var old_s2 := |obj.s2|;
    var old_s12 := obj.s1;
    var FullStatus := obj.push1(element);
    expect old_s1 == obj.N ==> FullStatus == false;
    expect old_s1 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect FullStatus == false; // observed from implementation
  }

}

method TestsForpush2()
{
  // Test case for combination {2}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
  //   POST Q2: old(|s2|) == N ==> FullStatus == false
  //   POST Q3: old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
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
    var old_s22 := obj.s2;
    var FullStatus := obj.push2(element);
    expect old_s2 == obj.N ==> FullStatus == false;
    expect old_s2 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect FullStatus == false; // observed from implementation
  }

  // Test case for combination {7}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
  //   POST Q2: old(|s2|) == N ==> FullStatus == false
  //   POST Q3: old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
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
    var old_s2 := |obj.s2|;
    var old_s1 := |obj.s1|;
    var old_s22 := obj.s2;
    var FullStatus := obj.push2(element);
    expect old_s2 == obj.N ==> FullStatus == false;
    expect old_s2 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect FullStatus == false; // observed from implementation
  }

  // Test case for combination {8}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
  //   POST Q2: old(|s2|) == N ==> FullStatus == false
  //   POST Q3: old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [11, 13];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 1;
    obj.s1 := [11];
    obj.s2 := [13];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s2 := |obj.s2|;
    var old_s1 := |obj.s1|;
    var old_s22 := obj.s2;
    var FullStatus := obj.push2(element);
    expect old_s2 == obj.N ==> FullStatus == false;
    expect old_s2 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect FullStatus == false; // observed from implementation
  }

  // Test case for combination {9}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
  //   POST Q2: old(|s2|) == N ==> FullStatus == false
  //   POST Q3: old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [5];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s2 := |obj.s2|;
    var old_s1 := |obj.s1|;
    var old_s22 := obj.s2;
    var FullStatus := obj.push2(element);
    expect old_s2 == obj.N ==> FullStatus == false;
    expect old_s2 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect tmp_data[..] == [0]; // observed from implementation
    expect FullStatus == true; // observed from implementation
  }

  // Test case for combination {10}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
  //   POST Q2: old(|s2|) == N ==> FullStatus == false
  //   POST Q3: old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [13, 10];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 1;
    obj.s1 := [];
    obj.s2 := [10];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s2 := |obj.s2|;
    var old_s1 := |obj.s1|;
    var old_s22 := obj.s2;
    var FullStatus := obj.push2(element);
    expect old_s2 == obj.N ==> FullStatus == false;
    expect old_s2 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect tmp_data[..] == [0, 10]; // observed from implementation
    expect FullStatus == true; // observed from implementation
  }

  // Test case for combination {11}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
  //   POST Q2: old(|s2|) == N ==> FullStatus == false
  //   POST Q3: old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [10, 25];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 0;
    obj.s1 := [10];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s2 := |obj.s2|;
    var old_s1 := |obj.s1|;
    var old_s22 := obj.s2;
    var FullStatus := obj.push2(element);
    expect old_s2 == obj.N ==> FullStatus == false;
    expect old_s2 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect tmp_data[..] == [10, 0]; // observed from implementation
    expect FullStatus == true; // observed from implementation
  }

  // Test case for combination {12}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
  //   POST Q2: old(|s2|) == N ==> FullStatus == false
  //   POST Q3: old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 4;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[4] [11, 47, 48, 13];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 1;
    obj.s1 := [11];
    obj.s2 := [13];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s2 := |obj.s2|;
    var old_s1 := |obj.s1|;
    var old_s22 := obj.s2;
    var FullStatus := obj.push2(element);
    expect old_s2 == obj.N ==> FullStatus == false;
    expect old_s2 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect tmp_data[..] == [11, 47, 0, 13]; // observed from implementation
    expect FullStatus == true; // observed from implementation
  }

  // Test case for combination {1}:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
  //   POST Q2: old(|s2|) == N ==> FullStatus == false
  //   POST Q3: old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
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
    var old_s22 := obj.s2;
    var FullStatus := obj.push2(element);
    expect old_s2 == obj.N ==> FullStatus == false;
    expect old_s2 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect FullStatus == false; // observed from implementation
  }

  // Test case for combination {1}/Oelement=1:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
  //   POST Q2: old(|s2|) == N ==> FullStatus == false
  //   POST Q3: old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
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
    var old_s22 := obj.s2;
    var FullStatus := obj.push2(element);
    expect old_s2 == obj.N ==> FullStatus == false;
    expect old_s2 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect FullStatus == false; // observed from implementation
  }

  // Test case for combination {1}/Oelement>=2:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
  //   POST Q2: old(|s2|) == N ==> FullStatus == false
  //   POST Q3: old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
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
    var element := 2;
    var old_s2 := |obj.s2|;
    var old_s1 := |obj.s1|;
    var old_s22 := obj.s2;
    var FullStatus := obj.push2(element);
    expect old_s2 == obj.N ==> FullStatus == false;
    expect old_s2 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect FullStatus == false; // observed from implementation
  }

}

method TestsForsearch1()
{
  // Test case for combination {1}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position != -1
  //   POST Q2: position >= 1
  //   POST Q3: 0 <= (|s1| - 1)
  //   POST Q4: s1[(|s1| - 1)] == Element && !Empty1()
  //   POST Q5: Valid()
  //   POST Q6: data.Length == N
  //   POST Q7: 0 <= |s1| + |s2|
  //   POST Q8: |s1| + |s2| <= N
  //   POST Q9: 0 <= |s1|
  //   POST Q10: |s1| <= N
  //   POST Q11: 0 <= |s2|
  //   POST Q12: |s2| <= N
  //   POST Q13: |s1| == 0
  //   POST Q14: |s2| == 0
  //   POST Q15: n1 == |s1|
  //   POST Q16: n2 == |s2|
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

  // Test case for combination {2}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position != -1
  //   POST Q2: position >= 1
  //   POST Q3: 0 <= (|s1| - 1)
  //   POST Q4: s1[(|s1| - 1)] == Element && !Empty1()
  //   POST Q5: Valid()
  //   POST Q6: data.Length == N
  //   POST Q7: 0 <= |s1| + |s2|
  //   POST Q8: |s1| + |s2| <= N
  //   POST Q9: 0 <= |s1|
  //   POST Q10: |s1| <= N
  //   POST Q11: 0 <= |s2|
  //   POST Q12: |s2| <= N
  //   POST Q13: |s1| == 0
  //   POST Q14: |s2| != 0
  //   POST Q15: forall i: int {:trigger s2[i]} :: 0 <= i && i < |s2| ==> s2[i] == data[data.Length - 1 - i]
  //   POST Q16: n1 == |s1|
  //   POST Q17: n2 == |s2|
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [9];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 1;
    obj.s1 := [];
    obj.s2 := [9];
    obj.Repr := {obj, obj.data};
    var Element := 0;
    var position := obj.search1(Element);
    expect position == -1;
  }

  // Test case for combination {3}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position != -1
  //   POST Q2: position >= 1
  //   POST Q3: 0 <= (|s1| - 1)
  //   POST Q4: s1[(|s1| - 1)] == Element && !Empty1()
  //   POST Q5: Valid()
  //   POST Q6: data.Length == N
  //   POST Q7: 0 <= |s1| + |s2|
  //   POST Q8: |s1| + |s2| <= N
  //   POST Q9: 0 <= |s1|
  //   POST Q10: |s1| <= N
  //   POST Q11: 0 <= |s2|
  //   POST Q12: |s2| <= N
  //   POST Q13: |s1| != 0
  //   POST Q14: forall i: int {:trigger data[i]} {:trigger s1[i]} :: 0 <= i && i < |s1| ==> s1[i] == data[i]
  //   POST Q15: |s2| == 0
  //   POST Q16: n1 == |s1|
  //   POST Q17: n2 == |s2|
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
    var Element := 8;
    var position := obj.search1(Element);
    expect position == -1;
  }

  // Test case for combination {4}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position != -1
  //   POST Q2: position >= 1
  //   POST Q3: 0 <= (|s1| - 1)
  //   POST Q4: s1[(|s1| - 1)] == Element && !Empty1()
  //   POST Q5: Valid()
  //   POST Q6: data.Length == N
  //   POST Q7: 0 <= |s1| + |s2|
  //   POST Q8: |s1| + |s2| <= N
  //   POST Q9: 0 <= |s1|
  //   POST Q10: |s1| <= N
  //   POST Q11: 0 <= |s2|
  //   POST Q12: |s2| <= N
  //   POST Q13: |s1| != 0
  //   POST Q14: forall i: int {:trigger data[i]} {:trigger s1[i]} :: 0 <= i && i < |s1| ==> s1[i] == data[i]
  //   POST Q15: |s2| != 0
  //   POST Q16: forall i: int {:trigger s2[i]} :: 0 <= i && i < |s2| ==> s2[i] == data[data.Length - 1 - i]
  //   POST Q17: n1 == |s1|
  //   POST Q18: n2 == |s2|
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [11, 13];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 1;
    obj.s1 := [11];
    obj.s2 := [13];
    obj.Repr := {obj, obj.data};
    var Element := 8;
    var position := obj.search1(Element);
    expect position == -1;
  }

  // Test case for combination {7}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position == -1 || position >= 1
  //   POST Q2: position >= 1 ==> exists i: int {:trigger s1[i]} :: 0 <= i < |s1| && s1[i] == Element && !Empty1()
  //   POST Q3: position == -1 ==> forall i: int {:trigger s1[i]} :: 0 <= i < |s1| ==> s1[i] != Element || Empty1()
  //   POST Q4: Valid()
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [9];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 0;
    obj.s1 := [9];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var Element := 9;
    var position := obj.search1(Element);
    expect position == -1 || position >= 1;
    expect position >= 1 ==> exists i: int :: 0 <= i < |obj.s1| && obj.s1[i] == Element && !obj.Empty1();
    expect position == -1 ==> forall i: int :: 0 <= i < |obj.s1| ==> obj.s1[i] != Element || obj.Empty1();
    expect position == 1; // observed from implementation
  }

  // Test case for combination {8}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position == -1 || position >= 1
  //   POST Q2: position >= 1 ==> exists i: int {:trigger s1[i]} :: 0 <= i < |s1| && s1[i] == Element && !Empty1()
  //   POST Q3: position == -1 ==> forall i: int {:trigger s1[i]} :: 0 <= i < |s1| ==> s1[i] != Element || Empty1()
  //   POST Q4: Valid()
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [10, 12];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 1;
    obj.s1 := [10];
    obj.s2 := [12];
    obj.Repr := {obj, obj.data};
    var Element := 10;
    var position := obj.search1(Element);
    expect position == -1 || position >= 1;
    expect position >= 1 ==> exists i: int :: 0 <= i < |obj.s1| && obj.s1[i] == Element && !obj.Empty1();
    expect position == -1 ==> forall i: int :: 0 <= i < |obj.s1| ==> obj.s1[i] != Element || obj.Empty1();
    expect position == 1; // observed from implementation
  }

  // Test case for combination {11}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position == -1 || position >= 1
  //   POST Q2: position >= 1 ==> exists i: int {:trigger s1[i]} :: 0 <= i < |s1| && s1[i] == Element && !Empty1()
  //   POST Q3: position == -1 ==> forall i: int {:trigger s1[i]} :: 0 <= i < |s1| ==> s1[i] != Element || Empty1()
  //   POST Q4: Valid()
  {
    var N := 3;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[3] [15, 18, 19];
    obj.data := tmp_data;
    obj.n1 := 3;
    obj.n2 := 0;
    obj.s1 := [15, 18, 19];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var Element := 18;
    var position := obj.search1(Element);
    expect position == -1 || position >= 1;
    expect position >= 1 ==> exists i: int :: 0 <= i < |obj.s1| && obj.s1[i] == Element && !obj.Empty1();
    expect position == -1 ==> forall i: int :: 0 <= i < |obj.s1| ==> obj.s1[i] != Element || obj.Empty1();
    expect position == 2; // observed from implementation
  }

  // Test case for combination {12}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position == -1 || position >= 1
  //   POST Q2: position >= 1 ==> exists i: int {:trigger s1[i]} :: 0 <= i < |s1| && s1[i] == Element && !Empty1()
  //   POST Q3: position == -1 ==> forall i: int {:trigger s1[i]} :: 0 <= i < |s1| ==> s1[i] != Element || Empty1()
  //   POST Q4: Valid()
  {
    var N := 4;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[4] [16, 20, 22, 18];
    obj.data := tmp_data;
    obj.n1 := 3;
    obj.n2 := 1;
    obj.s1 := [16, 20, 22];
    obj.s2 := [18];
    obj.Repr := {obj, obj.data};
    var Element := 20;
    var position := obj.search1(Element);
    expect position == -1 || position >= 1;
    expect position >= 1 ==> exists i: int :: 0 <= i < |obj.s1| && obj.s1[i] == Element && !obj.Empty1();
    expect position == -1 ==> forall i: int :: 0 <= i < |obj.s1| ==> obj.s1[i] != Element || obj.Empty1();
    expect position == 2; // observed from implementation
  }

  // Test case for combination {1}/OElement=1:
  //   PRE:  Valid()
  //   POST Q1: position != -1
  //   POST Q2: position >= 1
  //   POST Q3: 0 <= (|s1| - 1)
  //   POST Q4: s1[(|s1| - 1)] == Element && !Empty1()
  //   POST Q5: Valid()
  //   POST Q6: data.Length == N
  //   POST Q7: 0 <= |s1| + |s2|
  //   POST Q8: |s1| + |s2| <= N
  //   POST Q9: 0 <= |s1|
  //   POST Q10: |s1| <= N
  //   POST Q11: 0 <= |s2|
  //   POST Q12: |s2| <= N
  //   POST Q13: |s1| == 0
  //   POST Q14: |s2| == 0
  //   POST Q15: n1 == |s1|
  //   POST Q16: n2 == |s2|
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
    var Element := 1;
    var position := obj.search1(Element);
    expect position == -1;
  }

  // Test case for combination {1}/OElement>=2:
  //   PRE:  Valid()
  //   POST Q1: position != -1
  //   POST Q2: position >= 1
  //   POST Q3: 0 <= (|s1| - 1)
  //   POST Q4: s1[(|s1| - 1)] == Element && !Empty1()
  //   POST Q5: Valid()
  //   POST Q6: data.Length == N
  //   POST Q7: 0 <= |s1| + |s2|
  //   POST Q8: |s1| + |s2| <= N
  //   POST Q9: 0 <= |s1|
  //   POST Q10: |s1| <= N
  //   POST Q11: 0 <= |s2|
  //   POST Q12: |s2| <= N
  //   POST Q13: |s1| == 0
  //   POST Q14: |s2| == 0
  //   POST Q15: n1 == |s1|
  //   POST Q16: n2 == |s2|
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [3];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var Element := 2;
    var position := obj.search1(Element);
    expect position == -1;
  }

}

method TestsForsearch3()
{
  // Test case for combination {1}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position != -1
  //   POST Q2: position >= 1
  //   POST Q3: 0 <= (|s2| - 1)
  //   POST Q4: s2[(|s2| - 1)] == Element && !Empty2()
  //   POST Q5: Valid()
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: |s1| == 0
  //   POST Q13: |s2| == 0
  //   POST Q14: n1 == |s1|
  //   POST Q15: n2 == |s2|
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

  // Test case for combination {2}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position != -1
  //   POST Q2: position >= 1
  //   POST Q3: 0 <= (|s2| - 1)
  //   POST Q4: s2[(|s2| - 1)] == Element && !Empty2()
  //   POST Q5: Valid()
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: |s1| == 0
  //   POST Q13: |s2| != 0
  //   POST Q14: forall i: int {:trigger s2[i]} :: 0 <= i && i < |s2| ==> s2[i] == data[data.Length - 1 - i]
  //   POST Q15: n1 == |s1|
  //   POST Q16: n2 == |s2|
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [9];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 1;
    obj.s1 := [];
    obj.s2 := [9];
    obj.Repr := {obj, obj.data};
    var Element := 0;
    var position := obj.search3(Element);
    expect position == -1;
  }

  // Test case for combination {3}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position != -1
  //   POST Q2: position >= 1
  //   POST Q3: 0 <= (|s2| - 1)
  //   POST Q4: s2[(|s2| - 1)] == Element && !Empty2()
  //   POST Q5: Valid()
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: |s1| != 0
  //   POST Q13: forall i: int {:trigger data[i]} {:trigger s1[i]} :: 0 <= i && i < |s1| ==> s1[i] == data[i]
  //   POST Q14: |s2| == 0
  //   POST Q15: n1 == |s1|
  //   POST Q16: n2 == |s2|
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [9];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 0;
    obj.s1 := [9];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var Element := 0;
    var position := obj.search3(Element);
    expect position == -1;
  }

  // Test case for combination {4}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position != -1
  //   POST Q2: position >= 1
  //   POST Q3: 0 <= (|s2| - 1)
  //   POST Q4: s2[(|s2| - 1)] == Element && !Empty2()
  //   POST Q5: Valid()
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: |s1| != 0
  //   POST Q13: forall i: int {:trigger data[i]} {:trigger s1[i]} :: 0 <= i && i < |s1| ==> s1[i] == data[i]
  //   POST Q14: |s2| != 0
  //   POST Q15: forall i: int {:trigger s2[i]} :: 0 <= i && i < |s2| ==> s2[i] == data[data.Length - 1 - i]
  //   POST Q16: n1 == |s1|
  //   POST Q17: n2 == |s2|
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [10, 12];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 1;
    obj.s1 := [10];
    obj.s2 := [12];
    obj.Repr := {obj, obj.data};
    var Element := 0;
    var position := obj.search3(Element);
    expect position == -1;
  }

  // Test case for combination {6}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position == -1 || position >= 1
  //   POST Q2: position >= 1 ==> exists i: int {:trigger s2[i]} :: 0 <= i < |s2| && s2[i] == Element && !Empty2()
  //   POST Q3: Valid()
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [9];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 1;
    obj.s1 := [];
    obj.s2 := [9];
    obj.Repr := {obj, obj.data};
    var Element := 9;
    var position := obj.search3(Element);
    expect position == -1 || position >= 1;
    expect position >= 1 ==> exists i: int :: 0 <= i < |obj.s2| && obj.s2[i] == Element && !obj.Empty2();
    expect position == 1; // observed from implementation
  }

  // Test case for combination {8}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position == -1 || position >= 1
  //   POST Q2: position >= 1 ==> exists i: int {:trigger s2[i]} :: 0 <= i < |s2| && s2[i] == Element && !Empty2()
  //   POST Q3: Valid()
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [10, 12];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 1;
    obj.s1 := [10];
    obj.s2 := [12];
    obj.Repr := {obj, obj.data};
    var Element := 12;
    var position := obj.search3(Element);
    expect position == -1 || position >= 1;
    expect position >= 1 ==> exists i: int :: 0 <= i < |obj.s2| && obj.s2[i] == Element && !obj.Empty2();
    expect position == 1; // observed from implementation
  }

  // Test case for combination {10}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position == -1 || position >= 1
  //   POST Q2: position >= 1 ==> exists i: int {:trigger s2[i]} :: 0 <= i < |s2| && s2[i] == Element && !Empty2()
  //   POST Q3: Valid()
  {
    var N := 3;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[3] [18, 15, 18];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 3;
    obj.s1 := [];
    obj.s2 := [18, 15, 18];
    obj.Repr := {obj, obj.data};
    var Element := 15;
    var position := obj.search3(Element);
    expect position == -1 || position >= 1;
    expect position >= 1 ==> exists i: int :: 0 <= i < |obj.s2| && obj.s2[i] == Element && !obj.Empty2();
    expect position == 2; // observed from implementation
  }

  // Test case for combination {12}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position == -1 || position >= 1
  //   POST Q2: position >= 1 ==> exists i: int {:trigger s2[i]} :: 0 <= i < |s2| && s2[i] == Element && !Empty2()
  //   POST Q3: Valid()
  {
    var N := 4;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[4] [16, 29, 27, 18];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 3;
    obj.s1 := [16];
    obj.s2 := [18, 27, 29];
    obj.Repr := {obj, obj.data};
    var Element := 27;
    var position := obj.search3(Element);
    expect position == -1 || position >= 1;
    expect position >= 1 ==> exists i: int :: 0 <= i < |obj.s2| && obj.s2[i] == Element && !obj.Empty2();
    expect position == 2; // observed from implementation
  }

  // Test case for combination {1}/OElement=1:
  //   PRE:  Valid()
  //   POST Q1: position != -1
  //   POST Q2: position >= 1
  //   POST Q3: 0 <= (|s2| - 1)
  //   POST Q4: s2[(|s2| - 1)] == Element && !Empty2()
  //   POST Q5: Valid()
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: |s1| == 0
  //   POST Q13: |s2| == 0
  //   POST Q14: n1 == |s1|
  //   POST Q15: n2 == |s2|
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
    var Element := 1;
    var position := obj.search3(Element);
    expect position == -1;
  }

  // Test case for combination {1}/OElement>=2:
  //   PRE:  Valid()
  //   POST Q1: position != -1
  //   POST Q2: position >= 1
  //   POST Q3: 0 <= (|s2| - 1)
  //   POST Q4: s2[(|s2| - 1)] == Element && !Empty2()
  //   POST Q5: Valid()
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: |s1| == 0
  //   POST Q13: |s2| == 0
  //   POST Q14: n1 == |s1|
  //   POST Q15: n2 == |s2|
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [3];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var Element := 2;
    var position := obj.search3(Element);
    expect position == -1;
  }

}

method Main()
{
  TestsForpush1();
  print "TestsForpush1: all non-failing tests passed!\n";
  TestsForpush2();
  print "TestsForpush2: all non-failing tests passed!\n";
  TestsForsearch1();
  print "TestsForsearch1: all non-failing tests passed!\n";
  TestsForsearch3();
  print "TestsForsearch3: all non-failing tests passed!\n";
}
