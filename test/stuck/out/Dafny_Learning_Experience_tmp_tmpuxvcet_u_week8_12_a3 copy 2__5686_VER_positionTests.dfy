// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\stuck\in\Dafny_Learning_Experience_tmp_tmpuxvcet_u_week8_12_a3 copy 2__5686_VER_position.dfy
// Method: push1
// Generated: 2026-04-22 19:30:51

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
      if data[n1 - 1 - position] == Element {
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


method Passing()
{
  // Test case for combination {3}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
  //   POST Q2: old(|s1|) == N ==> FullStatus == false
  //   POST Q3: old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [10, 12];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 0;
    obj.s1 := [10, 12];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s1 := |obj.s1|;
    var old_s2 := |obj.s2|;
    var old_s12 := obj.s1;
    var FullStatus := obj.push1(element);
    expect old_s1 == obj.N ==> FullStatus == false;
    expect old_s1 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect FullStatus == false; // observed from implementation
  }

  // Test case for combination {6}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
  //   POST Q2: old(|s1|) == N ==> FullStatus == false
  //   POST Q3: old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [11, 11];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 2;
    obj.s1 := [];
    obj.s2 := [11, 11];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s1 := |obj.s1|;
    var old_s2 := |obj.s2|;
    var old_s12 := obj.s1;
    var FullStatus := obj.push1(element);
    expect old_s1 == obj.N ==> FullStatus == false;
    expect old_s1 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect FullStatus == false; // observed from implementation
  }

  // Test case for combination {8}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
  //   POST Q2: old(|s1|) == N ==> FullStatus == false
  //   POST Q3: old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 4;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[4] [13, 51, 51, 13];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 2;
    obj.s1 := [13, 51];
    obj.s2 := [13, 51];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s1 := |obj.s1|;
    var old_s2 := |obj.s2|;
    var old_s12 := obj.s1;
    var FullStatus := obj.push1(element);
    expect old_s1 == obj.N ==> FullStatus == false;
    expect old_s1 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect FullStatus == false; // observed from implementation
  }

  // Test case for combination {9}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
  //   POST Q2: old(|s1|) == N ==> FullStatus == false
  //   POST Q3: old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [8, 12];
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
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect tmp_data[..] == [0, 12]; // observed from implementation
    expect FullStatus == true; // observed from implementation
  }

  // Test case for combination {10}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
  //   POST Q2: old(|s1|) == N ==> FullStatus == false
  //   POST Q3: old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 3;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[3] [35, 33, 12];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 2;
    obj.s1 := [];
    obj.s2 := [12, 33];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s1 := |obj.s1|;
    var old_s2 := |obj.s2|;
    var old_s12 := obj.s1;
    var FullStatus := obj.push1(element);
    expect old_s1 == obj.N ==> FullStatus == false;
    expect old_s1 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect tmp_data[..] == [0, 33, 12]; // observed from implementation
    expect FullStatus == true; // observed from implementation
  }

  // Test case for combination {11}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
  //   POST Q2: old(|s1|) == N ==> FullStatus == false
  //   POST Q3: old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 3;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[3] [12, 26, 28];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 0;
    obj.s1 := [12, 26];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s1 := |obj.s1|;
    var old_s2 := |obj.s2|;
    var old_s12 := obj.s1;
    var FullStatus := obj.push1(element);
    expect old_s1 == obj.N ==> FullStatus == false;
    expect old_s1 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect tmp_data[..] == [12, 26, 0]; // observed from implementation
    expect FullStatus == true; // observed from implementation
  }

  // Test case for combination {12}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 == old(s1) + [element]
  //   POST Q2: old(|s1|) == N ==> FullStatus == false
  //   POST Q3: old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 5;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[5] [14, 46, 37, 46, 14];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 2;
    obj.s1 := [14, 46];
    obj.s2 := [14, 46];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s1 := |obj.s1|;
    var old_s2 := |obj.s2|;
    var old_s12 := obj.s1;
    var FullStatus := obj.push1(element);
    expect old_s1 == obj.N ==> FullStatus == false;
    expect old_s1 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect tmp_data[..] == [14, 46, 0, 46, 14]; // observed from implementation
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
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
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
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
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
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect FullStatus == false; // observed from implementation
  }

  // Test case for combination {2}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
  //   POST Q2: old(|s2|) == N ==> FullStatus == false
  //   POST Q3: old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [9, 9];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 2;
    obj.s1 := [];
    obj.s2 := [9, 9];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s2 := |obj.s2|;
    var old_s1 := |obj.s1|;
    var old_s22 := obj.s2;
    var FullStatus := obj.push2(element);
    expect old_s2 == obj.N ==> FullStatus == false;
    expect old_s2 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect FullStatus == false; // observed from implementation
  }

  // Test case for combination {7}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
  //   POST Q2: old(|s2|) == N ==> FullStatus == false
  //   POST Q3: old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [10, 12];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 0;
    obj.s1 := [10, 12];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s2 := |obj.s2|;
    var old_s1 := |obj.s1|;
    var old_s22 := obj.s2;
    var FullStatus := obj.push2(element);
    expect old_s2 == obj.N ==> FullStatus == false;
    expect old_s2 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect FullStatus == false; // observed from implementation
  }

  // Test case for combination {8}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
  //   POST Q2: old(|s2|) == N ==> FullStatus == false
  //   POST Q3: old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 4;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[4] [13, 51, 51, 13];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 2;
    obj.s1 := [13, 51];
    obj.s2 := [13, 51];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s2 := |obj.s2|;
    var old_s1 := |obj.s1|;
    var old_s22 := obj.s2;
    var FullStatus := obj.push2(element);
    expect old_s2 == obj.N ==> FullStatus == false;
    expect old_s2 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect FullStatus == false; // observed from implementation
  }

  // Test case for combination {9}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
  //   POST Q2: old(|s2|) == N ==> FullStatus == false
  //   POST Q3: old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [8, 12];
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
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect tmp_data[..] == [8, 0]; // observed from implementation
    expect FullStatus == true; // observed from implementation
  }

  // Test case for combination {10}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
  //   POST Q2: old(|s2|) == N ==> FullStatus == false
  //   POST Q3: old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 3;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[3] [35, 33, 12];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 2;
    obj.s1 := [];
    obj.s2 := [12, 33];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s2 := |obj.s2|;
    var old_s1 := |obj.s1|;
    var old_s22 := obj.s2;
    var FullStatus := obj.push2(element);
    expect old_s2 == obj.N ==> FullStatus == false;
    expect old_s2 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect tmp_data[..] == [0, 33, 12]; // observed from implementation
    expect FullStatus == true; // observed from implementation
  }

  // Test case for combination {11}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
  //   POST Q2: old(|s2|) == N ==> FullStatus == false
  //   POST Q3: old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 3;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[3] [25, 26, 28];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 0;
    obj.s1 := [25, 26];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s2 := |obj.s2|;
    var old_s1 := |obj.s1|;
    var old_s22 := obj.s2;
    var FullStatus := obj.push2(element);
    expect old_s2 == obj.N ==> FullStatus == false;
    expect old_s2 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect tmp_data[..] == [25, 26, 0]; // observed from implementation
    expect FullStatus == true; // observed from implementation
  }

  // Test case for combination {12}/Rel:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 == old(s2) + [element]
  //   POST Q2: old(|s2|) == N ==> FullStatus == false
  //   POST Q3: old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
  {
    var N := 5;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[5] [14, 46, 37, 46, 14];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 2;
    obj.s1 := [14, 46];
    obj.s2 := [14, 46];
    obj.Repr := {obj, obj.data};
    var element := 0;
    var old_s2 := |obj.s2|;
    var old_s1 := |obj.s1|;
    var old_s22 := obj.s2;
    var FullStatus := obj.push2(element);
    expect old_s2 == obj.N ==> FullStatus == false;
    expect old_s2 != obj.N && old_s1 + old_s2 == obj.N ==> FullStatus == false;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect tmp_data[..] == [14, 46, 0, 46, 14]; // observed from implementation
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
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
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
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
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
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect FullStatus == false; // observed from implementation
  }

  // Test case for combination {1}:
  //   PRE:  Valid()
  //   POST Q1: !Empty1()
  //   POST Q2: Valid()
  //   POST Q3: TopItem == s1[|s1| - 1]
  //   POST Q5: data.Length == N
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: forall i: int {:trigger data[i]} {:trigger s1[i]} :: 0 <= i && i < |s1| ==> s1[i] == data[i]
  //   POST Q13: |s2| == 0
  //   POST Q14: n1 == |s1|
  //   POST Q15: n2 == |s2|
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [12, 19];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 0;
    obj.s1 := [12, 19];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek1();
    expect TopItem == 19;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect EmptyStatus == true; // observed from implementation
  }

  // Test case for combination {2}:
  //   PRE:  Valid()
  //   POST Q1: !Empty1()
  //   POST Q2: Valid()
  //   POST Q3: TopItem == s1[|s1| - 1]
  //   POST Q5: data.Length == N
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: forall i: int {:trigger data[i]} {:trigger s1[i]} :: 0 <= i && i < |s1| ==> s1[i] == data[i]
  //   POST Q13: |s2| != 0
  //   POST Q14: forall i: int {:trigger s2[i]} :: 0 <= i && i < |s2| ==> s2[i] == data[data.Length - 1 - i]
  //   POST Q15: n1 == |s1|
  //   POST Q16: n2 == |s2|
  {
    var N := 4;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[4] [13, 39, 39, 13];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 2;
    obj.s1 := [13, 39];
    obj.s2 := [13, 39];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek1();
    expect TopItem == 39;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect EmptyStatus == true; // observed from implementation
  }

  // Test case for combination {5}:
  //   PRE:  Valid()
  //   POST Q1: Empty1() ==> EmptyStatus == false
  //   POST Q2: !Empty1() ==> EmptyStatus == true && TopItem == s1[|s1| - 1]
  //   POST Q3: Valid()
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [3, 6];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek1();
    expect obj.Empty1() ==> EmptyStatus == false;
    expect !obj.Empty1() ==> EmptyStatus == true && TopItem == obj.s1[|obj.s1| - 1];
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect EmptyStatus == false; // observed from implementation
    expect TopItem == 0; // observed from implementation
  }

  // Test case for combination {6}:
  //   PRE:  Valid()
  //   POST Q1: Empty1() ==> EmptyStatus == false
  //   POST Q2: !Empty1() ==> EmptyStatus == true && TopItem == s1[|s1| - 1]
  //   POST Q3: Valid()
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [14, 12];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 2;
    obj.s1 := [];
    obj.s2 := [12, 14];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek1();
    expect obj.Empty1() ==> EmptyStatus == false;
    expect !obj.Empty1() ==> EmptyStatus == true && TopItem == obj.s1[|obj.s1| - 1];
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect EmptyStatus == false; // observed from implementation
    expect TopItem == 0; // observed from implementation
  }

  // Test case for combination {1}/O|data|=1:
  //   PRE:  Valid()
  //   POST Q1: !Empty1()
  //   POST Q2: Valid()
  //   POST Q3: TopItem == s1[|s1| - 1]
  //   POST Q5: data.Length == N
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: forall i: int {:trigger data[i]} {:trigger s1[i]} :: 0 <= i && i < |s1| ==> s1[i] == data[i]
  //   POST Q13: |s2| == 0
  //   POST Q14: n1 == |s1|
  //   POST Q15: n2 == |s2|
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [16];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 0;
    obj.s1 := [16];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek1();
    expect TopItem == 16;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect EmptyStatus == true; // observed from implementation
  }

  // Test case for combination {1}/OTopItem=0:
  //   PRE:  Valid()
  //   POST Q1: !Empty1()
  //   POST Q2: Valid()
  //   POST Q3: TopItem == s1[|s1| - 1]
  //   POST Q5: data.Length == N
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: forall i: int {:trigger data[i]} {:trigger s1[i]} :: 0 <= i && i < |s1| ==> s1[i] == data[i]
  //   POST Q13: |s2| == 0
  //   POST Q14: n1 == |s1|
  //   POST Q15: n2 == |s2|
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [13, 0];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 0;
    obj.s1 := [13, 0];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek1();
    expect TopItem == 0;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect EmptyStatus == true; // observed from implementation
  }

  // Test case for combination {1}/OTopItem=1:
  //   PRE:  Valid()
  //   POST Q1: !Empty1()
  //   POST Q2: Valid()
  //   POST Q3: TopItem == s1[|s1| - 1]
  //   POST Q5: data.Length == N
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: forall i: int {:trigger data[i]} {:trigger s1[i]} :: 0 <= i && i < |s1| ==> s1[i] == data[i]
  //   POST Q13: |s2| == 0
  //   POST Q14: n1 == |s1|
  //   POST Q15: n2 == |s2|
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [14, 1];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 0;
    obj.s1 := [14, 1];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek1();
    expect TopItem == 1;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect EmptyStatus == true; // observed from implementation
  }

  // Test case for combination {2}/On1=1:
  //   PRE:  Valid()
  //   POST Q1: !Empty1()
  //   POST Q2: Valid()
  //   POST Q3: TopItem == s1[|s1| - 1]
  //   POST Q5: data.Length == N
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: forall i: int {:trigger data[i]} {:trigger s1[i]} :: 0 <= i && i < |s1| ==> s1[i] == data[i]
  //   POST Q13: |s2| != 0
  //   POST Q14: forall i: int {:trigger s2[i]} :: 0 <= i && i < |s2| ==> s2[i] == data[data.Length - 1 - i]
  //   POST Q15: n1 == |s1|
  //   POST Q16: n2 == |s2|
  {
    var N := 3;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[3] [11, 34, 33];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 2;
    obj.s1 := [11];
    obj.s2 := [33, 34];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek1();
    expect TopItem == 11;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect EmptyStatus == true; // observed from implementation
  }

  // Test case for combination {2}/On2=1:
  //   PRE:  Valid()
  //   POST Q1: !Empty1()
  //   POST Q2: Valid()
  //   POST Q3: TopItem == s1[|s1| - 1]
  //   POST Q5: data.Length == N
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: forall i: int {:trigger data[i]} {:trigger s1[i]} :: 0 <= i && i < |s1| ==> s1[i] == data[i]
  //   POST Q13: |s2| != 0
  //   POST Q14: forall i: int {:trigger s2[i]} :: 0 <= i && i < |s2| ==> s2[i] == data[data.Length - 1 - i]
  //   POST Q15: n1 == |s1|
  //   POST Q16: n2 == |s2|
  {
    var N := 3;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[3] [26, 27, 13];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 1;
    obj.s1 := [26, 27];
    obj.s2 := [13];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek1();
    expect TopItem == 27;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect EmptyStatus == true; // observed from implementation
  }

  // Test case for combination {2}/OTopItem=0:
  //   PRE:  Valid()
  //   POST Q1: !Empty1()
  //   POST Q2: Valid()
  //   POST Q3: TopItem == s1[|s1| - 1]
  //   POST Q5: data.Length == N
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: forall i: int {:trigger data[i]} {:trigger s1[i]} :: 0 <= i && i < |s1| ==> s1[i] == data[i]
  //   POST Q13: |s2| != 0
  //   POST Q14: forall i: int {:trigger s2[i]} :: 0 <= i && i < |s2| ==> s2[i] == data[data.Length - 1 - i]
  //   POST Q15: n1 == |s1|
  //   POST Q16: n2 == |s2|
  {
    var N := 4;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[4] [15, 0, 0, 15];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 2;
    obj.s1 := [15, 0];
    obj.s2 := [15, 0];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek1();
    expect TopItem == 0;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect EmptyStatus == true; // observed from implementation
  }

  // Test case for combination {1}:
  //   PRE:  Valid()
  //   POST Q1: !Empty2()
  //   POST Q2: Valid()
  //   POST Q3: TopItem == s2[|s2| - 1]
  //   POST Q5: data.Length == N
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: |s1| == 0
  //   POST Q13: forall i: int {:trigger s2[i]} :: 0 <= i && i < |s2| ==> s2[i] == data[data.Length - 1 - i]
  //   POST Q14: n1 == |s1|
  //   POST Q15: n2 == |s2|
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [14, 12];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 2;
    obj.s1 := [];
    obj.s2 := [12, 14];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek2();
    expect TopItem == 14;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect EmptyStatus == true; // observed from implementation
  }

  // Test case for combination {2}:
  //   PRE:  Valid()
  //   POST Q1: !Empty2()
  //   POST Q2: Valid()
  //   POST Q3: TopItem == s2[|s2| - 1]
  //   POST Q5: data.Length == N
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: |s1| != 0
  //   POST Q13: forall i: int {:trigger data[i]} {:trigger s1[i]} :: 0 <= i && i < |s1| ==> s1[i] == data[i]
  //   POST Q14: forall i: int {:trigger s2[i]} :: 0 <= i && i < |s2| ==> s2[i] == data[data.Length - 1 - i]
  //   POST Q15: n1 == |s1|
  //   POST Q16: n2 == |s2|
  {
    var N := 4;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[4] [13, 48, 48, 13];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 2;
    obj.s1 := [13, 48];
    obj.s2 := [13, 48];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek2();
    expect TopItem == 48;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect EmptyStatus == true; // observed from implementation
  }

  // Test case for combination {5}:
  //   PRE:  Valid()
  //   POST Q1: Empty2() ==> EmptyStatus == false
  //   POST Q2: !Empty2() ==> EmptyStatus == true && TopItem == s2[|s2| - 1]
  //   POST Q3: Valid()
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [3, 6];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek2();
    expect obj.Empty2() ==> EmptyStatus == false;
    expect !obj.Empty2() ==> EmptyStatus == true && TopItem == obj.s2[|obj.s2| - 1];
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect EmptyStatus == false; // observed from implementation
    expect TopItem == 0; // observed from implementation
  }

  // Test case for combination {6}:
  //   PRE:  Valid()
  //   POST Q1: Empty2() ==> EmptyStatus == false
  //   POST Q2: !Empty2() ==> EmptyStatus == true && TopItem == s2[|s2| - 1]
  //   POST Q3: Valid()
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [12, 19];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 0;
    obj.s1 := [12, 19];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek2();
    expect obj.Empty2() ==> EmptyStatus == false;
    expect !obj.Empty2() ==> EmptyStatus == true && TopItem == obj.s2[|obj.s2| - 1];
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect EmptyStatus == false; // observed from implementation
    expect TopItem == 0; // observed from implementation
  }

  // Test case for combination {1}/O|data|=1:
  //   PRE:  Valid()
  //   POST Q1: !Empty2()
  //   POST Q2: Valid()
  //   POST Q3: TopItem == s2[|s2| - 1]
  //   POST Q5: data.Length == N
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: |s1| == 0
  //   POST Q13: forall i: int {:trigger s2[i]} :: 0 <= i && i < |s2| ==> s2[i] == data[data.Length - 1 - i]
  //   POST Q14: n1 == |s1|
  //   POST Q15: n2 == |s2|
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [22];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 1;
    obj.s1 := [];
    obj.s2 := [22];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek2();
    expect TopItem == 22;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect EmptyStatus == true; // observed from implementation
  }

  // Test case for combination {1}/OTopItem=0:
  //   PRE:  Valid()
  //   POST Q1: !Empty2()
  //   POST Q2: Valid()
  //   POST Q3: TopItem == s2[|s2| - 1]
  //   POST Q5: data.Length == N
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: |s1| == 0
  //   POST Q13: forall i: int {:trigger s2[i]} :: 0 <= i && i < |s2| ==> s2[i] == data[data.Length - 1 - i]
  //   POST Q14: n1 == |s1|
  //   POST Q15: n2 == |s2|
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [0, 13];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 2;
    obj.s1 := [];
    obj.s2 := [13, 0];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek2();
    expect TopItem == 0;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect EmptyStatus == true; // observed from implementation
  }

  // Test case for combination {1}/OTopItem=1:
  //   PRE:  Valid()
  //   POST Q1: !Empty2()
  //   POST Q2: Valid()
  //   POST Q3: TopItem == s2[|s2| - 1]
  //   POST Q5: data.Length == N
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: |s1| == 0
  //   POST Q13: forall i: int {:trigger s2[i]} :: 0 <= i && i < |s2| ==> s2[i] == data[data.Length - 1 - i]
  //   POST Q14: n1 == |s1|
  //   POST Q15: n2 == |s2|
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [1, 1];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 2;
    obj.s1 := [];
    obj.s2 := [1, 1];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek2();
    expect TopItem == 1;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect EmptyStatus == true; // observed from implementation
  }

  // Test case for combination {2}/On1=1:
  //   PRE:  Valid()
  //   POST Q1: !Empty2()
  //   POST Q2: Valid()
  //   POST Q3: TopItem == s2[|s2| - 1]
  //   POST Q5: data.Length == N
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: |s1| != 0
  //   POST Q13: forall i: int {:trigger data[i]} {:trigger s1[i]} :: 0 <= i && i < |s1| ==> s1[i] == data[i]
  //   POST Q14: forall i: int {:trigger s2[i]} :: 0 <= i && i < |s2| ==> s2[i] == data[data.Length - 1 - i]
  //   POST Q15: n1 == |s1|
  //   POST Q16: n2 == |s2|
  {
    var N := 3;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[3] [11, 33, 32];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 2;
    obj.s1 := [11];
    obj.s2 := [32, 33];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek2();
    expect TopItem == 33;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect EmptyStatus == true; // observed from implementation
  }

  // Test case for combination {2}/On2=1:
  //   PRE:  Valid()
  //   POST Q1: !Empty2()
  //   POST Q2: Valid()
  //   POST Q3: TopItem == s2[|s2| - 1]
  //   POST Q5: data.Length == N
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: |s1| != 0
  //   POST Q13: forall i: int {:trigger data[i]} {:trigger s1[i]} :: 0 <= i && i < |s1| ==> s1[i] == data[i]
  //   POST Q14: forall i: int {:trigger s2[i]} :: 0 <= i && i < |s2| ==> s2[i] == data[data.Length - 1 - i]
  //   POST Q15: n1 == |s1|
  //   POST Q16: n2 == |s2|
  {
    var N := 3;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[3] [26, 27, 13];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 1;
    obj.s1 := [26, 27];
    obj.s2 := [13];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek2();
    expect TopItem == 13;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect EmptyStatus == true; // observed from implementation
  }

  // Test case for combination {2}/OTopItem=0:
  //   PRE:  Valid()
  //   POST Q1: !Empty2()
  //   POST Q2: Valid()
  //   POST Q3: TopItem == s2[|s2| - 1]
  //   POST Q5: data.Length == N
  //   POST Q6: 0 <= |s1| + |s2|
  //   POST Q7: |s1| + |s2| <= N
  //   POST Q8: 0 <= |s1|
  //   POST Q9: |s1| <= N
  //   POST Q10: 0 <= |s2|
  //   POST Q11: |s2| <= N
  //   POST Q12: |s1| != 0
  //   POST Q13: forall i: int {:trigger data[i]} {:trigger s1[i]} :: 0 <= i && i < |s1| ==> s1[i] == data[i]
  //   POST Q14: forall i: int {:trigger s2[i]} :: 0 <= i && i < |s2| ==> s2[i] == data[data.Length - 1 - i]
  //   POST Q15: n1 == |s1|
  //   POST Q16: n2 == |s2|
  {
    var N := 5;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[5] [15, 0, 43, 0, 15];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 2;
    obj.s1 := [15, 0];
    obj.s2 := [15, 0];
    obj.Repr := {obj, obj.data};
    var EmptyStatus, TopItem := obj.peek2();
    expect TopItem == 0;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect EmptyStatus == true; // observed from implementation
  }

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
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [4, 6];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var Element := 0;
    var position := obj.search1(Element);
    expect position == -1;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
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
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [14, 11];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 2;
    obj.s1 := [];
    obj.s2 := [11, 14];
    obj.Repr := {obj, obj.data};
    var Element := 0;
    var position := obj.search1(Element);
    expect position == -1;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
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
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [12, 26];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 0;
    obj.s1 := [12, 26];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var Element := 10;
    var position := obj.search1(Element);
    expect position == -1;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
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
    var N := 6;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[6] [19, 42, 43, 44, 42, 19];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 2;
    obj.s1 := [19, 42];
    obj.s2 := [19, 42];
    obj.Repr := {obj, obj.data};
    var Element := 10;
    var position := obj.search1(Element);
    expect position == -1;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
  }

  // Test case for combination {15}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position == -1 || position >= 1
  //   POST Q2: position >= 1 ==> exists i: int {:trigger s1[i]} :: 0 <= i < |s1| && s1[i] == Element && !Empty1()
  //   POST Q3: position == -1 ==> forall i: int {:trigger s1[i]} :: 0 <= i < |s1| ==> s1[i] != Element || Empty1()
  //   POST Q4: Valid()
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [11, 19];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 0;
    obj.s1 := [11, 19];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var Element := 19;
    var position := obj.search1(Element);
    expect position == -1 || position >= 1;
    expect position >= 1 ==> exists i: int :: 0 <= i < |obj.s1| && obj.s1[i] == Element && !obj.Empty1();
    expect position == -1 ==> forall i: int :: 0 <= i < |obj.s1| ==> obj.s1[i] != Element || obj.Empty1();
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect position == 1; // observed from implementation
  }

  // Test case for combination {16}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position == -1 || position >= 1
  //   POST Q2: position >= 1 ==> exists i: int {:trigger s1[i]} :: 0 <= i < |s1| && s1[i] == Element && !Empty1()
  //   POST Q3: position == -1 ==> forall i: int {:trigger s1[i]} :: 0 <= i < |s1| ==> s1[i] != Element || Empty1()
  //   POST Q4: Valid()
  {
    var N := 4;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[4] [36, 47, 47, 36];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 2;
    obj.s1 := [36, 47];
    obj.s2 := [36, 47];
    obj.Repr := {obj, obj.data};
    var Element := 47;
    var position := obj.search1(Element);
    expect position == -1 || position >= 1;
    expect position >= 1 ==> exists i: int :: 0 <= i < |obj.s1| && obj.s1[i] == Element && !obj.Empty1();
    expect position == -1 ==> forall i: int :: 0 <= i < |obj.s1| ==> obj.s1[i] != Element || obj.Empty1();
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect position == 1; // observed from implementation
  }

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
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [4, 6];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var Element := 0;
    var position := obj.search3(Element);
    expect position == -1;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
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
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [14, 11];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 2;
    obj.s1 := [];
    obj.s2 := [11, 14];
    obj.Repr := {obj, obj.data};
    var Element := 0;
    var position := obj.search3(Element);
    expect position == -1;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
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
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [11, 19];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 0;
    obj.s1 := [11, 19];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var Element := 0;
    var position := obj.search3(Element);
    expect position == -1;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
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
    var N := 4;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[4] [13, 48, 48, 13];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 2;
    obj.s1 := [13, 48];
    obj.s2 := [13, 48];
    obj.Repr := {obj, obj.data};
    var Element := 0;
    var position := obj.search3(Element);
    expect position == -1;
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
  }

  // Test case for combination {6}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position == -1 || position >= 1
  //   POST Q2: position >= 1 ==> exists i: int {:trigger s2[i]} :: 0 <= i < |s2| && s2[i] == Element && !Empty2()
  //   POST Q3: Valid()
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [14, 11];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 2;
    obj.s1 := [];
    obj.s2 := [11, 14];
    obj.Repr := {obj, obj.data};
    var Element := 11;
    var position := obj.search3(Element);
    expect position == -1 || position >= 1;
    expect position >= 1 ==> exists i: int :: 0 <= i < |obj.s2| && obj.s2[i] == Element && !obj.Empty2();
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect position == 2; // observed from implementation
  }

  // Test case for combination {8}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position == -1 || position >= 1
  //   POST Q2: position >= 1 ==> exists i: int {:trigger s2[i]} :: 0 <= i < |s2| && s2[i] == Element && !Empty2()
  //   POST Q3: Valid()
  {
    var N := 4;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[4] [37, 38, 38, 37];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 2;
    obj.s1 := [37, 38];
    obj.s2 := [37, 38];
    obj.Repr := {obj, obj.data};
    var Element := 37;
    var position := obj.search3(Element);
    expect position == -1 || position >= 1;
    expect position >= 1 ==> exists i: int :: 0 <= i < |obj.s2| && obj.s2[i] == Element && !obj.Empty2();
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect position == 2; // observed from implementation
  }

  // Test case for combination {10}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position == -1 || position >= 1
  //   POST Q2: position >= 1 ==> exists i: int {:trigger s2[i]} :: 0 <= i < |s2| && s2[i] == Element && !Empty2()
  //   POST Q3: Valid()
  {
    var N := 3;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[3] [14, 17, 14];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 3;
    obj.s1 := [];
    obj.s2 := [14, 17, 14];
    obj.Repr := {obj, obj.data};
    var Element := 17;
    var position := obj.search3(Element);
    expect position == -1 || position >= 1;
    expect position >= 1 ==> exists i: int :: 0 <= i < |obj.s2| && obj.s2[i] == Element && !obj.Empty2();
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect position == 2; // observed from implementation
  }

  // Test case for combination {12}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position == -1 || position >= 1
  //   POST Q2: position >= 1 ==> exists i: int {:trigger s2[i]} :: 0 <= i < |s2| && s2[i] == Element && !Empty2()
  //   POST Q3: Valid()
  {
    var N := 6;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[6] [18, 49, 59, 58, 58, 21];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 4;
    obj.s1 := [18, 49];
    obj.s2 := [21, 58, 58, 59];
    obj.Repr := {obj, obj.data};
    var Element := 58;
    var position := obj.search3(Element);
    expect position == -1 || position >= 1;
    expect position >= 1 ==> exists i: int :: 0 <= i < |obj.s2| && obj.s2[i] == Element && !obj.Empty2();
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect position == 2; // observed from implementation
  }

  // Test case for combination {14}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position == -1 || position >= 1
  //   POST Q2: position >= 1 ==> exists i: int {:trigger s2[i]} :: 0 <= i < |s2| && s2[i] == Element && !Empty2()
  //   POST Q3: Valid()
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [14, 11];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 2;
    obj.s1 := [];
    obj.s2 := [11, 14];
    obj.Repr := {obj, obj.data};
    var Element := 14;
    var position := obj.search3(Element);
    expect position == -1 || position >= 1;
    expect position >= 1 ==> exists i: int :: 0 <= i < |obj.s2| && obj.s2[i] == Element && !obj.Empty2();
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect position == 1; // observed from implementation
  }

  // Test case for combination {16}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position == -1 || position >= 1
  //   POST Q2: position >= 1 ==> exists i: int {:trigger s2[i]} :: 0 <= i < |s2| && s2[i] == Element && !Empty2()
  //   POST Q3: Valid()
  {
    var N := 4;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[4] [37, 38, 38, 37];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 2;
    obj.s1 := [37, 38];
    obj.s2 := [37, 38];
    obj.Repr := {obj, obj.data};
    var Element := 38;
    var position := obj.search3(Element);
    expect position == -1 || position >= 1;
    expect position >= 1 ==> exists i: int :: 0 <= i < |obj.s2| && obj.s2[i] == Element && !obj.Empty2();
    expect obj[..] == _module.TwoStacks`1[System.Numerics.BigInteger]; // observed from implementation
    expect position == 1; // observed from implementation
  }

}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != 0 ==> s1 == old(s1[0 .. |s1| - 1]) && EmptyStatus == true && PopedItem == old(s1[|s1| - 1])
  //   POST Q2: old(|s1|) == 0 ==> EmptyStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [5, 9];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var old_s1 := |obj.s1|;
    var old_s1_0_s1_1 := obj.s1[0 .. |obj.s1| - 1];
    var old_s1_s1_1 := obj.s1[|obj.s1| - 1];
    var EmptyStatus, PopedItem := obj.pop1();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect old_s1 != 0 ==> obj.s1 == old_s1_0_s1_1 && EmptyStatus == true && PopedItem == old_s1_s1_1;
    // expect old_s1 == 0 ==> EmptyStatus == false;
  }

  // Test case for combination {2}:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != 0 ==> s1 == old(s1[0 .. |s1| - 1]) && EmptyStatus == true && PopedItem == old(s1[|s1| - 1])
  //   POST Q2: old(|s1|) == 0 ==> EmptyStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [12, 12];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 2;
    obj.s1 := [];
    obj.s2 := [12, 12];
    obj.Repr := {obj, obj.data};
    var old_s1 := |obj.s1|;
    var old_s1_0_s1_1 := obj.s1[0 .. |obj.s1| - 1];
    var old_s1_s1_1 := obj.s1[|obj.s1| - 1];
    var EmptyStatus, PopedItem := obj.pop1();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect old_s1 != 0 ==> obj.s1 == old_s1_0_s1_1 && EmptyStatus == true && PopedItem == old_s1_s1_1;
    // expect old_s1 == 0 ==> EmptyStatus == false;
  }

  // Test case for combination {1}/O|data|=0:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != 0 ==> s1 == old(s1[0 .. |s1| - 1]) && EmptyStatus == true && PopedItem == old(s1[|s1| - 1])
  //   POST Q2: old(|s1|) == 0 ==> EmptyStatus == false
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
    var old_s1 := |obj.s1|;
    var old_s1_0_s1_1 := obj.s1[0 .. |obj.s1| - 1];
    var old_s1_s1_1 := obj.s1[|obj.s1| - 1];
    var EmptyStatus, PopedItem := obj.pop1();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect old_s1 != 0 ==> obj.s1 == old_s1_0_s1_1 && EmptyStatus == true && PopedItem == old_s1_s1_1;
    // expect old_s1 == 0 ==> EmptyStatus == false;
  }

  // Test case for combination {1}/O|data|=1:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != 0 ==> s1 == old(s1[0 .. |s1| - 1]) && EmptyStatus == true && PopedItem == old(s1[|s1| - 1])
  //   POST Q2: old(|s1|) == 0 ==> EmptyStatus == false
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
    var old_s1 := |obj.s1|;
    var old_s1_0_s1_1 := obj.s1[0 .. |obj.s1| - 1];
    var old_s1_s1_1 := obj.s1[|obj.s1| - 1];
    var EmptyStatus, PopedItem := obj.pop1();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect old_s1 != 0 ==> obj.s1 == old_s1_0_s1_1 && EmptyStatus == true && PopedItem == old_s1_s1_1;
    // expect old_s1 == 0 ==> EmptyStatus == false;
  }

  // Test case for combination {1}/OPopedItem=1:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != 0 ==> s1 == old(s1[0 .. |s1| - 1]) && EmptyStatus == true && PopedItem == old(s1[|s1| - 1])
  //   POST Q2: old(|s1|) == 0 ==> EmptyStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [7, 8];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var old_s1 := |obj.s1|;
    var old_s1_0_s1_1 := obj.s1[0 .. |obj.s1| - 1];
    var old_s1_s1_1 := obj.s1[|obj.s1| - 1];
    var EmptyStatus, PopedItem := obj.pop1();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect old_s1 != 0 ==> obj.s1 == old_s1_0_s1_1 && EmptyStatus == true && PopedItem == old_s1_s1_1;
    // expect old_s1 == 0 ==> EmptyStatus == false;
  }

  // Test case for combination {1}/OPopedItem>=2:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != 0 ==> s1 == old(s1[0 .. |s1| - 1]) && EmptyStatus == true && PopedItem == old(s1[|s1| - 1])
  //   POST Q2: old(|s1|) == 0 ==> EmptyStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [10, 11];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var old_s1 := |obj.s1|;
    var old_s1_0_s1_1 := obj.s1[0 .. |obj.s1| - 1];
    var old_s1_s1_1 := obj.s1[|obj.s1| - 1];
    var EmptyStatus, PopedItem := obj.pop1();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect old_s1 != 0 ==> obj.s1 == old_s1_0_s1_1 && EmptyStatus == true && PopedItem == old_s1_s1_1;
    // expect old_s1 == 0 ==> EmptyStatus == false;
  }

  // Test case for combination {2}/O|data|=1:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != 0 ==> s1 == old(s1[0 .. |s1| - 1]) && EmptyStatus == true && PopedItem == old(s1[|s1| - 1])
  //   POST Q2: old(|s1|) == 0 ==> EmptyStatus == false
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [22];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 1;
    obj.s1 := [];
    obj.s2 := [22];
    obj.Repr := {obj, obj.data};
    var old_s1 := |obj.s1|;
    var old_s1_0_s1_1 := obj.s1[0 .. |obj.s1| - 1];
    var old_s1_s1_1 := obj.s1[|obj.s1| - 1];
    var EmptyStatus, PopedItem := obj.pop1();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect old_s1 != 0 ==> obj.s1 == old_s1_0_s1_1 && EmptyStatus == true && PopedItem == old_s1_s1_1;
    // expect old_s1 == 0 ==> EmptyStatus == false;
  }

  // Test case for combination {2}/OPopedItem=1:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != 0 ==> s1 == old(s1[0 .. |s1| - 1]) && EmptyStatus == true && PopedItem == old(s1[|s1| - 1])
  //   POST Q2: old(|s1|) == 0 ==> EmptyStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [14, 14];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 2;
    obj.s1 := [];
    obj.s2 := [14, 14];
    obj.Repr := {obj, obj.data};
    var old_s1 := |obj.s1|;
    var old_s1_0_s1_1 := obj.s1[0 .. |obj.s1| - 1];
    var old_s1_s1_1 := obj.s1[|obj.s1| - 1];
    var EmptyStatus, PopedItem := obj.pop1();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect old_s1 != 0 ==> obj.s1 == old_s1_0_s1_1 && EmptyStatus == true && PopedItem == old_s1_s1_1;
    // expect old_s1 == 0 ==> EmptyStatus == false;
  }

  // Test case for combination {2}/OPopedItem>=2:
  //   PRE:  Valid()
  //   POST Q1: old(|s1|) != 0 ==> s1 == old(s1[0 .. |s1| - 1]) && EmptyStatus == true && PopedItem == old(s1[|s1| - 1])
  //   POST Q2: old(|s1|) == 0 ==> EmptyStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [15, 15];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 2;
    obj.s1 := [];
    obj.s2 := [15, 15];
    obj.Repr := {obj, obj.data};
    var old_s1 := |obj.s1|;
    var old_s1_0_s1_1 := obj.s1[0 .. |obj.s1| - 1];
    var old_s1_s1_1 := obj.s1[|obj.s1| - 1];
    var EmptyStatus, PopedItem := obj.pop1();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect old_s1 != 0 ==> obj.s1 == old_s1_0_s1_1 && EmptyStatus == true && PopedItem == old_s1_s1_1;
    // expect old_s1 == 0 ==> EmptyStatus == false;
  }

  // Test case for combination {1}:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != 0 ==> s2 == old(s2[0 .. |s2| - 1]) && EmptyStatus == true && PopedItem == old(s2[|s2| - 1])
  //   POST Q2: old(|s2|) == 0 ==> EmptyStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [5, 9];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var old_s2 := |obj.s2|;
    var old_s2_0_s2_1 := obj.s2[0 .. |obj.s2| - 1];
    var old_s2_s2_1 := obj.s2[|obj.s2| - 1];
    var EmptyStatus, PopedItem := obj.pop2();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect old_s2 != 0 ==> obj.s2 == old_s2_0_s2_1 && EmptyStatus == true && PopedItem == old_s2_s2_1;
    // expect old_s2 == 0 ==> EmptyStatus == false;
  }

  // Test case for combination {3}:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != 0 ==> s2 == old(s2[0 .. |s2| - 1]) && EmptyStatus == true && PopedItem == old(s2[|s2| - 1])
  //   POST Q2: old(|s2|) == 0 ==> EmptyStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [12, 20];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 0;
    obj.s1 := [12, 20];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var old_s2 := |obj.s2|;
    var old_s2_0_s2_1 := obj.s2[0 .. |obj.s2| - 1];
    var old_s2_s2_1 := obj.s2[|obj.s2| - 1];
    var EmptyStatus, PopedItem := obj.pop2();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect old_s2 != 0 ==> obj.s2 == old_s2_0_s2_1 && EmptyStatus == true && PopedItem == old_s2_s2_1;
    // expect old_s2 == 0 ==> EmptyStatus == false;
  }

  // Test case for combination {1}/O|data|=0:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != 0 ==> s2 == old(s2[0 .. |s2| - 1]) && EmptyStatus == true && PopedItem == old(s2[|s2| - 1])
  //   POST Q2: old(|s2|) == 0 ==> EmptyStatus == false
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
    var old_s2 := |obj.s2|;
    var old_s2_0_s2_1 := obj.s2[0 .. |obj.s2| - 1];
    var old_s2_s2_1 := obj.s2[|obj.s2| - 1];
    var EmptyStatus, PopedItem := obj.pop2();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect old_s2 != 0 ==> obj.s2 == old_s2_0_s2_1 && EmptyStatus == true && PopedItem == old_s2_s2_1;
    // expect old_s2 == 0 ==> EmptyStatus == false;
  }

  // Test case for combination {1}/O|data|=1:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != 0 ==> s2 == old(s2[0 .. |s2| - 1]) && EmptyStatus == true && PopedItem == old(s2[|s2| - 1])
  //   POST Q2: old(|s2|) == 0 ==> EmptyStatus == false
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
    var old_s2 := |obj.s2|;
    var old_s2_0_s2_1 := obj.s2[0 .. |obj.s2| - 1];
    var old_s2_s2_1 := obj.s2[|obj.s2| - 1];
    var EmptyStatus, PopedItem := obj.pop2();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect old_s2 != 0 ==> obj.s2 == old_s2_0_s2_1 && EmptyStatus == true && PopedItem == old_s2_s2_1;
    // expect old_s2 == 0 ==> EmptyStatus == false;
  }

  // Test case for combination {1}/OPopedItem=1:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != 0 ==> s2 == old(s2[0 .. |s2| - 1]) && EmptyStatus == true && PopedItem == old(s2[|s2| - 1])
  //   POST Q2: old(|s2|) == 0 ==> EmptyStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [7, 8];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var old_s2 := |obj.s2|;
    var old_s2_0_s2_1 := obj.s2[0 .. |obj.s2| - 1];
    var old_s2_s2_1 := obj.s2[|obj.s2| - 1];
    var EmptyStatus, PopedItem := obj.pop2();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect old_s2 != 0 ==> obj.s2 == old_s2_0_s2_1 && EmptyStatus == true && PopedItem == old_s2_s2_1;
    // expect old_s2 == 0 ==> EmptyStatus == false;
  }

  // Test case for combination {1}/OPopedItem>=2:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != 0 ==> s2 == old(s2[0 .. |s2| - 1]) && EmptyStatus == true && PopedItem == old(s2[|s2| - 1])
  //   POST Q2: old(|s2|) == 0 ==> EmptyStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [10, 11];
    obj.data := tmp_data;
    obj.n1 := 0;
    obj.n2 := 0;
    obj.s1 := [];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var old_s2 := |obj.s2|;
    var old_s2_0_s2_1 := obj.s2[0 .. |obj.s2| - 1];
    var old_s2_s2_1 := obj.s2[|obj.s2| - 1];
    var EmptyStatus, PopedItem := obj.pop2();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect old_s2 != 0 ==> obj.s2 == old_s2_0_s2_1 && EmptyStatus == true && PopedItem == old_s2_s2_1;
    // expect old_s2 == 0 ==> EmptyStatus == false;
  }

  // Test case for combination {3}/O|data|=1:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != 0 ==> s2 == old(s2[0 .. |s2| - 1]) && EmptyStatus == true && PopedItem == old(s2[|s2| - 1])
  //   POST Q2: old(|s2|) == 0 ==> EmptyStatus == false
  {
    var N := 1;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[1] [16];
    obj.data := tmp_data;
    obj.n1 := 1;
    obj.n2 := 0;
    obj.s1 := [16];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var old_s2 := |obj.s2|;
    var old_s2_0_s2_1 := obj.s2[0 .. |obj.s2| - 1];
    var old_s2_s2_1 := obj.s2[|obj.s2| - 1];
    var EmptyStatus, PopedItem := obj.pop2();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect old_s2 != 0 ==> obj.s2 == old_s2_0_s2_1 && EmptyStatus == true && PopedItem == old_s2_s2_1;
    // expect old_s2 == 0 ==> EmptyStatus == false;
  }

  // Test case for combination {3}/OPopedItem=1:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != 0 ==> s2 == old(s2[0 .. |s2| - 1]) && EmptyStatus == true && PopedItem == old(s2[|s2| - 1])
  //   POST Q2: old(|s2|) == 0 ==> EmptyStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [13, 23];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 0;
    obj.s1 := [13, 23];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var old_s2 := |obj.s2|;
    var old_s2_0_s2_1 := obj.s2[0 .. |obj.s2| - 1];
    var old_s2_s2_1 := obj.s2[|obj.s2| - 1];
    var EmptyStatus, PopedItem := obj.pop2();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect old_s2 != 0 ==> obj.s2 == old_s2_0_s2_1 && EmptyStatus == true && PopedItem == old_s2_s2_1;
    // expect old_s2 == 0 ==> EmptyStatus == false;
  }

  // Test case for combination {3}/OPopedItem>=2:
  //   PRE:  Valid()
  //   POST Q1: old(|s2|) != 0 ==> s2 == old(s2[0 .. |s2| - 1]) && EmptyStatus == true && PopedItem == old(s2[|s2| - 1])
  //   POST Q2: old(|s2|) == 0 ==> EmptyStatus == false
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [14, 15];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 0;
    obj.s1 := [14, 15];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var old_s2 := |obj.s2|;
    var old_s2_0_s2_1 := obj.s2[0 .. |obj.s2| - 1];
    var old_s2_s2_1 := obj.s2[|obj.s2| - 1];
    var EmptyStatus, PopedItem := obj.pop2();
    // runtime error: Unhandled exception. System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'length')
    // runtime error: at System.Collections.Immutable.Requires.FailRange(String parameterName, String message)
    // runtime error: at System.Collections.Immutable.Requires.Range(Boolean condition, String parameterName, String message)
    // expect old_s2 != 0 ==> obj.s2 == old_s2_0_s2_1 && EmptyStatus == true && PopedItem == old_s2_s2_1;
    // expect old_s2 == 0 ==> EmptyStatus == false;
  }

  // Test case for combination {7}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position == -1 || position >= 1
  //   POST Q2: position >= 1 ==> exists i: int {:trigger s1[i]} :: 0 <= i < |s1| && s1[i] == Element && !Empty1()
  //   POST Q3: position == -1 ==> forall i: int {:trigger s1[i]} :: 0 <= i < |s1| ==> s1[i] != Element || Empty1()
  //   POST Q4: Valid()
  {
    var N := 2;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[2] [11, 19];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 0;
    obj.s1 := [11, 19];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var Element := 11;
    var position := obj.search1(Element);
    // actual runtime state: obj=_module.TwoStacks`1[System.Numerics.BigInteger], position=-1
    // expect position == -1 || position >= 1; // got true
    // expect position >= 1 ==> exists i: int :: 0 <= i < |obj.s1| && obj.s1[i] == Element && !obj.Empty1(); // got true
    // expect position == -1 ==> forall i: int :: 0 <= i < |obj.s1| ==> obj.s1[i] != Element || obj.Empty1(); // got false
  }

  // Test case for combination {8}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position == -1 || position >= 1
  //   POST Q2: position >= 1 ==> exists i: int {:trigger s1[i]} :: 0 <= i < |s1| && s1[i] == Element && !Empty1()
  //   POST Q3: position == -1 ==> forall i: int {:trigger s1[i]} :: 0 <= i < |s1| ==> s1[i] != Element || Empty1()
  //   POST Q4: Valid()
  {
    var N := 4;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[4] [36, 47, 47, 36];
    obj.data := tmp_data;
    obj.n1 := 2;
    obj.n2 := 2;
    obj.s1 := [36, 47];
    obj.s2 := [36, 47];
    obj.Repr := {obj, obj.data};
    var Element := 36;
    var position := obj.search1(Element);
    // actual runtime state: obj=_module.TwoStacks`1[System.Numerics.BigInteger], position=-1
    // expect position == -1 || position >= 1; // got true
    // expect position >= 1 ==> exists i: int :: 0 <= i < |obj.s1| && obj.s1[i] == Element && !obj.Empty1(); // got true
    // expect position == -1 ==> forall i: int :: 0 <= i < |obj.s1| ==> obj.s1[i] != Element || obj.Empty1(); // got false
  }

  // Test case for combination {11}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position == -1 || position >= 1
  //   POST Q2: position >= 1 ==> exists i: int {:trigger s1[i]} :: 0 <= i < |s1| && s1[i] == Element && !Empty1()
  //   POST Q3: position == -1 ==> forall i: int {:trigger s1[i]} :: 0 <= i < |s1| ==> s1[i] != Element || Empty1()
  //   POST Q4: Valid()
  {
    var N := 4;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[4] [14, 16, 16, 24];
    obj.data := tmp_data;
    obj.n1 := 4;
    obj.n2 := 0;
    obj.s1 := [14, 16, 16, 24];
    obj.s2 := [];
    obj.Repr := {obj, obj.data};
    var Element := 16;
    var position := obj.search1(Element);
    // actual runtime state: obj=_module.TwoStacks`1[System.Numerics.BigInteger], position=-1
    // expect position == -1 || position >= 1; // got true
    // expect position >= 1 ==> exists i: int :: 0 <= i < |obj.s1| && obj.s1[i] == Element && !obj.Empty1(); // got true
    // expect position == -1 ==> forall i: int :: 0 <= i < |obj.s1| ==> obj.s1[i] != Element || obj.Empty1(); // got false
  }

  // Test case for combination {12}/Rel:
  //   PRE:  Valid()
  //   POST Q1: position == -1 || position >= 1
  //   POST Q2: position >= 1 ==> exists i: int {:trigger s1[i]} :: 0 <= i < |s1| && s1[i] == Element && !Empty1()
  //   POST Q3: position == -1 ==> forall i: int {:trigger s1[i]} :: 0 <= i < |s1| ==> s1[i] != Element || Empty1()
  //   POST Q4: Valid()
  {
    var N := 5;
    var obj := new TwoStacks<int>(N);
    var tmp_data := new int[5] [18, 50, 51, 56, 21];
    obj.data := tmp_data;
    obj.n1 := 3;
    obj.n2 := 2;
    obj.s1 := [18, 50, 51];
    obj.s2 := [21, 56];
    obj.Repr := {obj, obj.data};
    var Element := 50;
    var position := obj.search1(Element);
    // actual runtime state: obj=_module.TwoStacks`1[System.Numerics.BigInteger], position=-1
    // expect position == -1 || position >= 1; // got true
    // expect position >= 1 ==> exists i: int :: 0 <= i < |obj.s1| && obj.s1[i] == Element && !obj.Empty1(); // got true
    // expect position == -1 ==> forall i: int :: 0 <= i < |obj.s1| ==> obj.s1[i] != Element || obj.Empty1(); // got false
  }

}

method Main()
{
  Passing();
  Failing();
}
