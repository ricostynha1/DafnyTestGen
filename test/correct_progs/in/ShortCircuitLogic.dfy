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

