// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Software-Verification_tmp_tmpv4ueky2d_Best Time to Buy and Sell Stock_best_time_to_buy_and_sell_stock__835_AOR_Sub.dfy
// Method: best_time_to_buy_and_sell_stock
// Generated: 2026-04-24 17:08:29

// Software-Verification_tmp_tmpv4ueky2d_Best Time to Buy and Sell Stock_best_time_to_buy_and_sell_stock.dfy

method best_time_to_buy_and_sell_stock(prices: array<int>) returns (max_profit: int)
  requires 1 <= prices.Length <= 100000
  requires forall i: int {:trigger prices[i]} :: (0 <= i < prices.Length ==> 0 <= prices[i]) && (0 <= i < prices.Length ==> prices[i] <= 10000)
  ensures forall i: int, j: int {:trigger prices[i], prices[j]} :: 0 <= i < j < prices.Length ==> max_profit >= prices[j] - prices[i]
  decreases prices
{
  var min_price := 10001;
  max_profit := 0;
  var i := 0;
  while i < prices.Length
    invariant 0 <= i <= prices.Length
    invariant forall j: int {:trigger prices[j]} :: 0 <= j < i ==> min_price <= prices[j]
    invariant forall j: int, k: int {:trigger prices[j], prices[k]} :: 0 <= j < k < i ==> max_profit >= prices[k] - prices[j]
    decreases prices.Length - i
  {
    var price := prices[i];
    if price < min_price {
      min_price := price;
    }
    if price - min_price > max_profit {
      max_profit := price - min_price;
    }
    i := i - 1;
  }
}


method TestsForbest_time_to_buy_and_sell_stock()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  1 <= prices.Length <= 100000
  //   PRE:  forall i: int {:trigger prices[i]} :: (0 <= i < prices.Length ==> 0 <= prices[i]) && (0 <= i < prices.Length ==> prices[i] <= 10000)
  //   POST Q1: forall i: int, j: int {:trigger prices[i], prices[j]} :: 0 <= i < j < prices.Length ==> max_profit >= prices[j] - prices[i]
  {
    var prices := new int[1] [10];
    var max_profit := best_time_to_buy_and_sell_stock(prices);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.best__time__to__buy__and__sell__stock(BigInteger[] prices) in C:\cygwin64\tmp\DafnyCBT_turtl13q5wa\runner.cs:line 5900
    // runtime error: at _module.__default.TestCase__0() in C:\cygwin64\tmp\DafnyCBT_turtl13q5wa\runner.cs:line 5935
    // expect forall i: int, j: int :: 0 <= i < j < prices.Length ==> max_profit >= prices[j] - prices[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|prices|>=2:
  //   PRE:  1 <= prices.Length <= 100000
  //   PRE:  forall i: int {:trigger prices[i]} :: (0 <= i < prices.Length ==> 0 <= prices[i]) && (0 <= i < prices.Length ==> prices[i] <= 10000)
  //   POST Q1: forall i: int, j: int {:trigger prices[i], prices[j]} :: 0 <= i < j < prices.Length ==> max_profit >= prices[j] - prices[i]
  {
    var prices := new int[2] [7, 10];
    var max_profit := best_time_to_buy_and_sell_stock(prices);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.best__time__to__buy__and__sell__stock(BigInteger[] prices) in C:\cygwin64\tmp\DafnyCBT_turtl13q5wa\runner.cs:line 5900
    // runtime error: at _module.__default.TestCase__1() in C:\cygwin64\tmp\DafnyCBT_turtl13q5wa\runner.cs:line 5973
    // expect forall i: int, j: int :: 0 <= i < j < prices.Length ==> max_profit >= prices[j] - prices[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Omax_profit=0:
  //   PRE:  1 <= prices.Length <= 100000
  //   PRE:  forall i: int {:trigger prices[i]} :: (0 <= i < prices.Length ==> 0 <= prices[i]) && (0 <= i < prices.Length ==> prices[i] <= 10000)
  //   POST Q1: forall i: int, j: int {:trigger prices[i], prices[j]} :: 0 <= i < j < prices.Length ==> max_profit >= prices[j] - prices[i]
  {
    var prices := new int[1] [6];
    var max_profit := best_time_to_buy_and_sell_stock(prices);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.best__time__to__buy__and__sell__stock(BigInteger[] prices) in C:\cygwin64\tmp\DafnyCBT_turtl13q5wa\runner.cs:line 5900
    // runtime error: at _module.__default.TestCase__2() in C:\cygwin64\tmp\DafnyCBT_turtl13q5wa\runner.cs:line 6010
    // expect forall i: int, j: int :: 0 <= i < j < prices.Length ==> max_profit >= prices[j] - prices[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  1 <= prices.Length <= 100000
  //   PRE:  forall i: int {:trigger prices[i]} :: (0 <= i < prices.Length ==> 0 <= prices[i]) && (0 <= i < prices.Length ==> prices[i] <= 10000)
  //   POST Q1: forall i: int, j: int {:trigger prices[i], prices[j]} :: 0 <= i < j < prices.Length ==> max_profit >= prices[j] - prices[i]
  {
    var prices := new int[1] [9];
    var max_profit := best_time_to_buy_and_sell_stock(prices);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.best__time__to__buy__and__sell__stock(BigInteger[] prices) in C:\cygwin64\tmp\DafnyCBT_turtl13q5wa\runner.cs:line 5900
    // runtime error: at _module.__default.TestCase__3() in C:\cygwin64\tmp\DafnyCBT_turtl13q5wa\runner.cs:line 6047
    // expect forall i: int, j: int :: 0 <= i < j < prices.Length ==> max_profit >= prices[j] - prices[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  1 <= prices.Length <= 100000
  //   PRE:  forall i: int {:trigger prices[i]} :: (0 <= i < prices.Length ==> 0 <= prices[i]) && (0 <= i < prices.Length ==> prices[i] <= 10000)
  //   POST Q1: forall i: int, j: int {:trigger prices[i], prices[j]} :: 0 <= i < j < prices.Length ==> max_profit >= prices[j] - prices[i]
  {
    var prices := new int[1] [2];
    var max_profit := best_time_to_buy_and_sell_stock(prices);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.best__time__to__buy__and__sell__stock(BigInteger[] prices) in C:\cygwin64\tmp\DafnyCBT_turtl13q5wa\runner.cs:line 5900
    // runtime error: at _module.__default.TestCase__4() in C:\cygwin64\tmp\DafnyCBT_turtl13q5wa\runner.cs:line 6084
    // expect forall i: int, j: int :: 0 <= i < j < prices.Length ==> max_profit >= prices[j] - prices[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  1 <= prices.Length <= 100000
  //   PRE:  forall i: int {:trigger prices[i]} :: (0 <= i < prices.Length ==> 0 <= prices[i]) && (0 <= i < prices.Length ==> prices[i] <= 10000)
  //   POST Q1: forall i: int, j: int {:trigger prices[i], prices[j]} :: 0 <= i < j < prices.Length ==> max_profit >= prices[j] - prices[i]
  {
    var prices := new int[1] [3];
    var max_profit := best_time_to_buy_and_sell_stock(prices);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.best__time__to__buy__and__sell__stock(BigInteger[] prices) in C:\cygwin64\tmp\DafnyCBT_turtl13q5wa\runner.cs:line 5900
    // runtime error: at _module.__default.TestCase__5() in C:\cygwin64\tmp\DafnyCBT_turtl13q5wa\runner.cs:line 6121
    // expect forall i: int, j: int :: 0 <= i < j < prices.Length ==> max_profit >= prices[j] - prices[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  1 <= prices.Length <= 100000
  //   PRE:  forall i: int {:trigger prices[i]} :: (0 <= i < prices.Length ==> 0 <= prices[i]) && (0 <= i < prices.Length ==> prices[i] <= 10000)
  //   POST Q1: forall i: int, j: int {:trigger prices[i], prices[j]} :: 0 <= i < j < prices.Length ==> max_profit >= prices[j] - prices[i]
  {
    var prices := new int[1] [8];
    var max_profit := best_time_to_buy_and_sell_stock(prices);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.best__time__to__buy__and__sell__stock(BigInteger[] prices) in C:\cygwin64\tmp\DafnyCBT_turtl13q5wa\runner.cs:line 5900
    // runtime error: at _module.__default.TestCase__6() in C:\cygwin64\tmp\DafnyCBT_turtl13q5wa\runner.cs:line 6158
    // expect forall i: int, j: int :: 0 <= i < j < prices.Length ==> max_profit >= prices[j] - prices[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  1 <= prices.Length <= 100000
  //   PRE:  forall i: int {:trigger prices[i]} :: (0 <= i < prices.Length ==> 0 <= prices[i]) && (0 <= i < prices.Length ==> prices[i] <= 10000)
  //   POST Q1: forall i: int, j: int {:trigger prices[i], prices[j]} :: 0 <= i < j < prices.Length ==> max_profit >= prices[j] - prices[i]
  {
    var prices := new int[1] [5];
    var max_profit := best_time_to_buy_and_sell_stock(prices);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.best__time__to__buy__and__sell__stock(BigInteger[] prices) in C:\cygwin64\tmp\DafnyCBT_turtl13q5wa\runner.cs:line 5900
    // runtime error: at _module.__default.TestCase__7() in C:\cygwin64\tmp\DafnyCBT_turtl13q5wa\runner.cs:line 6195
    // expect forall i: int, j: int :: 0 <= i < j < prices.Length ==> max_profit >= prices[j] - prices[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  1 <= prices.Length <= 100000
  //   PRE:  forall i: int {:trigger prices[i]} :: (0 <= i < prices.Length ==> 0 <= prices[i]) && (0 <= i < prices.Length ==> prices[i] <= 10000)
  //   POST Q1: forall i: int, j: int {:trigger prices[i], prices[j]} :: 0 <= i < j < prices.Length ==> max_profit >= prices[j] - prices[i]
  {
    var prices := new int[1] [7];
    var max_profit := best_time_to_buy_and_sell_stock(prices);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.best__time__to__buy__and__sell__stock(BigInteger[] prices) in C:\cygwin64\tmp\DafnyCBT_turtl13q5wa\runner.cs:line 5900
    // runtime error: at _module.__default.TestCase__8() in C:\cygwin64\tmp\DafnyCBT_turtl13q5wa\runner.cs:line 6232
    // expect forall i: int, j: int :: 0 <= i < j < prices.Length ==> max_profit >= prices[j] - prices[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   PRE:  1 <= prices.Length <= 100000
  //   PRE:  forall i: int {:trigger prices[i]} :: (0 <= i < prices.Length ==> 0 <= prices[i]) && (0 <= i < prices.Length ==> prices[i] <= 10000)
  //   POST Q1: forall i: int, j: int {:trigger prices[i], prices[j]} :: 0 <= i < j < prices.Length ==> max_profit >= prices[j] - prices[i]
  {
    var prices := new int[1] [4];
    var max_profit := best_time_to_buy_and_sell_stock(prices);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.best__time__to__buy__and__sell__stock(BigInteger[] prices) in C:\cygwin64\tmp\DafnyCBT_turtl13q5wa\runner.cs:line 5900
    // runtime error: at _module.__default.TestCase__9() in C:\cygwin64\tmp\DafnyCBT_turtl13q5wa\runner.cs:line 6269
    // expect forall i: int, j: int :: 0 <= i < j < prices.Length ==> max_profit >= prices[j] - prices[i];
  }

}

method Main()
{
  TestsForbest_time_to_buy_and_sell_stock();
  print "TestsForbest_time_to_buy_and_sell_stock: all non-failing tests passed!\n";
}
