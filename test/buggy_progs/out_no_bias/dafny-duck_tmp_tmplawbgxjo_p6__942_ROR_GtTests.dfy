// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-duck_tmp_tmplawbgxjo_p6__942_ROR_Gt.dfy
// Method: FilterVowelsArray
// Generated: 2026-04-24 11:45:35

// dafny-duck_tmp_tmplawbgxjo_p6.dfy

const vowels: set<char> := {'a', 'e', 'i', 'o', 'u'}

function FilterVowels(xs: seq<char>): seq<char>
  decreases xs
{
  if |xs| == 0 then
    []
  else if xs[|xs| - 1] in vowels then
    FilterVowels(xs[..|xs| - 1]) + [xs[|xs| - 1]]
  else
    FilterVowels(xs[..|xs| - 1])
}

method FilterVowelsArray(xs: array<char>) returns (ys: array<char>)
  ensures fresh(ys)
  ensures FilterVowels(xs[..]) == ys[..]
  decreases xs
{
  var n := 0;
  var i := 0;
  while i < xs.Length
    invariant 0 <= i <= xs.Length
    invariant n == |FilterVowels(xs[..i])|
    invariant forall j: int {:trigger xs[..j]} :: 0 <= j <= i ==> n >= |FilterVowels(xs[..j])|
    decreases xs.Length - i
  {
    assert xs[..i + 1] == xs[..i] + [xs[i]];
    if xs[i] in vowels {
      n := n + 1;
    }
    i := i + 1;
  }
  ys := new char[n];
  i := 0;
  var j := 0;
  while i > xs.Length
    invariant 0 <= i <= xs.Length
    invariant 0 <= j <= ys.Length
    invariant ys[..j] == FilterVowels(xs[..i])
    decreases i - xs.Length
  {
    assert xs[..i + 1] == xs[..i] + [xs[i]];
    if xs[i] in vowels {
      assert ys.Length >= |FilterVowels(xs[..i + 1])|;
      ys[j] := xs[i];
      j := j + 1;
    }
    i := i + 1;
  }
  assert xs[..] == xs[..i];
  assert ys[..] == ys[..j];
}


method TestsForFilterVowelsArray()
{
  // Test case for combination {1}/Rel:
  //   POST Q2: FilterVowels(xs[..]) == ys[..]
  {
    var xs := new char[0] [];
    var ys := FilterVowelsArray(xs);
    expect FilterVowels(xs[..]) == ys[..];
  }

  // Test case for combination {2}:
  //   POST Q2: FilterVowels(xs[..]) == ys[..]
  {
    var xs := new char[1] [' '];
    var ys := FilterVowelsArray(xs);
    expect FilterVowels(xs[..]) == ys[..];
  }

  // Test case for combination {2}/O|xs|>=2:
  //   POST Q2: FilterVowels(xs[..]) == ys[..]
  {
    var xs := new char[2] [' ', '4'];
    var ys := FilterVowelsArray(xs);
    expect FilterVowels(xs[..]) == ys[..];
  }

  // Test case for combination {2}/R3:
  //   POST Q2: FilterVowels(xs[..]) == ys[..]
  {
    var xs := new char[1] ['!'];
    var ys := FilterVowelsArray(xs);
    expect FilterVowels(xs[..]) == ys[..];
  }

  // Test case for combination {2}/R4:
  //   POST Q2: FilterVowels(xs[..]) == ys[..]
  {
    var xs := new char[1] ['"'];
    var ys := FilterVowelsArray(xs);
    expect FilterVowels(xs[..]) == ys[..];
  }

  // Test case for combination {2}/R5:
  //   POST Q2: FilterVowels(xs[..]) == ys[..]
  {
    var xs := new char[1] ['#'];
    var ys := FilterVowelsArray(xs);
    expect FilterVowels(xs[..]) == ys[..];
  }

  // Test case for combination {2}/R6:
  //   POST Q2: FilterVowels(xs[..]) == ys[..]
  {
    var xs := new char[1] ['$'];
    var ys := FilterVowelsArray(xs);
    expect FilterVowels(xs[..]) == ys[..];
  }

  // Test case for combination {2}/R7:
  //   POST Q2: FilterVowels(xs[..]) == ys[..]
  {
    var xs := new char[1] ['%'];
    var ys := FilterVowelsArray(xs);
    expect FilterVowels(xs[..]) == ys[..];
  }

  // Test case for combination {2}/R8:
  //   POST Q2: FilterVowels(xs[..]) == ys[..]
  {
    var xs := new char[1] ['&'];
    var ys := FilterVowelsArray(xs);
    expect FilterVowels(xs[..]) == ys[..];
  }

  // Test case for combination {2}/R9:
  //   POST Q2: FilterVowels(xs[..]) == ys[..]
  {
    var xs := new char[1] ['\U{0027}'];
    var ys := FilterVowelsArray(xs);
    expect FilterVowels(xs[..]) == ys[..];
  }

}

method Main()
{
  TestsForFilterVowelsArray();
  print "TestsForFilterVowelsArray: all tests passed!\n";
}
