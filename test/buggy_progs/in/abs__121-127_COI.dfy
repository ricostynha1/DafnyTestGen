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
