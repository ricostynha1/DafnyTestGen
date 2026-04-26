// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\CO3408-Advanced-Software-Modelling-Assignment-2022-23-Part-2-A-Specification-Spectacular_tmp_tmp4pj4p2zx_car_park__5857_ROR_Eq.dfy
// Method: leaveCarPark
// Generated: 2026-04-24 21:41:36

// CO3408-Advanced-Software-Modelling-Assignment-2022-23-Part-2-A-Specification-Spectacular_tmp_tmp4pj4p2zx_car_park.dfy

method OriginalMain()
{
  var carPark := new CarPark();
  var availableSpaces := carPark.checkAvailability();
  assert availableSpaces == 2;
  var success := carPark.enterCarPark("car1");
  availableSpaces := carPark.checkAvailability();
  assert success && carPark.carPark == {"car1"} && availableSpaces == 1;
  success := carPark.enterCarPark("car2");
  availableSpaces := carPark.checkAvailability();
  assert success && "car2" in carPark.carPark && carPark.carPark == {"car1", "car2"} && availableSpaces == 0;
  success := carPark.enterCarPark("car3");
  assert !success && carPark.carPark == {"car1", "car2"} && carPark.reservedCarPark == {};
  success := carPark.makeSubscription("car4");
  assert success && carPark.subscriptions == {"car4"};
  success := carPark.enterReservedCarPark("car4");
  assert success && carPark.reservedCarPark == {"car4"};
  success := carPark.enterReservedCarPark("car5");
  assert !success && carPark.reservedCarPark == {"car4"};
  success := carPark.makeSubscription("car6");
  assert success && carPark.subscriptions == {"car4", "car6"};
  success := carPark.makeSubscription("car7");
  assert success && carPark.subscriptions == {"car4", "car6", "car7"};
  success := carPark.makeSubscription("car8");
  assert !success && carPark.subscriptions == {"car4", "car6", "car7"};
  success := carPark.enterReservedCarPark("car6");
  assert success && carPark.reservedCarPark == {"car4", "car6"};
  success := carPark.enterReservedCarPark("car7");
  assert success && carPark.reservedCarPark == {"car4", "car6", "car7"};
  assert carPark.carPark == {"car1", "car2"};
  success := carPark.leaveCarPark("car1");
  assert success && carPark.carPark == {"car2"} && carPark.reservedCarPark == {"car4", "car6", "car7"};
  assert "car9" !in carPark.carPark && "car9" !in carPark.reservedCarPark;
  success := carPark.leaveCarPark("car9");
  assert !success && carPark.carPark == {"car2"} && carPark.reservedCarPark == {"car4", "car6", "car7"};
  success := carPark.leaveCarPark("car6");
  assert success && carPark.carPark == {"car2"} && carPark.reservedCarPark == {"car4", "car7"};
  carPark.closeCarPark();
  assert carPark.carPark == {} && carPark.reservedCarPark == {} && carPark.subscriptions == {};
}

method MainB()
{
  var carPark := new CarPark();
  assert carPark.weekend == false;
  carPark.openReservedArea();
  assert carPark.weekend == true;
  var success := carPark.enterReservedCarPark("car3");
  assert "car3" !in carPark.subscriptions && success && carPark.carPark == {} && carPark.reservedCarPark == {"car3"};
  carPark.closeCarPark();
  assert carPark.carPark == {} && carPark.reservedCarPark == {} && carPark.subscriptions == {};
}

class {:autocontracts} CarPark {
  const totalSpaces: nat := 10
  const normalSpaces: nat := 7
  const reservedSpaces: nat := 3
  const badParkingBuffer: int := 5
  var weekend: bool
  var subscriptions: set<string>
  var carPark: set<string>
  var reservedCarPark: set<string>

  constructor ()
    requires true
    ensures Valid()
    ensures fresh(Repr)
    ensures this.subscriptions == {} && this.carPark == {} && this.reservedCarPark == {} && this.weekend == false
  {
    this.subscriptions := {};
    this.carPark := {};
    this.reservedCarPark := {};
    this.weekend := false;
    new;
    Repr := {this};
  }

  predicate Valid()
    reads this, this, Repr
    ensures Valid() ==> this in Repr
    decreases Repr + {this, this}
  {
    this in Repr &&
    null !in Repr &&
    carPark * reservedCarPark == {} &&
    |carPark| <= totalSpaces + badParkingBuffer &&
    normalSpaces + reservedSpaces == totalSpaces &&
    |reservedCarPark| <= reservedSpaces
  }

  method leaveCarPark(car: string) returns (success: bool)
    requires Valid()
    requires true
    modifies this
    ensures Valid()
    ensures fresh(Repr - old(Repr))
    ensures success ==> (car in old(carPark) && carPark == old(carPark) - {car} && reservedCarPark == old(reservedCarPark)) || (car in old(reservedCarPark) && reservedCarPark == old(reservedCarPark) - {car} && carPark == old(carPark))
    ensures success ==> car !in carPark && car !in reservedCarPark
    ensures !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && car !in old(carPark) && car !in old(reservedCarPark)
    ensures subscriptions == old(subscriptions) && weekend == old(weekend)
    decreases car
  {
    success := false;
    if car in carPark {
      carPark := carPark - {car};
      success := true;
    } else if car in reservedCarPark {
      reservedCarPark := reservedCarPark - {car};
      success := true;
    }
  }

  method checkAvailability() returns (availableSpaces: int)
    requires Valid()
    requires true
    modifies this
    ensures Valid()
    ensures fresh(Repr - old(Repr))
    ensures weekend ==> availableSpaces == normalSpaces - old(|carPark|) + reservedSpaces - old(|reservedCarPark|) - badParkingBuffer
    ensures !weekend ==> availableSpaces == normalSpaces - old(|carPark|) - badParkingBuffer
    ensures carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && weekend == old(weekend) && subscriptions == old(subscriptions)
  {
    if weekend {
      availableSpaces := normalSpaces - |carPark| + reservedSpaces - |reservedCarPark| - badParkingBuffer;
    } else {
      availableSpaces := normalSpaces - |carPark| - badParkingBuffer;
    }
  }

  method makeSubscription(car: string) returns (success: bool)
    requires Valid()
    requires true
    modifies this
    ensures Valid()
    ensures fresh(Repr - old(Repr))
    ensures success ==> old(|subscriptions|) < reservedSpaces && car !in old(subscriptions) && subscriptions == old(subscriptions) + {car}
    ensures !success ==> subscriptions == old(subscriptions) && (car in old(subscriptions) || old(|subscriptions|) >= reservedSpaces)
    ensures carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && weekend == old(weekend)
    decreases car
  {
    if |subscriptions| >= reservedSpaces || car in subscriptions {
      success := false;
    } else {
      subscriptions := subscriptions + {car};
      success := true;
    }
  }

  method openReservedArea()
    requires Valid()
    requires true
    modifies this
    ensures Valid()
    ensures fresh(Repr - old(Repr))
    ensures carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && weekend == true && subscriptions == old(subscriptions)
  {
    weekend := true;
  }

  method closeCarPark()
    requires Valid()
    requires true
    modifies this
    ensures Valid()
    ensures fresh(Repr - old(Repr))
    ensures carPark == {} && reservedCarPark == {} && subscriptions == {}
    ensures weekend == old(weekend)
  {
    carPark := {};
    reservedCarPark := {};
    subscriptions := {};
  }

  method enterCarPark(car: string) returns (success: bool)
    requires Valid()
    requires true
    modifies this
    ensures Valid()
    ensures fresh(Repr - old(Repr))
    ensures success ==> car !in old(carPark) && car !in old(reservedCarPark) && old(|carPark|) < normalSpaces - badParkingBuffer
    ensures success ==> carPark == old(carPark) + {car}
    ensures !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark)
    ensures !success ==> car in old(carPark) || car in old(reservedCarPark) || old(|carPark|) >= normalSpaces - badParkingBuffer
    ensures subscriptions == old(subscriptions) && reservedCarPark == old(reservedCarPark) && weekend == old(weekend)
    decreases car
  {
    if |carPark| == normalSpaces - badParkingBuffer || car in carPark || car in reservedCarPark {
      return false;
    } else {
      carPark := carPark + {car};
      return true;
    }
  }

  method enterReservedCarPark(car: string) returns (success: bool)
    requires Valid()
    requires true
    modifies this
    ensures Valid()
    ensures fresh(Repr - old(Repr))
    ensures success ==> car !in old(carPark) && car !in old(reservedCarPark) && old(|reservedCarPark|) < reservedSpaces && (car in subscriptions || weekend == true)
    ensures success ==> reservedCarPark == old(reservedCarPark) + {car}
    ensures !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark)
    ensures !success ==> car in old(carPark) || car in old(reservedCarPark) || old(|reservedCarPark|) >= reservedSpaces || (car !in subscriptions && weekend == false)
    ensures subscriptions == old(subscriptions) && carPark == old(carPark) && weekend == old(weekend)
    ensures weekend == old(weekend) && subscriptions == old(subscriptions)
    decreases car
  {
    if |reservedCarPark| >= reservedSpaces || car in carPark || car in reservedCarPark || (car !in subscriptions && weekend == false) {
      return false;
    } else {
      reservedCarPark := reservedCarPark + {car};
      return true;
    }
  }

  var Repr: set<object?>
}


method TestsForleaveCarPark()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST Q1: Valid()
  //   POST Q3: success
  //   POST Q4: car in old(carPark)
  //   POST Q5: carPark == old(carPark) - {car}
  //   POST Q6: reservedCarPark != old(reservedCarPark)
  //   POST Q7: car in old(reservedCarPark)
  //   POST Q8: weekend == old(weekend)
  //   POST Q9: reservedCarPark == old(reservedCarPark)
  //   POST Q10: car !in old(carPark)
  //   POST Q11: car !in old(reservedCarPark)
  //   POST Q12: subscriptions == old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"", "a", "b", "d", "e", "f", "g"};
    obj.carPark := {"", "a", "b", "d", "e", "f", "g"};
    obj.reservedCarPark := {"", "a", "b", "d", "e", "f", "g"};
    obj.Repr := {obj};
    var car: seq<char> := [];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_subscriptions := obj.subscriptions;
    var success := obj.leaveCarPark(car);
    // expect obj.Valid(); // got false
    // expect success == false || success == true; // got true
    // expect obj.weekend == false; // LHS=false, RHS=false
    // expect obj.carPark == old_carPark - {car}; // LHS={['a'], ['b'], ['d'], ['e'], ['f'], ['g']}, RHS={['a'], ['b'], ['d'], ['e'], ['f'], ['g']}
    // expect !(obj.reservedCarPark == old_reservedCarPark); // got false
    // expect obj.reservedCarPark == old_reservedCarPark; // LHS={[], ['a'], ['b'], ['d'], ['e'], ['f'], ['g']}, RHS={[], ['a'], ['b'], ['d'], ['e'], ['f'], ['g']}
    // expect obj.subscriptions == old_subscriptions; // LHS={[], ['a'], ['b'], ['d'], ['e'], ['f'], ['g']}, RHS={[], ['a'], ['b'], ['d'], ['e'], ['f'], ['g']}
  }

}

method TestsForcheckAvailability()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: weekend ==> availableSpaces == normalSpaces - old(|carPark|) + reservedSpaces - old(|reservedCarPark|) - badParkingBuffer
  //   POST Q6: !weekend ==> availableSpaces == normalSpaces - old(|carPark|) - badParkingBuffer
  //   POST Q7: carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && weekend == old(weekend) && subscriptions == old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.carPark := {"", "b", "c", "d", "e", "f", "g"};
    obj.reservedCarPark := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.Repr := {obj};
    var old_carPark := |obj.carPark|;
    var old_reservedCarPark := |obj.reservedCarPark|;
    var old_carPark2 := obj.carPark;
    var old_reservedCarPark2 := obj.reservedCarPark;
    var old_weekend := obj.weekend;
    var old_subscriptions := obj.subscriptions;
    var availableSpaces := obj.checkAvailability();
    // actual runtime state: availableSpaces=-5
    // expect obj.Valid(); // got false
    // expect obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark + obj.reservedSpaces - old_reservedCarPark - obj.badParkingBuffer; // got true
    // expect !obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark - obj.badParkingBuffer; // got true
    // expect obj.carPark == old_carPark2 && obj.reservedCarPark == old_reservedCarPark2 && obj.weekend == old_weekend && obj.subscriptions == old_subscriptions; // got true
  }

}

method TestsFormakeSubscription()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST Q1: Valid()
  //   POST Q3: success
  //   POST Q4: old(|subscriptions|) < reservedSpaces
  //   POST Q5: car !in old(subscriptions)
  //   POST Q6: subscriptions == old(subscriptions) + {car}
  //   POST Q7: carPark == old(carPark)
  //   POST Q8: reservedCarPark == old(reservedCarPark)
  //   POST Q9: weekend == old(weekend)
  //   POST Q10: car in old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"", "a", "b", "d", "e", "f", "g"};
    obj.carPark := {"", "a", "b", "d", "e", "f", "g"};
    obj.reservedCarPark := {"", "a", "b", "d", "e", "f", "g"};
    obj.Repr := {obj};
    var car: seq<char> := [];
    var old_subscriptions := |obj.subscriptions|;
    var old_subscriptions2 := obj.subscriptions;
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var success := obj.makeSubscription(car);
    // actual runtime state: success=false
    // expect obj.Valid(); // got false
    // expect success == false || success == true; // got true
    // expect obj.weekend == false; // LHS=false, RHS=false
    // expect obj.subscriptions == old_subscriptions2 + {car}; // LHS={[], ['a'], ['b'], ['d'], ['e'], ['f'], ['g']}, RHS={[], ['a'], ['b'], ['d'], ['e'], ['f'], ['g']}
    // expect obj.carPark == old_carPark; // LHS={[], ['a'], ['b'], ['d'], ['e'], ['f'], ['g']}, RHS={[], ['a'], ['b'], ['d'], ['e'], ['f'], ['g']}
    // expect obj.reservedCarPark == old_reservedCarPark; // LHS={[], ['a'], ['b'], ['d'], ['e'], ['f'], ['g']}, RHS={[], ['a'], ['b'], ['d'], ['e'], ['f'], ['g']}
  }

}

method TestsForopenReservedArea()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST Q1: Valid()
  //   POST Q3: carPark == old(carPark)
  //   POST Q4: reservedCarPark == old(reservedCarPark)
  //   POST Q5: weekend == true
  //   POST Q6: subscriptions == old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.carPark := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.reservedCarPark := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.Repr := {obj};
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_subscriptions := obj.subscriptions;
    obj.openReservedArea();
    // expect obj.Valid(); // got false
    // expect obj.weekend == true; // LHS=true, RHS=true
    // expect obj.carPark == old_carPark; // LHS={[], ['a'], ['b'], ['c'], ['d'], ['e'], ['f'], ['g']}, RHS={[], ['a'], ['b'], ['c'], ['d'], ['e'], ['f'], ['g']}
    // expect obj.reservedCarPark == old_reservedCarPark; // LHS={[], ['a'], ['b'], ['c'], ['d'], ['e'], ['f'], ['g']}, RHS={[], ['a'], ['b'], ['c'], ['d'], ['e'], ['f'], ['g']}
    // expect obj.subscriptions == old_subscriptions; // LHS={[], ['a'], ['b'], ['c'], ['d'], ['e'], ['f'], ['g']}, RHS={[], ['a'], ['b'], ['c'], ['d'], ['e'], ['f'], ['g']}
  }

}

method TestsForcloseCarPark()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST Q1: Valid()
  //   POST Q3: carPark == {}
  //   POST Q4: reservedCarPark == {}
  //   POST Q5: subscriptions == {}
  //   POST Q6: weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.carPark := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.reservedCarPark := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.Repr := {obj};
    obj.closeCarPark();
    expect obj.Valid();
    expect obj.weekend == false;
    expect obj.carPark == {};
    expect obj.reservedCarPark == {};
    expect obj.subscriptions == {};
  }

}

method TestsForenterCarPark()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST Q1: Valid()
  //   POST Q3: success
  //   POST Q4: car !in old(carPark)
  //   POST Q5: car !in old(reservedCarPark)
  //   POST Q6: old(|carPark|) < normalSpaces - badParkingBuffer
  //   POST Q7: carPark == old(carPark) + {car}
  //   POST Q8: weekend == old(weekend)
  //   POST Q9: subscriptions == old(subscriptions)
  //   POST Q10: car in old(carPark)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"", "a", "b", "d", "e", "f", "g"};
    obj.carPark := {"", "a", "b", "d", "e", "f", "g"};
    obj.reservedCarPark := {"", "a", "b", "d", "e", "f", "g"};
    obj.Repr := {obj};
    var car: seq<char> := [];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_carPark2 := |obj.carPark|;
    var old_subscriptions := obj.subscriptions;
    var success := obj.enterCarPark(car);
    // actual runtime state: success=false
    // expect obj.Valid(); // got false
    // expect success == false || success == true; // got true
    // expect obj.weekend == false; // LHS=false, RHS=false
    // expect obj.carPark == old_carPark + {car}; // LHS={[], ['a'], ['b'], ['d'], ['e'], ['f'], ['g']}, RHS={[], ['a'], ['b'], ['d'], ['e'], ['f'], ['g']}
    // expect obj.subscriptions == old_subscriptions; // LHS={[], ['a'], ['b'], ['d'], ['e'], ['f'], ['g']}, RHS={[], ['a'], ['b'], ['d'], ['e'], ['f'], ['g']}
  }

}

method TestsForenterReservedCarPark()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST Q1: Valid()
  //   POST Q3: success
  //   POST Q4: car !in old(carPark)
  //   POST Q5: car !in old(reservedCarPark)
  //   POST Q6: old(|reservedCarPark|) < reservedSpaces
  //   POST Q7: car !in subscriptions
  //   POST Q8: weekend == old(weekend)
  //   POST Q9: car !in subscriptions
  //   POST Q10: weekend == false
  //   POST Q11: car in old(carPark)
  //   POST Q12: subscriptions == old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"", "a", "b", "d", "e", "f", "g"};
    obj.carPark := {"", "a", "b", "d", "e", "f", "g"};
    obj.reservedCarPark := {"", "a", "b", "d", "e", "f", "g"};
    obj.Repr := {obj};
    var car: seq<char> := [];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_reservedCarPark2 := |obj.reservedCarPark|;
    var old_subscriptions := obj.subscriptions;
    var success := obj.enterReservedCarPark(car);
    // actual runtime state: success=false
    // expect obj.Valid(); // got false
    // expect success == false || success == true; // got true
    // expect obj.weekend == false; // LHS=false, RHS=false
    // expect !(car in obj.subscriptions); // got false
    // expect car !in obj.subscriptions; // got false
    // expect obj.subscriptions == old_subscriptions; // LHS={[], ['a'], ['b'], ['d'], ['e'], ['f'], ['g']}, RHS={[], ['a'], ['b'], ['d'], ['e'], ['f'], ['g']}
  }

}

method Main()
{
  TestsForleaveCarPark();
  print "TestsForleaveCarPark: all non-failing tests passed!\n";
  TestsForcheckAvailability();
  print "TestsForcheckAvailability: all non-failing tests passed!\n";
  TestsFormakeSubscription();
  print "TestsFormakeSubscription: all non-failing tests passed!\n";
  TestsForopenReservedArea();
  print "TestsForopenReservedArea: all non-failing tests passed!\n";
  TestsForcloseCarPark();
  print "TestsForcloseCarPark: all non-failing tests passed!\n";
  TestsForenterCarPark();
  print "TestsForenterCarPark: all non-failing tests passed!\n";
  TestsForenterReservedCarPark();
  print "TestsForenterReservedCarPark: all non-failing tests passed!\n";
}
