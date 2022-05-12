type rope = | Node of (rope * rope) | Leaf of string


let string_to_rope s = Leaf(s)

let concat r1 r2 = Node(r1, r2)

let length r = 
    let rec aux r acc = 
        match r with
        | Node(x, y) -> (aux x 0) + (aux y 0)
        | Leaf(s) -> acc + String.length s
    in aux r 0

(*let rec nth r i = 
    if i < 0 || length r <= i then None 
    else 
        match r with
        | Node(x, y) -> *)
        
