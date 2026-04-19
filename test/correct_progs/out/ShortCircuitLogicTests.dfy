// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\ShortCircuitLogic.dfy
// Method: GetFirstOrZero
// Generated: 2026-04-19 21:55:24

method GetFirstOrZero(a: array<int>) returns (result: int)
  ensures a.Length == 0 ==> result == 0
  ensures a.Length > 0 ==> result == a[0]
{
    if a.Length == 0 {
        return 0;
    } else {
        return a[0];
    }
}


method ZeroLengthOrValue(a: array<int>) returns (result: bool)
  ensures result == (a.Length == 0 || a[0] == 0)
{
    return a.Length == 0 || a[0] == 0;
}



method TestsForGetFirstOrZero()
{
  // Test case for combination {2}:
  //   POST: !(a.Length == 0)
  //   POST: a.Length > 0
  //   POST: result == a[0]
  //   ENSURES: a.Length == 0 ==> result == 0
  //   ENSURES: a.Length > 0 ==> result == a[0]
  {
    var a := new int[1] [-20];
    var result := GetFirstOrZero(a);
    expect result == -20;
  }

  // Test case for combination {3}:
  //   POST: a.Length == 0
  //   POST: result == 0
  //   POST: !(a.Length > 0)
  //   ENSURES: a.Length == 0 ==> result == 0
  //   ENSURES: a.Length > 0 ==> result == a[0]
  {
    var a := new int[0] [];
    var result := GetFirstOrZero(a);
    expect result == 0;
  }

  // Test case for combination {2}/O|a|>=2:
  //   POST: !(a.Length == 0)
  //   POST: a.Length > 0
  //   POST: result == a[0]
  //   ENSURES: a.Length == 0 ==> result == 0
  //   ENSURES: a.Length > 0 ==> result == a[0]
  {
    var a := new int[2] [-19, -20];
    var result := GetFirstOrZero(a);
    expect result == -19;
  }

  // Test case for combination {2}/Oresult=0:
  //   POST: !(a.Length == 0)
  //   POST: a.Length > 0
  //   POST: result == a[0]
  //   ENSURES: a.Length == 0 ==> result == 0
  //   ENSURES: a.Length > 0 ==> result == a[0]
  {
    var a := new int[1] [0];
    var result := GetFirstOrZero(a);
    expect result == 0;
  }

}

method TestsForZeroLengthOrValue()
{
  // Test case for combination {1}:
  //   POST: result == (a.Length == 0 || a[0] == 0)
  //   ENSURES: result == (a.Length == 0 || a[0] == 0)
  {
    var a := new int[1] [-20];
    var result := ZeroLengthOrValue(a);
    expect result == false;
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST: result == (a.Length == 0 || a[0] == 0)
  //   ENSURES: result == (a.Length == 0 || a[0] == 0)
  {
    var a := new int[2] [-1, -20];
    var result := ZeroLengthOrValue(a);
    expect result == false;
  }

  // Test case for combination {1}/Oresult=true:
  //   POST: result == (a.Length == 0 || a[0] == 0)
  //   ENSURES: result == (a.Length == 0 || a[0] == 0)
  {
    var a := new int[1] [0];
    var result := ZeroLengthOrValue(a);
    expect result == true;
  }

  // Test case for combination {1}/R4:
  //   POST: result == (a.Length == 0 || a[0] == 0)
  //   ENSURES: result == (a.Length == 0 || a[0] == 0)
  {
    var a := new int[1] [-19];
    var result := ZeroLengthOrValue(a);
    expect result == false;
  }

}

method Main()
{
  TestsForGetFirstOrZero();
  print "TestsForGetFirstOrZero: all non-failing tests passed!\n";
  TestsForZeroLengthOrValue();
  print "TestsForZeroLengthOrValue: all non-failing tests passed!\n";
}
