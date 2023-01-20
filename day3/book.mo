module Book {

  public type Book = {
      name : Text;
      pages : Nat;
  };

  func create_book(title : Text, pages : Nat) : Book {
    let abook = {
      name = title;
      pages = pages;
    };

    abook;
  }
}