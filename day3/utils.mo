import Array "mo:base/Array";
import Int "mo:base/Int";
import Buffer "mo:base/Buffer";

module Utils {
    public func second_maximum(array : [Int]) : Int {
      var sorted_array = Array.sort(array, Int.compare);

      sorted_array[sorted_array.size() - 2];
    };

    public func remove_even(array : [Nat]) : [Nat] {
      Array.filter(array, func(x: Nat) : Bool { x % 2 == 1});
    };

    public func drop<T>(xs : [T], n : Nat) : [T] {
      let buf = Buffer.fromArray<T>(xs);
      let sub_buf = Buffer.subBuffer(buf, n, buf.size() - n);
      Buffer.toArray(sub_buf);
    };

}
