import List "mo:base/List";

import Utils "utils";
import Book "book";

actor {

  // Variables of type Book
  let book1 : Book.Book = {
    name = "Think!";
    pages = 250;
  };

  let book2 : Book.Book = {
    name = "Learn Motoko";
    pages = 450;
  };

  // List of books
  var book_list : List.List<Book.Book> = List.nil<Book.Book>();

  // function to add a book to the book_list
  func add_book(abook : Book.Book) : () {
    book_list := List.push(abook, book_list);
  };

  // function to get books as an array of Book
  public query func get_books() : async [Book.Book] {
    List.toArray<Book.Book>(book_list);
  };

  // Some test public functions
  public query func test_second_maximum() : async Int {
    let arr : [Int] = [5,1,3,4,2,6];
    Utils.second_maximum(arr);
  };

  public query func test_drop() : async [Nat] {
    let arr_in : [Nat] = [1,2,3,4,5,6];
    let arr_out = Utils.drop<Nat>(arr_in, 2);
    arr_out;
  };

  public func test_add_book() : async List.List<Book.Book> {
    add_book(book1);
    add_book(book2);
    book_list;
  }
};
