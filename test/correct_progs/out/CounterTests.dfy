// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Counter.dfy
// Method: Increment
// Generated: 2026-04-21 23:35:29

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
  //   POST Q1: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 10;
    obj.Increment();
    expect obj.count == 11;
    expect obj[..] == _module.Counter; // observed from implementation
  }

  // Test case for combination {1}/Ocount=0:
  //   PRE:  count >= 0
  //   POST Q1: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 0;
    obj.Increment();
    expect obj.count == 1;
    expect obj[..] == _module.Counter; // observed from implementation
  }

  // Test case for combination {1}/R3:
  //   PRE:  count >= 0
  //   POST Q1: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 9;
    obj.Increment();
    expect obj.count == 10;
    expect obj[..] == _module.Counter; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  count >= 0
  //   POST Q1: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 8;
    obj.Increment();
    expect obj.count == 9;
    expect obj[..] == _module.Counter; // observed from implementation
  }

}

method TestsForReset()
{
  // Test case for combination {1}:
  //   POST Q1: count == 0
  {
    var obj := new Counter;
    obj.count := -10;
    obj.Reset();
    expect obj.count == 0;
    expect obj[..] == _module.Counter; // observed from implementation
  }

  // Test case for combination {1}/Ocount>0:
  //   POST Q1: count == 0
  {
    var obj := new Counter;
    obj.count := 10;
    obj.Reset();
    expect obj.count == 0;
    expect obj[..] == _module.Counter; // observed from implementation
  }

  // Test case for combination {1}/R3:
  //   POST Q1: count == 0
  {
    var obj := new Counter;
    obj.count := -9;
    obj.Reset();
    expect obj.count == 0;
    expect obj[..] == _module.Counter; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   POST Q1: count == 0
  {
    var obj := new Counter;
    obj.count := -8;
    obj.Reset();
    expect obj.count == 0;
    expect obj[..] == _module.Counter; // observed from implementation
  }

}

method Main()
{
  TestsForIncrement();
  print "TestsForIncrement: all non-failing tests passed!\n";
  TestsForReset();
  print "TestsForReset: all non-failing tests passed!\n";
}
