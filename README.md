# RevisionOCaml

## Exercice 1:

Les cordes (en anglais, ropes) sont une structure arborescente qui permet de représenter des suites de caractères. 
Plus précisément, une corde est un arbre binaire dont chaque feuille contient une chaîne de caractère.

### Question 1: 
Définissez un type `rope` qui permette de représenter les cordes.

### Question 2: 
Définissez une valeur `example1 : rope` qui représente la corde déssinée ci-dessus.

### Question 3: 
Définissez une valeur `example2 : rope` différente de `example1`, mais qui code également la chaîne "Hello, world!".

### Question 4: 
Écrivez une fonction `string_to_rope : string -> rope` qui convertit une chaîne de caractères en corde.

### Question 5: 
Écrivez une fonction `concat : rope -> rope -> rope` qui concatène deux cordes.

### Question 6: 
Écrivez une fonction `length : rope -> int` qui calcule la longueur totale d'une corde (par exemple, length example1 doit s'évaluer sur 13).

### Question 7: 
Écrivez une fonction `nth : rope -> int -> char option` telle que nth rope n renvoie le caractère d'indice n dans rope (ou None si rope est trop courte). Par exemple, nth example1 1 doit s'évaluer sur Some 'e'.

### Question 8: 
Écrivez une fonction `rope_to_string : rope -> string` qui convertit une corde en chaîne de caractères.

### Question 9: 
Écrivez une fonction `fold_left : ('a -> char -> 'a) -> 'a -> rope -> 'a` telle que fold_left f init rope calcule init |> f c0 |> f c1 |> ... |> f cn-1, où c0, ..., cn-1 sont les caractères de rope. Vous pourrez vous aider de la fonction `String.fold_left : ('a -> char -> 'a) -> 'a -> string -> 'a` qui accomplit la même opération pour les chaînes de caractères.

### Quetion bonus (plus difficile): 
Écrivez une fonction `split_at : rope -> int -> rope * rope` qui sépare une corde en deux à un indice donné. 
Attention, cette fonction doit préserver au maximum la structure de l'arbre passé en argument.
