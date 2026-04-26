// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\ShortCircuitLogic.dfy
// Method: GetFirstOrZero
// Generated: 2026-04-23 20:33:50

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
  //   POST Q1: a.Length > 0
  //   POST Q2: result == a[0]
  {
    var a := new int[1] [-10];
    var result := GetFirstOrZero(a);
    expect result == -10;
  }

  // Test case for combination {3}:
  //   POST Q1: a.Length == 0
  //   POST Q2: result == 0
  {
    var a := new int[0] [];
    var result := GetFirstOrZero(a);
    expect result == 0;
  }

  // Test case for combination {2}/O|a|>=2:
  //   POST Q1: a.Length > 0
  //   POST Q2: result == a[0]
  {
    var a := new int[2] [-1, -10];
    var result := GetFirstOrZero(a);
    expect result == -1;
  }

  // Test case for combination {2}/Oresult=0:
  //   POST Q1: a.Length > 0
  //   POST Q2: result == a[0]
  {
    var a := new int[1] [0];
    var result := GetFirstOrZero(a);
    expect result == 0;
  }

  // Test case for combination {2}/Oresult>0:
  //   POST Q1: a.Length > 0
  //   POST Q2: result == a[0]
  {
    var a := new int[1] [10];
    var result := GetFirstOrZero(a);
    expect result == 10;
  }

  // Test case for combination {2}/R5:
  //   POST Q1: a.Length > 0
  //   POST Q2: result == a[0]
  {
    var a := new int[1] [-9];
    var result := GetFirstOrZero(a);
    expect result == -9;
  }

  // Test case for combination {2}/R6:
  //   POST Q1: a.Length > 0
  //   POST Q2: result == a[0]
  {
    var a := new int[1] [-8];
    var result := GetFirstOrZero(a);
    expect result == -8;
  }

  // Test case for combination {2}/R7:
  //   POST Q1: a.Length > 0
  //   POST Q2: result == a[0]
  {
    var a := new int[1] [-7];
    var result := GetFirstOrZero(a);
    expect result == -7;
  }

  // Test case for combination {2}/R8:
  //   POST Q1: a.Length > 0
  //   POST Q2: result == a[0]
  {
    var a := new int[1] [-6];
    var result := GetFirstOrZero(a);
    expect result == -6;
  }

  // Test case for combination {2}/R9:
  //   POST Q1: a.Length > 0
  //   POST Q2: result == a[0]
  {
    var a := new int[1] [-5];
    var result := GetFirstOrZero(a);
    expect result == -5;
  }

}

method TestsForZeroLengthOrValue()
{
  // Test case for combination {1}:
  //   POST Q1: result == (a.Length == 0 || a[0] == 0)
  {
    var a := new int[1] [-10];
    var result := ZeroLengthOrValue(a);
    expect result == false;
  }

  // Test case for combination {1}/O|a|=0:
  //   POST Q1: result == (a.Length == 0 || a[0] == 0)
  {
    var a := new int[0] [];
    var result := ZeroLengthOrValue(a);
    expect result == true;
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: result == (a.Length == 0 || a[0] == 0)
  {
    var a := new int[2] [-1, -5];
    var result := ZeroLengthOrValue(a);
    expect result == false;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: result == (a.Length == 0 || a[0] == 0)
  {
    var a := new int[1] [-9];
    var result := ZeroLengthOrValue(a);
    expect result == false;
  }

  // Test case for combination {1}/R5:
  //   POST Q1: result == (a.Length == 0 || a[0] == 0)
  {
    var a := new int[1] [-8];
    var result := ZeroLengthOrValue(a);
    expect result == false;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: result == (a.Length == 0 || a[0] == 0)
  {
    var a := new int[1] [-7];
    var result := ZeroLengthOrValue(a);
    expect result == false;
  }

  // Test case for combination {1}/R7:
  //   POST Q1: result == (a.Length == 0 || a[0] == 0)
  {
    var a := new int[1] [-6];
    var result := ZeroLengthOrValue(a);
    expect result == false;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: result == (a.Length == 0 || a[0] == 0)
  {
    var a := new int[1] [-5];
    var result := ZeroLengthOrValue(a);
    expect result == false;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: result == (a.Length == 0 || a[0] == 0)
  {
    var a := new int[1] [-4];
    var result := ZeroLengthOrValue(a);
    expect result == false;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: result == (a.Length == 0 || a[0] == 0)
  {
    var a := new int[1] [-3];
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
