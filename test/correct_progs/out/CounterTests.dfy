// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Counter.dfy
// Method: Increment
// Generated: 2026-04-19 21:52:10

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


method TestsForIncrement()
{
  // Test case for combination {1}:
  //   PRE:  count >= 0
  //   POST: count == old(count) + 1
  //   ENSURES: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 20;
    obj.Increment();
    expect obj.count == 21;
  }

  // Test case for combination {1}/R2:
  //   PRE:  count >= 0
  //   POST: count == old(count) + 1
  //   ENSURES: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 19;
    obj.Increment();
    expect obj.count == 20;
  }

  // Test case for combination {1}/R3:
  //   PRE:  count >= 0
  //   POST: count == old(count) + 1
  //   ENSURES: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 18;
    obj.Increment();
    expect obj.count == 19;
  }

  // Test case for combination {1}/R4:
  //   PRE:  count >= 0
  //   POST: count == old(count) + 1
  //   ENSURES: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 17;
    obj.Increment();
    expect obj.count == 18;
  }

}

method TestsForReset()
{
  // Test case for combination {1}:
  //   POST: count == 0
  //   ENSURES: count == 0
  {
    var obj := new Counter;
    obj.count := -20;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/R2:
  //   POST: count == 0
  //   ENSURES: count == 0
  {
    var obj := new Counter;
    obj.count := -19;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/R3:
  //   POST: count == 0
  //   ENSURES: count == 0
  {
    var obj := new Counter;
    obj.count := -18;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/R4:
  //   POST: count == 0
  //   ENSURES: count == 0
  {
    var obj := new Counter;
    obj.count := -17;
    obj.Reset();
    expect obj.count == 0;
  }

}

method Main()
{
  TestsForIncrement();
  print "TestsForIncrement: all non-failing tests passed!\n";
  TestsForReset();
  print "TestsForReset: all non-failing tests passed!\n";
}
