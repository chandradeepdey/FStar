(*
   Copyright 2008-2016 Microsoft Research

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*)

module FStar.Tactics.Native

open FStar.Compiler.Range
open FStar.Syntax.Syntax
open FStar.Tactics.Types

module Cfg   = FStar.TypeChecker.Cfg
module N     = FStar.TypeChecker.Normalize
module PO    = FStar.TypeChecker.Primops

type itac = PO.psc -> FStar.Syntax.Embeddings.norm_cb -> universes -> args -> option term

type native_primitive_step =
    { name: FStar.Ident.lid;
      arity: Prims.int;
      strong_reduction_ok: bool;
      tactic: itac}

val list_all            : unit -> list native_primitive_step
