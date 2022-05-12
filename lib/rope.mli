
type rope = | Node of (rope * rope) | Leaf of string

val string_to_rope: string -> rope

val concat: rope -> rope -> rope

val length: rope -> int

