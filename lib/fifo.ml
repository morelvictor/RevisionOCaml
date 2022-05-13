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

let make p n = 
  {
    data = Array.make n p;
    capacity = n;
    next = 0;
    oldest = 0;
    empty = true;
    full = false            (*Pas sur de ça*)
  }