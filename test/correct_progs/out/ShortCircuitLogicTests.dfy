// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\ShortCircuitLogic.dfy
// Method: GetFirstOrZero
// Generated: 2026-04-10 23:12:46

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



method Passing()
{
  // Test case for combination {2}:
  //   POST: !(a.Length == 0)
  //   POST: a.Length > 0
  //   POST: result == a[0]
  //   ENSURES: a.Length == 0 ==> result == 0
  //   ENSURES: a.Length > 0 ==> result == a[0]
  {
    var a := new int[1] [2];
    var result := GetFirstOrZero(a);
    expect result == 2;
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

  // Test case for combination {2}/Ba=2:
  //   POST: !(a.Length == 0)
  //   POST: a.Length > 0
  //   POST: result == a[0]
  //   ENSURES: a.Length == 0 ==> result == 0
  //   ENSURES: a.Length > 0 ==> result == a[0]
  {
    var a := new int[2] [4, 3];
    var result := GetFirstOrZero(a);
    expect result == 4;
  }

  // Test case for combination {2}/Ba=3:
  //   POST: !(a.Length == 0)
  //   POST: a.Length > 0
  //   POST: result == a[0]
  //   ENSURES: a.Length == 0 ==> result == 0
  //   ENSURES: a.Length > 0 ==> result == a[0]
  {
    var a := new int[3] [5, 4, 6];
    var result := GetFirstOrZero(a);
    expect result == 5;
  }

  // Test case for combination {2}/Oresult>0:
  //   POST: !(a.Length == 0)
  //   POST: a.Length > 0
  //   POST: result == a[0]
  //   ENSURES: a.Length == 0 ==> result == 0
  //   ENSURES: a.Length > 0 ==> result == a[0]
  {
    var a := new int[4] [39, 9, 10, 8];
    var result := GetFirstOrZero(a);
    expect result == 39;
  }

  // Test case for combination {2}/Oresult<0:
  //   POST: !(a.Length == 0)
  //   POST: a.Length > 0
  //   POST: result == a[0]
  //   ENSURES: a.Length == 0 ==> result == 0
  //   ENSURES: a.Length > 0 ==> result == a[0]
  {
    var a := new int[6] [-1, 10, 14, 18, 22, 26];
    var result := GetFirstOrZero(a);
    expect result == -1;
  }

  // Test case for combination {2}/Oresult=0:
  //   POST: !(a.Length == 0)
  //   POST: a.Length > 0
  //   POST: result == a[0]
  //   ENSURES: a.Length == 0 ==> result == 0
  //   ENSURES: a.Length > 0 ==> result == a[0]
  {
    var a := new int[5] [0, 11, 10, 13, 12];
    var result := GetFirstOrZero(a);
    expect result == 0;
  }

  // Test case for combination {1}:
  //   POST: result == (a.Length == 0 || a[0] == 0)
  //   ENSURES: result == (a.Length == 0 || a[0] == 0)
  {
    var a := new int[1] [2];
    var result := ZeroLengthOrValue(a);
    expect result == false;
  }

  // Test case for combination {1}/Ba=2:
  //   POST: result == (a.Length == 0 || a[0] == 0)
  //   ENSURES: result == (a.Length == 0 || a[0] == 0)
  {
    var a := new int[2] [4, 3];
    var result := ZeroLengthOrValue(a);
    expect result == false;
  }

  // Test case for combination {1}/Ba=3:
  //   POST: result == (a.Length == 0 || a[0] == 0)
  //   ENSURES: result == (a.Length == 0 || a[0] == 0)
  {
    var a := new int[3] [5, 4, 6];
    var result := ZeroLengthOrValue(a);
    expect result == false;
  }

  // Test case for combination {1}/Oresult=true:
  //   POST: result == (a.Length == 0 || a[0] == 0)
  //   ENSURES: result == (a.Length == 0 || a[0] == 0)
  {
    var a := new int[4] [0, 9, 10, 8];
    var result := ZeroLengthOrValue(a);
    expect result == true;
  }

  // Test case for combination {1}/Oresult=false:
  //   POST: result == (a.Length == 0 || a[0] == 0)
  //   ENSURES: result == (a.Length == 0 || a[0] == 0)
  {
    var a := new int[6] [7, 11, 15, 19, 23, 27];
    var result := ZeroLengthOrValue(a);
    expect result == false;
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
