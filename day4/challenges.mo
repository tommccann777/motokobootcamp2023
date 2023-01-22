import List "mo:base/List";
import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import HashMap "mo:base/Hashmap";
import Principal "mo:base/Principal";

actor Challenge {

  let usernames = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);

  public shared ({ caller }) func add_username(name : Text) : async () {
    usernames.put(caller, name);
  };

  public query func get_usernames() : async [(Principal, Text)] {
    Iter.toArray<(Principal, Text)>(usernames.entries());
  };

  public shared ({caller}) func is_anonymous() : async Bool {
    Principal.isAnonymous(caller);
  };

  public query func test_unique(arr : [Nat]) : async List.List<Nat> {
    var alist : List.List<Nat> = List.fromArray<Nat>(arr);
    var unique_list = unique(alist, func(x : Nat, y : Nat):Bool {x == y});

    unique_list;
  };

/* work in progress - I can't get the syntax correct

  func unique<T> (alist : List.List<T>, equal: (T,T) -> Bool) : List.List<T> {
    var an_array : [T] = List.toArray<T>(alist);
    let nodupes = Buffer.Buffer<Nat>(an_array.size());

    for (element : T in an_array.vals()) {
      if (Buffer.contains(nodupes, element, equal) == false) nodupes.add(element);
    };

    var resultbuf : [T] = Buffer.toArray(nodupes);
    List.fromArray(resultBuf);
  };
*/

  func reverse<T>(l : List.List<T>) : async List.List<T> {
    return List.reverse(l);
  };

  func find_in_buffer<T> (buf: Buffer.Buffer<T>, val: T, equal: (T,T) -> Bool) : ?Nat {
    Buffer.indexOf(val, buf, equal);
  };



};

