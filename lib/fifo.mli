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

val push: 'a t -> 'a -> unit

val peek: 'a t -> 'a

val pop: 'a t -> 'a

val is_empty: 'a t -> bool

val is_full: 'a t -> bool

val iter: ('a -> unit) -> 'a t -> unit