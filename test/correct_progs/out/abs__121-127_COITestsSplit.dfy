// res.dfy

method abs(x: int) returns (y: int)
  ensures x > 0 ==> y == x
  ensures x <= 0 ==> y == -x
  decreases x
{
  if !(x > 0) {
    y := x;
  } else {
    y := -x;
  }
}

method Passing()
{
  var res := abs(0);
  // expect res == 0;
}

method Failing()  
{
  var res := abs(1);
  // expect res == 1;
  res := abs(5);
  // expect res == 5;
  res := abs(10);
  // expect res == 10;
  res := abs(121);
  // expect res == 121;
  res := abs(437);
  // expect res == 437;
  res := abs(19567);
  // expect res == 19567;
  res := abs(-1);
  // expect res == 1;
  res := abs(-7);
  // expect res == 7;
  res := abs(-302);
  // expect res == 302;
  res := abs(-567);
  // expect res == 567;
  res := abs(-1001);
  // expect res == 1001;
  res := abs(-435463279);
  // expect res == 435463279;
}

method Main()
{
  Passing();
  Failing();
}