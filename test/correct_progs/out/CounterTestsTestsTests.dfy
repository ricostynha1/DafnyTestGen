// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\CounterTestsTests.dfy
// Method: Increment
// Generated: 2026-03-31 20:49:09

// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\CounterTests.dfy
// Method: Increment
// Generated: 2026-03-31 19:39:15

// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Counter.dfy
// Method: Increment
// Generated: 2026-03-31 19:39:15

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
  //   POST: count == (count) + 1
  {
    var obj := new Counter;
    obj.count := 0;
    var old_count := obj.count;
    expect obj.count >= 0; // PRE-CHECK
    obj.Increment();
    expect obj.count == old_count + 1;
  }

  // Test case for combination {1}/Bcount=1:
  //   PRE:  count >= 0
  //   POST: count == (count) + 1
  {
    var obj := new Counter;
    obj.count := 1;
    var old_count := obj.count;
    expect obj.count >= 0; // PRE-CHECK
    obj.Increment();
    expect obj.count == old_count + 1;
  }

  // Test case for combination {1}/R3:
  //   PRE:  count >= 0
  //   POST: count == (count) + 1
  {
    var obj := new Counter;
    obj.count := 2;
    var old_count := obj.count;
    expect obj.count >= 0; // PRE-CHECK
    obj.Increment();
    expect obj.count == old_count + 1;
  }

  // Test case for combination {1}:
  //   POST: count == 0
  {
    var obj := new Counter;
    obj.count := 0;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/Bcount=1:
  //   POST: count == 0
  {
    var obj := new Counter;
    obj.count := 1;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/R3:
  //   POST: count == 0
  {
    var obj := new Counter;
    obj.count := -1;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}:
  //   PRE:  count >= 0
  //   POST: count == (count) + 1
  {
    var obj := new Counter;
    obj.count := 0;
    var old_count := obj.count;
    expect obj.count >= 0; // PRE-CHECK
    obj.Increment();
    expect obj.count == old_count + 1;
  }

  // Test case for combination {1}/Bcount=1:
  //   PRE:  count >= 0
  //   POST: count == (count) + 1
  {
    var obj := new Counter;
    obj.count := 1;
    var old_count := obj.count;
    expect obj.count >= 0; // PRE-CHECK
    obj.Increment();
    expect obj.count == old_count + 1;
  }

  // Test case for combination {1}/R3:
  //   PRE:  count >= 0
  //   POST: count == (count) + 1
  {
    var obj := new Counter;
    obj.count := 2;
    var old_count := obj.count;
    expect obj.count >= 0; // PRE-CHECK
    obj.Increment();
    expect obj.count == old_count + 1;
  }

  // Test case for combination {1}:
  //   POST: count == 0
  {
    var obj := new Counter;
    obj.count := 0;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/Bcount=1:
  //   POST: count == 0
  {
    var obj := new Counter;
    obj.count := 1;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/R3:
  //   POST: count == 0
  {
    var obj := new Counter;
    obj.count := -1;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}:
  //   POST: count == 0
  {
    var obj := new Counter;
    obj.count := 0;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/Bcount=1:
  //   POST: count == 0
  {
    var obj := new Counter;
    obj.count := 1;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/R3:
  //   POST: count == 0
  {
    var obj := new Counter;
    obj.count := -1;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}:
  //   PRE:  count >= 0
  //   POST: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 0;
    var old_count := obj.count;
    expect obj.count >= 0; // PRE-CHECK
    obj.Increment();
    expect obj.count == old_count + 1;
  }

  // Test case for combination {1}/Bcount=1:
  //   PRE:  count >= 0
  //   POST: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 1;
    var old_count := obj.count;
    expect obj.count >= 0; // PRE-CHECK
    obj.Increment();
    expect obj.count == old_count + 1;
  }

  // Test case for combination {1}/R3:
  //   PRE:  count >= 0
  //   POST: count == old(count) + 1
  {
    var obj := new Counter;
    obj.count := 2;
    var old_count := obj.count;
    expect obj.count >= 0; // PRE-CHECK
    obj.Increment();
    expect obj.count == old_count + 1;
  }

  // Test case for combination {1}:
  //   POST: count == 0
  {
    var obj := new Counter;
    obj.count := 0;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/Bcount=1:
  //   POST: count == 0
  {
    var obj := new Counter;
    obj.count := 1;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/R3:
  //   POST: count == 0
  {
    var obj := new Counter;
    obj.count := -1;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}:
  //   PRE:  count >= 0
  //   POST: count == (count) + 1
  {
    var obj := new Counter;
    obj.count := 0;
    var old_count := obj.count;
    expect obj.count >= 0; // PRE-CHECK
    obj.Increment();
    expect obj.count == old_count + 1;
  }

  // Test case for combination {1}/Bcount=1:
  //   PRE:  count >= 0
  //   POST: count == (count) + 1
  {
    var obj := new Counter;
    obj.count := 1;
    var old_count := obj.count;
    expect obj.count >= 0; // PRE-CHECK
    obj.Increment();
    expect obj.count == old_count + 1;
  }

  // Test case for combination {1}/R3:
  //   PRE:  count >= 0
  //   POST: count == (count) + 1
  {
    var obj := new Counter;
    obj.count := 2;
    var old_count := obj.count;
    expect obj.count >= 0; // PRE-CHECK
    obj.Increment();
    expect obj.count == old_count + 1;
  }

  // Test case for combination {1}:
  //   POST: count == 0
  {
    var obj := new Counter;
    obj.count := 0;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/Bcount=1:
  //   POST: count == 0
  {
    var obj := new Counter;
    obj.count := 1;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/R3:
  //   POST: count == 0
  {
    var obj := new Counter;
    obj.count := -1;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}:
  //   POST: count == 0
  {
    var obj := new Counter;
    obj.count := 0;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/Bcount=1:
  //   POST: count == 0
  {
    var obj := new Counter;
    obj.count := 1;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/R3:
  //   POST: count == 0
  {
    var obj := new Counter;
    obj.count := -1;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}:
  //   POST: count == 0
  {
    var obj := new Counter;
    obj.count := 0;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/Bcount=1:
  //   POST: count == 0
  {
    var obj := new Counter;
    obj.count := 1;
    obj.Reset();
    expect obj.count == 0;
  }

  // Test case for combination {1}/R3:
  //   POST: count == 0
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
