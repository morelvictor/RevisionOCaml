
open Lib.Fifo

(* 
let example1 = 
    Node(
        Node(
            Leaf("Hello"), 
            Leaf(",")), 
        Node(
            Node(
                Leaf(" wor"), 
                Leaf("ld")), 
            Leaf("!")))

let example2 = Node(Leaf("Hello, "), Leaf("world!"))
*)

let uniter a = match a with _ -> ()

let () = 
    uniter(make 2 10);
    print_endline("");

