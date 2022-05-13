
open Lib.Rope

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

let () = 
    print_int (length example1); 
    print_newline();
    print_int (length example2);
    print_newline();
    print_string((string_of_rope example1) ^ "\n");
    (match (nth example1 1) with
    | Some(x) -> print_char x
    | None -> ());
    print_endline("");

