// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_426.dfy
// Method: FilterOddNumbers
// Generated: 2026-04-10 23:16:29

// Returns a sequence with the odd numbers in the input array, by the same order.
method FilterOddNumbers(arr: array<int>) returns (oddList: seq<int>)
  ensures oddList == FilterOdd(arr[..])
{
  oddList := [];
  for i := 0 to arr.Length
    invariant oddList == FilterOdd(arr[..i])
  {
    if IsOdd(arr[i]) {
      oddList := oddList + [arr[i]];
    }
    assert arr[..i+1] == arr[..i] + [arr[i]]; // proof helper
  }
  assert arr[..] == arr[..arr.Length]; // proof helper
}

// Auxiliary predicate to checks if a number is odd
predicate IsOdd(n: int) {
  n % 2 != 0
}

// Select from a sequence 'a' the elements that satisfy a predicate 'p'.
function {:fuel 4} FilterOdd(a: seq<int>): seq<int> {
  if |a| == 0 then []
  else if IsOdd(a[|a|-1]) then FilterOdd(a[..|a|-1]) + [a[|a|-1]]
  else FilterOdd(a[..|a|-1])
}


// Test cases checked statically.
method FilterOddNumbersTest(){
  var a1:= new int[] [1, 2, 3, 4];
  var res1 := FilterOddNumbers(a1);
  assert res1 == [1, 3];

  var a2:= new int[] [1, 3, 5];
  var res2 := FilterOddNumbers(a2);
  assert res2 == [1, 3, 5];

  var a3 := new int[] [2, 4, 6, 8];
  var res3:=FilterOddNumbers(a3);
  assert res3 == [];
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: oddList == FilterOdd(arr[..])
  //   ENSURES: oddList == FilterOdd(arr[..])
  {
    var arr := new int[0] [];
    var oddList := FilterOddNumbers(arr);
    expect oddList == [];
  }

  // Test case for combination {1}/Barr=1:
  //   POST: oddList == FilterOdd(arr[..])
  //   ENSURES: oddList == FilterOdd(arr[..])
  {
    var arr := new int[1] [2];
    var oddList := FilterOddNumbers(arr);
    expect oddList == [];
  }

  // Test case for combination {1}/Barr=2:
  //   POST: oddList == FilterOdd(arr[..])
  //   ENSURES: oddList == FilterOdd(arr[..])
  {
    var arr := new int[2] [4, 3];
    var oddList := FilterOddNumbers(arr);
    expect oddList == [3];
  }

  // Test case for combination {1}/Barr=3:
  //   POST: oddList == FilterOdd(arr[..])
  //   ENSURES: oddList == FilterOdd(arr[..])
  {
    var arr := new int[3] [5, 4, 6];
    var oddList := FilterOddNumbers(arr);
    expect oddList == [5];
  }

  // Test case for combination {1}/O|oddList|>=3:
  //   POST: oddList == FilterOdd(arr[..])
  //   ENSURES: oddList == FilterOdd(arr[..])
  {
    var arr := new int[4] [5, 6, 7, 8];
    var oddList := FilterOddNumbers(arr);
    expect oddList == [5, 7];
  }

  // Test case for combination {1}/O|oddList|>=2:
  //   POST: oddList == FilterOdd(arr[..])
  //   ENSURES: oddList == FilterOdd(arr[..])
  {
    var arr := new int[5] [6, 7, 8, 9, 10];
    var oddList := FilterOddNumbers(arr);
    expect oddList == [7, 9];
  }

  // Test case for combination {1}/O|oddList|=1:
  //   POST: oddList == FilterOdd(arr[..])
  //   ENSURES: oddList == FilterOdd(arr[..])
  {
    var arr := new int[6] [8, 9, 10, 11, 12, 13];
    var oddList := FilterOddNumbers(arr);
    expect oddList == [9, 11, 13];
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
