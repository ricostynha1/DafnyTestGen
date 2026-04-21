// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\CS5232_Project_tmp_tmpai_cfrng_LFUSimple__1025-1036_COI.dfy
// Method: getLFUKey
// Generated: 2026-03-28 22:00:57

// CS5232_Project_tmp_tmpai_cfrng_LFUSimple.dfy

method Main()
{
  var LFUCache := new LFUCache(5);
  print "Cache Capacity = 5 \n";
  print "PUT (1, 1) - ";
  LFUCache.put(1, 1);
  print "PUT (2, 2) - ";
  LFUCache.put(2, 2);
  print "PUT (3, 3) - ";
  LFUCache.put(3, 3);
  print "GET (1) - ";
  var val := LFUCache.get(1);
  print "get(1) = ";
  print val;
  print "\n";
  print "PUT (3, 5) - ";
  LFUCache.put(3, 5);
  print "GET (3) - ";
  val := LFUCache.get(3);
  print "get(3) = ";
  print val;
  print "\n";
  print "PUT (4, 6) - ";
  LFUCache.put(4, 6);
  print "PUT (5, 7) - ";
  LFUCache.put(5, 7);
  print "PUT (10, 100) - ";
  LFUCache.put(10, 100);
  print "GET (2) - ";
  val := LFUCache.get(2);
  print "get(2) = ";
  print val;
  print "\n";
}

class LFUCache {
  var capacity: int
  var cacheMap: map<int, (int, int)>

  constructor (capacity: int)
    requires capacity > 0
    ensures Valid()
    decreases capacity
  {
    this.capacity := capacity;
    this.cacheMap := map[];
  }

  predicate Valid()
    reads this
    decreases {this}
  {
    this.capacity > 0 &&
    0 <= |cacheMap| <= capacity &&
    (|cacheMap| > 0 ==>
      forall e: int {:trigger cacheMap[e]} {:trigger e in cacheMap} :: 
        e in cacheMap ==>
          cacheMap[e].1 >= 1) &&
    (|cacheMap| > 0 ==>
      forall e: int {:trigger cacheMap[e]} {:trigger e in cacheMap} :: 
        e in cacheMap ==>
          cacheMap[e].0 >= 0)
  }

  method getLFUKey() returns (lfuKey: int)
    requires Valid()
    requires |cacheMap| > 0
    ensures Valid()
    ensures lfuKey in cacheMap
    ensures forall k: (int, (int, int)) {:trigger k.0} {:trigger k in cacheMap.Items} :: k in cacheMap.Items ==> cacheMap[lfuKey].1 <= cacheMap[k.0].1
  {
    var items := cacheMap.Items;
    var seenItems := {};
    var anyItem :| !(anyItem in items);
    var minFreq := anyItem.1.1;
    lfuKey := anyItem.0;
    while items != {}
      invariant cacheMap.Items >= items
      invariant cacheMap.Items >= seenItems
      invariant cacheMap.Items == seenItems + items
      invariant lfuKey in cacheMap
      invariant cacheMap[lfuKey].1 == minFreq
      invariant forall e: (int, (int, int)) {:trigger e.1} {:trigger e in seenItems} :: e in seenItems ==> minFreq <= e.1.1
      invariant forall e: (int, (int, int)) {:trigger e.0} {:trigger e in seenItems} :: e in seenItems ==> minFreq <= cacheMap[e.0].1
      invariant forall e: (int, (int, int)) {:trigger e.0} {:trigger e in seenItems} :: e in seenItems ==> cacheMap[lfuKey].1 <= cacheMap[e.0].1
      invariant exists e: (int, (int, int)) {:trigger e.1} {:trigger e in seenItems + items} :: !(e in seenItems + items) || minFreq == e.1.1
      decreases |items|
    {
      var item :| item in items;
      if item.1.1 < minFreq {
        lfuKey := item.0;
        minFreq := item.1.1;
      }
      items := items - {item};
      seenItems := seenItems + {item};
    }
    assert seenItems == cacheMap.Items;
    assert cacheMap[lfuKey].1 == minFreq;
    assert forall e: (int, (int, int)) {:trigger e.1} {:trigger e in seenItems} :: e in seenItems ==> minFreq <= e.1.1;
    assert forall e: (int, (int, int)) {:trigger e.1} {:trigger e in cacheMap.Items} :: e in cacheMap.Items ==> minFreq <= e.1.1;
    assert forall k: (int, (int, int)) {:trigger k.0} {:trigger k in seenItems} :: k in seenItems ==> cacheMap[lfuKey].1 <= cacheMap[k.0].1;
    assert forall k: (int, (int, int)) {:trigger k.0} {:trigger k in cacheMap.Items} :: k in cacheMap.Items ==> cacheMap[lfuKey].1 <= cacheMap[k.0].1;
    return lfuKey;
  }

  method get(key: int) returns (value: int)
    requires Valid()
    modifies this
    ensures Valid()
    ensures key !in cacheMap ==> value == -1
    ensures forall e: int {:trigger e in cacheMap} {:trigger e in (cacheMap)} :: e in (cacheMap) <==> e in cacheMap
    ensures forall e: int {:trigger cacheMap[e]} {:trigger (cacheMap[e])} {:trigger e in (cacheMap)} :: e in (cacheMap) ==> (cacheMap[e].0) == cacheMap[e].0
    ensures key in cacheMap ==> value == cacheMap[key].0 && (cacheMap[key].1) == cacheMap[key].1 - 1
    decreases key
  {
    assert key in cacheMap ==> cacheMap[key].0 >= 0;
    if key !in cacheMap {
      value := -1;
    } else {
      assert key in cacheMap;
      assert cacheMap[key].0 >= 0;
      value := cacheMap[key].0;
      var oldFreq := cacheMap[key].1;
      var newV := (value, oldFreq + 1);
      cacheMap := cacheMap[key := newV];
    }
    print "after get: ";
    print cacheMap;
    print "\n";
    return value;
  }

  method put(key: int, value: int)
    requires Valid()
    requires value > 0
    modifies this
    ensures Valid()
    decreases key, value
  {
    if key in cacheMap {
      var currFreq := cacheMap[key].1;
      cacheMap := cacheMap[key := (value, currFreq)];
    } else {
      if |cacheMap| < capacity {
        cacheMap := cacheMap[key := (value, 1)];
      } else {
        var LFUKey := getLFUKey();
        assert LFUKey in cacheMap;
        assert |cacheMap| == capacity;
        var oldMap := cacheMap;
        var newMap := cacheMap - {LFUKey};
        cacheMap := newMap;
        assert newMap == cacheMap - {LFUKey};
        assert LFUKey !in cacheMap;
        assert LFUKey in oldMap;
        var oldCard := |oldMap|;
        var newCard := |newMap|;
        assert |cacheMap.Keys| < |oldMap|;
        cacheMap := cacheMap[key := (value, 1)];
      }
    }
    print "after put: ";
    print cacheMap;
    print "\n";
  }
}


method GeneratedTests_getLFUKey()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  |cacheMap| > 0
  //   POST: Valid()
  //   POST: lfuKey in cacheMap
  //   POST: forall k: (int, (int, int)) {:trigger k.0} {:trigger k in cacheMap.Items} :: k in cacheMap.Items ==> cacheMap[lfuKey].1 <= cacheMap[k.0].1
  {
    var obj := new LFUCache(8);
    obj.capacity := 8;
    var tmp_cacheMap: map<int, (int, int)> := map[-2 := 0, -1 := 0, 0 := 0, 1 := 0, 2 := 0, 3 := 0, 4 := 0, 5 := 0];
    obj.cacheMap := tmp_cacheMap;
    expect obj.Valid(); // PRE-CHECK
    expect |obj.cacheMap| > 0; // PRE-CHECK
    var lfuKey := obj.getLFUKey();
    expect obj.Valid();
    expect lfuKey in obj.cacheMap;
    expect forall k: (int, (int, int)) {:trigger k.0} {:trigger k in obj.cacheMap.Items} :: k in obj.cacheMap.Items ==> obj.cacheMap[lfuKey].1 <= obj.cacheMap[k.0].1;
  }

  // Test case for combination {1}/Bcapacity=1,cacheMap=1:
  //   PRE:  Valid()
  //   PRE:  |cacheMap| > 0
  //   POST: Valid()
  //   POST: lfuKey in cacheMap
  //   POST: forall k: (int, (int, int)) {:trigger k.0} {:trigger k in cacheMap.Items} :: k in cacheMap.Items ==> cacheMap[lfuKey].1 <= cacheMap[k.0].1
  {
    var obj := new LFUCache(1);
    obj.capacity := 1;
    var tmp_cacheMap: map<int, (int, int)> := map[3 := 0];
    obj.cacheMap := tmp_cacheMap;
    expect obj.Valid(); // PRE-CHECK
    expect |obj.cacheMap| > 0; // PRE-CHECK
    var lfuKey := obj.getLFUKey();
    expect obj.Valid();
    expect lfuKey in obj.cacheMap;
    expect forall k: (int, (int, int)) {:trigger k.0} {:trigger k in obj.cacheMap.Items} :: k in obj.cacheMap.Items ==> obj.cacheMap[lfuKey].1 <= obj.cacheMap[k.0].1;
  }

  // Test case for combination {1}/Bcapacity=2,cacheMap=1:
  //   PRE:  Valid()
  //   PRE:  |cacheMap| > 0
  //   POST: Valid()
  //   POST: lfuKey in cacheMap
  //   POST: forall k: (int, (int, int)) {:trigger k.0} {:trigger k in cacheMap.Items} :: k in cacheMap.Items ==> cacheMap[lfuKey].1 <= cacheMap[k.0].1
  {
    var obj := new LFUCache(2);
    obj.capacity := 2;
    var tmp_cacheMap: map<int, (int, int)> := map[3 := 0];
    obj.cacheMap := tmp_cacheMap;
    expect obj.Valid(); // PRE-CHECK
    expect |obj.cacheMap| > 0; // PRE-CHECK
    var lfuKey := obj.getLFUKey();
    expect obj.Valid();
    expect lfuKey in obj.cacheMap;
    expect forall k: (int, (int, int)) {:trigger k.0} {:trigger k in obj.cacheMap.Items} :: k in obj.cacheMap.Items ==> obj.cacheMap[lfuKey].1 <= obj.cacheMap[k.0].1;
  }

  // Test case for combination {1}/Bcapacity=2,cacheMap=2:
  //   PRE:  Valid()
  //   PRE:  |cacheMap| > 0
  //   POST: Valid()
  //   POST: lfuKey in cacheMap
  //   POST: forall k: (int, (int, int)) {:trigger k.0} {:trigger k in cacheMap.Items} :: k in cacheMap.Items ==> cacheMap[lfuKey].1 <= cacheMap[k.0].1
  {
    var obj := new LFUCache(2);
    obj.capacity := 2;
    var tmp_cacheMap: map<int, (int, int)> := map[1 := 0, 2 := 0];
    obj.cacheMap := tmp_cacheMap;
    expect obj.Valid(); // PRE-CHECK
    expect |obj.cacheMap| > 0; // PRE-CHECK
    var lfuKey := obj.getLFUKey();
    expect obj.Valid();
    expect lfuKey in obj.cacheMap;
    expect forall k: (int, (int, int)) {:trigger k.0} {:trigger k in obj.cacheMap.Items} :: k in obj.cacheMap.Items ==> obj.cacheMap[lfuKey].1 <= obj.cacheMap[k.0].1;
  }

}

method GeneratedTests_get()
{
  // Test case for combination {2,3}:
  //   PRE:  Valid()
  //   POST: Valid()
  //   POST: !(key !in cacheMap)
  //   POST: forall e: int {:trigger e in cacheMap} {:trigger e in old(cacheMap)} :: e in old(cacheMap) <==> e in cacheMap
  //   POST: forall e: int {:trigger cacheMap[e]} {:trigger old(cacheMap[e])} {:trigger e in old(cacheMap)} :: e in old(cacheMap) ==> old(cacheMap[e].0) == cacheMap[e].0
  //   POST: value == cacheMap[key].0
  //   POST: old(cacheMap[key].1) == cacheMap[key].1 - 1
  //   POST: value == -1
  //   POST: !(key in cacheMap)
  {
    var obj := new LFUCache(1);
    obj.capacity := 0;
    var tmp_cacheMap: map<int, (int, int)> := map[];
    obj.cacheMap := tmp_cacheMap;
    var key := 0;
    var old_cacheMap := obj.cacheMap;
    var old_cacheMap_key_1 := obj.cacheMap[key].1;
    var check_value := obj.cacheMap[key].0;
    expect obj.Valid(); // PRE-CHECK
    var value := obj.get(key);
    expect obj.Valid();
    expect !(key !in obj.cacheMap);
    expect forall e: int {:trigger e in obj.cacheMap} {:trigger e in old_cacheMap} :: e in old_cacheMap <==> e in obj.cacheMap;
    expect forall e: int {:trigger obj.cacheMap[e]} {:trigger old(obj.cacheMap[e])} {:trigger e in old_cacheMap} :: e in old_cacheMap ==> old(obj.cacheMap[e].0) == obj.cacheMap[e].0;
    expect value == check_value;
    expect old_cacheMap_key_1 == obj.cacheMap[key].1 - 1;
    expect value == check_value;
    expect !(key in obj.cacheMap);
  }

}

method GeneratedTests_put()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  value > 0
  //   POST: Valid()
  {
    var obj := new LFUCache(1);
    obj.capacity := 0;
    var tmp_cacheMap: map<int, (int, int)> := map[];
    obj.cacheMap := tmp_cacheMap;
    var key := 0;
    var value := 1;
    expect obj.Valid(); // PRE-CHECK
    expect value > 0; // PRE-CHECK
    obj.put(key, value);
    expect obj.Valid();
  }

  // Test case for combination {1}/Bkey=0,value=1,capacity=1,cacheMap=0:
  //   PRE:  Valid()
  //   PRE:  value > 0
  //   POST: Valid()
  {
    var obj := new LFUCache(1);
    obj.capacity := 1;
    var tmp_cacheMap: map<int, (int, int)> := map[];
    obj.cacheMap := tmp_cacheMap;
    var key := 0;
    var value := 1;
    expect obj.Valid(); // PRE-CHECK
    expect value > 0; // PRE-CHECK
    obj.put(key, value);
    expect obj.Valid();
  }

  // Test case for combination {1}/Bkey=1,value=2,capacity=2,cacheMap=1:
  //   PRE:  Valid()
  //   PRE:  value > 0
  //   POST: Valid()
  {
    var obj := new LFUCache(1);
    obj.capacity := 2;
    var tmp_cacheMap: map<int, (int, int)> := map[];
    obj.cacheMap := tmp_cacheMap;
    var key := 1;
    var value := 2;
    expect obj.Valid(); // PRE-CHECK
    expect value > 0; // PRE-CHECK
    obj.put(key, value);
    expect obj.Valid();
  }

}
