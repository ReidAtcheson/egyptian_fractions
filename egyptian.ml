(*For bigints. Probably unnecessary machinery, but why not.*)
open Z
(*For representing egyptian fractions as modern fractions.*)
(*To make a set of bigints.*) open Set
module S = Set.Make(Z)


(*I represent an egyptian fraction by a set of integers,
 * representing the reciprocals which comprise it.
 *
 * For example in mathematical notation {2,4,8} represents
 * the egyptian fraction 1/2 + 1/4 + 1/8
 *
 * *)
type egyptian_fraction =  S.t

(* Convert an egyptian fraction to a modern fraction *)
let to_modern x = S.fold (fun z  q -> Q.add q (Q.make Z.one z)) x Q.zero

(* Convert an egyptian fraction to a string *)

let egyptian_to_string x = S.fold (fun z s -> s ^ " + " ^ "1/"^(Z.to_string z)   ) x ""


(* Take a fraction of form 2/p and convert it to egyptian fraction
 * as 2/p = 1/p+1/2p+1/3p+1/6p*)
let double_to_egyptian p = S.of_list [p; (Z.of_int 2)*p ;(Z.of_int 3)*p;(Z.of_int 6)*p]

(* Add two egyptian fractions. *)
let rec add e1 e2 = 
  (*Form intersection of unit fractions that comprise e1 and e2*)
  let e12 = S.inter e1 e2 in
  if (S.is_empty e12) 
  (*If the intersection is empty, then
    * the sum of the two egyptian fractions is just
    * the union of the sets e1 and e2.
    * *)
    then (S.union e1 e2)
    (*Otherwise the sum contains a fraction
     * of the form 2/n, which we must convert
     * to egyptian form and then try again.*)
    else
      (*Find smallest integer in the intersection*)
      let e = S.min_elt e12 in
      (*Convert 2/e to egyptian form*)
      let egypt = double_to_egyptian e in
      (*Now that egypt accounts for the doubled fraction
       * we can remove it from e1 and e2*)
      let ebar1 = S.remove e e1 in
      let ebar2 = S.remove e e2 in
      (*Now add it all together!*)
      add egypt (add ebar1 ebar2)



(* Convert standard modern fraction to egyptian fraction by 
 * breaking it down into a sum of egyptian fraction singletons.
 *
 * For example: 3/5 = 1/5 + 1/5 + 1/5*)
let rec modern_to_egyptian q = 
  (*First get numerator*)
  let num = Q.num q in
  let den = Q.den q in
  (* If num is one, then q is already in Egyptian form *)
  if (num==Z.one) 
    then
      S.singleton den
    (*If num>1 then we can subtract 1/den from q 
     * and then recurse*)
    else
      let nextq = Q.make (num-Z.one) (den) in
      add (S.singleton den) (modern_to_egyptian nextq)




