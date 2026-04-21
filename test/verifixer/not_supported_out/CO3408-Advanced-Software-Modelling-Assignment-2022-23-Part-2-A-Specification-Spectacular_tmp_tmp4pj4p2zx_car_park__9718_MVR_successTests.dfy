// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\not_supported\CO3408-Advanced-Software-Modelling-Assignment-2022-23-Part-2-A-Specification-Spectacular_tmp_tmp4pj4p2zx_car_park__9718_MVR_success.dfy
// Method: leaveCarPark
// Generated: 2026-04-08 21:51:41

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
  success := success;
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
    if |carPark| >= normalSpaces - badParkingBuffer || car in carPark || car in reservedCarPark {
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



method Passing()
{
  // Test case for combination {4}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: car !in carPark
  //   POST: car !in reservedCarPark
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: car !in old(carPark)
  //   POST: car !in old(reservedCarPark)
  //   ENSURES: Valid()
  //   ENSURES: success ==> (car in old(carPark) && carPark == old(carPark) - {car} && reservedCarPark == old(reservedCarPark)) || (car in old(reservedCarPark) && reservedCarPark == old(reservedCarPark) - {car} && carPark == old(carPark))
  //   ENSURES: success ==> car !in carPark && car !in reservedCarPark
  //   ENSURES: !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && car !in old(carPark) && car !in old(reservedCarPark)
  //   ENSURES: subscriptions == old(subscriptions) && weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {"b"};
    obj.Repr := {obj};
    var car: seq<char> := [];
    var old_reservedCarPark := obj.reservedCarPark;
    var old_carPark := obj.carPark;
    var success := obj.leaveCarPark(car);
    expect obj.Valid();
    expect car !in obj.carPark;
    expect car !in obj.reservedCarPark;
    expect obj.reservedCarPark == old_reservedCarPark;
  }

  // Test case for combination {4}/BreservedCarPark=0,totalSpaces=0,normalSpaces=0,reservedSpaces=0,badParkingBuffer=0:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: car !in carPark
  //   POST: car !in reservedCarPark
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: car !in old(carPark)
  //   POST: car !in old(reservedCarPark)
  //   ENSURES: Valid()
  //   ENSURES: success ==> (car in old(carPark) && carPark == old(carPark) - {car} && reservedCarPark == old(reservedCarPark)) || (car in old(reservedCarPark) && reservedCarPark == old(reservedCarPark) - {car} && carPark == old(carPark))
  //   ENSURES: success ==> car !in carPark && car !in reservedCarPark
  //   ENSURES: !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && car !in old(carPark) && car !in old(reservedCarPark)
  //   ENSURES: subscriptions == old(subscriptions) && weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {};
    obj.carPark := {""};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var car: seq<char> := ['b'];
    var old_reservedCarPark := obj.reservedCarPark;
    var old_carPark := obj.carPark;
    var success := obj.leaveCarPark(car);
    expect obj.Valid();
    expect car !in obj.carPark;
    expect car !in obj.reservedCarPark;
    expect obj.reservedCarPark == old_reservedCarPark;
  }

  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: carPark == old(carPark)
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: weekend == true
  //   POST: subscriptions == old(subscriptions)
  //   ENSURES: Valid()
  //   ENSURES: carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && weekend == true && subscriptions == old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_subscriptions := obj.subscriptions;
    obj.openReservedArea();
    expect obj.Valid();
    expect obj.weekend == true;
    expect obj.carPark == old_carPark;
    expect obj.reservedCarPark == old_reservedCarPark;
    expect obj.subscriptions == old_subscriptions;
  }

  // Test case for combination {1}/BreservedCarPark=0,totalSpaces=0,normalSpaces=0,reservedSpaces=0,badParkingBuffer=0:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: carPark == old(carPark)
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: weekend == true
  //   POST: subscriptions == old(subscriptions)
  //   ENSURES: Valid()
  //   ENSURES: carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && weekend == true && subscriptions == old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := true;
    obj.subscriptions := {};
    obj.carPark := {"b", "f"};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_subscriptions := obj.subscriptions;
    obj.openReservedArea();
    expect obj.Valid();
    expect obj.weekend == true;
    expect obj.carPark == old_carPark;
    expect obj.reservedCarPark == old_reservedCarPark;
    expect obj.subscriptions == old_subscriptions;
  }

  // Test case for combination {1}/BreservedCarPark=0,totalSpaces=0,normalSpaces=0,reservedSpaces=0,badParkingBuffer=1:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: carPark == old(carPark)
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: weekend == true
  //   POST: subscriptions == old(subscriptions)
  //   ENSURES: Valid()
  //   ENSURES: carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && weekend == true && subscriptions == old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_subscriptions := obj.subscriptions;
    obj.openReservedArea();
    expect obj.Valid();
    expect obj.weekend == true;
    expect obj.carPark == old_carPark;
    expect obj.reservedCarPark == old_reservedCarPark;
    expect obj.subscriptions == old_subscriptions;
  }

  // Test case for combination {1}/BreservedCarPark=0,totalSpaces=0,normalSpaces=0,reservedSpaces=1,badParkingBuffer=0:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: carPark == old(carPark)
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: weekend == true
  //   POST: subscriptions == old(subscriptions)
  //   ENSURES: Valid()
  //   ENSURES: carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && weekend == true && subscriptions == old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_subscriptions := obj.subscriptions;
    obj.openReservedArea();
    expect obj.Valid();
    expect obj.weekend == true;
    expect obj.carPark == old_carPark;
    expect obj.reservedCarPark == old_reservedCarPark;
    expect obj.subscriptions == old_subscriptions;
  }

  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: carPark == {}
  //   POST: reservedCarPark == {}
  //   POST: subscriptions == {}
  //   POST: weekend == old(weekend)
  //   ENSURES: Valid()
  //   ENSURES: carPark == {} && reservedCarPark == {} && subscriptions == {}
  //   ENSURES: weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    obj.closeCarPark();
    expect obj.Valid();
    expect obj.weekend == false;
    expect obj.carPark == {};
    expect obj.reservedCarPark == {};
    expect obj.subscriptions == {};
  }

  // Test case for combination {1}/BreservedCarPark=0,totalSpaces=0,normalSpaces=0,reservedSpaces=0,badParkingBuffer=0:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: carPark == {}
  //   POST: reservedCarPark == {}
  //   POST: subscriptions == {}
  //   POST: weekend == old(weekend)
  //   ENSURES: Valid()
  //   ENSURES: carPark == {} && reservedCarPark == {} && subscriptions == {}
  //   ENSURES: weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := true;
    obj.subscriptions := {};
    obj.carPark := {"c"};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    obj.closeCarPark();
    expect obj.Valid();
    expect obj.weekend == true;
    expect obj.carPark == {};
    expect obj.reservedCarPark == {};
    expect obj.subscriptions == {};
  }

  // Test case for combination {1}/BreservedCarPark=0,totalSpaces=0,normalSpaces=0,reservedSpaces=0,badParkingBuffer=1:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: carPark == {}
  //   POST: reservedCarPark == {}
  //   POST: subscriptions == {}
  //   POST: weekend == old(weekend)
  //   ENSURES: Valid()
  //   ENSURES: carPark == {} && reservedCarPark == {} && subscriptions == {}
  //   ENSURES: weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    obj.closeCarPark();
    expect obj.Valid();
    expect obj.weekend == false;
    expect obj.carPark == {};
    expect obj.reservedCarPark == {};
    expect obj.subscriptions == {};
  }

  // Test case for combination {1}/BreservedCarPark=0,totalSpaces=0,normalSpaces=0,reservedSpaces=1,badParkingBuffer=0:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: carPark == {}
  //   POST: reservedCarPark == {}
  //   POST: subscriptions == {}
  //   POST: weekend == old(weekend)
  //   ENSURES: Valid()
  //   ENSURES: carPark == {} && reservedCarPark == {} && subscriptions == {}
  //   ENSURES: weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    obj.closeCarPark();
    expect obj.Valid();
    expect obj.weekend == false;
    expect obj.carPark == {};
    expect obj.reservedCarPark == {};
    expect obj.subscriptions == {};
  }

  // Test case for combination {6}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: !success
  //   POST: success
  //   POST: old(|carPark|) >= normalSpaces - badParkingBuffer
  //   POST: car in old(carPark)
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: weekend == old(weekend)
  //   ENSURES: Valid()
  //   ENSURES: success ==> car !in old(carPark) && car !in old(reservedCarPark) && old(|carPark|) < normalSpaces - badParkingBuffer
  //   ENSURES: success ==> carPark == old(carPark) + {car}
  //   ENSURES: !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark)
  //   ENSURES: !success ==> car in old(carPark) || car in old(reservedCarPark) || old(|carPark|) >= normalSpaces - badParkingBuffer
  //   ENSURES: subscriptions == old(subscriptions) && reservedCarPark == old(reservedCarPark) && weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {};
    obj.carPark := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var car: seq<char> := [];
    var old_carPark := |obj.carPark|;
    var old_carPark2 := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var success := obj.enterCarPark(car);
    expect obj.Valid();
    expect success == false;
    expect obj.weekend == false;
    expect obj.reservedCarPark == old_reservedCarPark;
  }

  // Test case for combination {7}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: !success
  //   POST: success
  //   POST: old(|carPark|) >= normalSpaces - badParkingBuffer
  //   POST: car in old(reservedCarPark)
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: weekend == old(weekend)
  //   ENSURES: Valid()
  //   ENSURES: success ==> car !in old(carPark) && car !in old(reservedCarPark) && old(|carPark|) < normalSpaces - badParkingBuffer
  //   ENSURES: success ==> carPark == old(carPark) + {car}
  //   ENSURES: !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark)
  //   ENSURES: !success ==> car in old(carPark) || car in old(reservedCarPark) || old(|carPark|) >= normalSpaces - badParkingBuffer
  //   ENSURES: subscriptions == old(subscriptions) && reservedCarPark == old(reservedCarPark) && weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"d", "g"};
    obj.carPark := {"d", "g"};
    obj.reservedCarPark := {"f"};
    obj.Repr := {obj};
    var car: seq<char> := ['f'];
    var old_carPark := |obj.carPark|;
    var old_reservedCarPark := obj.reservedCarPark;
    var success := obj.enterCarPark(car);
    expect obj.Valid();
    expect success == false;
    expect obj.weekend == false;
    expect obj.reservedCarPark == old_reservedCarPark;
  }

  // Test case for combination {8}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: !success
  //   POST: success
  //   POST: old(|carPark|) >= normalSpaces - badParkingBuffer
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: weekend == old(weekend)
  //   ENSURES: Valid()
  //   ENSURES: success ==> car !in old(carPark) && car !in old(reservedCarPark) && old(|carPark|) < normalSpaces - badParkingBuffer
  //   ENSURES: success ==> carPark == old(carPark) + {car}
  //   ENSURES: !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark)
  //   ENSURES: !success ==> car in old(carPark) || car in old(reservedCarPark) || old(|carPark|) >= normalSpaces - badParkingBuffer
  //   ENSURES: subscriptions == old(subscriptions) && reservedCarPark == old(reservedCarPark) && weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {};
    obj.carPark := {"d", "g"};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var car: seq<char> := ['f'];
    var old_carPark := |obj.carPark|;
    var old_reservedCarPark := obj.reservedCarPark;
    var success := obj.enterCarPark(car);
    expect obj.Valid();
    expect success == false;
    expect obj.weekend == false;
    expect obj.reservedCarPark == old_reservedCarPark;
  }

  // Test case for combination {24}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: car !in old(carPark)
  //   POST: car !in old(reservedCarPark)
  //   POST: old(|reservedCarPark|) < reservedSpaces
  //   POST: car in subscriptions
  //   POST: reservedCarPark == old(reservedCarPark) + {car}
  //   POST: success
  //   POST: car in old(carPark)
  //   POST: subscriptions == old(subscriptions)
  //   POST: weekend == old(weekend)
  //   ENSURES: Valid()
  //   ENSURES: success ==> car !in old(carPark) && car !in old(reservedCarPark) && old(|reservedCarPark|) < reservedSpaces && (car in subscriptions || weekend == true)
  //   ENSURES: success ==> reservedCarPark == old(reservedCarPark) + {car}
  //   ENSURES: !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark)
  //   ENSURES: !success ==> car in old(carPark) || car in old(reservedCarPark) || old(|reservedCarPark|) >= reservedSpaces || (car !in subscriptions && weekend == false)
  //   ENSURES: subscriptions == old(subscriptions) && carPark == old(carPark) && weekend == old(weekend)
  //   ENSURES: weekend == old(weekend) && subscriptions == old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"a", "d"};
    obj.carPark := {"c"};
    obj.reservedCarPark := {"e", "g"};
    obj.Repr := {obj};
    var car: seq<char> := ['d'];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_reservedCarPark2 := |obj.reservedCarPark|;
    var old_subscriptions := obj.subscriptions;
    var success := obj.enterReservedCarPark(car);
    expect obj.Valid();
    expect success == true;
    expect obj.weekend == false;
    expect car in obj.subscriptions;
    expect obj.reservedCarPark == old_reservedCarPark + {car};
    expect obj.subscriptions == old_subscriptions;
  }

}

method Failing()
{
  // Test case for combination {6}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: car in old(carPark)
  //   POST: carPark == old(carPark) - {car}
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: car !in carPark
  //   POST: car !in reservedCarPark
  //   POST: carPark == old(carPark)
  //   POST: car !in old(carPark)
  //   ENSURES: Valid()
  //   ENSURES: success ==> (car in old(carPark) && carPark == old(carPark) - {car} && reservedCarPark == old(reservedCarPark)) || (car in old(reservedCarPark) && reservedCarPark == old(reservedCarPark) - {car} && carPark == old(carPark))
  //   ENSURES: success ==> car !in carPark && car !in reservedCarPark
  //   ENSURES: !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && car !in old(carPark) && car !in old(reservedCarPark)
  //   ENSURES: subscriptions == old(subscriptions) && weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {""};
    obj.carPark := {""};
    obj.reservedCarPark := {"d"};
    obj.Repr := {obj};
    var car: seq<char> := [];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var success := obj.leaveCarPark(car);
    // expect obj.Valid();
    // expect obj.carPark == old_carPark - {car};
    // expect obj.reservedCarPark == old_reservedCarPark;
    // expect car !in obj.carPark;
    // expect car !in obj.reservedCarPark;
    // expect obj.carPark == old_carPark;
  }

  // Test case for combination {8}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: car in old(carPark)
  //   POST: carPark == old(carPark) - {car}
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: car !in carPark
  //   POST: car !in reservedCarPark
  //   POST: carPark == old(carPark)
  //   POST: car !in old(carPark)
  //   ENSURES: Valid()
  //   ENSURES: success ==> (car in old(carPark) && carPark == old(carPark) - {car} && reservedCarPark == old(reservedCarPark)) || (car in old(reservedCarPark) && reservedCarPark == old(reservedCarPark) - {car} && carPark == old(carPark))
  //   ENSURES: success ==> car !in carPark && car !in reservedCarPark
  //   ENSURES: !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && car !in old(carPark) && car !in old(reservedCarPark)
  //   ENSURES: subscriptions == old(subscriptions) && weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {""};
    obj.carPark := {"a"};
    obj.reservedCarPark := {""};
    obj.Repr := {obj};
    var car: seq<char> := [];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var success := obj.leaveCarPark(car);
    // expect obj.Valid();
    // expect obj.carPark == old_carPark - {car};
    // expect obj.reservedCarPark == old_reservedCarPark;
    // expect car !in obj.carPark;
    // expect car !in obj.reservedCarPark;
    // expect obj.carPark == old_carPark;
  }

  // Test case for combination {3}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: availableSpaces == normalSpaces - old(|carPark|) + reservedSpaces - old(|reservedCarPark|) - badParkingBuffer
  //   POST: weekend
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: weekend == old(weekend)
  //   POST: subscriptions == old(subscriptions)
  //   ENSURES: Valid()
  //   ENSURES: weekend ==> availableSpaces == normalSpaces - old(|carPark|) + reservedSpaces - old(|reservedCarPark|) - badParkingBuffer
  //   ENSURES: !weekend ==> availableSpaces == normalSpaces - old(|carPark|) - badParkingBuffer
  //   ENSURES: carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && weekend == old(weekend) && subscriptions == old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.carPark := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.reservedCarPark := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.Repr := {obj};
    var old_carPark := |obj.carPark|;
    var old_reservedCarPark := |obj.reservedCarPark|;
    var old_reservedCarPark2 := obj.reservedCarPark;
    var old_weekend := obj.weekend;
    var old_subscriptions := obj.subscriptions;
    var check_availableSpaces := obj.normalSpaces - old_carPark + obj.reservedSpaces - old_reservedCarPark - obj.badParkingBuffer;
    var availableSpaces := obj.checkAvailability();
    // expect obj.Valid();
    // expect availableSpaces == check_availableSpaces;
    // expect obj.weekend;
    // expect obj.reservedCarPark == old_reservedCarPark2;
    // expect obj.weekend == old_weekend;
    // expect obj.subscriptions == old_subscriptions;
  }

  // Test case for combination {6}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: availableSpaces == normalSpaces - old(|carPark|) + reservedSpaces - old(|reservedCarPark|) - badParkingBuffer
  //   POST: availableSpaces == normalSpaces - old(|carPark|) - badParkingBuffer
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: weekend == old(weekend)
  //   POST: subscriptions == old(subscriptions)
  //   ENSURES: Valid()
  //   ENSURES: weekend ==> availableSpaces == normalSpaces - old(|carPark|) + reservedSpaces - old(|reservedCarPark|) - badParkingBuffer
  //   ENSURES: !weekend ==> availableSpaces == normalSpaces - old(|carPark|) - badParkingBuffer
  //   ENSURES: carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && weekend == old(weekend) && subscriptions == old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.carPark := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.reservedCarPark := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.Repr := {obj};
    var old_carPark := |obj.carPark|;
    var old_reservedCarPark := |obj.reservedCarPark|;
    var old_reservedCarPark2 := obj.reservedCarPark;
    var old_weekend := obj.weekend;
    var old_subscriptions := obj.subscriptions;
    var check_availableSpaces := obj.normalSpaces - old_carPark + obj.reservedSpaces - old_reservedCarPark - obj.badParkingBuffer;
    var availableSpaces := obj.checkAvailability();
    // expect obj.Valid();
    // expect availableSpaces == check_availableSpaces;
    // expect availableSpaces == check_availableSpaces;
    // expect obj.reservedCarPark == old_reservedCarPark2;
    // expect obj.weekend == old_weekend;
    // expect obj.subscriptions == old_subscriptions;
  }

  // Test case for combination {7}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: carPark == old(carPark)
  //   POST: weekend
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: weekend == old(weekend)
  //   POST: subscriptions == old(subscriptions)
  //   ENSURES: Valid()
  //   ENSURES: weekend ==> availableSpaces == normalSpaces - old(|carPark|) + reservedSpaces - old(|reservedCarPark|) - badParkingBuffer
  //   ENSURES: !weekend ==> availableSpaces == normalSpaces - old(|carPark|) - badParkingBuffer
  //   ENSURES: carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && weekend == old(weekend) && subscriptions == old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := true;
    obj.subscriptions := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.carPark := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.reservedCarPark := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.Repr := {obj};
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_weekend := obj.weekend;
    var old_subscriptions := obj.subscriptions;
    var availableSpaces := obj.checkAvailability();
    // expect obj.Valid();
    // expect obj.carPark == old_carPark;
    // expect obj.weekend;
    // expect obj.reservedCarPark == old_reservedCarPark;
    // expect obj.weekend == old_weekend;
    // expect obj.subscriptions == old_subscriptions;
  }

  // Test case for combination {8}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: carPark == old(carPark)
  //   POST: weekend
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: weekend == old(weekend)
  //   POST: subscriptions == old(subscriptions)
  //   ENSURES: Valid()
  //   ENSURES: weekend ==> availableSpaces == normalSpaces - old(|carPark|) + reservedSpaces - old(|reservedCarPark|) - badParkingBuffer
  //   ENSURES: !weekend ==> availableSpaces == normalSpaces - old(|carPark|) - badParkingBuffer
  //   ENSURES: carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && weekend == old(weekend) && subscriptions == old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := true;
    obj.subscriptions := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.carPark := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.reservedCarPark := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.Repr := {obj};
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_weekend := obj.weekend;
    var old_subscriptions := obj.subscriptions;
    var availableSpaces := obj.checkAvailability();
    // expect obj.Valid();
    // expect obj.carPark == old_carPark;
    // expect obj.weekend;
    // expect obj.reservedCarPark == old_reservedCarPark;
    // expect obj.weekend == old_weekend;
    // expect obj.subscriptions == old_subscriptions;
  }

  // Test case for combination {7}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: old(|subscriptions|) < reservedSpaces
  //   POST: car !in old(subscriptions)
  //   POST: subscriptions == old(subscriptions) + {car}
  //   POST: subscriptions == old(subscriptions)
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: weekend == old(weekend)
  //   POST: carPark == old(carPark)
  //   ENSURES: Valid()
  //   ENSURES: success ==> old(|subscriptions|) < reservedSpaces && car !in old(subscriptions) && subscriptions == old(subscriptions) + {car}
  //   ENSURES: !success ==> subscriptions == old(subscriptions) && (car in old(subscriptions) || old(|subscriptions|) >= reservedSpaces)
  //   ENSURES: carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"", "a", "b", "c", "d", "f", "g"};
    obj.carPark := {"", "a", "b", "c", "d", "f", "g"};
    obj.reservedCarPark := {"", "a", "b", "c", "d", "f", "g"};
    obj.Repr := {obj};
    var car: seq<char> := [];
    var old_subscriptions := |obj.subscriptions|;
    var old_subscriptions2 := obj.subscriptions;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_carPark := obj.carPark;
    var success := obj.makeSubscription(car);
    // expect obj.Valid();
    // expect obj.weekend == false;
    // expect obj.subscriptions == old_subscriptions2 + {car};
    // expect obj.subscriptions == old_subscriptions2;
    // expect obj.reservedCarPark == old_reservedCarPark;
    // expect obj.carPark == old_carPark;
  }

  // Test case for combination {11}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: old(|subscriptions|) < reservedSpaces
  //   POST: car !in old(subscriptions)
  //   POST: car in old(subscriptions)
  //   POST: subscriptions == old(subscriptions)
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: weekend == old(weekend)
  //   POST: carPark == old(carPark)
  //   ENSURES: Valid()
  //   ENSURES: success ==> old(|subscriptions|) < reservedSpaces && car !in old(subscriptions) && subscriptions == old(subscriptions) + {car}
  //   ENSURES: !success ==> subscriptions == old(subscriptions) && (car in old(subscriptions) || old(|subscriptions|) >= reservedSpaces)
  //   ENSURES: carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"f", "g"};
    obj.carPark := {"f", "g"};
    obj.reservedCarPark := {"f", "g"};
    obj.Repr := {obj};
    var car: seq<char> := ['e'];
    var old_subscriptions := |obj.subscriptions|;
    var old_subscriptions2 := obj.subscriptions;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_carPark := obj.carPark;
    var success := obj.makeSubscription(car);
    // expect obj.Valid();
    // expect obj.weekend == false;
    // expect obj.subscriptions == old_subscriptions2;
    // expect obj.reservedCarPark == old_reservedCarPark;
    // expect obj.carPark == old_carPark;
  }

  // Test case for combination {16}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: old(|subscriptions|) < reservedSpaces
  //   POST: subscriptions == old(subscriptions)
  //   POST: subscriptions == old(subscriptions) + {car}
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: !(old(|subscriptions|) >= reservedSpaces)
  //   POST: carPark == old(carPark)
  //   POST: weekend == old(weekend)
  //   ENSURES: Valid()
  //   ENSURES: success ==> old(|subscriptions|) < reservedSpaces && car !in old(subscriptions) && subscriptions == old(subscriptions) + {car}
  //   ENSURES: !success ==> subscriptions == old(subscriptions) && (car in old(subscriptions) || old(|subscriptions|) >= reservedSpaces)
  //   ENSURES: carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"", "a", "b", "c", "d", "f", "g"};
    obj.carPark := {"", "a", "b", "c", "d", "f", "g"};
    obj.reservedCarPark := {"", "a", "b", "c", "d", "f", "g"};
    obj.Repr := {obj};
    var car: seq<char> := [];
    var old_subscriptions := |obj.subscriptions|;
    var old_subscriptions2 := obj.subscriptions;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_carPark := obj.carPark;
    var success := obj.makeSubscription(car);
    // expect obj.Valid();
    // expect obj.weekend == false;
    // expect obj.subscriptions == old_subscriptions2;
    // expect obj.subscriptions == old_subscriptions2 + {car};
    // expect obj.reservedCarPark == old_reservedCarPark;
    // expect obj.carPark == old_carPark;
  }

  // Test case for combination {33}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: old(|subscriptions|) >= reservedSpaces
  //   POST: subscriptions == old(subscriptions)
  //   POST: car in old(subscriptions)
  //   POST: carPark == old(carPark)
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: !(old(|subscriptions|) >= reservedSpaces)
  //   POST: weekend == old(weekend)
  //   ENSURES: Valid()
  //   ENSURES: success ==> old(|subscriptions|) < reservedSpaces && car !in old(subscriptions) && subscriptions == old(subscriptions) + {car}
  //   ENSURES: !success ==> subscriptions == old(subscriptions) && (car in old(subscriptions) || old(|subscriptions|) >= reservedSpaces)
  //   ENSURES: carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"a", "b", "c", "e"};
    obj.carPark := {""};
    obj.reservedCarPark := {""};
    obj.Repr := {obj};
    var car: seq<char> := ['f'];
    var old_subscriptions := |obj.subscriptions|;
    var old_subscriptions2 := obj.subscriptions;
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var success := obj.makeSubscription(car);
    // expect obj.Valid();
    // expect obj.weekend == false;
    // expect obj.subscriptions == old_subscriptions2;
    // expect obj.carPark == old_carPark;
    // expect obj.reservedCarPark == old_reservedCarPark;
  }

  // Test case for combination {34}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: old(|subscriptions|) >= reservedSpaces
  //   POST: subscriptions == old(subscriptions)
  //   POST: car in old(subscriptions)
  //   POST: carPark == old(carPark)
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: !(old(|subscriptions|) >= reservedSpaces)
  //   POST: weekend == old(weekend)
  //   ENSURES: Valid()
  //   ENSURES: success ==> old(|subscriptions|) < reservedSpaces && car !in old(subscriptions) && subscriptions == old(subscriptions) + {car}
  //   ENSURES: !success ==> subscriptions == old(subscriptions) && (car in old(subscriptions) || old(|subscriptions|) >= reservedSpaces)
  //   ENSURES: carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"f", "g"};
    obj.carPark := {"f", "g"};
    obj.reservedCarPark := {"f", "g"};
    obj.Repr := {obj};
    var car: seq<char> := ['e'];
    var old_subscriptions := |obj.subscriptions|;
    var old_subscriptions2 := obj.subscriptions;
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var success := obj.makeSubscription(car);
    // expect obj.Valid();
    // expect obj.weekend == false;
    // expect obj.subscriptions == old_subscriptions2;
    // expect obj.carPark == old_carPark;
    // expect obj.reservedCarPark == old_reservedCarPark;
  }

  // Test case for combination {19}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: car !in old(carPark)
  //   POST: car !in old(reservedCarPark)
  //   POST: old(|carPark|) < normalSpaces - badParkingBuffer
  //   POST: !success
  //   POST: subscriptions == old(subscriptions)
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: old(|carPark|) >= normalSpaces - badParkingBuffer
  //   POST: weekend == old(weekend)
  //   ENSURES: Valid()
  //   ENSURES: success ==> car !in old(carPark) && car !in old(reservedCarPark) && old(|carPark|) < normalSpaces - badParkingBuffer
  //   ENSURES: success ==> carPark == old(carPark) + {car}
  //   ENSURES: !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark)
  //   ENSURES: !success ==> car in old(carPark) || car in old(reservedCarPark) || old(|carPark|) >= normalSpaces - badParkingBuffer
  //   ENSURES: subscriptions == old(subscriptions) && reservedCarPark == old(reservedCarPark) && weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"b"};
    obj.carPark := {"c", "d", "e", "f", "g"};
    obj.reservedCarPark := {"b"};
    obj.Repr := {obj};
    var car: seq<char> := ['a'];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_carPark2 := |obj.carPark|;
    var old_subscriptions := obj.subscriptions;
    var success := obj.enterCarPark(car);
    // expect obj.Valid();
    // expect success == true;
    // expect obj.weekend == false;
    // expect obj.subscriptions == old_subscriptions;
    // expect obj.reservedCarPark == old_reservedCarPark;
  }

  // Test case for combination {20}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: car !in old(carPark)
  //   POST: car !in old(reservedCarPark)
  //   POST: old(|carPark|) < normalSpaces - badParkingBuffer
  //   POST: !success
  //   POST: success
  //   POST: old(|carPark|) >= normalSpaces - badParkingBuffer
  //   POST: subscriptions == old(subscriptions)
  //   POST: reservedCarPark == old(reservedCarPark)
  //   POST: weekend == old(weekend)
  //   ENSURES: Valid()
  //   ENSURES: success ==> car !in old(carPark) && car !in old(reservedCarPark) && old(|carPark|) < normalSpaces - badParkingBuffer
  //   ENSURES: success ==> carPark == old(carPark) + {car}
  //   ENSURES: !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark)
  //   ENSURES: !success ==> car in old(carPark) || car in old(reservedCarPark) || old(|carPark|) >= normalSpaces - badParkingBuffer
  //   ENSURES: subscriptions == old(subscriptions) && reservedCarPark == old(reservedCarPark) && weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {};
    obj.carPark := {"d", "g"};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var car: seq<char> := ['f'];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_carPark2 := |obj.carPark|;
    var old_subscriptions := obj.subscriptions;
    var success := obj.enterCarPark(car);
    // expect obj.Valid();
    // expect success == true;
    // expect obj.weekend == false;
    // expect obj.subscriptions == old_subscriptions;
    // expect obj.reservedCarPark == old_reservedCarPark;
  }

  // Test case for combination {17}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: !success
  //   POST: reservedCarPark == old(reservedCarPark) + {car}
  //   POST: success
  //   POST: car in old(carPark)
  //   POST: weekend == old(weekend)
  //   ENSURES: Valid()
  //   ENSURES: success ==> car !in old(carPark) && car !in old(reservedCarPark) && old(|reservedCarPark|) < reservedSpaces && (car in subscriptions || weekend == true)
  //   ENSURES: success ==> reservedCarPark == old(reservedCarPark) + {car}
  //   ENSURES: !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark)
  //   ENSURES: !success ==> car in old(carPark) || car in old(reservedCarPark) || old(|reservedCarPark|) >= reservedSpaces || (car !in subscriptions && weekend == false)
  //   ENSURES: subscriptions == old(subscriptions) && carPark == old(carPark) && weekend == old(weekend)
  //   ENSURES: weekend == old(weekend) && subscriptions == old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := true;
    obj.subscriptions := {"d"};
    obj.carPark := {"d"};
    obj.reservedCarPark := {"e", "g"};
    obj.Repr := {obj};
    var car: seq<char> := ['d'];
    var old_reservedCarPark := obj.reservedCarPark;
    var old_carPark := obj.carPark;
    var success := obj.enterReservedCarPark(car);
    // expect obj.Valid();
    // expect success == false;
    // expect obj.weekend == true;
    // expect obj.reservedCarPark == old_reservedCarPark + {car};
  }

  // Test case for combination {18}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: !success
  //   POST: reservedCarPark == old(reservedCarPark) + {car}
  //   POST: success
  //   POST: car in old(carPark)
  //   POST: car in old(reservedCarPark)
  //   POST: weekend == old(weekend)
  //   ENSURES: Valid()
  //   ENSURES: success ==> car !in old(carPark) && car !in old(reservedCarPark) && old(|reservedCarPark|) < reservedSpaces && (car in subscriptions || weekend == true)
  //   ENSURES: success ==> reservedCarPark == old(reservedCarPark) + {car}
  //   ENSURES: !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark)
  //   ENSURES: !success ==> car in old(carPark) || car in old(reservedCarPark) || old(|reservedCarPark|) >= reservedSpaces || (car !in subscriptions && weekend == false)
  //   ENSURES: subscriptions == old(subscriptions) && carPark == old(carPark) && weekend == old(weekend)
  //   ENSURES: weekend == old(weekend) && subscriptions == old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := true;
    obj.subscriptions := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.carPark := {};
    obj.reservedCarPark := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.Repr := {obj};
    var car: seq<char> := [];
    var old_reservedCarPark := obj.reservedCarPark;
    var old_carPark := obj.carPark;
    var success := obj.enterReservedCarPark(car);
    // expect obj.Valid();
    // expect success == false;
    // expect obj.weekend == true;
    // expect obj.reservedCarPark == old_reservedCarPark + {car};
  }

  // Test case for combination {19}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: !success
  //   POST: reservedCarPark == old(reservedCarPark) + {car}
  //   POST: success
  //   POST: car in old(carPark)
  //   POST: old(|reservedCarPark|) >= reservedSpaces
  //   POST: weekend == old(weekend)
  //   ENSURES: Valid()
  //   ENSURES: success ==> car !in old(carPark) && car !in old(reservedCarPark) && old(|reservedCarPark|) < reservedSpaces && (car in subscriptions || weekend == true)
  //   ENSURES: success ==> reservedCarPark == old(reservedCarPark) + {car}
  //   ENSURES: !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark)
  //   ENSURES: !success ==> car in old(carPark) || car in old(reservedCarPark) || old(|reservedCarPark|) >= reservedSpaces || (car !in subscriptions && weekend == false)
  //   ENSURES: subscriptions == old(subscriptions) && carPark == old(carPark) && weekend == old(weekend)
  //   ENSURES: weekend == old(weekend) && subscriptions == old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := true;
    obj.subscriptions := {"e", "f", "g"};
    obj.carPark := {};
    obj.reservedCarPark := {"e", "f", "g"};
    obj.Repr := {obj};
    var car: seq<char> := ['d'];
    var old_reservedCarPark := obj.reservedCarPark;
    var old_carPark := obj.carPark;
    var old_reservedCarPark2 := |obj.reservedCarPark|;
    var success := obj.enterReservedCarPark(car);
    // expect obj.Valid();
    // expect success == false;
    // expect obj.weekend == true;
    // expect obj.reservedCarPark == old_reservedCarPark + {car};
  }

  // Test case for combination {20}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: !success
  //   POST: reservedCarPark == old(reservedCarPark) + {car}
  //   POST: success
  //   POST: car in old(carPark)
  //   POST: subscriptions == old(subscriptions)
  //   POST: carPark == old(carPark)
  //   POST: weekend == old(weekend)
  //   ENSURES: Valid()
  //   ENSURES: success ==> car !in old(carPark) && car !in old(reservedCarPark) && old(|reservedCarPark|) < reservedSpaces && (car in subscriptions || weekend == true)
  //   ENSURES: success ==> reservedCarPark == old(reservedCarPark) + {car}
  //   ENSURES: !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark)
  //   ENSURES: !success ==> car in old(carPark) || car in old(reservedCarPark) || old(|reservedCarPark|) >= reservedSpaces || (car !in subscriptions && weekend == false)
  //   ENSURES: subscriptions == old(subscriptions) && carPark == old(carPark) && weekend == old(weekend)
  //   ENSURES: weekend == old(weekend) && subscriptions == old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"a"};
    obj.carPark := {"b"};
    obj.reservedCarPark := {"e", "g"};
    obj.Repr := {obj};
    var car: seq<char> := ['d'];
    var old_reservedCarPark := obj.reservedCarPark;
    var old_carPark := obj.carPark;
    var old_subscriptions := obj.subscriptions;
    var success := obj.enterReservedCarPark(car);
    // expect obj.Valid();
    // expect success == false;
    // expect obj.weekend == false;
    // expect obj.reservedCarPark == old_reservedCarPark + {car};
    // expect obj.subscriptions == old_subscriptions;
    // expect obj.carPark == old_carPark;
  }

  // Test case for combination {23}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: car !in old(carPark)
  //   POST: car !in old(reservedCarPark)
  //   POST: old(|reservedCarPark|) < reservedSpaces
  //   POST: car in subscriptions
  //   POST: reservedCarPark == old(reservedCarPark) + {car}
  //   POST: subscriptions == old(subscriptions)
  //   POST: weekend == old(weekend)
  //   POST: success
  //   ENSURES: Valid()
  //   ENSURES: success ==> car !in old(carPark) && car !in old(reservedCarPark) && old(|reservedCarPark|) < reservedSpaces && (car in subscriptions || weekend == true)
  //   ENSURES: success ==> reservedCarPark == old(reservedCarPark) + {car}
  //   ENSURES: !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark)
  //   ENSURES: !success ==> car in old(carPark) || car in old(reservedCarPark) || old(|reservedCarPark|) >= reservedSpaces || (car !in subscriptions && weekend == false)
  //   ENSURES: subscriptions == old(subscriptions) && carPark == old(carPark) && weekend == old(weekend)
  //   ENSURES: weekend == old(weekend) && subscriptions == old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"a", "d"};
    obj.carPark := {"e"};
    obj.reservedCarPark := {"d", "f", "g"};
    obj.Repr := {obj};
    var car: seq<char> := ['a'];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_reservedCarPark2 := |obj.reservedCarPark|;
    var old_subscriptions := obj.subscriptions;
    var success := obj.enterReservedCarPark(car);
    // expect obj.Valid();
    // expect success == true;
    // expect obj.weekend == false;
    // expect car in obj.subscriptions;
    // expect obj.reservedCarPark == old_reservedCarPark + {car};
    // expect obj.subscriptions == old_subscriptions;
  }

  // Test case for combination {29}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: car !in old(carPark)
  //   POST: car !in old(reservedCarPark)
  //   POST: old(|reservedCarPark|) < reservedSpaces
  //   POST: car in subscriptions
  //   POST: reservedCarPark == old(reservedCarPark) + {car}
  //   POST: subscriptions == old(subscriptions)
  //   POST: weekend == old(weekend)
  //   POST: success
  //   ENSURES: Valid()
  //   ENSURES: success ==> car !in old(carPark) && car !in old(reservedCarPark) && old(|reservedCarPark|) < reservedSpaces && (car in subscriptions || weekend == true)
  //   ENSURES: success ==> reservedCarPark == old(reservedCarPark) + {car}
  //   ENSURES: !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark)
  //   ENSURES: !success ==> car in old(carPark) || car in old(reservedCarPark) || old(|reservedCarPark|) >= reservedSpaces || (car !in subscriptions && weekend == false)
  //   ENSURES: subscriptions == old(subscriptions) && carPark == old(carPark) && weekend == old(weekend)
  //   ENSURES: weekend == old(weekend) && subscriptions == old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := true;
    obj.subscriptions := {"a"};
    obj.carPark := {"a", "e"};
    obj.reservedCarPark := {"c", "d", "e", "f", "g"};
    obj.Repr := {obj};
    var car: seq<char> := ['b'];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_reservedCarPark2 := |obj.reservedCarPark|;
    var old_subscriptions := obj.subscriptions;
    var success := obj.enterReservedCarPark(car);
    // expect obj.Valid();
    // expect success == true;
    // expect obj.weekend == true;
    // expect car in obj.subscriptions;
    // expect obj.reservedCarPark == old_reservedCarPark + {car};
    // expect obj.subscriptions == old_subscriptions;
  }

  // Test case for combination {31}:
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST: Valid()
  //   POST: car !in old(carPark)
  //   POST: car !in old(reservedCarPark)
  //   POST: old(|reservedCarPark|) < reservedSpaces
  //   POST: car in subscriptions
  //   POST: reservedCarPark == old(reservedCarPark) + {car}
  //   POST: success
  //   POST: car in old(carPark)
  //   POST: subscriptions == old(subscriptions)
  //   POST: weekend == old(weekend)
  //   ENSURES: Valid()
  //   ENSURES: success ==> car !in old(carPark) && car !in old(reservedCarPark) && old(|reservedCarPark|) < reservedSpaces && (car in subscriptions || weekend == true)
  //   ENSURES: success ==> reservedCarPark == old(reservedCarPark) + {car}
  //   ENSURES: !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark)
  //   ENSURES: !success ==> car in old(carPark) || car in old(reservedCarPark) || old(|reservedCarPark|) >= reservedSpaces || (car !in subscriptions && weekend == false)
  //   ENSURES: subscriptions == old(subscriptions) && carPark == old(carPark) && weekend == old(weekend)
  //   ENSURES: weekend == old(weekend) && subscriptions == old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := true;
    obj.subscriptions := {"a"};
    obj.carPark := {"c"};
    obj.reservedCarPark := {"e", "g"};
    obj.Repr := {obj};
    var car: seq<char> := ['d'];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_reservedCarPark2 := |obj.reservedCarPark|;
    var old_subscriptions := obj.subscriptions;
    var success := obj.enterReservedCarPark(car);
    // expect obj.Valid();
    // expect success == true;
    // expect obj.weekend == true;
    // expect car in obj.subscriptions;
    // expect obj.reservedCarPark == old_reservedCarPark + {car};
    // expect obj.subscriptions == old_subscriptions;
  }

}

method Main()
{
  Passing();
  Failing();
}
