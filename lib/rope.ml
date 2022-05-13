
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
        | Node(x, y) -> (if length x > i then nth x i else nth y (i - (length y)))

let fold_left f acc r = String.fold_left f acc (string_of_rope r)

let rec split_at r i = 
    if i < 0 || i >= length r then (if i < 0 then (Leaf(""), r) else (r, Leaf("")))
    else match r with 
    | Leaf(s) -> (Leaf(String.sub s 0 (i-1)), Leaf(String.sub s (i-1) ((String.length s) - i + 1)))
    | Node(a, b) -> 
        if length a > i then 
            let (g, d) = split_at a i in 
            (g, concat d b)
        else
            let (g, d) = split_at b (i - length a + 1 ) in
            (concat a g, d)

let show r = 
    let rec aux r = 
    match r with
    | Leaf(s) -> "Leaf(" ^ s ^ ")"
    | Node(x, y) -> "Node(" ^ aux x ^ ", " ^ aux y ^ ")"
    in print_string (aux r)