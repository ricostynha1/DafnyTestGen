// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Counter.dfy
// Method: Increment
// Generated: 2026-04-10 22:25:01

class Counter {
    var count: int

    method Increment()
        modifies this
        requires count >= 0
        ensures count == old(count) + 1
    {
        count := count + 1;
    }

    method Reset()
        modifies this
        ensures count == 0
    {
        count := 0;
    }
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  count >= 0
  //   POST: count == old(count) + 1
  //   ENSURES: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 0;
    obj.Increment();
    expect obj.count == 1;
  }

  // Test case for combination {1}/Bcount=1:
  //   PRE:  count >= 0
  //   POST: count == old(count) + 1
  //   ENSURES: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 1;
    obj.Increment();
    expect obj.count == 2;
  }

  // Test case for combination {1}/Ocount>0:
  //   PRE:  count >= 0
  //   POST: count == old(count) + 1
  //   ENSURES: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 2;
    obj.Increment();
    expect obj.count == 3;
  }

  // Test case for combination {1}:
  //   POST: count == 0
  //   ENSURES: count == 0
  {
    var obj := new Counter;
    obj.count := 0;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/Bcount=1:
  //   POST: count == 0
  //   ENSURES: count == 0
  {
    var obj := new Counter;
    obj.count := 1;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/Ocount=0:
  //   POST: count == 0
  //   ENSURES: count == 0
  {
    var obj := new Counter;
    obj.count := -1;
    obj.Reset();
    expect obj.count == 0;
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
