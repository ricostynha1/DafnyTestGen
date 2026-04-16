// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_629.dfy
// Method: FindEvenNumbers
// Generated: 2026-04-16 22:38:15

// Retrives the sequence of even numbers from an array of integers.
method FindEvenNumbers(arr: array<int>) returns (evenList: seq<int>)
    ensures evenList == Filter(arr[..], IsEven)
{
    evenList := [];
    for i := 0 to arr.Length
        invariant evenList == Filter(arr[..i], IsEven)
    {
        if IsEven(arr[i]) {
            evenList := evenList + [arr[i]];
        }
        assert arr[..i+1] == arr[..i] + [arr[i]]; // proof helper
    }    
    assert arr[..] == arr[..arr.Length]; // proof helper
}

// Selects from a sequence the elements that satisfy a predicate.
function {:fuel 5} Filter<T>(s: seq<T>, p: T -> bool) : seq<T> {
    if |s| == 0 then []
    else if p(Last(s)) then Filter(DropLast(s), p) + [Last(s)]
    else Filter(DropLast(s), p)
}

// Predicate that checks if a number is even.
predicate IsEven(n: int) {
    n % 2 == 0
}

// Helper functions for sequences
function Last<T>(s: seq<T>) : T
    requires |s| > 0
{ 
    s[|s|-1] 
}

function DropLast<T>(s: seq<T>) : seq<T>
    requires |s| > 0
{ 
    s[..|s|-1] 
}

// Test cases checked statically.
method FindEvenNumbersTest(){
    // general case
    var a1 := new int[] [1, 2, 4];
    var res1 := FindEvenNumbers(a1);
    assert res1 == [2, 4];

    // all even
    var a2 := new int[] [2, 4, 6];
    var res2 := FindEvenNumbers(a2);
    assert res2 == [2, 4, 6];

    // none even
    var a3 := new int[] [1, 3, 5, 7];
    var res3 := FindEvenNumbers(a3);
    assert res3 == [];

    // duplicates
    var a4 := new int[] [1, 2, 2, 3];
    var res4 := FindEvenNumbers(a4);
    assert res4 == [2, 2];

    // empty
    var a5 := new int[] [];
    var res5 := FindEvenNumbers(a5);
    assert res5 == [];
}

method Passing()
{
  // Test case for combination {1}:
  //   POST: evenList == Filter(arr[..], IsEven)
  //   ENSURES: evenList == Filter(arr[..], IsEven)
  {
    var arr := new int[0] [];
    var evenList := FindEvenNumbers(arr);
    expect evenList == [];
  }

  // Test case for combination {1}/Barr=1:
  //   POST: evenList == Filter(arr[..], IsEven)
  //   ENSURES: evenList == Filter(arr[..], IsEven)
  {
    var arr := new int[1] [2];
    var evenList := FindEvenNumbers(arr);
    expect evenList == [2];
  }

  // Test case for combination {1}/Barr=2:
  //   POST: evenList == Filter(arr[..], IsEven)
  //   ENSURES: evenList == Filter(arr[..], IsEven)
  {
    var arr := new int[2] [4, 3];
    var evenList := FindEvenNumbers(arr);
    expect evenList == [4];
  }

  // Test case for combination {1}/Barr=3:
  //   POST: evenList == Filter(arr[..], IsEven)
  //   ENSURES: evenList == Filter(arr[..], IsEven)
  {
    var arr := new int[3] [5, 4, 6];
    var evenList := FindEvenNumbers(arr);
    expect evenList == [4, 6];
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
