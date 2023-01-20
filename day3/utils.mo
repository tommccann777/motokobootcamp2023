import Array "mo:base/Array";
import Int "mo:base/Int";
import Buffer "mo:base/Buffer";

module Utils {
    func second_maximum(array : [Int]) : Int {
      var sorted_array = Array.sort(array, Int.compare);

      sorted_array[sorted_array.size() - 2];
    };

    func remove_even(array : [Nat]) : [Nat] {
      Array.filter(array, func(x: Nat) : Bool { x % 2 == 1});
    };

    func testdrop() : [Nat] {
      let arr_in : [Nat] = [1,2,3,4,5,6];
      let arr_out = drop<Nat>(arr_in, 2);
      arr_out;
    };

    func drop<T>(xs : [T], n : Nat) : [T] {
      let buf = Buffer.fromArray<T>(xs);
      let sub_buf = Buffer.subBuffer(buf, n, buf.size() - n);
      Buffer.toArray(sub_buf);
    };

}
