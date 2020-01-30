open Egyptian


let e1 = S.of_list [Z.of_int 2;Z.of_int 8]
let e2 = S.of_list [Z.of_int 10;Z.of_int 8;Z.of_int 120]


(*Test the conversion from Egyptian to modern*)
let test_to_modern = assert ((Q.compare (Q.make (Z.of_int 5) (Z.of_int 8)) (to_modern e1))==0)

(*Test adding an egyptian fraction to itself*)
let test_add_self = assert ((Q.compare (to_modern (add e1 e1)) (Q.add (to_modern e1) (to_modern e1)))==0)

(*Test adding unequal egyptian fractions*)
let test_add_unequal = assert ((Q.compare (to_modern (add e1 e2)) (Q.add (to_modern e1) (to_modern e2)))==0)


let () = Printf.printf "All tests pass\n"
