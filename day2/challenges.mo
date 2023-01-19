import Array "mo:base/Array";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Buffer "mo:base/Buffer";

actor {
  type Pattern = Text.Pattern;

  public query func average_array(array : [Int]) : async Int {
    var total : Int = 0;

    for(num in array.vals()) {
      total += num;
    };

    total / array.size();
  };


  public query func count_character(t : Text, c : Char) : async Nat {
    var occurrences : Nat = 0;

    for (letter in t.chars()) {
      if (letter == c) occurrences := occurrences + 1;
    };

    occurrences;
  };


  public query func factorial(n : Nat) :  async Nat {
    var result : Nat = 1;
    var counter : Nat = n;

    while (counter > 1) {
      result := result * counter;
      counter := counter - 1;
    };

    result;
  };


  public query func number_of_words(t : Text) : async Nat {
    Iter.size(Text.tokens(t, #char ' '));
  };

  public query func find_duplicates(a : [Nat]) : async [Nat] {
    let dupes = Buffer.Buffer<Nat>(a.size());

    for (num in a.vals()) {
      if (hasDuplicate(a, num)) {
        if (not Buffer.contains<Nat>(dupes, num, func(x: Nat, y: Nat) : Bool { x == y})) dupes.add(num);
      }
    };

    Buffer.toArray(dupes);
  };


  public query func convert_to_binary(n : Nat) : async Text {

    var result : Text = "";
    var working_num : Nat = n;

    while (working_num > 0) {
      if (working_num % 2 == 0) {
        result := "0" # result;
      } else {
        result := "1" # result;
      };
      working_num := working_num / 2;
    };

    return result;
  };

  // private functions
  func hasDuplicate(arr : [Nat], num : Nat) : Bool {
    var occurrences : Nat = 0;

    for (element in arr.vals()) {
      if (element == num) occurrences := occurrences + 1;
      if (occurrences > 1) return true;
    };

    return false;
  };

}