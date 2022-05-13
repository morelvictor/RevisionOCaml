type 'a t = {
  data: 'a array;
  capacity: int;
  mutable next: int;
  mutable oldest: int;
  mutable empty: bool;
  mutable full: bool
}

exception Empty
exception Full

val make: 'a -> int -> 'a t