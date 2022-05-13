type rope = | Node of (rope * rope) | Leaf of string


let string_to_rope s = Leaf(s)

let concat r1 r2 = Node(r1, r2)

let length r = 
    let rec aux r acc = 
        match r with
        | Node(x, y) -> (aux x 0) + (aux y 0)
        | Leaf(s) -> acc + String.length s
    in aux r 0

let string_of_rope r = 
    let rec aux acc r =
        match r with
        | Leaf(s) -> acc ^ s
        | Node(x, y) -> acc ^ (aux "" x) ^ (aux "" y)
    in aux "" r

let rec nth r i = 
    if i < 0 || i >= length r then None 
    else match r with 
        | Leaf(s) -> (if (String.length s) < i then None else Some(String.get s i))
        | Node(x, y) -> (if length x > i then nth x i else nth y (i- (length y)))

let fold_left f acc r = String.fold_left f acc (string_of_rope r)