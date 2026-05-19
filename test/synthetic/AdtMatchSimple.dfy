// Minimal ADT match smoke test: single match, no recursion, no quantifiers.

datatype Shape = Circle(r: int) | Square(s: int) | Triangle(a: int, b: int, c: int)

function Area(sh: Shape): int
{
  match sh {
    case Circle(r) => 3 * r * r        // approx pi*r^2 with pi=3
    case Square(s) => s * s
    case Triangle(a, b, c) => a + b + c // dummy
  }
}

method ClassifyArea(sh: Shape) returns (kind: int)
  ensures kind == 1 ==> Area(sh) > 100
  ensures kind == 2 ==> Area(sh) <= 100
{
  if Area(sh) > 100 {
    kind := 1;
  } else {
    kind := 2;
  }
}
