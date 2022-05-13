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

let make d n = 
  {
    data = Array.make n d;
    capacity = n;
    next = 0;
    oldest = 0;
    empty = true;
    full = n = 0
  }

let push f i = 
  if f.full then raise Full 
  else f.data.(f.next) <- i;
    f.next <- (f.next + 1);
    (if f.next >= f.capacity then f.next <- 0);
    (if f.next = f.oldest then f.full <- true);
    f.empty <- false

let peek f = if f.empty then raise Empty else f.data.(f.oldest)


let pop f = if f.empty then raise Empty else
  let value = peek f in
  f.oldest <- f.oldest + 1;
  (if f.oldest >= f.capacity then f.oldest <- 0);
  (if f.next = f.oldest then f.empty <- true);
  f.full <- false;
  value

let is_empty f = f.empty

let is_full f = f.full