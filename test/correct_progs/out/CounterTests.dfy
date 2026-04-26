// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Counter.dfy
// Method: Increment
// Generated: 2026-04-23 20:23:22

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
  }

  // Test case for combination {1}/Ocount=0:
  //   PRE:  count >= 0
  //   POST Q1: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 0;
    obj.Increment();
    expect obj.count == 1;
  }

  // Test case for combination {1}/R3:
  //   PRE:  count >= 0
  //   POST Q1: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 9;
    obj.Increment();
    expect obj.count == 10;
  }

  // Test case for combination {1}/R4:
  //   PRE:  count >= 0
  //   POST Q1: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 8;
    obj.Increment();
    expect obj.count == 9;
  }

  // Test case for combination {1}/R5:
  //   PRE:  count >= 0
  //   POST Q1: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 7;
    obj.Increment();
    expect obj.count == 8;
  }

  // Test case for combination {1}/R6:
  //   PRE:  count >= 0
  //   POST Q1: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 6;
    obj.Increment();
    expect obj.count == 7;
  }

  // Test case for combination {1}/R7:
  //   PRE:  count >= 0
  //   POST Q1: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 5;
    obj.Increment();
    expect obj.count == 6;
  }

  // Test case for combination {1}/R8:
  //   PRE:  count >= 0
  //   POST Q1: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 4;
    obj.Increment();
    expect obj.count == 5;
  }

  // Test case for combination {1}/R9:
  //   PRE:  count >= 0
  //   POST Q1: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 3;
    obj.Increment();
    expect obj.count == 4;
  }

  // Test case for combination {1}/R10:
  //   PRE:  count >= 0
  //   POST Q1: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 2;
    obj.Increment();
    expect obj.count == 3;
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
  }

  // Test case for combination {1}/Ocount>0:
  //   POST Q1: count == 0
  {
    var obj := new Counter;
    obj.count := 10;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/R3:
  //   POST Q1: count == 0
  {
    var obj := new Counter;
    obj.count := -9;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: count == 0
  {
    var obj := new Counter;
    obj.count := -8;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/R5:
  //   POST Q1: count == 0
  {
    var obj := new Counter;
    obj.count := -7;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: count == 0
  {
    var obj := new Counter;
    obj.count := -6;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/R7:
  //   POST Q1: count == 0
  {
    var obj := new Counter;
    obj.count := -5;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: count == 0
  {
    var obj := new Counter;
    obj.count := -4;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: count == 0
  {
    var obj := new Counter;
    obj.count := -3;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: count == 0
  {
    var obj := new Counter;
    obj.count := -2;
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
