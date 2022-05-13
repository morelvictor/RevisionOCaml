# RevisionOCaml

## Exercice 1:

Les cordes (en anglais, ropes) sont une structure arborescente qui permet de représenter des suites de caractères. 
Plus précisément, une corde est un arbre binaire dont chaque feuille contient une chaîne de caractère.

### Question 1: 
Définissez un type `rope` qui permet de représenter les cordes.

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

## Exercice 2 : Files d'attente avec limite de taille

On va chercher à définir un module Fifo pour manipuler des files d'attente à capacité limitée. Ce module contiendra :

  - Un type 'a t qui représente une file d'attente dont les éléments sont de type 'a,
  - Deux exceptions Empty et Full,
  - Une fonction `make : 'a -> int -> 'a t` telle que `make default n` crée et renvoie une file d'attente vide avec une capacité de `n` (la valeur de l'argument `default` n'a pas d'importance, mais elle sera nécessaire pour l'initialisation du tableau sous-jacent),
  - Une fonction `push : 'a -> 'a t -> unit` qui ajoute un élément à une file d'attente (ou lève l'exception `Fifo.Full` sans modifier la file si celle-ci est déjà pleine)
  - Une fonction `pop : 'a t -> 'a` qui enlève l'élément le plus ancien de la file d'attente, et renvoie sa valeur (ou lève l'exception `Fifo.Empty` sans modifier la file si celle-ci est vide),
  - Une fonction `peek : 'a t -> 'a` qui renvoie l'élément le plus ancien sans modifier la file (ou lève l'exception `Fifo.Empty` si celle-ci est vide),
  - Deux fonctions `is_empty` et `is_full` de type `'a t -> bool`.

### Question 1

Définissez un module `Fifo` contenant seulement le `type 'a t`, qui doit être un type enregistement avec :

   - Un champ data de type `'a array`,
   - Un champ capacity de type `int`,
   - Deux champs modifiables `next` et `oldest` de type `int`,
   - Deux champs modifiables `empty` et `full` de type `bool`.

### Question 2 

Ajoutez à votre module les deux exceptions `Empty` et `Full`.

### Question 3 

Ajoutez à votre module la fonction make. Si on appelle Fifo.make default n alors :

   - Le champ `data` doit être initialisé avec un tableau de taille `n` rempli avec l'élément `default`,
   - Le champ `capacity` doit valoir `n`,
   - Les champs `next` et `oldest` doivent être initialisés à `0`,
   - Le champ `empty` doit être initialisé à `true`,
   - Le champ `full` doit être initialisé à `true` ou `false`, selon la valeur de `n`.

### Question 4 

Ajoutez à votre module la fonction push. Quelques remarques :

   - Si la file est pleine, il faut lever l'exeption `Full` sans la modifier,
   - Le nouvel élément doit être placé dans le tableau `.data` à l'indice `.next`,
   - Ensuite, le champ `.next` doit être incrémenté,
   - Si, après l'incrémentation, `.next` a dépassé strictement l'indice maximal du tableau, alors il faut « boucler », c'est-à-dire mettre `.next` à `0`,
   - Si après cette étape, `.next` est égal à `.oldest`, alors la pile est désormais pleine, et il faut mettre à jour le champ correspondant,
   - Dans tous les cas, la pile et désormais non vide, et il faut donc mettre à jour le champ correspondant.

### Question 5 

 Ajoutez à votre module la fonction `peek`. L'élément le plus ancien est situé à l'indice `.oldest`.

### Question 6 

Ajoutez à votre module la fonction `pop`. Comme dans le cas de `push`, n'oubliez pas de « boucler » si nécessaire, et de mettre à jour les champs `.empty` et `.full`.

### Question 7 

Ajoutez à votre module les fonctions `is_empty` et `is_full`.

### Question 8 

Sans utiliser la fonction `Fifo.is_empty`, définissez une fonction `fifo_iter : ('a -> unit) -> 'a Fifo.t -> unit` telle que `fifo_iter f fifo` vide complètement la file `fifo`, et applique successivement la fonction `f` à chacun de ses éléments, du plus ancien au plus récent.

