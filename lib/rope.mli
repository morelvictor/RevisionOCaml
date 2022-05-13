
type rope = | Node of (rope * rope) | Leaf of string

val string_to_rope: string -> rope

val concat: rope -> rope -> rope

val length: rope -> int

val string_of_rope: rope -> string

val nth: rope -> int -> char option

val fold_left: ('a -> char -> 'a) -> 'a -> rope -> 'a

