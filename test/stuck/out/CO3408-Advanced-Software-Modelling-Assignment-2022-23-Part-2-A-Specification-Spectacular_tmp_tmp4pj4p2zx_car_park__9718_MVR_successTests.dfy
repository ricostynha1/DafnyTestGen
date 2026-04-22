// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\stuck\in\CO3408-Advanced-Software-Modelling-Assignment-2022-23-Part-2-A-Specification-Spectacular_tmp_tmp4pj4p2zx_car_park__9718_MVR_success.dfy
// Method: leaveCarPark
// Generated: 2026-04-22 19:25:56

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
  // Test case for combination {7}/Oweekend=true:
  //   NOTE: Z3 returned UNKNOWN on full query (likely quantifier incompleteness).
  //         Inputs chosen from preconditions-only fallback; postconditions NOT verified by Z3.
  //         Expected output values may be spurious — Dafny static check will flag if so.
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: success ==> (car in old(carPark) && carPark == old(carPark) - {car} && reservedCarPark == old(reservedCarPark)) || (car in old(reservedCarPark) && reservedCarPark == old(reservedCarPark) - {car} && carPark == old(carPark))
  //   POST Q6: success ==> car !in carPark && car !in reservedCarPark
  //   POST Q7: !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && car !in old(carPark) && car !in old(reservedCarPark)
  //   POST Q8: subscriptions == old(subscriptions) && weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := true;
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var car: seq<char> := ['f'];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_subscriptions := obj.subscriptions;
    var old_weekend := obj.weekend;
    var success := obj.leaveCarPark(car);
    expect obj.Valid();
    expect success ==> (car in old_carPark && obj.carPark == old_carPark - {car} && obj.reservedCarPark == old_reservedCarPark) || (car in old_reservedCarPark && obj.reservedCarPark == old_reservedCarPark - {car} && obj.carPark == old_carPark);
    expect success ==> car !in obj.carPark && car !in obj.reservedCarPark;
    expect !success ==> obj.carPark == old_carPark && obj.reservedCarPark == old_reservedCarPark && car !in old_carPark && car !in old_reservedCarPark;
    expect obj.subscriptions == old_subscriptions && obj.weekend == old_weekend;
    expect obj[..] == _module.CarPark; // observed from implementation
    expect success == false; // observed from implementation
  }

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
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var old_carPark := |obj.carPark|;
    var old_reservedCarPark := |obj.reservedCarPark|;
    var old_carPark2 := obj.carPark;
    var old_reservedCarPark2 := obj.reservedCarPark;
    var old_weekend := obj.weekend;
    var old_subscriptions := obj.subscriptions;
    var availableSpaces := obj.checkAvailability();
    expect obj.Valid();
    expect obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark + obj.reservedSpaces - old_reservedCarPark - obj.badParkingBuffer;
    expect !obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark - obj.badParkingBuffer;
    expect obj.carPark == old_carPark2 && obj.reservedCarPark == old_reservedCarPark2 && obj.weekend == old_weekend && obj.subscriptions == old_subscriptions;
    expect obj[..] == _module.CarPark; // observed from implementation
    expect availableSpaces == 2; // observed from implementation
  }

  // Test case for combination {3}:
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
    obj.weekend := true;
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var old_carPark := |obj.carPark|;
    var old_reservedCarPark := |obj.reservedCarPark|;
    var old_carPark2 := obj.carPark;
    var old_reservedCarPark2 := obj.reservedCarPark;
    var old_weekend := obj.weekend;
    var old_subscriptions := obj.subscriptions;
    var availableSpaces := obj.checkAvailability();
    expect obj.Valid();
    expect obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark + obj.reservedSpaces - old_reservedCarPark - obj.badParkingBuffer;
    expect !obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark - obj.badParkingBuffer;
    expect obj.carPark == old_carPark2 && obj.reservedCarPark == old_reservedCarPark2 && obj.weekend == old_weekend && obj.subscriptions == old_subscriptions;
    expect obj[..] == _module.CarPark; // observed from implementation
    expect availableSpaces == 5; // observed from implementation
  }

  // Test case for combination {2}/BnormalSpaces=0:
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
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var old_carPark := |obj.carPark|;
    var old_reservedCarPark := |obj.reservedCarPark|;
    var old_carPark2 := obj.carPark;
    var old_reservedCarPark2 := obj.reservedCarPark;
    var old_weekend := obj.weekend;
    var old_subscriptions := obj.subscriptions;
    var availableSpaces := obj.checkAvailability();
    expect obj.Valid();
    expect obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark + obj.reservedSpaces - old_reservedCarPark - obj.badParkingBuffer;
    expect !obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark - obj.badParkingBuffer;
    expect obj.carPark == old_carPark2 && obj.reservedCarPark == old_reservedCarPark2 && obj.weekend == old_weekend && obj.subscriptions == old_subscriptions;
    expect obj[..] == _module.CarPark; // observed from implementation
    expect availableSpaces == 2; // observed from implementation
  }

  // Test case for combination {2}/BnormalSpaces=1:
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
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var old_carPark := |obj.carPark|;
    var old_reservedCarPark := |obj.reservedCarPark|;
    var old_carPark2 := obj.carPark;
    var old_reservedCarPark2 := obj.reservedCarPark;
    var old_weekend := obj.weekend;
    var old_subscriptions := obj.subscriptions;
    var availableSpaces := obj.checkAvailability();
    expect obj.Valid();
    expect obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark + obj.reservedSpaces - old_reservedCarPark - obj.badParkingBuffer;
    expect !obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark - obj.badParkingBuffer;
    expect obj.carPark == old_carPark2 && obj.reservedCarPark == old_reservedCarPark2 && obj.weekend == old_weekend && obj.subscriptions == old_subscriptions;
    expect obj[..] == _module.CarPark; // observed from implementation
    expect availableSpaces == 2; // observed from implementation
  }

  // Test case for combination {2}/BreservedSpaces=0:
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
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var old_carPark := |obj.carPark|;
    var old_reservedCarPark := |obj.reservedCarPark|;
    var old_carPark2 := obj.carPark;
    var old_reservedCarPark2 := obj.reservedCarPark;
    var old_weekend := obj.weekend;
    var old_subscriptions := obj.subscriptions;
    var availableSpaces := obj.checkAvailability();
    expect obj.Valid();
    expect obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark + obj.reservedSpaces - old_reservedCarPark - obj.badParkingBuffer;
    expect !obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark - obj.badParkingBuffer;
    expect obj.carPark == old_carPark2 && obj.reservedCarPark == old_reservedCarPark2 && obj.weekend == old_weekend && obj.subscriptions == old_subscriptions;
    expect obj[..] == _module.CarPark; // observed from implementation
    expect availableSpaces == 2; // observed from implementation
  }

  // Test case for combination {2}/BreservedSpaces=1:
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
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var old_carPark := |obj.carPark|;
    var old_reservedCarPark := |obj.reservedCarPark|;
    var old_carPark2 := obj.carPark;
    var old_reservedCarPark2 := obj.reservedCarPark;
    var old_weekend := obj.weekend;
    var old_subscriptions := obj.subscriptions;
    var availableSpaces := obj.checkAvailability();
    expect obj.Valid();
    expect obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark + obj.reservedSpaces - old_reservedCarPark - obj.badParkingBuffer;
    expect !obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark - obj.badParkingBuffer;
    expect obj.carPark == old_carPark2 && obj.reservedCarPark == old_reservedCarPark2 && obj.weekend == old_weekend && obj.subscriptions == old_subscriptions;
    expect obj[..] == _module.CarPark; // observed from implementation
    expect availableSpaces == 2; // observed from implementation
  }

  // Test case for combination {3}/BnormalSpaces=0:
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
    obj.weekend := true;
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var old_carPark := |obj.carPark|;
    var old_reservedCarPark := |obj.reservedCarPark|;
    var old_carPark2 := obj.carPark;
    var old_reservedCarPark2 := obj.reservedCarPark;
    var old_weekend := obj.weekend;
    var old_subscriptions := obj.subscriptions;
    var availableSpaces := obj.checkAvailability();
    expect obj.Valid();
    expect obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark + obj.reservedSpaces - old_reservedCarPark - obj.badParkingBuffer;
    expect !obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark - obj.badParkingBuffer;
    expect obj.carPark == old_carPark2 && obj.reservedCarPark == old_reservedCarPark2 && obj.weekend == old_weekend && obj.subscriptions == old_subscriptions;
    expect obj[..] == _module.CarPark; // observed from implementation
    expect availableSpaces == 5; // observed from implementation
  }

  // Test case for combination {3}/BnormalSpaces=1:
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
    obj.weekend := true;
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var old_carPark := |obj.carPark|;
    var old_reservedCarPark := |obj.reservedCarPark|;
    var old_carPark2 := obj.carPark;
    var old_reservedCarPark2 := obj.reservedCarPark;
    var old_weekend := obj.weekend;
    var old_subscriptions := obj.subscriptions;
    var availableSpaces := obj.checkAvailability();
    expect obj.Valid();
    expect obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark + obj.reservedSpaces - old_reservedCarPark - obj.badParkingBuffer;
    expect !obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark - obj.badParkingBuffer;
    expect obj.carPark == old_carPark2 && obj.reservedCarPark == old_reservedCarPark2 && obj.weekend == old_weekend && obj.subscriptions == old_subscriptions;
    expect obj[..] == _module.CarPark; // observed from implementation
    expect availableSpaces == 5; // observed from implementation
  }

  // Test case for combination {3}/BreservedSpaces=0:
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
    obj.weekend := true;
    obj.subscriptions := {"a"};
    obj.carPark := {"a"};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var old_carPark := |obj.carPark|;
    var old_reservedCarPark := |obj.reservedCarPark|;
    var old_carPark2 := obj.carPark;
    var old_reservedCarPark2 := obj.reservedCarPark;
    var old_weekend := obj.weekend;
    var old_subscriptions := obj.subscriptions;
    var availableSpaces := obj.checkAvailability();
    expect obj.Valid();
    expect obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark + obj.reservedSpaces - old_reservedCarPark - obj.badParkingBuffer;
    expect !obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark - obj.badParkingBuffer;
    expect obj.carPark == old_carPark2 && obj.reservedCarPark == old_reservedCarPark2 && obj.weekend == old_weekend && obj.subscriptions == old_subscriptions;
    expect obj[..] == _module.CarPark; // observed from implementation
    expect availableSpaces == 4; // observed from implementation
  }

  // Test case for combination {2}/R6:
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
    obj.subscriptions := {"a"};
    obj.carPark := {"a"};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var old_carPark := |obj.carPark|;
    var old_reservedCarPark := |obj.reservedCarPark|;
    var old_carPark2 := obj.carPark;
    var old_reservedCarPark2 := obj.reservedCarPark;
    var old_weekend := obj.weekend;
    var old_subscriptions := obj.subscriptions;
    var availableSpaces := obj.checkAvailability();
    expect obj.Valid();
    expect obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark + obj.reservedSpaces - old_reservedCarPark - obj.badParkingBuffer;
    expect !obj.weekend ==> availableSpaces == obj.normalSpaces - old_carPark - obj.badParkingBuffer;
    expect obj.carPark == old_carPark2 && obj.reservedCarPark == old_reservedCarPark2 && obj.weekend == old_weekend && obj.subscriptions == old_subscriptions;
    expect obj[..] == _module.CarPark; // observed from implementation
    expect availableSpaces == 1; // observed from implementation
  }

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
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var car: seq<char> := ['e'];
    var old_subscriptions := |obj.subscriptions|;
    var old_subscriptions2 := obj.subscriptions;
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var success := obj.makeSubscription(car);
    expect obj.Valid();
    expect success == false || success == true;
    expect obj.weekend == false;
    expect obj.subscriptions == old_subscriptions2 + {car};
    expect obj.carPark == old_carPark;
    expect obj.reservedCarPark == old_reservedCarPark;
    expect obj[..] == _module.CarPark; // observed from implementation
    expect success == true; // observed from implementation
  }

  // Test case for combination {3}/OtotalSpaces=0:
  //   NOTE: Z3 returned UNKNOWN on full query (likely quantifier incompleteness).
  //         Inputs chosen from preconditions-only fallback; postconditions NOT verified by Z3.
  //         Expected output values may be spurious — Dafny static check will flag if so.
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: success ==> old(|subscriptions|) < reservedSpaces && car !in old(subscriptions) && subscriptions == old(subscriptions) + {car}
  //   POST Q6: !success ==> subscriptions == old(subscriptions) && (car in old(subscriptions) || old(|subscriptions|) >= reservedSpaces)
  //   POST Q7: carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var car: seq<char> := ['c'];
    var old_subscriptions := |obj.subscriptions|;
    var old_subscriptions2 := obj.subscriptions;
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_weekend := obj.weekend;
    var success := obj.makeSubscription(car);
    expect obj.Valid();
    expect success ==> old_subscriptions < obj.reservedSpaces && car !in old_subscriptions2 && obj.subscriptions == old_subscriptions2 + {car};
    expect !success ==> obj.subscriptions == old_subscriptions2 && (car in old_subscriptions2 || old_subscriptions >= obj.reservedSpaces);
    expect obj.carPark == old_carPark && obj.reservedCarPark == old_reservedCarPark && obj.weekend == old_weekend;
    expect obj[..] == _module.CarPark; // observed from implementation
    expect success == true; // observed from implementation
  }

  // Test case for combination {2}/R2:
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
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var car: seq<char> := ['a'];
    var old_subscriptions := |obj.subscriptions|;
    var old_subscriptions2 := obj.subscriptions;
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var success := obj.makeSubscription(car);
    expect obj.Valid();
    expect success == false || success == true;
    expect obj.weekend == false;
    expect obj.subscriptions == old_subscriptions2 + {car};
    expect obj.carPark == old_carPark;
    expect obj.reservedCarPark == old_reservedCarPark;
    expect obj[..] == _module.CarPark; // observed from implementation
    expect success == true; // observed from implementation
  }

  // Test case for combination {2}/R3:
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
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {""};
    obj.Repr := {obj};
    var car: seq<char> := [];
    var old_subscriptions := |obj.subscriptions|;
    var old_subscriptions2 := obj.subscriptions;
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var success := obj.makeSubscription(car);
    expect obj.Valid();
    expect success == false || success == true;
    expect obj.weekend == false;
    expect obj.subscriptions == old_subscriptions2 + {car};
    expect obj.carPark == old_carPark;
    expect obj.reservedCarPark == old_reservedCarPark;
    expect obj[..] == _module.CarPark; // observed from implementation
    expect success == true; // observed from implementation
  }

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
    expect obj[..] == _module.CarPark; // observed from implementation
  }

  // Test case for combination {1}/BnormalSpaces=0:
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
    expect obj[..] == _module.CarPark; // observed from implementation
  }

  // Test case for combination {1}/BnormalSpaces=1:
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
    expect obj[..] == _module.CarPark; // observed from implementation
  }

  // Test case for combination {1}/BreservedSpaces=0:
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
    expect obj[..] == _module.CarPark; // observed from implementation
  }

  // Test case for combination {1}/R6:
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
    expect obj[..] == _module.CarPark; // observed from implementation
  }

  // Test case for combination {1}/R7:
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
    expect obj[..] == _module.CarPark; // observed from implementation
  }

  // Test case for combination {1}/R8:
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
    obj.subscriptions := {"", "b", "c", "d", "e", "f", "g"};
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
    expect obj[..] == _module.CarPark; // observed from implementation
  }

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
    expect obj[..] == _module.CarPark; // observed from implementation
  }

  // Test case for combination {1}/BnormalSpaces=0:
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
    expect obj[..] == _module.CarPark; // observed from implementation
  }

  // Test case for combination {1}/BnormalSpaces=1:
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
    expect obj[..] == _module.CarPark; // observed from implementation
  }

  // Test case for combination {1}/BreservedSpaces=0:
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
    expect obj[..] == _module.CarPark; // observed from implementation
  }

  // Test case for combination {1}/BreservedSpaces=1:
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
    expect obj[..] == _module.CarPark; // observed from implementation
  }

  // Test case for combination {1}/Oweekend=true:
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
    obj.weekend := true;
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    obj.closeCarPark();
    expect obj.Valid();
    expect obj.weekend == true;
    expect obj.carPark == {};
    expect obj.reservedCarPark == {};
    expect obj.subscriptions == {};
    expect obj[..] == _module.CarPark; // observed from implementation
  }

  // Test case for combination {1}/O|subscriptions|=1:
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
    obj.subscriptions := {"e"};
    obj.carPark := {""};
    obj.reservedCarPark := {""};
    obj.Repr := {obj};
    obj.closeCarPark();
    expect obj.Valid();
    expect obj.weekend == false;
    expect obj.carPark == {};
    expect obj.reservedCarPark == {};
    expect obj.subscriptions == {};
    expect obj[..] == _module.CarPark; // observed from implementation
  }

  // Test case for combination {1}/O|reservedCarPark|=1:
  //   NOTE: Z3 returned UNKNOWN on full query (likely quantifier incompleteness).
  //         Inputs chosen from preconditions-only fallback; postconditions NOT verified by Z3.
  //         Expected output values may be spurious — Dafny static check will flag if so.
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: carPark == {} && reservedCarPark == {} && subscriptions == {}
  //   POST Q6: weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"d"};
    obj.carPark := {"d"};
    obj.reservedCarPark := {"d"};
    obj.Repr := {obj};
    var old_weekend := obj.weekend;
    obj.closeCarPark();
    expect obj.Valid();
    expect obj.carPark == {} && obj.reservedCarPark == {} && obj.subscriptions == {};
    expect obj.weekend == old_weekend;
    expect obj[..] == _module.CarPark; // observed from implementation
  }

  // Test case for combination {1}/R9:
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
    obj.subscriptions := {"d", "e"};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    obj.closeCarPark();
    expect obj.Valid();
    expect obj.weekend == false;
    expect obj.carPark == {};
    expect obj.reservedCarPark == {};
    expect obj.subscriptions == {};
    expect obj[..] == _module.CarPark; // observed from implementation
  }

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
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var car: seq<char> := ['f'];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_carPark2 := |obj.carPark|;
    var old_subscriptions := obj.subscriptions;
    var success := obj.enterCarPark(car);
    expect obj.Valid();
    expect success == false || success == true;
    expect obj.weekend == false;
    expect obj.carPark == old_carPark + {car};
    expect obj.subscriptions == old_subscriptions;
    expect obj[..] == _module.CarPark; // observed from implementation
    expect success == true; // observed from implementation
  }

  // Test case for combination {7}:
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
  //   POST Q8: subscriptions == old(subscriptions)
  //   POST Q9: reservedCarPark == old(reservedCarPark)
  //   POST Q10: weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {""};
    obj.carPark := {};
    obj.reservedCarPark := {""};
    obj.Repr := {obj};
    var car: seq<char> := ['d'];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_carPark2 := |obj.carPark|;
    var old_subscriptions := obj.subscriptions;
    var success := obj.enterCarPark(car);
    expect obj.Valid();
    expect success == true || success == false;
    expect obj.weekend == false;
    expect obj.carPark == old_carPark + {car};
    expect obj.subscriptions == old_subscriptions;
    expect obj.reservedCarPark == old_reservedCarPark;
    expect obj[..] == _module.CarPark; // observed from implementation
    expect success == true; // observed from implementation
  }

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
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var car: seq<char> := [];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_reservedCarPark2 := |obj.reservedCarPark|;
    var old_subscriptions := obj.subscriptions;
    var success := obj.enterReservedCarPark(car);
    expect obj.Valid();
    expect success == false || success == true;
    expect obj.weekend == false;
    expect !(car in obj.subscriptions);
    expect car !in obj.subscriptions;
    expect obj.subscriptions == old_subscriptions;
    expect obj[..] == _module.CarPark; // observed from implementation
    expect success == false; // observed from implementation
  }

}

method Failing()
{
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
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var car: seq<char> := ['f'];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_subscriptions := obj.subscriptions;
    var success := obj.leaveCarPark(car);
    // actual runtime state: obj=_module.CarPark, success=false
    // expect obj.Valid(); // got true
    // expect success == false || success == true; // got true
    // expect obj.weekend == false; // LHS=false, RHS=false
    // expect obj.carPark == old_carPark - {car}; // LHS={}, RHS={}
    // expect !(obj.reservedCarPark == old_reservedCarPark); // got false
    // expect obj.reservedCarPark == old_reservedCarPark; // LHS={}, RHS={}
    // expect obj.subscriptions == old_subscriptions; // LHS={}, RHS={}
  }

  // Test case for combination {2}/BnormalSpaces=0:
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
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var car: seq<char> := ['e'];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_subscriptions := obj.subscriptions;
    var success := obj.leaveCarPark(car);
    // actual runtime state: obj=_module.CarPark, success=false
    // expect obj.Valid(); // got true
    // expect success == false || success == true; // got true
    // expect obj.weekend == false; // LHS=false, RHS=false
    // expect obj.carPark == old_carPark - {car}; // LHS={}, RHS={}
    // expect !(obj.reservedCarPark == old_reservedCarPark); // got false
    // expect obj.reservedCarPark == old_reservedCarPark; // LHS={}, RHS={}
    // expect obj.subscriptions == old_subscriptions; // LHS={}, RHS={}
  }

  // Test case for combination {2}/BnormalSpaces=1:
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
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var car: seq<char> := ['e'];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_subscriptions := obj.subscriptions;
    var success := obj.leaveCarPark(car);
    // actual runtime state: obj=_module.CarPark, success=false
    // expect obj.Valid(); // got true
    // expect success == false || success == true; // got true
    // expect obj.weekend == false; // LHS=false, RHS=false
    // expect obj.carPark == old_carPark - {car}; // LHS={}, RHS={}
    // expect !(obj.reservedCarPark == old_reservedCarPark); // got false
    // expect obj.reservedCarPark == old_reservedCarPark; // LHS={}, RHS={}
    // expect obj.subscriptions == old_subscriptions; // LHS={}, RHS={}
  }

  // Test case for combination {2}/BreservedSpaces=0:
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
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var car: seq<char> := ['g'];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_subscriptions := obj.subscriptions;
    var success := obj.leaveCarPark(car);
    // actual runtime state: obj=_module.CarPark, success=false
    // expect obj.Valid(); // got true
    // expect success == false || success == true; // got true
    // expect obj.weekend == false; // LHS=false, RHS=false
    // expect obj.carPark == old_carPark - {car}; // LHS={}, RHS={}
    // expect !(obj.reservedCarPark == old_reservedCarPark); // got false
    // expect obj.reservedCarPark == old_reservedCarPark; // LHS={}, RHS={}
    // expect obj.subscriptions == old_subscriptions; // LHS={}, RHS={}
  }

  // Test case for combination {2}/BreservedSpaces=1:
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
    obj.subscriptions := {};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var car: seq<char> := ['g'];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_subscriptions := obj.subscriptions;
    var success := obj.leaveCarPark(car);
    // actual runtime state: obj=_module.CarPark, success=false
    // expect obj.Valid(); // got true
    // expect success == false || success == true; // got true
    // expect obj.weekend == false; // LHS=false, RHS=false
    // expect obj.carPark == old_carPark - {car}; // LHS={}, RHS={}
    // expect !(obj.reservedCarPark == old_reservedCarPark); // got false
    // expect obj.reservedCarPark == old_reservedCarPark; // LHS={}, RHS={}
    // expect obj.subscriptions == old_subscriptions; // LHS={}, RHS={}
  }

  // Test case for combination {7}/BreservedSpaces=0:
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
  //   POST Q8: reservedCarPark == old(reservedCarPark) - {car}
  //   POST Q9: carPark == old(carPark)
  //   POST Q10: car !in carPark
  //   POST Q11: car !in reservedCarPark
  //   POST Q12: subscriptions == old(subscriptions)
  //   POST Q13: weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {};
    obj.carPark := {"c"};
    obj.reservedCarPark := {"", "d"};
    obj.Repr := {obj};
    var car: seq<char> := ['g'];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_subscriptions := obj.subscriptions;
    var success := obj.leaveCarPark(car);
    // actual runtime state: obj=_module.CarPark, success=false
    // expect obj.Valid(); // got true
    // expect success == true || success == false; // got true
    // expect obj.weekend == false; // LHS=false, RHS=false
    // expect obj.carPark == old_carPark - {car}; // LHS={['c']}, RHS={['c']}
    // expect !(obj.reservedCarPark == old_reservedCarPark); // got false
    // expect obj.reservedCarPark == old_reservedCarPark - {car}; // LHS={[], ['d']}, RHS={[], ['d']}
    // expect obj.carPark == old_carPark; // LHS={['c']}, RHS={['c']}
    // expect car !in obj.carPark; // got true
    // expect car !in obj.reservedCarPark; // got true
    // expect obj.subscriptions == old_subscriptions; // LHS={}, RHS={}
  }

  // Test case for combination {7}/O|carPark|=1:
  //   NOTE: Z3 returned UNKNOWN on full query (likely quantifier incompleteness).
  //         Inputs chosen from preconditions-only fallback; postconditions NOT verified by Z3.
  //         Expected output values may be spurious — Dafny static check will flag if so.
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: success ==> (car in old(carPark) && carPark == old(carPark) - {car} && reservedCarPark == old(reservedCarPark)) || (car in old(reservedCarPark) && reservedCarPark == old(reservedCarPark) - {car} && carPark == old(carPark))
  //   POST Q6: success ==> car !in carPark && car !in reservedCarPark
  //   POST Q7: !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && car !in old(carPark) && car !in old(reservedCarPark)
  //   POST Q8: subscriptions == old(subscriptions) && weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"f"};
    obj.carPark := {"f"};
    obj.reservedCarPark := {"f"};
    obj.Repr := {obj};
    var car: seq<char> := [];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_subscriptions := obj.subscriptions;
    var old_weekend := obj.weekend;
    var success := obj.leaveCarPark(car);
    // actual runtime state: obj=_module.CarPark, success=false
    // expect obj.Valid(); // got false
    // expect success ==> (car in old_carPark && obj.carPark == old_carPark - {car} && obj.reservedCarPark == old_reservedCarPark) || (car in old_reservedCarPark && obj.reservedCarPark == old_reservedCarPark - {car} && obj.carPark == old_carPark); // got true
    // expect success ==> car !in obj.carPark && car !in obj.reservedCarPark; // got true
    // expect !success ==> obj.carPark == old_carPark && obj.reservedCarPark == old_reservedCarPark && car !in old_carPark && car !in old_reservedCarPark; // got true
    // expect obj.subscriptions == old_subscriptions && obj.weekend == old_weekend; // got true
  }

  // Test case for combination {7}/O|reservedCarPark|>=2:
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
  //   POST Q8: reservedCarPark == old(reservedCarPark) - {car}
  //   POST Q9: carPark == old(carPark)
  //   POST Q10: car !in carPark
  //   POST Q11: car !in reservedCarPark
  //   POST Q12: subscriptions == old(subscriptions)
  //   POST Q13: weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"", "a", "e", "g"};
    obj.carPark := {"", "a", "e", "g"};
    obj.reservedCarPark := {"a", "e"};
    obj.Repr := {obj};
    var car: seq<char> := ['c'];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_subscriptions := obj.subscriptions;
    var success := obj.leaveCarPark(car);
    // actual runtime state: obj=_module.CarPark, success=false
    // expect obj.Valid(); // got false
    // expect success == true || success == false; // got true
    // expect obj.weekend == false; // LHS=false, RHS=false
    // expect obj.carPark == old_carPark - {car}; // LHS={[], ['a'], ['e'], ['g']}, RHS={[], ['a'], ['e'], ['g']}
    // expect !(obj.reservedCarPark == old_reservedCarPark); // got false
    // expect obj.reservedCarPark == old_reservedCarPark - {car}; // LHS={['a'], ['e']}, RHS={['a'], ['e']}
    // expect obj.carPark == old_carPark; // LHS={[], ['a'], ['e'], ['g']}, RHS={[], ['a'], ['e'], ['g']}
    // expect car !in obj.carPark; // got true
    // expect car !in obj.reservedCarPark; // got true
    // expect obj.subscriptions == old_subscriptions; // LHS={[], ['a'], ['e'], ['g']}, RHS={[], ['a'], ['e'], ['g']}
  }

  // Test case for combination {7}/Oweekend=true:
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
  //   POST Q8: reservedCarPark == old(reservedCarPark) - {car}
  //   POST Q9: carPark == old(carPark)
  //   POST Q10: car !in carPark
  //   POST Q11: car !in reservedCarPark
  //   POST Q12: subscriptions == old(subscriptions)
  //   POST Q13: weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := true;
    obj.subscriptions := {"b", "c", "e", "f"};
    obj.carPark := {};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var car: seq<char> := ['a'];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_subscriptions := obj.subscriptions;
    var success := obj.leaveCarPark(car);
    // actual runtime state: obj=_module.CarPark, success=false
    // expect obj.Valid(); // got true
    // expect success == true || success == false; // got true
    // expect obj.weekend == true; // LHS=true, RHS=true
    // expect obj.carPark == old_carPark - {car}; // LHS={}, RHS={}
    // expect !(obj.reservedCarPark == old_reservedCarPark); // got false
    // expect obj.reservedCarPark == old_reservedCarPark - {car}; // LHS={}, RHS={}
    // expect obj.carPark == old_carPark; // LHS={}, RHS={}
    // expect car !in obj.carPark; // got true
    // expect car !in obj.reservedCarPark; // got true
    // expect obj.subscriptions == old_subscriptions; // LHS={['b'], ['c'], ['e'], ['f']}, RHS={['b'], ['c'], ['e'], ['f']}
  }

  // Test case for combination {3}:
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
  //   POST Q10: car !in old(subscriptions)
  //   POST Q11: old(|subscriptions|) >= reservedSpaces
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"c", "d", "e", "g"};
    obj.carPark := {""};
    obj.reservedCarPark := {};
    obj.Repr := {obj};
    var car: seq<char> := ['a'];
    var old_subscriptions := |obj.subscriptions|;
    var old_subscriptions2 := obj.subscriptions;
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var success := obj.makeSubscription(car);
    // actual runtime state: obj=_module.CarPark, success=false
    // expect obj.Valid(); // got true
    // expect success == false || success == true; // got true
    // expect obj.weekend == false; // LHS=false, RHS=false
    // expect obj.subscriptions == old_subscriptions2 + {car}; // LHS={['c'], ['d'], ['e'], ['g']}, RHS={['a'], ['c'], ['d'], ['e'], ['g']}
    // expect obj.carPark == old_carPark; // LHS={[]}, RHS={[]}
    // expect obj.reservedCarPark == old_reservedCarPark; // LHS={}, RHS={}
  }

  // Test case for combination {3}/O|carPark|>=2:
  //   NOTE: Z3 returned UNKNOWN on full query (likely quantifier incompleteness).
  //         Inputs chosen from preconditions-only fallback; postconditions NOT verified by Z3.
  //         Expected output values may be spurious — Dafny static check will flag if so.
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: success ==> old(|subscriptions|) < reservedSpaces && car !in old(subscriptions) && subscriptions == old(subscriptions) + {car}
  //   POST Q6: !success ==> subscriptions == old(subscriptions) && (car in old(subscriptions) || old(|subscriptions|) >= reservedSpaces)
  //   POST Q7: carPark == old(carPark) && reservedCarPark == old(reservedCarPark) && weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"", "b", "e", "f"};
    obj.carPark := {"", "b", "e", "f"};
    obj.reservedCarPark := {"", "b", "e", "f"};
    obj.Repr := {obj};
    var car: seq<char> := ['c'];
    var old_subscriptions := |obj.subscriptions|;
    var old_subscriptions2 := obj.subscriptions;
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_weekend := obj.weekend;
    var success := obj.makeSubscription(car);
    // actual runtime state: obj=_module.CarPark, success=false
    // expect obj.Valid(); // got false
    // expect success ==> old_subscriptions < obj.reservedSpaces && car !in old_subscriptions2 && obj.subscriptions == old_subscriptions2 + {car}; // got true
    // expect !success ==> obj.subscriptions == old_subscriptions2 && (car in old_subscriptions2 || old_subscriptions >= obj.reservedSpaces); // got true
    // expect obj.carPark == old_carPark && obj.reservedCarPark == old_reservedCarPark && obj.weekend == old_weekend; // got true
  }

  // Test case for combination {3}/O|carPark|>=2:
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
  //   POST Q10: car !in old(subscriptions)
  //   POST Q11: old(|subscriptions|) >= reservedSpaces
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"", "a", "b", "c", "d", "e", "f", "g"};
    obj.carPark := {"b", "f"};
    obj.reservedCarPark := {"b", "f"};
    obj.Repr := {obj};
    var car: seq<char> := [];
    var old_subscriptions := |obj.subscriptions|;
    var old_subscriptions2 := obj.subscriptions;
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var success := obj.makeSubscription(car);
    // actual runtime state: obj=_module.CarPark, success=false
    // expect obj.Valid(); // got false
    // expect success == false || success == true; // got true
    // expect obj.weekend == false; // LHS=false, RHS=false
    // expect obj.subscriptions == old_subscriptions2 + {car}; // LHS={[], ['a'], ['b'], ['c'], ['d'], ['e'], ['f'], ['g']}, RHS={[], ['a'], ['b'], ['c'], ['d'], ['e'], ['f'], ['g']}
    // expect obj.carPark == old_carPark; // LHS={['b'], ['f']}, RHS={['b'], ['f']}
    // expect obj.reservedCarPark == old_reservedCarPark; // LHS={['b'], ['f']}, RHS={['b'], ['f']}
  }

  // Test case for combination {1}/BreservedSpaces=1:
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
    obj.subscriptions := {"e"};
    obj.carPark := {"e"};
    obj.reservedCarPark := {"e"};
    obj.Repr := {obj};
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_subscriptions := obj.subscriptions;
    obj.openReservedArea();
    // actual runtime state: obj=_module.CarPark
    // expect obj.Valid(); // got false
    // expect obj.weekend == true; // LHS=true, RHS=true
    // expect obj.carPark == old_carPark; // LHS={['e']}, RHS={['e']}
    // expect obj.reservedCarPark == old_reservedCarPark; // LHS={['e']}, RHS={['e']}
    // expect obj.subscriptions == old_subscriptions; // LHS={['e']}, RHS={['e']}
  }

  // Test case for combination {7}/O|reservedCarPark|=1:
  //   NOTE: Z3 returned UNKNOWN on full query (likely quantifier incompleteness).
  //         Inputs chosen from preconditions-only fallback; postconditions NOT verified by Z3.
  //         Expected output values may be spurious — Dafny static check will flag if so.
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: success ==> car !in old(carPark) && car !in old(reservedCarPark) && old(|carPark|) < normalSpaces - badParkingBuffer
  //   POST Q6: success ==> carPark == old(carPark) + {car}
  //   POST Q7: !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark)
  //   POST Q8: !success ==> car in old(carPark) || car in old(reservedCarPark) || old(|carPark|) >= normalSpaces - badParkingBuffer
  //   POST Q9: subscriptions == old(subscriptions) && reservedCarPark == old(reservedCarPark) && weekend == old(weekend)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"f"};
    obj.carPark := {"f"};
    obj.reservedCarPark := {"f"};
    obj.Repr := {obj};
    var car: seq<char> := [];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_carPark2 := |obj.carPark|;
    var old_subscriptions := obj.subscriptions;
    var old_weekend := obj.weekend;
    var success := obj.enterCarPark(car);
    // actual runtime state: obj=_module.CarPark
    // expect obj.Valid(); // got false
    // expect success ==> car !in old_carPark && car !in old_reservedCarPark && old_carPark2 < obj.normalSpaces - obj.badParkingBuffer; // got true
    // expect success ==> obj.carPark == old_carPark + {car}; // got true
    // expect !success ==> obj.carPark == old_carPark && obj.reservedCarPark == old_reservedCarPark; // got true
    // expect !success ==> car in old_carPark || car in old_reservedCarPark || old_carPark2 >= obj.normalSpaces - obj.badParkingBuffer; // got true
    // expect obj.subscriptions == old_subscriptions && obj.reservedCarPark == old_reservedCarPark && obj.weekend == old_weekend; // got true
  }

  // Test case for combination {3}/R2:
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
    obj.subscriptions := {"c", "d", "g"};
    obj.carPark := {"c", "d", "g"};
    obj.reservedCarPark := {"d"};
    obj.Repr := {obj};
    var car: seq<char> := ['d'];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_carPark2 := |obj.carPark|;
    var old_subscriptions := obj.subscriptions;
    var success := obj.enterCarPark(car);
    // actual runtime state: obj=_module.CarPark, success=false
    // expect obj.Valid(); // got false
    // expect success == false || success == true; // got true
    // expect obj.weekend == false; // LHS=false, RHS=false
    // expect obj.carPark == old_carPark + {car}; // LHS={['c'], ['d'], ['g']}, RHS={['c'], ['d'], ['g']}
    // expect obj.subscriptions == old_subscriptions; // LHS={['c'], ['d'], ['g']}, RHS={['c'], ['d'], ['g']}
  }

  // Test case for combination {5}:
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
  //   POST Q11: subscriptions == old(subscriptions)
  //   POST Q12: old(|reservedCarPark|) >= reservedSpaces
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"", "d", "e", "g"};
    obj.carPark := {"", "d", "e", "g"};
    obj.reservedCarPark := {"", "d", "e", "g"};
    obj.Repr := {obj};
    var car: seq<char> := ['c'];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_reservedCarPark2 := |obj.reservedCarPark|;
    var old_subscriptions := obj.subscriptions;
    var success := obj.enterReservedCarPark(car);
    // actual runtime state: obj=_module.CarPark, success=false
    // expect obj.Valid(); // got false
    // expect success == false || success == true; // got true
    // expect obj.weekend == false; // LHS=false, RHS=false
    // expect !(car in obj.subscriptions); // got true
    // expect car !in obj.subscriptions; // got true
    // expect obj.subscriptions == old_subscriptions; // LHS={[], ['d'], ['e'], ['g']}, RHS={[], ['d'], ['e'], ['g']}
  }

  // Test case for combination {8}/O|carPark|=1:
  //   NOTE: Z3 returned UNKNOWN on full query (likely quantifier incompleteness).
  //         Inputs chosen from preconditions-only fallback; postconditions NOT verified by Z3.
  //         Expected output values may be spurious — Dafny static check will flag if so.
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   PRE:  true
  //   PRE:  true
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: success ==> car !in old(carPark) && car !in old(reservedCarPark) && old(|reservedCarPark|) < reservedSpaces && (car in subscriptions || weekend == true)
  //   POST Q6: success ==> reservedCarPark == old(reservedCarPark) + {car}
  //   POST Q7: !success ==> carPark == old(carPark) && reservedCarPark == old(reservedCarPark)
  //   POST Q8: !success ==> car in old(carPark) || car in old(reservedCarPark) || old(|reservedCarPark|) >= reservedSpaces || (car !in subscriptions && weekend == false)
  //   POST Q9: subscriptions == old(subscriptions) && carPark == old(carPark) && weekend == old(weekend)
  //   POST Q10: weekend == old(weekend) && subscriptions == old(subscriptions)
  {
    var obj := new CarPark();
    obj.weekend := false;
    obj.subscriptions := {"d"};
    obj.carPark := {"d"};
    obj.reservedCarPark := {"d"};
    obj.Repr := {obj};
    var car: seq<char> := ['c'];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_reservedCarPark2 := |obj.reservedCarPark|;
    var old_subscriptions := obj.subscriptions;
    var old_weekend := obj.weekend;
    var success := obj.enterReservedCarPark(car);
    // actual runtime state: obj=_module.CarPark, success=false
    // expect obj.Valid(); // got false
    // expect success ==> car !in old_carPark && car !in old_reservedCarPark && old_reservedCarPark2 < obj.reservedSpaces && (car in obj.subscriptions || obj.weekend == true); // got true
    // expect success ==> obj.reservedCarPark == old_reservedCarPark + {car}; // got true
    // expect !success ==> obj.carPark == old_carPark && obj.reservedCarPark == old_reservedCarPark; // got true
    // expect !success ==> car in old_carPark || car in old_reservedCarPark || old_reservedCarPark2 >= obj.reservedSpaces || (car !in obj.subscriptions && obj.weekend == false); // got true
    // expect obj.subscriptions == old_subscriptions && obj.carPark == old_carPark && obj.weekend == old_weekend; // got true
    // expect obj.weekend == old_weekend && obj.subscriptions == old_subscriptions; // got true
  }

  // Test case for combination {3}/R2:
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
    obj.subscriptions := {"c", "e", "f", "g"};
    obj.carPark := {};
    obj.reservedCarPark := {"c", "e", "f", "g"};
    obj.Repr := {obj};
    var car: seq<char> := ['e'];
    var old_carPark := obj.carPark;
    var old_reservedCarPark := obj.reservedCarPark;
    var old_reservedCarPark2 := |obj.reservedCarPark|;
    var old_subscriptions := obj.subscriptions;
    var success := obj.enterReservedCarPark(car);
    // actual runtime state: obj=_module.CarPark, success=false
    // expect obj.Valid(); // got false
    // expect success == false || success == true; // got true
    // expect obj.weekend == false; // LHS=false, RHS=false
    // expect !(car in obj.subscriptions); // got false
    // expect car !in obj.subscriptions; // got false
    // expect obj.subscriptions == old_subscriptions; // LHS={['c'], ['e'], ['f'], ['g']}, RHS={['c'], ['e'], ['f'], ['g']}
  }

}

method Main()
{
  Passing();
  Failing();
}
