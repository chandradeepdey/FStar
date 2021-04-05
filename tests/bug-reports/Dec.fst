module Dec

let rec f (x y:nat)
  : Tot unit (decreases y)
  = if y = 0 then ()
    else f (x + 1) (y - 1)

let rec f1 (x y :nat)
  : Tot unit (decreases y)
  = if y = 0 then ()
    else f2 (x + 1) (y - 1)

and f2 (x y:nat)
  : Tot unit (decreases y)
  = if y = 0 then ()
    else f1 (x + 1) (y - 1)

let pred (x y:nat) : prop = (x <= y) == true
let rec g (x' y' : nat)
  : Lemma (requires y' >= x')
          (ensures (pred x' y'))
          (decreases y')
  = if x' > 0
    then g (x' - 1) (y' - 1)
    else ()


[@@expect_failure [19]]
let rec h (x y : nat)
  : Lemma (requires False)
          (ensures (pred x y))
          (decreases y)
  = if x > 0
    then h (x - 1) (y - 1)
    else ()

let rec h (x y : nat)
  : Lemma (requires x <= y)
          (ensures (pred x y))
          (decreases y)
  = if x > 0
    then h (x - 1) (y - 1)
    else ()

val old (x:nat) (y:nat)
  : Tot unit (decreases y)
let rec old (a b:nat)
  = if b = 0 then ()
    else old (a + 1) (b - 1)

val old2 (x:nat) (y:nat)
  : Tot unit (decreases y)
let rec old2 (a b:nat)
  : Tot unit
  = if b = 0 then ()
    else old2 (a + 1) (b - 1)

let rec simple (x:nat) (y:nat)
  : Tot unit (decreases y)
  = if y = 0 then ()
    else simple x (y - 1)

val last: l:list 'a {Cons? l} -> Tot 'a
let rec last = function
  | [hd] -> hd
  | _::tl -> last tl

let rec tt : int -> int = fun x -> x
let rec tt' : int -> Dv int = fun x -> tt' x

let test_inner_let_rec (x y:nat)
  : Lemma (requires x <= y)
          (ensures pred x y)
  = let rec aux (x:nat) (y:nat)
        : Lemma (requires (x <= y))
                (ensures (pred x y))
                (decreases y)
        = if x = 0 then ()
          else aux (x - 1) (y - 1)
    in
    aux x y
