module CheckEquiv

open FStar.Tactics.V2
open FStar.Ghost

let g (x:int) : int = x

let must (r:ret_t 'a) : Tac 'a =
  match r with
  | Some x, [] -> x
  | _, issues ->
    log_issues issues;
    fail "must failed"

#push-options "--no_smt"
let _ = assert True by begin
  let env = cur_env () in
  let _ = must <| check_equiv env (`1) (`(g 1)) in
  ()
end

let _ = assert True by begin
  let env = cur_env () in
  let _ = must <| check_equiv env (`1) (`1) in
  ()
end

let _ = assert True by begin
  let env = cur_env () in
  let _ = must <| check_equiv env (`(1+1)) (`(3-1)) in
  ()
end

let _ = assert True by begin
  let env = cur_env () in
  let _ = must <| check_equiv env (`1) (`(reveal u#0 #int (hide u#0 #int 1))) in
  ()
end

[@@expect_failure] // this is fine, as nosmt implies nodelta
let _ = assert True by begin
  let env = cur_env () in
  let _ = must <| check_equiv_nosmt env (`1) (`(g 1)) in
  ()
end

let _ = assert True by begin
  let env = cur_env () in
  let _ = must <| check_equiv_nosmt env (`1) (`1) in
  ()
end

let _ = assert True by begin
  let env = cur_env () in
  let _ = must <| check_equiv_nosmt env (`(1+1)) (`(3-1)) in
  ()
end

let _ = assert True by begin
  let env = cur_env () in
  let _ = must <| check_equiv_nosmt env (`1) (`(reveal #int (hide #int 1))) in
  ()
end

#pop-options
