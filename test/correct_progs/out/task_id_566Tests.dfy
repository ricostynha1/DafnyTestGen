// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_566.dfy
// Method: CalcSumOfDigits
// Generated: 2026-04-20 09:12:39

// Recursive definition of the sum of the decimal digits of a natural number n.
function SumOfDigits(n: nat) : (sum: nat) { 
    if n > 9 then SumOfDigits(n / 10) + n % 10 else n
}

// Computes the sum of the decimal digits of a natural number n.
method CalcSumOfDigits(n: nat) returns (sum: nat)
    ensures sum == SumOfDigits(n)
    requires n >= 0
{
    sum := 0; // partial sum
    var num : nat := n; // remaining number
    while num > 0           
        invariant SumOfDigits(n) == sum + SumOfDigits(num)  
    {
        sum := sum + num % 10;
        num := num / 10;
    }
}

// Test cases checked statically by Dafny.
method SumOfDigitsTest() {
    var s1 := CalcSumOfDigits(0);
    assert s1 == 0;
    var s2 := CalcSumOfDigits(9);
    assert s2 == 9;
    var s3 := CalcSumOfDigits(10);
    assert s3 == 1;
    var s4 := CalcSumOfDigits(99);
    assert s4 == 18;
    var s5 := CalcSumOfDigits(111111111);
    assert s5 == 9;
}

method TestsForCalcSumOfDigits()
{
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST: sum == SumOfDigits(n)
  //   POST: sum == SumOfDigits(n / 10) + n % 10
  //   ENSURES: sum == SumOfDigits(n)
  {
    var n := 10;
    var sum := CalcSumOfDigits(n);
    expect sum == 1;
  }

  // Test case for combination {2}:
  //   PRE:  n >= 0
  //   POST: !(n > 9)
  //   POST: sum == n
  //   ENSURES: sum == SumOfDigits(n)
  {
    var n := 2;
    var sum := CalcSumOfDigits(n);
    expect sum == 2;
  }

  // Test case for combination {1}/Bn=11:
  //   PRE:  n >= 0
  //   POST: sum == SumOfDigits(n)
  //   POST: sum == SumOfDigits(n / 10) + n % 10
  //   ENSURES: sum == SumOfDigits(n)
  {
    var n := 11;
    var sum := CalcSumOfDigits(n);
    expect sum == 2;
  }

  // Test case for combination {2}/On=0:
  //   PRE:  n >= 0
  //   POST: !(n > 9)
  //   POST: sum == n
  //   ENSURES: sum == SumOfDigits(n)
  {
    var n := 0;
    var sum := CalcSumOfDigits(n);
    expect sum == 0;
  }

}

method Main()
{
  TestsForCalcSumOfDigits();
  print "TestsForCalcSumOfDigits: all non-failing tests passed!\n";
}
