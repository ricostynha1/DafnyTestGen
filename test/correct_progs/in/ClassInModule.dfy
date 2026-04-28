// Smoke test: class methods inside a named module.

module M {
  class Counter {
    var count: int

    constructor()
      ensures count == 0
    {
      count := 0;
    }

    method Increment()
      modifies this
      requires count >= 0
      ensures count == old(count) + 1
    {
      count := count + 1;
    }

    method Reset()
      modifies this
      ensures count == 0
    {
      count := 0;
    }
  }
}
