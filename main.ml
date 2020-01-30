open Egyptian


let e1 = S.of_list [Z.of_int 2;Z.of_int 8]
let e2 = S.of_list [Z.of_int 10;Z.of_int 8;Z.of_int 120]
let q = to_modern (add e1 e2)




let () = 
  Printf.printf "%s\n%s\n%s\n" (egyptian_to_string e1) (egyptian_to_string e2) (egyptian_to_string (add e1 e2))
