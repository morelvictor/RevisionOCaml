
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

