(*For bigints. Probably unnecessary machinery, but why not.*)
open Z
(*For representing egyptian fractions as modern fractions.*)
(*open Q*)
(*To make a set of bigints.*)
open Set
module S = Set.Make(Z)


(*I represent an egyptian fraction by a set of integers,
 * representing the reciprocals which comprise it.*)
type egyptian_fraction =  S.t

(* Convert an egyptian fraction to a modern fraction *)
let to_modern x = S.fold (fun z  q -> Q.add q (Q.make Z.one z)) x Q.zero



let e = S.of_list [Z.of_int 2;Z.of_int 8]
let q = to_modern e




let () = Printf.printf "%s\n" (Q.to_string q)
