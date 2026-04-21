// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny-mini-project_tmp_tmpjxr3wzqh_src_project2a__-_ODL_Sub-left.dfy
// Method: add
// Generated: 2026-03-28 22:05:22

// dafny-mini-project_tmp_tmpjxr3wzqh_src_project2a.dfy

function rem<T(==)>(x: T, s: seq<T>): seq<T>
  ensures x !in rem(x, s)
  ensures forall i: int {:trigger rem(x, s)[i]} :: 0 <= i < |rem(x, s)| ==> rem(x, s)[i] in s
  ensures forall i: int {:trigger s[i]} :: 0 <= i < |s| && s[i] != x ==> s[i] in rem(x, s)
  decreases s
{
  if |s| == 0 then
    []
  else if s[0] == x then
    rem(x, s[1..])
  else
    [s[0]] + rem(x, s[1..])
}

class Address {
  constructor ()
  {
  }
}

class Date {
  constructor ()
  {
  }
}

class MessageId {
  constructor ()
  {
  }
}

class Message {
  var id: MessageId
  var content: string
  var date: Date
  var sender: Address
  var recipients: seq<Address>

  constructor (s: Address)
    ensures fresh(id)
    ensures fresh(date)
    ensures content == ""
    ensures sender == s
    ensures recipients == []
    decreases s
  {
    id := new MessageId();
    date := new Date();
    this.content := "";
    this.sender := s;
    this.recipients := [];
  }

  method setContent(c: string)
    modifies this
    ensures content == c
    decreases c
  {
    this.content := c;
  }

  method setDate(d: Date)
    modifies this
    ensures date == d
    decreases d
  {
    this.date := d;
  }

  method addRecipient(p: nat, r: Address)
    requires p < |recipients|
    modifies this
    ensures |recipients| == |(recipients)| + 1
    ensures recipients[p] == r
    ensures forall i: int {:trigger (recipients[i])} {:trigger recipients[i]} :: 0 <= i < p ==> recipients[i] == (recipients[i])
    ensures forall i: int {:trigger recipients[i]} :: p < i < |recipients| ==> recipients[i] == (recipients[i - 1])
    decreases p, r
  {
    this.recipients := this.recipients[..p] + [r] + this.recipients[p..];
  }
}

class Mailbox {
  var messages: set<Message>
  var name: string

  constructor (n: string)
    ensures name == n
    ensures messages == {}
    decreases n
  {
    name := n;
    messages := {};
  }

  method add(m: Message)
    modifies this
    ensures m in messages
    ensures messages == (messages) + {m}
    decreases m
  {
    messages := {m} + messages;
  }

  method remove(m: Message)
    requires m in messages
    modifies this
    ensures m !in messages
    ensures messages == (messages) - {m}
    decreases m
  {
    messages := {m};
  }

  method empty()
    modifies this
    ensures messages == {}
  {
    messages := {};
  }
}

class MailApp {
  var userboxes: set<Mailbox>
  var inbox: Mailbox
  var drafts: Mailbox
  var trash: Mailbox
  var sent: Mailbox
  var userboxList: seq<Mailbox>

  predicate Valid()
    reads this
    decreases {this}
  {
    inbox != drafts &&
    inbox != trash &&
    inbox != sent &&
    drafts != trash &&
    drafts != sent &&
    inbox !in userboxList &&
    drafts !in userboxList &&
    trash !in userboxList &&
    sent !in userboxList &&
    forall i: int {:trigger userboxList[i]} :: 
      0 <= i < |userboxList| ==>
        userboxList[i] in userboxes
  }

  constructor ()
  {
    inbox := new Mailbox("Inbox");
    drafts := new Mailbox("Drafts");
    trash := new Mailbox("Trash");
    sent := new Mailbox("Sent");
    userboxList := [];
  }

  method deleteMailbox(mb: Mailbox)
    requires Valid()
    requires mb in userboxList
    decreases mb
  {
  }

  method newMailbox(n: string)
    requires Valid()
    requires !exists mb: Mailbox {:trigger mb.name} {:trigger mb in userboxList} | mb in userboxList :: mb.name == n
    modifies this
    ensures exists mb: Mailbox {:trigger mb.name} {:trigger mb in userboxList} | mb in userboxList :: mb.name == n
    decreases n
  {
    var mb := new Mailbox(n);
    userboxList := [mb] + userboxList;
  }

  method newMessage(s: Address)
    requires Valid()
    modifies this.drafts
    ensures exists m: Message {:trigger m.sender} {:trigger m in drafts.messages} | m in drafts.messages :: m.sender == s
    decreases s
  {
    var m := new Message(s);
    drafts.add(m);
  }

  method moveMessage(m: Message, mb1: Mailbox, mb2: Mailbox)
    requires Valid()
    requires m in mb1.messages
    requires m !in mb2.messages
    modifies mb1, mb2
    ensures m !in mb1.messages
    ensures m in mb2.messages
    decreases m, mb1, mb2
  {
    mb1.remove(m);
    mb2.add(m);
  }

  method deleteMessage(m: Message, mb: Mailbox)
    requires Valid()
    requires m in mb.messages
    requires m !in trash.messages
    modifies m, mb, this.trash
    decreases m, mb
  {
    moveMessage(m, mb, trash);
  }

  method sendMessage(m: Message)
    requires Valid()
    requires m in drafts.messages
    requires m !in sent.messages
    modifies this.drafts, this.sent
    decreases m
  {
    moveMessage(m, drafts, sent);
  }

  method emptyTrash()
    requires Valid()
    modifies this.trash
    ensures trash.messages == {}
  {
    trash.empty();
  }
}


method GeneratedTests_add()
{
  // Test case for combination {1}:
  //   POST: m in messages
  //   POST: messages == old(messages) + {m}
  {
    var obj := new Mailbox(1);
    var tmp_messages: set<Message> := {};
    obj.messages := tmp_messages;
    var tmp_name: string := [];
    obj.name := tmp_name;
    var m := 0;
    var old_messages := obj.messages;
    obj.add(m);
    expect m in obj.messages;
    expect obj.messages == old_messages + {m};
  }

  // Test case for combination {1}/Bmessages=0,name=0,n=0:
  //   POST: m in messages
  //   POST: messages == old(messages) + {m}
  {
    var obj := new Mailbox(1);
    var tmp_messages: set<Message> := {};
    obj.messages := tmp_messages;
    var tmp_name: string := [];
    obj.name := tmp_name;
    var m := -2;
    var old_messages := obj.messages;
    obj.add(m);
    expect m in obj.messages;
    expect obj.messages == old_messages + {m};
  }

  // Test case for combination {1}/Bmessages=2,name=0,n=2:
  //   POST: m in messages
  //   POST: messages == old(messages) + {m}
  {
    var obj := new Mailbox(1);
    var tmp_messages: set<Message> := {1, 5};
    obj.messages := tmp_messages;
    var tmp_name: string := [];
    obj.name := tmp_name;
    var m := 3;
    var old_messages := obj.messages;
    obj.add(m);
    expect m in obj.messages;
    expect obj.messages == old_messages + {m};
  }

  // Test case for combination {1}/Bmessages=2,name=0,n=3:
  //   POST: m in messages
  //   POST: messages == old(messages) + {m}
  {
    var obj := new Mailbox(1);
    var tmp_messages: set<Message> := {0, 3};
    obj.messages := tmp_messages;
    var tmp_name: string := [];
    obj.name := tmp_name;
    var m := 5;
    var old_messages := obj.messages;
    obj.add(m);
    expect m in obj.messages;
    expect obj.messages == old_messages + {m};
  }

}

method GeneratedTests_remove()
{
  // Test case for combination {1}:
  //   PRE:  m in messages
  //   POST: m !in messages
  //   POST: messages == old(messages) - {m}
  {
    var obj := new Mailbox(1);
    var tmp_messages: set<Message> := {-2};
    obj.messages := tmp_messages;
    var tmp_name: string := [];
    obj.name := tmp_name;
    var m := -2;
    var old_messages := obj.messages;
    expect m in obj.messages; // PRE-CHECK
    obj.remove(m);
    expect m !in obj.messages;
    expect obj.messages == old_messages - {m};
  }

  // Test case for combination {1}/Bmessages=2,name=0,n=2:
  //   PRE:  m in messages
  //   POST: m !in messages
  //   POST: messages == old(messages) - {m}
  {
    var obj := new Mailbox(1);
    var tmp_messages: set<Message> := {2, 3};
    obj.messages := tmp_messages;
    var tmp_name: string := [];
    obj.name := tmp_name;
    var m := 2;
    var old_messages := obj.messages;
    expect m in obj.messages; // PRE-CHECK
    obj.remove(m);
    expect m !in obj.messages;
    expect obj.messages == old_messages - {m};
  }

  // Test case for combination {1}/Bmessages=2,name=0,n=3:
  //   PRE:  m in messages
  //   POST: m !in messages
  //   POST: messages == old(messages) - {m}
  {
    var obj := new Mailbox(1);
    var tmp_messages: set<Message> := {-2, 4};
    obj.messages := tmp_messages;
    var tmp_name: string := [];
    obj.name := tmp_name;
    var m := -2;
    var old_messages := obj.messages;
    expect m in obj.messages; // PRE-CHECK
    obj.remove(m);
    expect m !in obj.messages;
    expect obj.messages == old_messages - {m};
  }

  // Test case for combination {1}/Bmessages=2,name=1,n=0:
  //   PRE:  m in messages
  //   POST: m !in messages
  //   POST: messages == old(messages) - {m}
  {
    var obj := new Mailbox(1);
    var tmp_messages: set<Message> := {2, 3};
    obj.messages := tmp_messages;
    var tmp_name: string := [];
    obj.name := tmp_name;
    var m := 3;
    var old_messages := obj.messages;
    expect m in obj.messages; // PRE-CHECK
    obj.remove(m);
    expect m !in obj.messages;
    expect obj.messages == old_messages - {m};
  }

}

method GeneratedTests_empty()
{
  // Test case for combination {1}:
  //   POST: messages == {}
  {
    var obj := new Mailbox(1);
    var tmp_messages: set<Message> := {};
    obj.messages := tmp_messages;
    var tmp_name: string := [];
    obj.name := tmp_name;
    obj.empty();
    expect obj.messages == {};
  }

  // Test case for combination {1}/Bmessages=2,name=0,n=2:
  //   POST: messages == {}
  {
    var obj := new Mailbox(1);
    var tmp_messages: set<Message> := {0, 1};
    obj.messages := tmp_messages;
    var tmp_name: string := [];
    obj.name := tmp_name;
    obj.empty();
    expect obj.messages == {};
  }

  // Test case for combination {1}/Bmessages=2,name=0,n=3:
  //   POST: messages == {}
  {
    var obj := new Mailbox(1);
    var tmp_messages: set<Message> := {1, 2};
    obj.messages := tmp_messages;
    var tmp_name: string := [];
    obj.name := tmp_name;
    obj.empty();
    expect obj.messages == {};
  }

  // Test case for combination {1}/Bmessages=2,name=1,n=0:
  //   POST: messages == {}
  {
    var obj := new Mailbox(1);
    var tmp_messages: set<Message> := {-2, -1};
    obj.messages := tmp_messages;
    var tmp_name: string := [];
    obj.name := tmp_name;
    obj.empty();
    expect obj.messages == {};
  }

}

method Main()
{
  GeneratedTests_add();
  print "GeneratedTests_add: all tests passed!\n";
  GeneratedTests_remove();
  print "GeneratedTests_remove: all tests passed!\n";
  GeneratedTests_empty();
  print "GeneratedTests_empty: all tests passed!\n";
}
