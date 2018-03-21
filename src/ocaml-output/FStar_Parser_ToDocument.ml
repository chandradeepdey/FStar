open Prims
let (should_print_fs_typ_app : Prims.bool FStar_ST.ref) =
  FStar_Util.mk_ref false 
let with_fs_typ_app :
  'Auu____19 'Auu____20 .
    Prims.bool -> ('Auu____19 -> 'Auu____20) -> 'Auu____19 -> 'Auu____20
  =
  fun b  ->
    fun printer  ->
      fun t  ->
        let b0 = FStar_ST.op_Bang should_print_fs_typ_app  in
        FStar_ST.op_Colon_Equals should_print_fs_typ_app b;
        (let res = printer t  in
         FStar_ST.op_Colon_Equals should_print_fs_typ_app b0; res)
  
let (str : Prims.string -> FStar_Pprint.document) =
  fun s  -> FStar_Pprint.doc_of_string s 
let default_or_map :
  'Auu____107 'Auu____108 .
    'Auu____107 ->
      ('Auu____108 -> 'Auu____107) ->
        'Auu____108 FStar_Pervasives_Native.option -> 'Auu____107
  =
  fun n1  ->
    fun f  ->
      fun x  ->
        match x with
        | FStar_Pervasives_Native.None  -> n1
        | FStar_Pervasives_Native.Some x' -> f x'
  
let (prefix2 :
  FStar_Pprint.document -> FStar_Pprint.document -> FStar_Pprint.document) =
  fun prefix_  ->
    fun body  ->
      FStar_Pprint.prefix (Prims.parse_int "2") (Prims.parse_int "1") prefix_
        body
  
let (op_Hat_Slash_Plus_Hat :
  FStar_Pprint.document -> FStar_Pprint.document -> FStar_Pprint.document) =
  fun prefix_  -> fun body  -> prefix2 prefix_ body 
let (jump2 : FStar_Pprint.document -> FStar_Pprint.document) =
  fun body  ->
    FStar_Pprint.jump (Prims.parse_int "2") (Prims.parse_int "1") body
  
let (infix2 :
  FStar_Pprint.document ->
    FStar_Pprint.document -> FStar_Pprint.document -> FStar_Pprint.document)
  = FStar_Pprint.infix (Prims.parse_int "2") (Prims.parse_int "1") 
let (infix0 :
  FStar_Pprint.document ->
    FStar_Pprint.document -> FStar_Pprint.document -> FStar_Pprint.document)
  = FStar_Pprint.infix (Prims.parse_int "0") (Prims.parse_int "1") 
let (break1 : FStar_Pprint.document) =
  FStar_Pprint.break_ (Prims.parse_int "1") 
let separate_break_map :
  'Auu____162 .
    FStar_Pprint.document ->
      ('Auu____162 -> FStar_Pprint.document) ->
        'Auu____162 Prims.list -> FStar_Pprint.document
  =
  fun sep  ->
    fun f  ->
      fun l  ->
        let uu____184 =
          let uu____185 =
            let uu____186 = FStar_Pprint.op_Hat_Hat sep break1  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____186  in
          FStar_Pprint.separate_map uu____185 f l  in
        FStar_Pprint.group uu____184
  
let precede_break_separate_map :
  'Auu____192 .
    FStar_Pprint.document ->
      FStar_Pprint.document ->
        ('Auu____192 -> FStar_Pprint.document) ->
          'Auu____192 Prims.list -> FStar_Pprint.document
  =
  fun prec  ->
    fun sep  ->
      fun f  ->
        fun l  ->
          let uu____218 =
            let uu____219 = FStar_Pprint.op_Hat_Hat prec FStar_Pprint.space
               in
            let uu____220 =
              let uu____221 = FStar_List.hd l  in
              FStar_All.pipe_right uu____221 f  in
            FStar_Pprint.precede uu____219 uu____220  in
          let uu____222 =
            let uu____223 = FStar_List.tl l  in
            FStar_Pprint.concat_map
              (fun x  ->
                 let uu____229 =
                   let uu____230 =
                     let uu____231 = f x  in
                     FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____231  in
                   FStar_Pprint.op_Hat_Hat sep uu____230  in
                 FStar_Pprint.op_Hat_Hat break1 uu____229) uu____223
             in
          FStar_Pprint.op_Hat_Hat uu____218 uu____222
  
let concat_break_map :
  'Auu____235 .
    ('Auu____235 -> FStar_Pprint.document) ->
      'Auu____235 Prims.list -> FStar_Pprint.document
  =
  fun f  ->
    fun l  ->
      let uu____253 =
        FStar_Pprint.concat_map
          (fun x  ->
             let uu____257 = f x  in FStar_Pprint.op_Hat_Hat uu____257 break1)
          l
         in
      FStar_Pprint.group uu____253
  
let (parens_with_nesting : FStar_Pprint.document -> FStar_Pprint.document) =
  fun contents  ->
    FStar_Pprint.surround (Prims.parse_int "2") (Prims.parse_int "0")
      FStar_Pprint.lparen contents FStar_Pprint.rparen
  
let (soft_parens_with_nesting :
  FStar_Pprint.document -> FStar_Pprint.document) =
  fun contents  ->
    FStar_Pprint.soft_surround (Prims.parse_int "2") (Prims.parse_int "0")
      FStar_Pprint.lparen contents FStar_Pprint.rparen
  
let (braces_with_nesting : FStar_Pprint.document -> FStar_Pprint.document) =
  fun contents  ->
    FStar_Pprint.surround (Prims.parse_int "2") (Prims.parse_int "1")
      FStar_Pprint.lbrace contents FStar_Pprint.rbrace
  
let (soft_braces_with_nesting :
  FStar_Pprint.document -> FStar_Pprint.document) =
  fun contents  ->
    FStar_Pprint.soft_surround (Prims.parse_int "2") (Prims.parse_int "1")
      FStar_Pprint.lbrace contents FStar_Pprint.rbrace
  
let (brackets_with_nesting : FStar_Pprint.document -> FStar_Pprint.document)
  =
  fun contents  ->
    FStar_Pprint.surround (Prims.parse_int "2") (Prims.parse_int "1")
      FStar_Pprint.lbracket contents FStar_Pprint.rbracket
  
let (soft_brackets_with_nesting :
  FStar_Pprint.document -> FStar_Pprint.document) =
  fun contents  ->
    FStar_Pprint.soft_surround (Prims.parse_int "2") (Prims.parse_int "1")
      FStar_Pprint.lbracket contents FStar_Pprint.rbracket
  
let (soft_begin_end_with_nesting :
  FStar_Pprint.document -> FStar_Pprint.document) =
  fun contents  ->
    let uu____279 = str "begin"  in
    let uu____280 = str "end"  in
    FStar_Pprint.soft_surround (Prims.parse_int "2") (Prims.parse_int "1")
      uu____279 contents uu____280
  
let separate_map_last :
  'Auu____285 .
    FStar_Pprint.document ->
      (Prims.bool -> 'Auu____285 -> FStar_Pprint.document) ->
        'Auu____285 Prims.list -> FStar_Pprint.document
  =
  fun sep  ->
    fun f  ->
      fun es  ->
        let l = FStar_List.length es  in
        let es1 =
          FStar_List.mapi
            (fun i  -> fun e  -> f (i <> (l - (Prims.parse_int "1"))) e) es
           in
        FStar_Pprint.separate sep es1
  
let separate_break_map_last :
  'Auu____330 .
    FStar_Pprint.document ->
      (Prims.bool -> 'Auu____330 -> FStar_Pprint.document) ->
        'Auu____330 Prims.list -> FStar_Pprint.document
  =
  fun sep  ->
    fun f  ->
      fun l  ->
        let uu____357 =
          let uu____358 =
            let uu____359 = FStar_Pprint.op_Hat_Hat sep break1  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____359  in
          separate_map_last uu____358 f l  in
        FStar_Pprint.group uu____357
  
let separate_map_or_flow :
  'Auu____364 .
    FStar_Pprint.document ->
      ('Auu____364 -> FStar_Pprint.document) ->
        'Auu____364 Prims.list -> FStar_Pprint.document
  =
  fun sep  ->
    fun f  ->
      fun l  ->
        if (FStar_List.length l) < (Prims.parse_int "10")
        then FStar_Pprint.separate_map sep f l
        else FStar_Pprint.flow_map sep f l
  
let flow_map_last :
  'Auu____391 .
    FStar_Pprint.document ->
      (Prims.bool -> 'Auu____391 -> FStar_Pprint.document) ->
        'Auu____391 Prims.list -> FStar_Pprint.document
  =
  fun sep  ->
    fun f  ->
      fun es  ->
        let l = FStar_List.length es  in
        let es1 =
          FStar_List.mapi
            (fun i  -> fun e  -> f (i <> (l - (Prims.parse_int "1"))) e) es
           in
        FStar_Pprint.flow sep es1
  
let separate_map_or_flow_last :
  'Auu____436 .
    FStar_Pprint.document ->
      (Prims.bool -> 'Auu____436 -> FStar_Pprint.document) ->
        'Auu____436 Prims.list -> FStar_Pprint.document
  =
  fun sep  ->
    fun f  ->
      fun l  ->
        if (FStar_List.length l) < (Prims.parse_int "10")
        then separate_map_last sep f l
        else flow_map_last sep f l
  
let soft_surround_separate_map :
  'Auu____473 .
    Prims.int ->
      Prims.int ->
        FStar_Pprint.document ->
          FStar_Pprint.document ->
            FStar_Pprint.document ->
              FStar_Pprint.document ->
                ('Auu____473 -> FStar_Pprint.document) ->
                  'Auu____473 Prims.list -> FStar_Pprint.document
  =
  fun n1  ->
    fun b  ->
      fun void_  ->
        fun opening  ->
          fun sep  ->
            fun closing  ->
              fun f  ->
                fun xs  ->
                  if xs = []
                  then void_
                  else
                    (let uu____518 = FStar_Pprint.separate_map sep f xs  in
                     FStar_Pprint.soft_surround n1 b opening uu____518
                       closing)
  
let soft_surround_map_or_flow :
  'Auu____528 .
    Prims.int ->
      Prims.int ->
        FStar_Pprint.document ->
          FStar_Pprint.document ->
            FStar_Pprint.document ->
              FStar_Pprint.document ->
                ('Auu____528 -> FStar_Pprint.document) ->
                  'Auu____528 Prims.list -> FStar_Pprint.document
  =
  fun n1  ->
    fun b  ->
      fun void_  ->
        fun opening  ->
          fun sep  ->
            fun closing  ->
              fun f  ->
                fun xs  ->
                  if xs = []
                  then void_
                  else
                    (let uu____573 = separate_map_or_flow sep f xs  in
                     FStar_Pprint.soft_surround n1 b opening uu____573
                       closing)
  
let (doc_of_fsdoc :
  (Prims.string,(Prims.string,Prims.string) FStar_Pervasives_Native.tuple2
                  Prims.list)
    FStar_Pervasives_Native.tuple2 -> FStar_Pprint.document)
  =
  fun uu____586  ->
    match uu____586 with
    | (comment,keywords) ->
        let uu____611 =
          let uu____612 =
            let uu____615 = str comment  in
            let uu____616 =
              let uu____619 =
                let uu____622 =
                  FStar_Pprint.separate_map FStar_Pprint.comma
                    (fun uu____631  ->
                       match uu____631 with
                       | (k,v1) ->
                           let uu____638 =
                             let uu____641 = str k  in
                             let uu____642 =
                               let uu____645 =
                                 let uu____648 = str v1  in [uu____648]  in
                               FStar_Pprint.rarrow :: uu____645  in
                             uu____641 :: uu____642  in
                           FStar_Pprint.concat uu____638) keywords
                   in
                [uu____622]  in
              FStar_Pprint.space :: uu____619  in
            uu____615 :: uu____616  in
          FStar_Pprint.concat uu____612  in
        FStar_Pprint.group uu____611
  
let (is_unit : FStar_Parser_AST.term -> Prims.bool) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Const (FStar_Const.Const_unit ) -> true
    | uu____652 -> false
  
let (matches_var : FStar_Parser_AST.term -> FStar_Ident.ident -> Prims.bool)
  =
  fun t  ->
    fun x  ->
      match t.FStar_Parser_AST.tm with
      | FStar_Parser_AST.Var y ->
          x.FStar_Ident.idText = (FStar_Ident.text_of_lid y)
      | uu____660 -> false
  
let (is_tuple_constructor : FStar_Ident.lident -> Prims.bool) =
  FStar_Parser_Const.is_tuple_data_lid' 
let (is_dtuple_constructor : FStar_Ident.lident -> Prims.bool) =
  FStar_Parser_Const.is_dtuple_data_lid' 
let (is_list_structure :
  FStar_Ident.lident ->
    FStar_Ident.lident -> FStar_Parser_AST.term -> Prims.bool)
  =
  fun cons_lid1  ->
    fun nil_lid1  ->
      let rec aux e =
        match e.FStar_Parser_AST.tm with
        | FStar_Parser_AST.Construct (lid,[]) ->
            FStar_Ident.lid_equals lid nil_lid1
        | FStar_Parser_AST.Construct (lid,uu____689::(e2,uu____691)::[]) ->
            (FStar_Ident.lid_equals lid cons_lid1) && (aux e2)
        | uu____714 -> false  in
      aux
  
let (is_list : FStar_Parser_AST.term -> Prims.bool) =
  is_list_structure FStar_Parser_Const.cons_lid FStar_Parser_Const.nil_lid 
let (is_lex_list : FStar_Parser_AST.term -> Prims.bool) =
  is_list_structure FStar_Parser_Const.lexcons_lid
    FStar_Parser_Const.lextop_lid
  
let rec (extract_from_list :
  FStar_Parser_AST.term -> FStar_Parser_AST.term Prims.list) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Construct (uu____726,[]) -> []
    | FStar_Parser_AST.Construct
        (uu____737,(e1,FStar_Parser_AST.Nothing )::(e2,FStar_Parser_AST.Nothing
                                                    )::[])
        -> let uu____758 = extract_from_list e2  in e1 :: uu____758
    | uu____761 ->
        let uu____762 =
          let uu____763 = FStar_Parser_AST.term_to_string e  in
          FStar_Util.format1 "Not a list %s" uu____763  in
        failwith uu____762
  
let (is_array : FStar_Parser_AST.term -> Prims.bool) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.App
        ({ FStar_Parser_AST.tm = FStar_Parser_AST.Var lid;
           FStar_Parser_AST.range = uu____770;
           FStar_Parser_AST.level = uu____771;_},l,FStar_Parser_AST.Nothing
         )
        ->
        (FStar_Ident.lid_equals lid FStar_Parser_Const.array_mk_array_lid) &&
          (is_list l)
    | uu____773 -> false
  
let rec (is_ref_set : FStar_Parser_AST.term -> Prims.bool) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Var maybe_empty_lid ->
        FStar_Ident.lid_equals maybe_empty_lid FStar_Parser_Const.set_empty
    | FStar_Parser_AST.App
        ({ FStar_Parser_AST.tm = FStar_Parser_AST.Var maybe_singleton_lid;
           FStar_Parser_AST.range = uu____779;
           FStar_Parser_AST.level = uu____780;_},{
                                                   FStar_Parser_AST.tm =
                                                     FStar_Parser_AST.App
                                                     ({
                                                        FStar_Parser_AST.tm =
                                                          FStar_Parser_AST.Var
                                                          maybe_addr_of_lid;
                                                        FStar_Parser_AST.range
                                                          = uu____782;
                                                        FStar_Parser_AST.level
                                                          = uu____783;_},e1,FStar_Parser_AST.Nothing
                                                      );
                                                   FStar_Parser_AST.range =
                                                     uu____785;
                                                   FStar_Parser_AST.level =
                                                     uu____786;_},FStar_Parser_AST.Nothing
         )
        ->
        (FStar_Ident.lid_equals maybe_singleton_lid
           FStar_Parser_Const.set_singleton)
          &&
          (FStar_Ident.lid_equals maybe_addr_of_lid
             FStar_Parser_Const.heap_addr_of_lid)
    | FStar_Parser_AST.App
        ({
           FStar_Parser_AST.tm = FStar_Parser_AST.App
             ({ FStar_Parser_AST.tm = FStar_Parser_AST.Var maybe_union_lid;
                FStar_Parser_AST.range = uu____788;
                FStar_Parser_AST.level = uu____789;_},e1,FStar_Parser_AST.Nothing
              );
           FStar_Parser_AST.range = uu____791;
           FStar_Parser_AST.level = uu____792;_},e2,FStar_Parser_AST.Nothing
         )
        ->
        ((FStar_Ident.lid_equals maybe_union_lid FStar_Parser_Const.set_union)
           && (is_ref_set e1))
          && (is_ref_set e2)
    | uu____794 -> false
  
let rec (extract_from_ref_set :
  FStar_Parser_AST.term -> FStar_Parser_AST.term Prims.list) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Var uu____802 -> []
    | FStar_Parser_AST.App
        ({ FStar_Parser_AST.tm = FStar_Parser_AST.Var uu____803;
           FStar_Parser_AST.range = uu____804;
           FStar_Parser_AST.level = uu____805;_},{
                                                   FStar_Parser_AST.tm =
                                                     FStar_Parser_AST.App
                                                     ({
                                                        FStar_Parser_AST.tm =
                                                          FStar_Parser_AST.Var
                                                          uu____806;
                                                        FStar_Parser_AST.range
                                                          = uu____807;
                                                        FStar_Parser_AST.level
                                                          = uu____808;_},e1,FStar_Parser_AST.Nothing
                                                      );
                                                   FStar_Parser_AST.range =
                                                     uu____810;
                                                   FStar_Parser_AST.level =
                                                     uu____811;_},FStar_Parser_AST.Nothing
         )
        -> [e1]
    | FStar_Parser_AST.App
        ({
           FStar_Parser_AST.tm = FStar_Parser_AST.App
             ({ FStar_Parser_AST.tm = FStar_Parser_AST.Var uu____812;
                FStar_Parser_AST.range = uu____813;
                FStar_Parser_AST.level = uu____814;_},e1,FStar_Parser_AST.Nothing
              );
           FStar_Parser_AST.range = uu____816;
           FStar_Parser_AST.level = uu____817;_},e2,FStar_Parser_AST.Nothing
         )
        ->
        let uu____819 = extract_from_ref_set e1  in
        let uu____822 = extract_from_ref_set e2  in
        FStar_List.append uu____819 uu____822
    | uu____825 ->
        let uu____826 =
          let uu____827 = FStar_Parser_AST.term_to_string e  in
          FStar_Util.format1 "Not a ref set %s" uu____827  in
        failwith uu____826
  
let (is_general_application : FStar_Parser_AST.term -> Prims.bool) =
  fun e  ->
    let uu____833 = (is_array e) || (is_ref_set e)  in
    Prims.op_Negation uu____833
  
let (is_general_construction : FStar_Parser_AST.term -> Prims.bool) =
  fun e  ->
    let uu____837 = (is_list e) || (is_lex_list e)  in
    Prims.op_Negation uu____837
  
let (is_general_prefix_op : FStar_Ident.ident -> Prims.bool) =
  fun op  ->
    let op_starting_char =
      FStar_Util.char_at (FStar_Ident.text_of_id op) (Prims.parse_int "0")
       in
    ((op_starting_char = 33) || (op_starting_char = 63)) ||
      ((op_starting_char = 126) && ((FStar_Ident.text_of_id op) <> "~"))
  
let (head_and_args :
  FStar_Parser_AST.term ->
    (FStar_Parser_AST.term,(FStar_Parser_AST.term,FStar_Parser_AST.imp)
                             FStar_Pervasives_Native.tuple2 Prims.list)
      FStar_Pervasives_Native.tuple2)
  =
  fun e  ->
    let rec aux e1 acc =
      match e1.FStar_Parser_AST.tm with
      | FStar_Parser_AST.App (head1,arg,imp) -> aux head1 ((arg, imp) :: acc)
      | uu____904 -> (e1, acc)  in
    aux e []
  
type associativity =
  | Left 
  | Right 
  | NonAssoc [@@deriving show]
let (uu___is_Left : associativity -> Prims.bool) =
  fun projectee  -> match projectee with | Left  -> true | uu____918 -> false 
let (uu___is_Right : associativity -> Prims.bool) =
  fun projectee  ->
    match projectee with | Right  -> true | uu____922 -> false
  
let (uu___is_NonAssoc : associativity -> Prims.bool) =
  fun projectee  ->
    match projectee with | NonAssoc  -> true | uu____926 -> false
  
type token = (FStar_Char.char,Prims.string) FStar_Util.either[@@deriving
                                                               show]
type associativity_level =
  (associativity,token Prims.list) FStar_Pervasives_Native.tuple2[@@deriving
                                                                   show]
let (token_to_string :
  (FStar_BaseTypes.char,Prims.string) FStar_Util.either -> Prims.string) =
  fun uu___51_944  ->
    match uu___51_944 with
    | FStar_Util.Inl c -> Prims.strcat (FStar_Util.string_of_char c) ".*"
    | FStar_Util.Inr s -> s
  
let (matches_token :
  Prims.string ->
    (FStar_Char.char,Prims.string) FStar_Util.either -> Prims.bool)
  =
  fun s  ->
    fun uu___52_961  ->
      match uu___52_961 with
      | FStar_Util.Inl c ->
          let uu____970 = FStar_String.get s (Prims.parse_int "0")  in
          uu____970 = c
      | FStar_Util.Inr s' -> s = s'
  
let matches_level :
  'Auu____978 .
    Prims.string ->
      ('Auu____978,(FStar_Char.char,Prims.string) FStar_Util.either
                     Prims.list)
        FStar_Pervasives_Native.tuple2 -> Prims.bool
  =
  fun s  ->
    fun uu____997  ->
      match uu____997 with
      | (assoc_levels,tokens) ->
          let uu____1025 = FStar_List.tryFind (matches_token s) tokens  in
          uu____1025 <> FStar_Pervasives_Native.None
  
let opinfix4 :
  'Auu____1051 .
    Prims.unit ->
      (associativity,('Auu____1051,Prims.string) FStar_Util.either Prims.list)
        FStar_Pervasives_Native.tuple2
  = fun uu____1062  -> (Right, [FStar_Util.Inr "**"]) 
let opinfix3 :
  'Auu____1078 .
    Prims.unit ->
      (associativity,(FStar_Char.char,'Auu____1078) FStar_Util.either
                       Prims.list)
        FStar_Pervasives_Native.tuple2
  =
  fun uu____1090  ->
    (Left, [FStar_Util.Inl 42; FStar_Util.Inl 47; FStar_Util.Inl 37])
  
let opinfix2 :
  'Auu____1125 .
    Prims.unit ->
      (associativity,(FStar_Char.char,'Auu____1125) FStar_Util.either
                       Prims.list)
        FStar_Pervasives_Native.tuple2
  = fun uu____1137  -> (Left, [FStar_Util.Inl 43; FStar_Util.Inl 45]) 
let minus_lvl :
  'Auu____1165 .
    Prims.unit ->
      (associativity,('Auu____1165,Prims.string) FStar_Util.either Prims.list)
        FStar_Pervasives_Native.tuple2
  = fun uu____1176  -> (Left, [FStar_Util.Inr "-"]) 
let opinfix1 :
  'Auu____1192 .
    Prims.unit ->
      (associativity,(FStar_Char.char,'Auu____1192) FStar_Util.either
                       Prims.list)
        FStar_Pervasives_Native.tuple2
  = fun uu____1204  -> (Right, [FStar_Util.Inl 64; FStar_Util.Inl 94]) 
let pipe_right :
  'Auu____1232 .
    Prims.unit ->
      (associativity,('Auu____1232,Prims.string) FStar_Util.either Prims.list)
        FStar_Pervasives_Native.tuple2
  = fun uu____1243  -> (Left, [FStar_Util.Inr "|>"]) 
let opinfix0d :
  'Auu____1259 .
    Prims.unit ->
      (associativity,(FStar_Char.char,'Auu____1259) FStar_Util.either
                       Prims.list)
        FStar_Pervasives_Native.tuple2
  = fun uu____1271  -> (Left, [FStar_Util.Inl 36]) 
let opinfix0c :
  'Auu____1292 .
    Prims.unit ->
      (associativity,(FStar_Char.char,'Auu____1292) FStar_Util.either
                       Prims.list)
        FStar_Pervasives_Native.tuple2
  =
  fun uu____1304  ->
    (Left, [FStar_Util.Inl 61; FStar_Util.Inl 60; FStar_Util.Inl 62])
  
let equal :
  'Auu____1339 .
    Prims.unit ->
      (associativity,('Auu____1339,Prims.string) FStar_Util.either Prims.list)
        FStar_Pervasives_Native.tuple2
  = fun uu____1350  -> (Left, [FStar_Util.Inr "="]) 
let opinfix0b :
  'Auu____1366 .
    Prims.unit ->
      (associativity,(FStar_Char.char,'Auu____1366) FStar_Util.either
                       Prims.list)
        FStar_Pervasives_Native.tuple2
  = fun uu____1378  -> (Left, [FStar_Util.Inl 38]) 
let opinfix0a :
  'Auu____1399 .
    Prims.unit ->
      (associativity,(FStar_Char.char,'Auu____1399) FStar_Util.either
                       Prims.list)
        FStar_Pervasives_Native.tuple2
  = fun uu____1411  -> (Left, [FStar_Util.Inl 124]) 
let colon_equals :
  'Auu____1432 .
    Prims.unit ->
      (associativity,('Auu____1432,Prims.string) FStar_Util.either Prims.list)
        FStar_Pervasives_Native.tuple2
  = fun uu____1443  -> (NonAssoc, [FStar_Util.Inr ":="]) 
let amp :
  'Auu____1459 .
    Prims.unit ->
      (associativity,('Auu____1459,Prims.string) FStar_Util.either Prims.list)
        FStar_Pervasives_Native.tuple2
  = fun uu____1470  -> (Right, [FStar_Util.Inr "&"]) 
let colon_colon :
  'Auu____1486 .
    Prims.unit ->
      (associativity,('Auu____1486,Prims.string) FStar_Util.either Prims.list)
        FStar_Pervasives_Native.tuple2
  = fun uu____1497  -> (Right, [FStar_Util.Inr "::"]) 
let (level_associativity_spec :
  (associativity,(FStar_Char.char,Prims.string) FStar_Util.either Prims.list)
    FStar_Pervasives_Native.tuple2 Prims.list)
  =
  [opinfix4 ();
  opinfix3 ();
  opinfix2 ();
  opinfix1 ();
  pipe_right ();
  opinfix0d ();
  opinfix0c ();
  opinfix0b ();
  opinfix0a ();
  colon_equals ();
  amp ();
  colon_colon ()] 
let (level_table :
  ((Prims.int,Prims.int,Prims.int) FStar_Pervasives_Native.tuple3,(FStar_Char.char,
                                                                    Prims.string)
                                                                    FStar_Util.either
                                                                    Prims.list)
    FStar_Pervasives_Native.tuple2 Prims.list)
  =
  let levels_from_associativity l uu___53_1704 =
    match uu___53_1704 with
    | Left  -> (l, l, (l - (Prims.parse_int "1")))
    | Right  -> ((l - (Prims.parse_int "1")), l, l)
    | NonAssoc  ->
        ((l - (Prims.parse_int "1")), l, (l - (Prims.parse_int "1")))
     in
  FStar_List.mapi
    (fun i  ->
       fun uu____1744  ->
         match uu____1744 with
         | (assoc1,tokens) -> ((levels_from_associativity i assoc1), tokens))
    level_associativity_spec
  
let (assign_levels :
  associativity_level Prims.list ->
    Prims.string ->
      (Prims.int,Prims.int,Prims.int) FStar_Pervasives_Native.tuple3)
  =
  fun token_associativity_spec  ->
    fun s  ->
      let uu____1824 = FStar_List.tryFind (matches_level s) level_table  in
      match uu____1824 with
      | FStar_Pervasives_Native.Some (assoc_levels,uu____1874) ->
          assoc_levels
      | uu____1918 -> failwith (Prims.strcat "Unrecognized operator " s)
  
let (max : Prims.int -> Prims.int -> Prims.int) =
  fun k1  -> fun k2  -> if k1 > k2 then k1 else k2 
let max_level :
  'Auu____1953 .
    ('Auu____1953,(FStar_Char.char,Prims.string) FStar_Util.either Prims.list)
      FStar_Pervasives_Native.tuple2 Prims.list -> Prims.int
  =
  fun l  ->
    let find_level_and_max n1 level =
      let uu____2013 =
        FStar_List.tryFind
          (fun uu____2053  ->
             match uu____2053 with
             | (uu____2071,tokens) ->
                 tokens = (FStar_Pervasives_Native.snd level)) level_table
         in
      match uu____2013 with
      | FStar_Pervasives_Native.Some ((uu____2113,l1,uu____2115),uu____2116)
          -> max n1 l1
      | FStar_Pervasives_Native.None  ->
          let uu____2171 =
            let uu____2172 =
              let uu____2173 =
                FStar_List.map token_to_string
                  (FStar_Pervasives_Native.snd level)
                 in
              FStar_String.concat "," uu____2173  in
            FStar_Util.format1 "Undefined associativity level %s" uu____2172
             in
          failwith uu____2171
       in
    FStar_List.fold_left find_level_and_max (Prims.parse_int "0") l
  
let (levels :
  Prims.string ->
    (Prims.int,Prims.int,Prims.int) FStar_Pervasives_Native.tuple3)
  =
  fun op  ->
    let uu____2207 = assign_levels level_associativity_spec op  in
    match uu____2207 with
    | (left1,mine,right1) ->
        if op = "*"
        then ((left1 - (Prims.parse_int "1")), mine, right1)
        else (left1, mine, right1)
  
let operatorInfix0ad12 :
  'Auu____2231 .
    Prims.unit ->
      (associativity,(FStar_Char.char,'Auu____2231) FStar_Util.either
                       Prims.list)
        FStar_Pervasives_Native.tuple2 Prims.list
  =
  fun uu____2245  ->
    [opinfix0a ();
    opinfix0b ();
    opinfix0c ();
    opinfix0d ();
    opinfix1 ();
    opinfix2 ()]
  
let (is_operatorInfix0ad12 : FStar_Ident.ident -> Prims.bool) =
  fun op  ->
    let uu____2326 =
      let uu____2340 =
        FStar_All.pipe_left matches_level (FStar_Ident.text_of_id op)  in
      FStar_List.tryFind uu____2340 (operatorInfix0ad12 ())  in
    uu____2326 <> FStar_Pervasives_Native.None
  
let (is_operatorInfix34 : FStar_Ident.ident -> Prims.bool) =
  let opinfix34 = [opinfix3 (); opinfix4 ()]  in
  fun op  ->
    let uu____2453 =
      let uu____2467 =
        FStar_All.pipe_left matches_level (FStar_Ident.text_of_id op)  in
      FStar_List.tryFind uu____2467 opinfix34  in
    uu____2453 <> FStar_Pervasives_Native.None
  
let (handleable_args_length : FStar_Ident.ident -> Prims.int) =
  fun op  ->
    let op_s = FStar_Ident.text_of_id op  in
    let uu____2533 =
      (is_general_prefix_op op) || (FStar_List.mem op_s ["-"; "~"])  in
    if uu____2533
    then (Prims.parse_int "1")
    else
      (let uu____2535 =
         ((is_operatorInfix0ad12 op) || (is_operatorInfix34 op)) ||
           (FStar_List.mem op_s
              ["<==>"; "==>"; "\\/"; "/\\"; "="; "|>"; ":="; ".()"; ".[]"])
          in
       if uu____2535
       then (Prims.parse_int "2")
       else
         if FStar_List.mem op_s [".()<-"; ".[]<-"]
         then (Prims.parse_int "3")
         else (Prims.parse_int "0"))
  
let handleable_op :
  'Auu____2541 . FStar_Ident.ident -> 'Auu____2541 Prims.list -> Prims.bool =
  fun op  ->
    fun args  ->
      match FStar_List.length args with
      | _0_27 when _0_27 = (Prims.parse_int "0") -> true
      | _0_28 when _0_28 = (Prims.parse_int "1") ->
          (is_general_prefix_op op) ||
            (FStar_List.mem (FStar_Ident.text_of_id op) ["-"; "~"])
      | _0_29 when _0_29 = (Prims.parse_int "2") ->
          ((is_operatorInfix0ad12 op) || (is_operatorInfix34 op)) ||
            (FStar_List.mem (FStar_Ident.text_of_id op)
               ["<==>"; "==>"; "\\/"; "/\\"; "="; "|>"; ":="; ".()"; ".[]"])
      | _0_30 when _0_30 = (Prims.parse_int "3") ->
          FStar_List.mem (FStar_Ident.text_of_id op) [".()<-"; ".[]<-"]
      | uu____2554 -> false
  
let (comment_stack :
  (Prims.string,FStar_Range.range) FStar_Pervasives_Native.tuple2 Prims.list
    FStar_ST.ref)
  = FStar_Util.mk_ref [] 
let with_comment :
  'Auu____2588 .
    ('Auu____2588 -> FStar_Pprint.document) ->
      'Auu____2588 -> FStar_Range.range -> FStar_Pprint.document
  =
  fun printer  ->
    fun tm  ->
      fun tmrange  ->
        let rec comments_before_pos acc print_pos lookahead_pos =
          let uu____2620 = FStar_ST.op_Bang comment_stack  in
          match uu____2620 with
          | [] -> (acc, false)
          | (comment,crange)::cs ->
              let uu____2679 = FStar_Range.range_before_pos crange print_pos
                 in
              if uu____2679
              then
                (FStar_ST.op_Colon_Equals comment_stack cs;
                 (let uu____2716 =
                    let uu____2717 =
                      let uu____2718 = str comment  in
                      FStar_Pprint.op_Hat_Hat uu____2718
                        FStar_Pprint.hardline
                       in
                    FStar_Pprint.op_Hat_Hat acc uu____2717  in
                  comments_before_pos uu____2716 print_pos lookahead_pos))
              else
                (let uu____2720 =
                   FStar_Range.range_before_pos crange lookahead_pos  in
                 (acc, uu____2720))
           in
        let uu____2721 =
          let uu____2726 =
            let uu____2727 = FStar_Range.start_of_range tmrange  in
            FStar_Range.end_of_line uu____2727  in
          let uu____2728 = FStar_Range.end_of_range tmrange  in
          comments_before_pos FStar_Pprint.empty uu____2726 uu____2728  in
        match uu____2721 with
        | (comments,has_lookahead) ->
            let printed_e = printer tm  in
            let comments1 =
              if has_lookahead
              then
                let pos = FStar_Range.end_of_range tmrange  in
                let uu____2734 = comments_before_pos comments pos pos  in
                FStar_Pervasives_Native.fst uu____2734
              else comments  in
            let uu____2740 = FStar_Pprint.op_Hat_Hat comments1 printed_e  in
            FStar_Pprint.group uu____2740
  
let rec (place_comments_until_pos :
  Prims.int ->
    Prims.int ->
      FStar_Range.pos -> FStar_Pprint.document -> FStar_Pprint.document)
  =
  fun k  ->
    fun lbegin  ->
      fun pos_end  ->
        fun doc1  ->
          let uu____2753 = FStar_ST.op_Bang comment_stack  in
          match uu____2753 with
          | (comment,crange)::cs when
              FStar_Range.range_before_pos crange pos_end ->
              (FStar_ST.op_Colon_Equals comment_stack cs;
               (let lnum =
                  let uu____2837 =
                    let uu____2838 =
                      let uu____2839 = FStar_Range.start_of_range crange  in
                      FStar_Range.line_of_pos uu____2839  in
                    uu____2838 - lbegin  in
                  max k uu____2837  in
                let doc2 =
                  let uu____2841 =
                    let uu____2842 =
                      FStar_Pprint.repeat lnum FStar_Pprint.hardline  in
                    let uu____2843 = str comment  in
                    FStar_Pprint.op_Hat_Hat uu____2842 uu____2843  in
                  FStar_Pprint.op_Hat_Hat doc1 uu____2841  in
                let uu____2844 =
                  let uu____2845 = FStar_Range.end_of_range crange  in
                  FStar_Range.line_of_pos uu____2845  in
                place_comments_until_pos (Prims.parse_int "1") uu____2844
                  pos_end doc2))
          | uu____2846 ->
              let lnum =
                let uu____2854 =
                  let uu____2855 = FStar_Range.line_of_pos pos_end  in
                  uu____2855 - lbegin  in
                max (Prims.parse_int "1") uu____2854  in
              let uu____2856 = FStar_Pprint.repeat lnum FStar_Pprint.hardline
                 in
              FStar_Pprint.op_Hat_Hat doc1 uu____2856
  
let separate_map_with_comments :
  'Auu____2863 .
    FStar_Pprint.document ->
      FStar_Pprint.document ->
        ('Auu____2863 -> FStar_Pprint.document) ->
          'Auu____2863 Prims.list ->
            ('Auu____2863 -> FStar_Range.range) -> FStar_Pprint.document
  =
  fun prefix1  ->
    fun sep  ->
      fun f  ->
        fun xs  ->
          fun extract_range  ->
            let fold_fun uu____2911 x =
              match uu____2911 with
              | (last_line,doc1) ->
                  let r = extract_range x  in
                  let doc2 =
                    let uu____2925 = FStar_Range.start_of_range r  in
                    place_comments_until_pos (Prims.parse_int "1") last_line
                      uu____2925 doc1
                     in
                  let uu____2926 =
                    let uu____2927 = FStar_Range.end_of_range r  in
                    FStar_Range.line_of_pos uu____2927  in
                  let uu____2928 =
                    let uu____2929 =
                      let uu____2930 = f x  in
                      FStar_Pprint.op_Hat_Hat sep uu____2930  in
                    FStar_Pprint.op_Hat_Hat doc2 uu____2929  in
                  (uu____2926, uu____2928)
               in
            let uu____2931 =
              let uu____2938 = FStar_List.hd xs  in
              let uu____2939 = FStar_List.tl xs  in (uu____2938, uu____2939)
               in
            match uu____2931 with
            | (x,xs1) ->
                let init1 =
                  let uu____2955 =
                    let uu____2956 =
                      let uu____2957 = extract_range x  in
                      FStar_Range.end_of_range uu____2957  in
                    FStar_Range.line_of_pos uu____2956  in
                  let uu____2958 =
                    let uu____2959 = f x  in
                    FStar_Pprint.op_Hat_Hat prefix1 uu____2959  in
                  (uu____2955, uu____2958)  in
                let uu____2960 = FStar_List.fold_left fold_fun init1 xs1  in
                FStar_Pervasives_Native.snd uu____2960
  
let rec (p_decl : FStar_Parser_AST.decl -> FStar_Pprint.document) =
  fun d  ->
    let uu____3325 =
      let uu____3326 = FStar_Pprint.optional p_fsdoc d.FStar_Parser_AST.doc
         in
      let uu____3327 =
        let uu____3328 = p_attributes d.FStar_Parser_AST.attrs  in
        let uu____3329 =
          let uu____3330 = p_qualifiers d.FStar_Parser_AST.quals  in
          let uu____3331 =
            let uu____3332 = p_rawDecl d  in
            FStar_Pprint.op_Hat_Hat
              (if d.FStar_Parser_AST.quals = []
               then FStar_Pprint.empty
               else break1) uu____3332
             in
          FStar_Pprint.op_Hat_Hat uu____3330 uu____3331  in
        FStar_Pprint.op_Hat_Hat uu____3328 uu____3329  in
      FStar_Pprint.op_Hat_Hat uu____3326 uu____3327  in
    FStar_Pprint.group uu____3325

and (p_attributes : FStar_Parser_AST.attributes_ -> FStar_Pprint.document) =
  fun attrs  ->
    let uu____3335 =
      let uu____3336 = str "@"  in
      FStar_Pprint.op_Hat_Hat FStar_Pprint.lbracket uu____3336  in
    let uu____3337 =
      FStar_Pprint.op_Hat_Hat FStar_Pprint.rbracket FStar_Pprint.hardline  in
    soft_surround_map_or_flow (Prims.parse_int "0") (Prims.parse_int "2")
      FStar_Pprint.empty uu____3335 FStar_Pprint.space uu____3337
      p_atomicTerm attrs

and (p_fsdoc : FStar_Parser_AST.fsdoc -> FStar_Pprint.document) =
  fun uu____3338  ->
    match uu____3338 with
    | (doc1,kwd_args) ->
        let kwd_args_doc =
          match kwd_args with
          | [] -> FStar_Pprint.empty
          | kwd_args1 ->
              let process_kwd_arg uu____3372 =
                match uu____3372 with
                | (kwd,arg) ->
                    let uu____3379 = str "@"  in
                    let uu____3380 =
                      let uu____3381 = str kwd  in
                      let uu____3382 =
                        let uu____3383 = str arg  in
                        FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____3383
                         in
                      FStar_Pprint.op_Hat_Hat uu____3381 uu____3382  in
                    FStar_Pprint.op_Hat_Hat uu____3379 uu____3380
                 in
              let uu____3384 =
                let uu____3385 =
                  FStar_Pprint.separate_map FStar_Pprint.hardline
                    process_kwd_arg kwd_args1
                   in
                FStar_Pprint.op_Hat_Hat uu____3385 FStar_Pprint.hardline  in
              FStar_Pprint.op_Hat_Hat FStar_Pprint.hardline uu____3384
           in
        let uu____3390 =
          let uu____3391 =
            let uu____3392 =
              let uu____3393 =
                let uu____3394 = str doc1  in
                let uu____3395 =
                  let uu____3396 =
                    let uu____3397 =
                      FStar_Pprint.op_Hat_Hat FStar_Pprint.rparen
                        FStar_Pprint.hardline
                       in
                    FStar_Pprint.op_Hat_Hat FStar_Pprint.star uu____3397  in
                  FStar_Pprint.op_Hat_Hat kwd_args_doc uu____3396  in
                FStar_Pprint.op_Hat_Hat uu____3394 uu____3395  in
              FStar_Pprint.op_Hat_Hat FStar_Pprint.star uu____3393  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.star uu____3392  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.lparen uu____3391  in
        FStar_Pprint.op_Hat_Hat FStar_Pprint.hardline uu____3390

and (p_justSig : FStar_Parser_AST.decl -> FStar_Pprint.document) =
  fun d  ->
    match d.FStar_Parser_AST.d with
    | FStar_Parser_AST.Val (lid,t) ->
        let uu____3401 =
          let uu____3402 = str "val"  in
          let uu____3403 =
            let uu____3404 =
              let uu____3405 = p_lident lid  in
              let uu____3406 =
                FStar_Pprint.op_Hat_Hat FStar_Pprint.space FStar_Pprint.colon
                 in
              FStar_Pprint.op_Hat_Hat uu____3405 uu____3406  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____3404  in
          FStar_Pprint.op_Hat_Hat uu____3402 uu____3403  in
        let uu____3407 = p_typ false false t  in
        op_Hat_Slash_Plus_Hat uu____3401 uu____3407
    | FStar_Parser_AST.TopLevelLet (uu____3408,lbs) ->
        FStar_Pprint.separate_map FStar_Pprint.hardline
          (fun lb  ->
             let uu____3433 =
               let uu____3434 = str "let"  in
               let uu____3435 = p_letlhs lb  in
               FStar_Pprint.op_Hat_Slash_Hat uu____3434 uu____3435  in
             FStar_Pprint.group uu____3433) lbs
    | uu____3436 -> FStar_Pprint.empty

and (p_rawDecl : FStar_Parser_AST.decl -> FStar_Pprint.document) =
  fun d  ->
    match d.FStar_Parser_AST.d with
    | FStar_Parser_AST.Open uid ->
        let uu____3439 =
          let uu____3440 = str "open"  in
          let uu____3441 = p_quident uid  in
          FStar_Pprint.op_Hat_Slash_Hat uu____3440 uu____3441  in
        FStar_Pprint.group uu____3439
    | FStar_Parser_AST.Include uid ->
        let uu____3443 =
          let uu____3444 = str "include"  in
          let uu____3445 = p_quident uid  in
          FStar_Pprint.op_Hat_Slash_Hat uu____3444 uu____3445  in
        FStar_Pprint.group uu____3443
    | FStar_Parser_AST.ModuleAbbrev (uid1,uid2) ->
        let uu____3448 =
          let uu____3449 = str "module"  in
          let uu____3450 =
            let uu____3451 =
              let uu____3452 = p_uident uid1  in
              let uu____3453 =
                FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                  FStar_Pprint.equals
                 in
              FStar_Pprint.op_Hat_Hat uu____3452 uu____3453  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____3451  in
          FStar_Pprint.op_Hat_Hat uu____3449 uu____3450  in
        let uu____3454 = p_quident uid2  in
        op_Hat_Slash_Plus_Hat uu____3448 uu____3454
    | FStar_Parser_AST.TopLevelModule uid ->
        let uu____3456 =
          let uu____3457 = str "module"  in
          let uu____3458 =
            let uu____3459 = p_quident uid  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____3459  in
          FStar_Pprint.op_Hat_Hat uu____3457 uu____3458  in
        FStar_Pprint.group uu____3456
    | FStar_Parser_AST.Tycon
        (true
         ,(FStar_Parser_AST.TyconAbbrev
           (uid,tpars,FStar_Pervasives_Native.None ,t),FStar_Pervasives_Native.None
           )::[])
        ->
        let effect_prefix_doc =
          let uu____3492 = str "effect"  in
          let uu____3493 =
            let uu____3494 = p_uident uid  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____3494  in
          FStar_Pprint.op_Hat_Hat uu____3492 uu____3493  in
        let uu____3495 =
          let uu____3496 = p_typars tpars  in
          FStar_Pprint.surround (Prims.parse_int "2") (Prims.parse_int "1")
            effect_prefix_doc uu____3496 FStar_Pprint.equals
           in
        let uu____3497 = p_typ false false t  in
        op_Hat_Slash_Plus_Hat uu____3495 uu____3497
    | FStar_Parser_AST.Tycon (false ,tcdefs) ->
        let uu____3515 = str "type"  in
        let uu____3516 = str "and"  in
        precede_break_separate_map uu____3515 uu____3516 p_fsdocTypeDeclPairs
          tcdefs
    | FStar_Parser_AST.TopLevelLet (q,lbs) ->
        let let_doc =
          let uu____3538 = str "let"  in
          let uu____3539 =
            let uu____3540 = p_letqualifier q  in
            FStar_Pprint.op_Hat_Hat uu____3540 FStar_Pprint.space  in
          FStar_Pprint.op_Hat_Hat uu____3538 uu____3539  in
        let uu____3541 =
          let uu____3542 = str "and"  in
          FStar_Pprint.op_Hat_Hat uu____3542 FStar_Pprint.space  in
        separate_map_with_comments let_doc uu____3541 p_letbinding lbs
          (fun uu____3550  ->
             match uu____3550 with
             | (p,t) ->
                 FStar_Range.union_ranges p.FStar_Parser_AST.prange
                   t.FStar_Parser_AST.range)
    | FStar_Parser_AST.Val (lid,t) ->
        let uu____3559 =
          let uu____3560 = str "val"  in
          let uu____3561 =
            let uu____3562 =
              let uu____3563 = p_lident lid  in
              let uu____3564 =
                FStar_Pprint.op_Hat_Hat FStar_Pprint.space FStar_Pprint.colon
                 in
              FStar_Pprint.op_Hat_Hat uu____3563 uu____3564  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____3562  in
          FStar_Pprint.op_Hat_Hat uu____3560 uu____3561  in
        let uu____3565 = p_typ false false t  in
        op_Hat_Slash_Plus_Hat uu____3559 uu____3565
    | FStar_Parser_AST.Assume (id1,t) ->
        let decl_keyword =
          let uu____3569 =
            let uu____3570 =
              FStar_Util.char_at id1.FStar_Ident.idText (Prims.parse_int "0")
               in
            FStar_All.pipe_right uu____3570 FStar_Util.is_upper  in
          if uu____3569
          then FStar_Pprint.empty
          else
            (let uu____3572 = str "val"  in
             FStar_Pprint.op_Hat_Hat uu____3572 FStar_Pprint.space)
           in
        let uu____3573 =
          let uu____3574 =
            let uu____3575 = p_ident id1  in
            let uu____3576 =
              FStar_Pprint.op_Hat_Hat FStar_Pprint.space FStar_Pprint.colon
               in
            FStar_Pprint.op_Hat_Hat uu____3575 uu____3576  in
          FStar_Pprint.op_Hat_Hat decl_keyword uu____3574  in
        let uu____3577 = p_typ false false t  in
        op_Hat_Slash_Plus_Hat uu____3573 uu____3577
    | FStar_Parser_AST.Exception (uid,t_opt) ->
        let uu____3584 = str "exception"  in
        let uu____3585 =
          let uu____3586 =
            let uu____3587 = p_uident uid  in
            let uu____3588 =
              FStar_Pprint.optional
                (fun t  ->
                   let uu____3592 =
                     let uu____3593 = str "of"  in
                     let uu____3594 = p_typ false false t  in
                     op_Hat_Slash_Plus_Hat uu____3593 uu____3594  in
                   FStar_Pprint.op_Hat_Hat break1 uu____3592) t_opt
               in
            FStar_Pprint.op_Hat_Hat uu____3587 uu____3588  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____3586  in
        FStar_Pprint.op_Hat_Hat uu____3584 uu____3585
    | FStar_Parser_AST.NewEffect ne ->
        let uu____3596 = str "new_effect"  in
        let uu____3597 =
          let uu____3598 = p_newEffect ne  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____3598  in
        FStar_Pprint.op_Hat_Hat uu____3596 uu____3597
    | FStar_Parser_AST.SubEffect se ->
        let uu____3600 = str "sub_effect"  in
        let uu____3601 =
          let uu____3602 = p_subEffect se  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____3602  in
        FStar_Pprint.op_Hat_Hat uu____3600 uu____3601
    | FStar_Parser_AST.Pragma p -> p_pragma p
    | FStar_Parser_AST.Fsdoc doc1 ->
        let uu____3605 = p_fsdoc doc1  in
        FStar_Pprint.op_Hat_Hat uu____3605 FStar_Pprint.hardline
    | FStar_Parser_AST.Main uu____3606 ->
        failwith "*Main declaration* : Is that really still in use ??"
    | FStar_Parser_AST.Tycon (true ,uu____3607) ->
        failwith
          "Effect abbreviation is expected to be defined by an abbreviation"
    | FStar_Parser_AST.Splice t ->
        let uu____3625 = str "%splice"  in
        let uu____3626 =
          let uu____3627 = p_term false false t  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____3627  in
        FStar_Pprint.op_Hat_Hat uu____3625 uu____3626

and (p_pragma : FStar_Parser_AST.pragma -> FStar_Pprint.document) =
  fun uu___54_3628  ->
    match uu___54_3628 with
    | FStar_Parser_AST.SetOptions s ->
        let uu____3630 = str "#set-options"  in
        let uu____3631 =
          let uu____3632 =
            let uu____3633 = str s  in FStar_Pprint.dquotes uu____3633  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____3632  in
        FStar_Pprint.op_Hat_Hat uu____3630 uu____3631
    | FStar_Parser_AST.ResetOptions s_opt ->
        let uu____3637 = str "#reset-options"  in
        let uu____3638 =
          FStar_Pprint.optional
            (fun s  ->
               let uu____3642 =
                 let uu____3643 = str s  in FStar_Pprint.dquotes uu____3643
                  in
               FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____3642) s_opt
           in
        FStar_Pprint.op_Hat_Hat uu____3637 uu____3638
    | FStar_Parser_AST.LightOff  ->
        (FStar_ST.op_Colon_Equals should_print_fs_typ_app true;
         str "#light \"off\"")

and (p_typars : FStar_Parser_AST.binder Prims.list -> FStar_Pprint.document)
  = fun bs  -> p_binders true bs

and (p_fsdocTypeDeclPairs :
  (FStar_Parser_AST.tycon,FStar_Parser_AST.fsdoc
                            FStar_Pervasives_Native.option)
    FStar_Pervasives_Native.tuple2 -> FStar_Pprint.document)
  =
  fun uu____3667  ->
    match uu____3667 with
    | (typedecl,fsdoc_opt) ->
        let uu____3680 = FStar_Pprint.optional p_fsdoc fsdoc_opt  in
        let uu____3681 = p_typeDecl typedecl  in
        FStar_Pprint.op_Hat_Hat uu____3680 uu____3681

and (p_typeDecl : FStar_Parser_AST.tycon -> FStar_Pprint.document) =
  fun uu___55_3682  ->
    match uu___55_3682 with
    | FStar_Parser_AST.TyconAbstract (lid,bs,typ_opt) ->
        let empty' uu____3697 = FStar_Pprint.empty  in
        p_typeDeclPrefix lid bs typ_opt empty'
    | FStar_Parser_AST.TyconAbbrev (lid,bs,typ_opt,t) ->
        let f uu____3713 =
          let uu____3714 = p_typ false false t  in
          prefix2 FStar_Pprint.equals uu____3714  in
        p_typeDeclPrefix lid bs typ_opt f
    | FStar_Parser_AST.TyconRecord (lid,bs,typ_opt,record_field_decls) ->
        let p_recordFieldAndComments ps uu____3761 =
          match uu____3761 with
          | (lid1,t,doc_opt) ->
              let uu____3777 =
                FStar_Range.extend_to_end_of_line t.FStar_Parser_AST.range
                 in
              with_comment (p_recordFieldDecl ps) (lid1, t, doc_opt)
                uu____3777
           in
        let p_fields uu____3791 =
          let uu____3792 =
            let uu____3793 =
              let uu____3794 =
                let uu____3795 =
                  FStar_Pprint.op_Hat_Hat FStar_Pprint.semi break1  in
                separate_map_last uu____3795 p_recordFieldAndComments
                  record_field_decls
                 in
              braces_with_nesting uu____3794  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____3793  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.equals uu____3792  in
        p_typeDeclPrefix lid bs typ_opt p_fields
    | FStar_Parser_AST.TyconVariant (lid,bs,typ_opt,ct_decls) ->
        let p_constructorBranchAndComments uu____3859 =
          match uu____3859 with
          | (uid,t_opt,doc_opt,use_of) ->
              let range =
                let uu____3885 =
                  let uu____3886 =
                    FStar_Util.map_opt t_opt
                      (fun t  -> t.FStar_Parser_AST.range)
                     in
                  FStar_Util.dflt uid.FStar_Ident.idRange uu____3886  in
                FStar_Range.extend_to_end_of_line uu____3885  in
              let p_constructorBranch decl =
                let uu____3919 =
                  let uu____3920 =
                    let uu____3921 = p_constructorDecl decl  in
                    FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____3921  in
                  FStar_Pprint.op_Hat_Hat FStar_Pprint.bar uu____3920  in
                FStar_Pprint.group uu____3919  in
              with_comment p_constructorBranch (uid, t_opt, doc_opt, use_of)
                range
           in
        let datacon_doc uu____3941 =
          let uu____3942 =
            FStar_Pprint.separate_map break1 p_constructorBranchAndComments
              ct_decls
             in
          FStar_Pprint.group uu____3942  in
        p_typeDeclPrefix lid bs typ_opt
          (fun uu____3957  ->
             let uu____3958 = datacon_doc ()  in
             prefix2 FStar_Pprint.equals uu____3958)

and (p_typeDeclPrefix :
  FStar_Ident.ident ->
    FStar_Parser_AST.binder Prims.list ->
      FStar_Parser_AST.knd FStar_Pervasives_Native.option ->
        (Prims.unit -> FStar_Pprint.document) -> FStar_Pprint.document)
  =
  fun lid  ->
    fun bs  ->
      fun typ_opt  ->
        fun cont  ->
          if (bs = []) && (typ_opt = FStar_Pervasives_Native.None)
          then
            let uu____3973 = p_ident lid  in
            let uu____3974 =
              let uu____3975 = cont ()  in
              FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____3975  in
            FStar_Pprint.op_Hat_Hat uu____3973 uu____3974
          else
            (let binders_doc =
               let uu____3978 = p_typars bs  in
               let uu____3979 =
                 FStar_Pprint.optional
                   (fun t  ->
                      let uu____3983 =
                        let uu____3984 =
                          let uu____3985 = p_typ false false t  in
                          FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                            uu____3985
                           in
                        FStar_Pprint.op_Hat_Hat FStar_Pprint.colon uu____3984
                         in
                      FStar_Pprint.op_Hat_Hat break1 uu____3983) typ_opt
                  in
               FStar_Pprint.op_Hat_Hat uu____3978 uu____3979  in
             let uu____3986 = p_ident lid  in
             let uu____3987 = cont ()  in
             FStar_Pprint.surround (Prims.parse_int "2")
               (Prims.parse_int "1") uu____3986 binders_doc uu____3987)

and (p_recordFieldDecl :
  Prims.bool ->
    (FStar_Ident.ident,FStar_Parser_AST.term,FStar_Parser_AST.fsdoc
                                               FStar_Pervasives_Native.option)
      FStar_Pervasives_Native.tuple3 -> FStar_Pprint.document)
  =
  fun ps  ->
    fun uu____3989  ->
      match uu____3989 with
      | (lid,t,doc_opt) ->
          let uu____4005 =
            let uu____4006 = FStar_Pprint.optional p_fsdoc doc_opt  in
            let uu____4007 =
              let uu____4008 = p_lident lid  in
              let uu____4009 =
                let uu____4010 = p_typ ps false t  in
                FStar_Pprint.op_Hat_Hat FStar_Pprint.colon uu____4010  in
              FStar_Pprint.op_Hat_Hat uu____4008 uu____4009  in
            FStar_Pprint.op_Hat_Hat uu____4006 uu____4007  in
          FStar_Pprint.group uu____4005

and (p_constructorDecl :
  (FStar_Ident.ident,FStar_Parser_AST.term FStar_Pervasives_Native.option,
    FStar_Parser_AST.fsdoc FStar_Pervasives_Native.option,Prims.bool)
    FStar_Pervasives_Native.tuple4 -> FStar_Pprint.document)
  =
  fun uu____4011  ->
    match uu____4011 with
    | (uid,t_opt,doc_opt,use_of) ->
        let sep = if use_of then str "of" else FStar_Pprint.colon  in
        let uid_doc = p_uident uid  in
        let uu____4039 = FStar_Pprint.optional p_fsdoc doc_opt  in
        let uu____4040 =
          let uu____4041 = FStar_Pprint.break_ (Prims.parse_int "0")  in
          let uu____4042 =
            default_or_map uid_doc
              (fun t  ->
                 let uu____4047 =
                   let uu____4048 =
                     FStar_Pprint.op_Hat_Hat FStar_Pprint.space sep  in
                   FStar_Pprint.op_Hat_Hat uid_doc uu____4048  in
                 let uu____4049 = p_typ false false t  in
                 op_Hat_Slash_Plus_Hat uu____4047 uu____4049) t_opt
             in
          FStar_Pprint.op_Hat_Hat uu____4041 uu____4042  in
        FStar_Pprint.op_Hat_Hat uu____4039 uu____4040

and (p_letlhs :
  (FStar_Parser_AST.pattern,FStar_Parser_AST.term)
    FStar_Pervasives_Native.tuple2 -> FStar_Pprint.document)
  =
  fun uu____4050  ->
    match uu____4050 with
    | (pat,uu____4056) ->
        let uu____4057 =
          match pat.FStar_Parser_AST.pat with
          | FStar_Parser_AST.PatAscribed
              (pat1,(t,FStar_Pervasives_Native.None )) ->
              let uu____4076 =
                let uu____4077 =
                  let uu____4078 =
                    let uu____4079 =
                      let uu____4080 = p_tmArrow p_tmNoEq t  in
                      FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____4080
                       in
                    FStar_Pprint.op_Hat_Hat FStar_Pprint.colon uu____4079  in
                  FStar_Pprint.group uu____4078  in
                FStar_Pprint.op_Hat_Hat break1 uu____4077  in
              (pat1, uu____4076)
          | FStar_Parser_AST.PatAscribed
              (pat1,(t,FStar_Pervasives_Native.Some tac)) ->
              let uu____4092 =
                let uu____4093 =
                  let uu____4094 =
                    let uu____4095 =
                      let uu____4096 =
                        let uu____4097 = p_tmArrow p_tmNoEq t  in
                        FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____4097
                         in
                      FStar_Pprint.op_Hat_Hat FStar_Pprint.colon uu____4096
                       in
                    FStar_Pprint.group uu____4095  in
                  let uu____4098 =
                    let uu____4099 =
                      let uu____4100 = str "by"  in
                      let uu____4101 =
                        let uu____4102 = p_atomicTerm tac  in
                        FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____4102
                         in
                      FStar_Pprint.op_Hat_Hat uu____4100 uu____4101  in
                    FStar_Pprint.group uu____4099  in
                  FStar_Pprint.op_Hat_Hat uu____4094 uu____4098  in
                FStar_Pprint.op_Hat_Hat break1 uu____4093  in
              (pat1, uu____4092)
          | uu____4103 -> (pat, FStar_Pprint.empty)  in
        (match uu____4057 with
         | (pat1,ascr_doc) ->
             (match pat1.FStar_Parser_AST.pat with
              | FStar_Parser_AST.PatApp
                  ({
                     FStar_Parser_AST.pat = FStar_Parser_AST.PatVar
                       (x,uu____4107);
                     FStar_Parser_AST.prange = uu____4108;_},pats)
                  ->
                  let uu____4118 =
                    let uu____4119 = p_lident x  in
                    let uu____4120 =
                      let uu____4121 =
                        separate_map_or_flow break1 p_atomicPattern pats  in
                      FStar_Pprint.op_Hat_Hat uu____4121 ascr_doc  in
                    FStar_Pprint.op_Hat_Slash_Hat uu____4119 uu____4120  in
                  FStar_Pprint.group uu____4118
              | uu____4122 ->
                  let uu____4123 =
                    let uu____4124 = p_tuplePattern pat1  in
                    FStar_Pprint.op_Hat_Hat uu____4124 ascr_doc  in
                  FStar_Pprint.group uu____4123))

and (p_letbinding :
  (FStar_Parser_AST.pattern,FStar_Parser_AST.term)
    FStar_Pervasives_Native.tuple2 -> FStar_Pprint.document)
  =
  fun uu____4125  ->
    match uu____4125 with
    | (pat,e) ->
        let pat_doc = p_letlhs (pat, e)  in
        let uu____4133 =
          let uu____4134 =
            FStar_Pprint.op_Hat_Slash_Hat pat_doc FStar_Pprint.equals  in
          FStar_Pprint.group uu____4134  in
        let uu____4135 = p_term false false e  in
        prefix2 uu____4133 uu____4135

and (p_newEffect : FStar_Parser_AST.effect_decl -> FStar_Pprint.document) =
  fun uu___56_4136  ->
    match uu___56_4136 with
    | FStar_Parser_AST.RedefineEffect (lid,bs,t) ->
        p_effectRedefinition lid bs t
    | FStar_Parser_AST.DefineEffect (lid,bs,t,eff_decls) ->
        p_effectDefinition lid bs t eff_decls

and (p_effectRedefinition :
  FStar_Ident.ident ->
    FStar_Parser_AST.binder Prims.list ->
      FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun uid  ->
    fun bs  ->
      fun t  ->
        let uu____4161 = p_uident uid  in
        let uu____4162 = p_binders true bs  in
        let uu____4163 =
          let uu____4164 = p_simpleTerm false false t  in
          prefix2 FStar_Pprint.equals uu____4164  in
        FStar_Pprint.surround (Prims.parse_int "2") (Prims.parse_int "1")
          uu____4161 uu____4162 uu____4163

and (p_effectDefinition :
  FStar_Ident.ident ->
    FStar_Parser_AST.binder Prims.list ->
      FStar_Parser_AST.term ->
        FStar_Parser_AST.decl Prims.list -> FStar_Pprint.document)
  =
  fun uid  ->
    fun bs  ->
      fun t  ->
        fun eff_decls  ->
          let uu____4173 =
            let uu____4174 =
              let uu____4175 =
                let uu____4176 = p_uident uid  in
                let uu____4177 = p_binders true bs  in
                let uu____4178 =
                  let uu____4179 = p_typ false false t  in
                  prefix2 FStar_Pprint.colon uu____4179  in
                FStar_Pprint.surround (Prims.parse_int "2")
                  (Prims.parse_int "1") uu____4176 uu____4177 uu____4178
                 in
              FStar_Pprint.group uu____4175  in
            let uu____4180 =
              let uu____4181 = str "with"  in
              let uu____4182 =
                separate_break_map_last FStar_Pprint.semi p_effectDecl
                  eff_decls
                 in
              prefix2 uu____4181 uu____4182  in
            FStar_Pprint.op_Hat_Slash_Hat uu____4174 uu____4180  in
          braces_with_nesting uu____4173

and (p_effectDecl :
  Prims.bool -> FStar_Parser_AST.decl -> FStar_Pprint.document) =
  fun ps  ->
    fun d  ->
      match d.FStar_Parser_AST.d with
      | FStar_Parser_AST.Tycon
          (false
           ,(FStar_Parser_AST.TyconAbbrev
             (lid,[],FStar_Pervasives_Native.None ,e),FStar_Pervasives_Native.None
             )::[])
          ->
          let uu____4213 =
            let uu____4214 = p_lident lid  in
            let uu____4215 =
              FStar_Pprint.op_Hat_Hat FStar_Pprint.space FStar_Pprint.equals
               in
            FStar_Pprint.op_Hat_Hat uu____4214 uu____4215  in
          let uu____4216 = p_simpleTerm ps false e  in
          prefix2 uu____4213 uu____4216
      | uu____4217 ->
          let uu____4218 =
            let uu____4219 = FStar_Parser_AST.decl_to_string d  in
            FStar_Util.format1
              "Not a declaration of an effect member... or at least I hope so : %s"
              uu____4219
             in
          failwith uu____4218

and (p_subEffect : FStar_Parser_AST.lift -> FStar_Pprint.document) =
  fun lift  ->
    let lift_op_doc =
      let lifts =
        match lift.FStar_Parser_AST.lift_op with
        | FStar_Parser_AST.NonReifiableLift t -> [("lift_wp", t)]
        | FStar_Parser_AST.ReifiableLift (t1,t2) ->
            [("lift_wp", t1); ("lift", t2)]
        | FStar_Parser_AST.LiftForFree t -> [("lift", t)]  in
      let p_lift ps uu____4277 =
        match uu____4277 with
        | (kwd,t) ->
            let uu____4284 =
              let uu____4285 = str kwd  in
              let uu____4286 =
                FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                  FStar_Pprint.equals
                 in
              FStar_Pprint.op_Hat_Hat uu____4285 uu____4286  in
            let uu____4287 = p_simpleTerm ps false t  in
            prefix2 uu____4284 uu____4287
         in
      separate_break_map_last FStar_Pprint.semi p_lift lifts  in
    let uu____4292 =
      let uu____4293 =
        let uu____4294 = p_quident lift.FStar_Parser_AST.msource  in
        let uu____4295 =
          let uu____4296 = str "~>"  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____4296  in
        FStar_Pprint.op_Hat_Hat uu____4294 uu____4295  in
      let uu____4297 = p_quident lift.FStar_Parser_AST.mdest  in
      prefix2 uu____4293 uu____4297  in
    let uu____4298 =
      let uu____4299 = braces_with_nesting lift_op_doc  in
      FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____4299  in
    FStar_Pprint.op_Hat_Hat uu____4292 uu____4298

and (p_qualifier : FStar_Parser_AST.qualifier -> FStar_Pprint.document) =
  fun uu___57_4300  ->
    match uu___57_4300 with
    | FStar_Parser_AST.Private  -> str "private"
    | FStar_Parser_AST.Abstract  -> str "abstract"
    | FStar_Parser_AST.Noeq  -> str "noeq"
    | FStar_Parser_AST.Unopteq  -> str "unopteq"
    | FStar_Parser_AST.Assumption  -> str "assume"
    | FStar_Parser_AST.DefaultEffect  -> str "default"
    | FStar_Parser_AST.TotalEffect  -> str "total"
    | FStar_Parser_AST.Effect_qual  -> FStar_Pprint.empty
    | FStar_Parser_AST.New  -> str "new"
    | FStar_Parser_AST.Inline  -> str "inline"
    | FStar_Parser_AST.Visible  -> FStar_Pprint.empty
    | FStar_Parser_AST.Unfold_for_unification_and_vcgen  -> str "unfold"
    | FStar_Parser_AST.Inline_for_extraction  -> str "inline_for_extraction"
    | FStar_Parser_AST.Irreducible  -> str "irreducible"
    | FStar_Parser_AST.NoExtract  -> str "noextract"
    | FStar_Parser_AST.Reifiable  -> str "reifiable"
    | FStar_Parser_AST.Reflectable  -> str "reflectable"
    | FStar_Parser_AST.Opaque  -> str "opaque"
    | FStar_Parser_AST.Logic  -> str "logic"

and (p_qualifiers : FStar_Parser_AST.qualifiers -> FStar_Pprint.document) =
  fun qs  ->
    let uu____4302 = FStar_Pprint.separate_map break1 p_qualifier qs  in
    FStar_Pprint.group uu____4302

and (p_letqualifier :
  FStar_Parser_AST.let_qualifier -> FStar_Pprint.document) =
  fun uu___58_4303  ->
    match uu___58_4303 with
    | FStar_Parser_AST.Rec  ->
        let uu____4304 = str "rec"  in
        FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____4304
    | FStar_Parser_AST.Mutable  ->
        let uu____4305 = str "mutable"  in
        FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____4305
    | FStar_Parser_AST.NoLetQualifier  -> FStar_Pprint.empty

and (p_aqual : FStar_Parser_AST.arg_qualifier -> FStar_Pprint.document) =
  fun uu___59_4306  ->
    match uu___59_4306 with
    | FStar_Parser_AST.Implicit  -> str "#"
    | FStar_Parser_AST.Equality  -> str "$"

and (p_disjunctivePattern :
  FStar_Parser_AST.pattern -> FStar_Pprint.document) =
  fun p  ->
    match p.FStar_Parser_AST.pat with
    | FStar_Parser_AST.PatOr pats ->
        let uu____4311 =
          let uu____4312 =
            let uu____4313 =
              FStar_Pprint.op_Hat_Hat FStar_Pprint.bar FStar_Pprint.space  in
            FStar_Pprint.op_Hat_Hat break1 uu____4313  in
          FStar_Pprint.separate_map uu____4312 p_tuplePattern pats  in
        FStar_Pprint.group uu____4311
    | uu____4314 -> p_tuplePattern p

and (p_tuplePattern : FStar_Parser_AST.pattern -> FStar_Pprint.document) =
  fun p  ->
    match p.FStar_Parser_AST.pat with
    | FStar_Parser_AST.PatTuple (pats,false ) ->
        let uu____4321 =
          let uu____4322 = FStar_Pprint.op_Hat_Hat FStar_Pprint.comma break1
             in
          FStar_Pprint.separate_map uu____4322 p_constructorPattern pats  in
        FStar_Pprint.group uu____4321
    | uu____4323 -> p_constructorPattern p

and (p_constructorPattern :
  FStar_Parser_AST.pattern -> FStar_Pprint.document) =
  fun p  ->
    match p.FStar_Parser_AST.pat with
    | FStar_Parser_AST.PatApp
        ({ FStar_Parser_AST.pat = FStar_Parser_AST.PatName maybe_cons_lid;
           FStar_Parser_AST.prange = uu____4326;_},hd1::tl1::[])
        when
        FStar_Ident.lid_equals maybe_cons_lid FStar_Parser_Const.cons_lid ->
        let uu____4331 =
          FStar_Pprint.op_Hat_Hat FStar_Pprint.colon FStar_Pprint.colon  in
        let uu____4332 = p_constructorPattern hd1  in
        let uu____4333 = p_constructorPattern tl1  in
        infix0 uu____4331 uu____4332 uu____4333
    | FStar_Parser_AST.PatApp
        ({ FStar_Parser_AST.pat = FStar_Parser_AST.PatName uid;
           FStar_Parser_AST.prange = uu____4335;_},pats)
        ->
        let uu____4341 = p_quident uid  in
        let uu____4342 =
          FStar_Pprint.separate_map break1 p_atomicPattern pats  in
        prefix2 uu____4341 uu____4342
    | uu____4343 -> p_atomicPattern p

and (p_atomicPattern : FStar_Parser_AST.pattern -> FStar_Pprint.document) =
  fun p  ->
    match p.FStar_Parser_AST.pat with
    | FStar_Parser_AST.PatAscribed (pat,(t,FStar_Pervasives_Native.None )) ->
        (match ((pat.FStar_Parser_AST.pat), (t.FStar_Parser_AST.tm)) with
         | (FStar_Parser_AST.PatVar (lid,aqual),FStar_Parser_AST.Refine
            ({ FStar_Parser_AST.b = FStar_Parser_AST.Annotated (lid',t1);
               FStar_Parser_AST.brange = uu____4359;
               FStar_Parser_AST.blevel = uu____4360;
               FStar_Parser_AST.aqual = uu____4361;_},phi))
             when lid.FStar_Ident.idText = lid'.FStar_Ident.idText ->
             let uu____4367 =
               let uu____4368 = p_ident lid  in
               p_refinement aqual uu____4368 t1 phi  in
             soft_parens_with_nesting uu____4367
         | (FStar_Parser_AST.PatWild ,FStar_Parser_AST.Refine
            ({ FStar_Parser_AST.b = FStar_Parser_AST.NoName t1;
               FStar_Parser_AST.brange = uu____4370;
               FStar_Parser_AST.blevel = uu____4371;
               FStar_Parser_AST.aqual = uu____4372;_},phi))
             ->
             let uu____4374 =
               p_refinement FStar_Pervasives_Native.None
                 FStar_Pprint.underscore t1 phi
                in
             soft_parens_with_nesting uu____4374
         | uu____4375 ->
             let uu____4380 =
               let uu____4381 = p_tuplePattern pat  in
               let uu____4382 =
                 let uu____4383 = FStar_Pprint.break_ (Prims.parse_int "0")
                    in
                 let uu____4384 =
                   let uu____4385 = p_tmEqNoRefinement t  in
                   FStar_Pprint.op_Hat_Hat FStar_Pprint.colon uu____4385  in
                 FStar_Pprint.op_Hat_Hat uu____4383 uu____4384  in
               FStar_Pprint.op_Hat_Hat uu____4381 uu____4382  in
             soft_parens_with_nesting uu____4380)
    | FStar_Parser_AST.PatList pats ->
        let uu____4389 =
          separate_break_map FStar_Pprint.semi p_tuplePattern pats  in
        FStar_Pprint.surround (Prims.parse_int "2") (Prims.parse_int "0")
          FStar_Pprint.lbracket uu____4389 FStar_Pprint.rbracket
    | FStar_Parser_AST.PatRecord pats ->
        let p_recordFieldPat uu____4404 =
          match uu____4404 with
          | (lid,pat) ->
              let uu____4411 = p_qlident lid  in
              let uu____4412 = p_tuplePattern pat  in
              infix2 FStar_Pprint.equals uu____4411 uu____4412
           in
        let uu____4413 =
          separate_break_map FStar_Pprint.semi p_recordFieldPat pats  in
        soft_braces_with_nesting uu____4413
    | FStar_Parser_AST.PatTuple (pats,true ) ->
        let uu____4423 =
          FStar_Pprint.op_Hat_Hat FStar_Pprint.lparen FStar_Pprint.bar  in
        let uu____4424 =
          separate_break_map FStar_Pprint.comma p_constructorPattern pats  in
        let uu____4425 =
          FStar_Pprint.op_Hat_Hat FStar_Pprint.bar FStar_Pprint.rparen  in
        FStar_Pprint.surround (Prims.parse_int "2") (Prims.parse_int "1")
          uu____4423 uu____4424 uu____4425
    | FStar_Parser_AST.PatTvar (tv,arg_qualifier_opt) -> p_tvar tv
    | FStar_Parser_AST.PatOp op ->
        let uu____4436 =
          let uu____4437 =
            let uu____4438 = str (FStar_Ident.text_of_id op)  in
            let uu____4439 =
              FStar_Pprint.op_Hat_Hat FStar_Pprint.space FStar_Pprint.rparen
               in
            FStar_Pprint.op_Hat_Hat uu____4438 uu____4439  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____4437  in
        FStar_Pprint.op_Hat_Hat FStar_Pprint.lparen uu____4436
    | FStar_Parser_AST.PatWild  -> FStar_Pprint.underscore
    | FStar_Parser_AST.PatConst c -> p_constant c
    | FStar_Parser_AST.PatVar (lid,aqual) ->
        let uu____4447 = FStar_Pprint.optional p_aqual aqual  in
        let uu____4448 = p_lident lid  in
        FStar_Pprint.op_Hat_Hat uu____4447 uu____4448
    | FStar_Parser_AST.PatName uid -> p_quident uid
    | FStar_Parser_AST.PatOr uu____4450 -> failwith "Inner or pattern !"
    | FStar_Parser_AST.PatApp
        ({ FStar_Parser_AST.pat = FStar_Parser_AST.PatName uu____4453;
           FStar_Parser_AST.prange = uu____4454;_},uu____4455)
        ->
        let uu____4460 = p_tuplePattern p  in
        soft_parens_with_nesting uu____4460
    | FStar_Parser_AST.PatTuple (uu____4461,false ) ->
        let uu____4466 = p_tuplePattern p  in
        soft_parens_with_nesting uu____4466
    | uu____4467 ->
        let uu____4468 =
          let uu____4469 = FStar_Parser_AST.pat_to_string p  in
          FStar_Util.format1 "Invalid pattern %s" uu____4469  in
        failwith uu____4468

and (p_binder :
  Prims.bool -> FStar_Parser_AST.binder -> FStar_Pprint.document) =
  fun is_atomic  ->
    fun b  ->
      match b.FStar_Parser_AST.b with
      | FStar_Parser_AST.Variable lid ->
          let uu____4473 =
            FStar_Pprint.optional p_aqual b.FStar_Parser_AST.aqual  in
          let uu____4474 = p_lident lid  in
          FStar_Pprint.op_Hat_Hat uu____4473 uu____4474
      | FStar_Parser_AST.TVariable lid -> p_lident lid
      | FStar_Parser_AST.Annotated (lid,t) ->
          let doc1 =
            match t.FStar_Parser_AST.tm with
            | FStar_Parser_AST.Refine
                ({ FStar_Parser_AST.b = FStar_Parser_AST.Annotated (lid',t1);
                   FStar_Parser_AST.brange = uu____4481;
                   FStar_Parser_AST.blevel = uu____4482;
                   FStar_Parser_AST.aqual = uu____4483;_},phi)
                when lid.FStar_Ident.idText = lid'.FStar_Ident.idText ->
                let uu____4485 = p_ident lid  in
                p_refinement b.FStar_Parser_AST.aqual uu____4485 t1 phi
            | uu____4486 ->
                let uu____4487 =
                  FStar_Pprint.optional p_aqual b.FStar_Parser_AST.aqual  in
                let uu____4488 =
                  let uu____4489 = p_lident lid  in
                  let uu____4490 =
                    let uu____4491 =
                      let uu____4492 =
                        FStar_Pprint.break_ (Prims.parse_int "0")  in
                      let uu____4493 = p_tmFormula t  in
                      FStar_Pprint.op_Hat_Hat uu____4492 uu____4493  in
                    FStar_Pprint.op_Hat_Hat FStar_Pprint.colon uu____4491  in
                  FStar_Pprint.op_Hat_Hat uu____4489 uu____4490  in
                FStar_Pprint.op_Hat_Hat uu____4487 uu____4488
             in
          if is_atomic
          then
            let uu____4494 =
              let uu____4495 =
                FStar_Pprint.op_Hat_Hat doc1 FStar_Pprint.rparen  in
              FStar_Pprint.op_Hat_Hat FStar_Pprint.lparen uu____4495  in
            FStar_Pprint.group uu____4494
          else FStar_Pprint.group doc1
      | FStar_Parser_AST.TAnnotated uu____4497 ->
          failwith "Is this still used ?"
      | FStar_Parser_AST.NoName t ->
          (match t.FStar_Parser_AST.tm with
           | FStar_Parser_AST.Refine
               ({ FStar_Parser_AST.b = FStar_Parser_AST.NoName t1;
                  FStar_Parser_AST.brange = uu____4504;
                  FStar_Parser_AST.blevel = uu____4505;
                  FStar_Parser_AST.aqual = uu____4506;_},phi)
               ->
               if is_atomic
               then
                 let uu____4508 =
                   let uu____4509 =
                     let uu____4510 =
                       p_refinement b.FStar_Parser_AST.aqual
                         FStar_Pprint.underscore t1 phi
                        in
                     FStar_Pprint.op_Hat_Hat uu____4510 FStar_Pprint.rparen
                      in
                   FStar_Pprint.op_Hat_Hat FStar_Pprint.lparen uu____4509  in
                 FStar_Pprint.group uu____4508
               else
                 (let uu____4512 =
                    p_refinement b.FStar_Parser_AST.aqual
                      FStar_Pprint.underscore t1 phi
                     in
                  FStar_Pprint.group uu____4512)
           | uu____4513 -> if is_atomic then p_atomicTerm t else p_appTerm t)

and (p_refinement :
  FStar_Parser_AST.arg_qualifier FStar_Pervasives_Native.option ->
    FStar_Pprint.document ->
      FStar_Parser_AST.term -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun aqual_opt  ->
    fun binder  ->
      fun t  ->
        fun phi  ->
          let uu____4521 = FStar_Pprint.optional p_aqual aqual_opt  in
          let uu____4522 =
            let uu____4523 =
              let uu____4524 =
                let uu____4525 = p_appTerm t  in
                let uu____4526 =
                  let uu____4527 = p_noSeqTerm false false phi  in
                  soft_braces_with_nesting uu____4527  in
                FStar_Pprint.op_Hat_Hat uu____4525 uu____4526  in
              FStar_Pprint.op_Hat_Hat FStar_Pprint.colon uu____4524  in
            FStar_Pprint.op_Hat_Hat binder uu____4523  in
          FStar_Pprint.op_Hat_Hat uu____4521 uu____4522

and (p_binders :
  Prims.bool -> FStar_Parser_AST.binder Prims.list -> FStar_Pprint.document)
  =
  fun is_atomic  ->
    fun bs  -> separate_map_or_flow break1 (p_binder is_atomic) bs

and (p_qlident : FStar_Ident.lid -> FStar_Pprint.document) =
  fun lid  -> str (FStar_Ident.text_of_lid lid)

and (p_quident : FStar_Ident.lid -> FStar_Pprint.document) =
  fun lid  -> str (FStar_Ident.text_of_lid lid)

and (p_ident : FStar_Ident.ident -> FStar_Pprint.document) =
  fun lid  -> str (FStar_Ident.text_of_id lid)

and (p_lident : FStar_Ident.ident -> FStar_Pprint.document) =
  fun lid  -> str (FStar_Ident.text_of_id lid)

and (p_uident : FStar_Ident.ident -> FStar_Pprint.document) =
  fun lid  -> str (FStar_Ident.text_of_id lid)

and (p_tvar : FStar_Ident.ident -> FStar_Pprint.document) =
  fun lid  -> str (FStar_Ident.text_of_id lid)

and (p_lidentOrUnderscore : FStar_Ident.ident -> FStar_Pprint.document) =
  fun id1  ->
    if
      FStar_Util.starts_with FStar_Ident.reserved_prefix
        id1.FStar_Ident.idText
    then FStar_Pprint.underscore
    else p_lident id1

and (paren_if : Prims.bool -> FStar_Pprint.document -> FStar_Pprint.document)
  = fun b  -> if b then soft_parens_with_nesting else (fun x  -> x)

and (p_term :
  Prims.bool -> Prims.bool -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun ps  ->
    fun pb  ->
      fun e  ->
        match e.FStar_Parser_AST.tm with
        | FStar_Parser_AST.Seq (e1,e2) ->
            let uu____4550 =
              let uu____4551 =
                let uu____4552 = p_noSeqTerm true false e1  in
                FStar_Pprint.op_Hat_Hat uu____4552 FStar_Pprint.semi  in
              FStar_Pprint.group uu____4551  in
            let uu____4553 = p_term ps pb e2  in
            FStar_Pprint.op_Hat_Slash_Hat uu____4550 uu____4553
        | FStar_Parser_AST.Bind (x,e1,e2) ->
            let uu____4557 =
              let uu____4558 =
                let uu____4559 =
                  let uu____4560 = p_lident x  in
                  let uu____4561 =
                    FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                      FStar_Pprint.long_left_arrow
                     in
                  FStar_Pprint.op_Hat_Hat uu____4560 uu____4561  in
                let uu____4562 =
                  let uu____4563 = p_noSeqTerm true false e1  in
                  let uu____4564 =
                    FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                      FStar_Pprint.semi
                     in
                  FStar_Pprint.op_Hat_Hat uu____4563 uu____4564  in
                op_Hat_Slash_Plus_Hat uu____4559 uu____4562  in
              FStar_Pprint.group uu____4558  in
            let uu____4565 = p_term ps pb e2  in
            FStar_Pprint.op_Hat_Slash_Hat uu____4557 uu____4565
        | uu____4566 ->
            let uu____4567 = p_noSeqTerm ps pb e  in
            FStar_Pprint.group uu____4567

and (p_noSeqTerm :
  Prims.bool -> Prims.bool -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun ps  ->
    fun pb  ->
      fun e  -> with_comment (p_noSeqTerm' ps pb) e e.FStar_Parser_AST.range

and (p_noSeqTerm' :
  Prims.bool -> Prims.bool -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun ps  ->
    fun pb  ->
      fun e  ->
        match e.FStar_Parser_AST.tm with
        | FStar_Parser_AST.Ascribed (e1,t,FStar_Pervasives_Native.None ) ->
            let uu____4578 =
              let uu____4579 = p_tmIff e1  in
              let uu____4580 =
                let uu____4581 =
                  let uu____4582 = p_typ ps pb t  in
                  FStar_Pprint.op_Hat_Slash_Hat FStar_Pprint.colon uu____4582
                   in
                FStar_Pprint.op_Hat_Hat FStar_Pprint.langle uu____4581  in
              FStar_Pprint.op_Hat_Slash_Hat uu____4579 uu____4580  in
            FStar_Pprint.group uu____4578
        | FStar_Parser_AST.Ascribed (e1,t,FStar_Pervasives_Native.Some tac)
            ->
            let uu____4588 =
              let uu____4589 = p_tmIff e1  in
              let uu____4590 =
                let uu____4591 =
                  let uu____4592 =
                    let uu____4593 = p_typ false false t  in
                    let uu____4594 =
                      let uu____4595 = str "by"  in
                      let uu____4596 = p_typ ps pb tac  in
                      FStar_Pprint.op_Hat_Slash_Hat uu____4595 uu____4596  in
                    FStar_Pprint.op_Hat_Slash_Hat uu____4593 uu____4594  in
                  FStar_Pprint.op_Hat_Slash_Hat FStar_Pprint.colon uu____4592
                   in
                FStar_Pprint.op_Hat_Hat FStar_Pprint.langle uu____4591  in
              FStar_Pprint.op_Hat_Slash_Hat uu____4589 uu____4590  in
            FStar_Pprint.group uu____4588
        | FStar_Parser_AST.Op
            ({ FStar_Ident.idText = ".()<-";
               FStar_Ident.idRange = uu____4597;_},e1::e2::e3::[])
            ->
            let uu____4603 =
              let uu____4604 =
                let uu____4605 =
                  let uu____4606 = p_atomicTermNotQUident e1  in
                  let uu____4607 =
                    let uu____4608 =
                      let uu____4609 =
                        let uu____4610 = p_term false false e2  in
                        soft_parens_with_nesting uu____4610  in
                      let uu____4611 =
                        FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                          FStar_Pprint.larrow
                         in
                      FStar_Pprint.op_Hat_Hat uu____4609 uu____4611  in
                    FStar_Pprint.op_Hat_Hat FStar_Pprint.dot uu____4608  in
                  FStar_Pprint.op_Hat_Hat uu____4606 uu____4607  in
                FStar_Pprint.group uu____4605  in
              let uu____4612 =
                let uu____4613 = p_noSeqTerm ps pb e3  in jump2 uu____4613
                 in
              FStar_Pprint.op_Hat_Hat uu____4604 uu____4612  in
            FStar_Pprint.group uu____4603
        | FStar_Parser_AST.Op
            ({ FStar_Ident.idText = ".[]<-";
               FStar_Ident.idRange = uu____4614;_},e1::e2::e3::[])
            ->
            let uu____4620 =
              let uu____4621 =
                let uu____4622 =
                  let uu____4623 = p_atomicTermNotQUident e1  in
                  let uu____4624 =
                    let uu____4625 =
                      let uu____4626 =
                        let uu____4627 = p_term false false e2  in
                        soft_brackets_with_nesting uu____4627  in
                      let uu____4628 =
                        FStar_Pprint.op_Hat_Hat FStar_Pprint.space
                          FStar_Pprint.larrow
                         in
                      FStar_Pprint.op_Hat_Hat uu____4626 uu____4628  in
                    FStar_Pprint.op_Hat_Hat FStar_Pprint.dot uu____4625  in
                  FStar_Pprint.op_Hat_Hat uu____4623 uu____4624  in
                FStar_Pprint.group uu____4622  in
              let uu____4629 =
                let uu____4630 = p_noSeqTerm ps pb e3  in jump2 uu____4630
                 in
              FStar_Pprint.op_Hat_Hat uu____4621 uu____4629  in
            FStar_Pprint.group uu____4620
        | FStar_Parser_AST.Requires (e1,wtf) ->
            let uu____4640 =
              let uu____4641 = str "requires"  in
              let uu____4642 = p_typ ps pb e1  in
              FStar_Pprint.op_Hat_Slash_Hat uu____4641 uu____4642  in
            FStar_Pprint.group uu____4640
        | FStar_Parser_AST.Ensures (e1,wtf) ->
            let uu____4652 =
              let uu____4653 = str "ensures"  in
              let uu____4654 = p_typ ps pb e1  in
              FStar_Pprint.op_Hat_Slash_Hat uu____4653 uu____4654  in
            FStar_Pprint.group uu____4652
        | FStar_Parser_AST.Attributes es ->
            let uu____4658 =
              let uu____4659 = str "attributes"  in
              let uu____4660 =
                FStar_Pprint.separate_map break1 p_atomicTerm es  in
              FStar_Pprint.op_Hat_Slash_Hat uu____4659 uu____4660  in
            FStar_Pprint.group uu____4658
        | FStar_Parser_AST.If (e1,e2,e3) ->
            if is_unit e3
            then
              let uu____4664 =
                let uu____4665 =
                  let uu____4666 = str "if"  in
                  let uu____4667 = p_noSeqTerm false false e1  in
                  op_Hat_Slash_Plus_Hat uu____4666 uu____4667  in
                let uu____4668 =
                  let uu____4669 = str "then"  in
                  let uu____4670 = p_noSeqTerm ps pb e2  in
                  op_Hat_Slash_Plus_Hat uu____4669 uu____4670  in
                FStar_Pprint.op_Hat_Slash_Hat uu____4665 uu____4668  in
              FStar_Pprint.group uu____4664
            else
              (let e2_doc =
                 match e2.FStar_Parser_AST.tm with
                 | FStar_Parser_AST.If (uu____4673,uu____4674,e31) when
                     is_unit e31 ->
                     let uu____4676 = p_noSeqTerm false false e2  in
                     soft_parens_with_nesting uu____4676
                 | uu____4677 -> p_noSeqTerm false false e2  in
               let uu____4678 =
                 let uu____4679 =
                   let uu____4680 = str "if"  in
                   let uu____4681 = p_noSeqTerm false false e1  in
                   op_Hat_Slash_Plus_Hat uu____4680 uu____4681  in
                 let uu____4682 =
                   let uu____4683 =
                     let uu____4684 = str "then"  in
                     op_Hat_Slash_Plus_Hat uu____4684 e2_doc  in
                   let uu____4685 =
                     let uu____4686 = str "else"  in
                     let uu____4687 = p_noSeqTerm ps pb e3  in
                     op_Hat_Slash_Plus_Hat uu____4686 uu____4687  in
                   FStar_Pprint.op_Hat_Slash_Hat uu____4683 uu____4685  in
                 FStar_Pprint.op_Hat_Slash_Hat uu____4679 uu____4682  in
               FStar_Pprint.group uu____4678)
        | FStar_Parser_AST.TryWith (e1,branches) ->
            let uu____4710 =
              let uu____4711 =
                let uu____4712 =
                  let uu____4713 = str "try"  in
                  let uu____4714 = p_noSeqTerm false false e1  in
                  prefix2 uu____4713 uu____4714  in
                let uu____4715 =
                  let uu____4716 = str "with"  in
                  let uu____4717 =
                    separate_map_last FStar_Pprint.hardline p_patternBranch
                      branches
                     in
                  FStar_Pprint.op_Hat_Slash_Hat uu____4716 uu____4717  in
                FStar_Pprint.op_Hat_Slash_Hat uu____4712 uu____4715  in
              FStar_Pprint.group uu____4711  in
            let uu____4726 = paren_if (ps || pb)  in uu____4726 uu____4710
        | FStar_Parser_AST.Match (e1,branches) ->
            let uu____4751 =
              let uu____4752 =
                let uu____4753 =
                  let uu____4754 = str "match"  in
                  let uu____4755 = p_noSeqTerm false false e1  in
                  let uu____4756 = str "with"  in
                  FStar_Pprint.surround (Prims.parse_int "2")
                    (Prims.parse_int "1") uu____4754 uu____4755 uu____4756
                   in
                let uu____4757 =
                  separate_map_last FStar_Pprint.hardline p_patternBranch
                    branches
                   in
                FStar_Pprint.op_Hat_Slash_Hat uu____4753 uu____4757  in
              FStar_Pprint.group uu____4752  in
            let uu____4766 = paren_if (ps || pb)  in uu____4766 uu____4751
        | FStar_Parser_AST.LetOpen (uid,e1) ->
            let uu____4771 =
              let uu____4772 =
                let uu____4773 =
                  let uu____4774 = str "let open"  in
                  let uu____4775 = p_quident uid  in
                  let uu____4776 = str "in"  in
                  FStar_Pprint.surround (Prims.parse_int "2")
                    (Prims.parse_int "1") uu____4774 uu____4775 uu____4776
                   in
                let uu____4777 = p_term false pb e1  in
                FStar_Pprint.op_Hat_Slash_Hat uu____4773 uu____4777  in
              FStar_Pprint.group uu____4772  in
            let uu____4778 = paren_if ps  in uu____4778 uu____4771
        | FStar_Parser_AST.Let (q,lbs,e1) ->
            let p_lb q1 uu____4832 =
              match uu____4832 with
              | (a,(pat,e2)) ->
                  let attrs = p_attrs_opt a  in
                  let doc_let_or_and =
                    match q1 with
                    | FStar_Pervasives_Native.Some (FStar_Parser_AST.Rec ) ->
                        let uu____4864 =
                          let uu____4865 = str "let"  in
                          let uu____4866 = str "rec"  in
                          FStar_Pprint.op_Hat_Slash_Hat uu____4865 uu____4866
                           in
                        FStar_Pprint.group uu____4864
                    | FStar_Pervasives_Native.Some
                        (FStar_Parser_AST.NoLetQualifier ) -> str "let"
                    | uu____4867 -> str "and"  in
                  let doc_pat = p_letlhs (pat, e2)  in
                  let doc_expr = p_term false false e2  in
                  let uu____4872 =
                    FStar_Pprint.surround (Prims.parse_int "2")
                      (Prims.parse_int "1") doc_let_or_and doc_pat
                      FStar_Pprint.equals
                     in
                  FStar_Pprint.prefix (Prims.parse_int "2")
                    (Prims.parse_int "1") uu____4872 doc_expr
               in
            let lbs_docs =
              let uu____4876 =
                FStar_List.mapi
                  (fun i  ->
                     fun lb  ->
                       if i = (Prims.parse_int "0")
                       then
                         let uu____4908 =
                           p_lb (FStar_Pervasives_Native.Some q) lb  in
                         FStar_Pprint.group uu____4908
                       else
                         (let uu____4910 =
                            p_lb FStar_Pervasives_Native.None lb  in
                          FStar_Pprint.group uu____4910)) lbs
                 in
              let uu____4911 = let uu____4914 = str "in"  in [uu____4914]  in
              FStar_List.append uu____4876 uu____4911  in
            let lbs_doc =
              let uu____4916 = FStar_Pprint.separate break1 lbs_docs  in
              FStar_Pprint.group uu____4916  in
            let uu____4917 =
              let uu____4918 =
                let uu____4919 = p_term false pb e1  in
                FStar_Pprint.op_Hat_Slash_Hat lbs_doc uu____4919  in
              FStar_Pprint.group uu____4918  in
            let uu____4920 = paren_if ps  in uu____4920 uu____4917
        | FStar_Parser_AST.Abs
            ({ FStar_Parser_AST.pat = FStar_Parser_AST.PatVar (x,typ_opt);
               FStar_Parser_AST.prange = uu____4925;_}::[],{
                                                             FStar_Parser_AST.tm
                                                               =
                                                               FStar_Parser_AST.Match
                                                               (maybe_x,branches);
                                                             FStar_Parser_AST.range
                                                               = uu____4928;
                                                             FStar_Parser_AST.level
                                                               = uu____4929;_})
            when matches_var maybe_x x ->
            let uu____4956 =
              let uu____4957 =
                let uu____4958 = str "function"  in
                let uu____4959 =
                  separate_map_last FStar_Pprint.hardline p_patternBranch
                    branches
                   in
                FStar_Pprint.op_Hat_Slash_Hat uu____4958 uu____4959  in
              FStar_Pprint.group uu____4957  in
            let uu____4968 = paren_if (ps || pb)  in uu____4968 uu____4956
        | FStar_Parser_AST.Quote (e1,FStar_Parser_AST.Dynamic ) ->
            let uu____4972 =
              let uu____4973 = str "quote"  in
              let uu____4974 = p_noSeqTerm ps pb e1  in
              FStar_Pprint.op_Hat_Slash_Hat uu____4973 uu____4974  in
            FStar_Pprint.group uu____4972
        | FStar_Parser_AST.Quote (e1,FStar_Parser_AST.Static ) ->
            let uu____4976 =
              let uu____4977 = str "`"  in
              let uu____4978 = p_noSeqTerm ps pb e1  in
              FStar_Pprint.op_Hat_Hat uu____4977 uu____4978  in
            FStar_Pprint.group uu____4976
        | FStar_Parser_AST.VQuote e1 ->
            let uu____4980 =
              let uu____4981 = str "%`"  in
              let uu____4982 = p_noSeqTerm ps pb e1  in
              FStar_Pprint.op_Hat_Hat uu____4981 uu____4982  in
            FStar_Pprint.group uu____4980
        | uu____4983 -> p_typ ps pb e

and (p_attrs_opt :
  FStar_Parser_AST.term Prims.list FStar_Pervasives_Native.option ->
    FStar_Pprint.document)
  =
  fun uu___60_4984  ->
    match uu___60_4984 with
    | FStar_Pervasives_Native.None  -> FStar_Pprint.empty
    | FStar_Pervasives_Native.Some terms ->
        let uu____4996 =
          let uu____4997 = str "[@"  in
          let uu____4998 =
            let uu____4999 =
              FStar_Pprint.separate_map break1 p_atomicTerm terms  in
            let uu____5000 = str "]"  in
            FStar_Pprint.op_Hat_Slash_Hat uu____4999 uu____5000  in
          FStar_Pprint.op_Hat_Slash_Hat uu____4997 uu____4998  in
        FStar_Pprint.group uu____4996

and (p_typ :
  Prims.bool -> Prims.bool -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun ps  ->
    fun pb  ->
      fun e  -> with_comment (p_typ' ps pb) e e.FStar_Parser_AST.range

and (p_typ' :
  Prims.bool -> Prims.bool -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun ps  ->
    fun pb  ->
      fun e  ->
        match e.FStar_Parser_AST.tm with
        | FStar_Parser_AST.QForall (bs,trigger,e1) ->
            let uu____5022 =
              let uu____5023 =
                let uu____5024 = p_quantifier e  in
                FStar_Pprint.op_Hat_Hat uu____5024 FStar_Pprint.space  in
              let uu____5025 = p_binders true bs  in
              FStar_Pprint.soft_surround (Prims.parse_int "2")
                (Prims.parse_int "0") uu____5023 uu____5025 FStar_Pprint.dot
               in
            let uu____5026 =
              let uu____5027 = p_trigger trigger  in
              let uu____5028 = p_noSeqTerm ps pb e1  in
              FStar_Pprint.op_Hat_Hat uu____5027 uu____5028  in
            prefix2 uu____5022 uu____5026
        | FStar_Parser_AST.QExists (bs,trigger,e1) ->
            let uu____5044 =
              let uu____5045 =
                let uu____5046 = p_quantifier e  in
                FStar_Pprint.op_Hat_Hat uu____5046 FStar_Pprint.space  in
              let uu____5047 = p_binders true bs  in
              FStar_Pprint.soft_surround (Prims.parse_int "2")
                (Prims.parse_int "0") uu____5045 uu____5047 FStar_Pprint.dot
               in
            let uu____5048 =
              let uu____5049 = p_trigger trigger  in
              let uu____5050 = p_noSeqTerm ps pb e1  in
              FStar_Pprint.op_Hat_Hat uu____5049 uu____5050  in
            prefix2 uu____5044 uu____5048
        | uu____5051 -> p_simpleTerm ps pb e

and (p_quantifier : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.QForall uu____5053 -> str "forall"
    | FStar_Parser_AST.QExists uu____5066 -> str "exists"
    | uu____5079 ->
        failwith "Imposible : p_quantifier called on a non-quantifier term"

and (p_trigger :
  FStar_Parser_AST.term Prims.list Prims.list -> FStar_Pprint.document) =
  fun uu___61_5080  ->
    match uu___61_5080 with
    | [] -> FStar_Pprint.empty
    | pats ->
        let uu____5092 =
          let uu____5093 =
            let uu____5094 = str "pattern"  in
            let uu____5095 =
              let uu____5096 =
                let uu____5097 = p_disjunctivePats pats  in jump2 uu____5097
                 in
              let uu____5098 =
                FStar_Pprint.op_Hat_Hat FStar_Pprint.rbrace break1  in
              FStar_Pprint.op_Hat_Slash_Hat uu____5096 uu____5098  in
            FStar_Pprint.op_Hat_Slash_Hat uu____5094 uu____5095  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.colon uu____5093  in
        FStar_Pprint.op_Hat_Hat FStar_Pprint.lbrace uu____5092

and (p_disjunctivePats :
  FStar_Parser_AST.term Prims.list Prims.list -> FStar_Pprint.document) =
  fun pats  ->
    let uu____5104 = str "\\/"  in
    FStar_Pprint.separate_map uu____5104 p_conjunctivePats pats

and (p_conjunctivePats :
  FStar_Parser_AST.term Prims.list -> FStar_Pprint.document) =
  fun pats  ->
    let uu____5110 =
      FStar_Pprint.separate_map FStar_Pprint.semi p_appTerm pats  in
    FStar_Pprint.group uu____5110

and (p_simpleTerm :
  Prims.bool -> Prims.bool -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun ps  ->
    fun pb  ->
      fun e  ->
        match e.FStar_Parser_AST.tm with
        | FStar_Parser_AST.Abs (pats,e1) ->
            let uu____5120 =
              let uu____5121 =
                let uu____5122 = str "fun"  in
                let uu____5123 =
                  let uu____5124 =
                    FStar_Pprint.separate_map break1 p_atomicPattern pats  in
                  FStar_Pprint.op_Hat_Slash_Hat uu____5124
                    FStar_Pprint.rarrow
                   in
                op_Hat_Slash_Plus_Hat uu____5122 uu____5123  in
              let uu____5125 = p_term false pb e1  in
              op_Hat_Slash_Plus_Hat uu____5121 uu____5125  in
            let uu____5126 = paren_if ps  in uu____5126 uu____5120
        | uu____5129 -> p_tmIff e

and (p_maybeFocusArrow : Prims.bool -> FStar_Pprint.document) =
  fun b  -> if b then str "~>" else FStar_Pprint.rarrow

and (p_patternBranch :
  Prims.bool ->
    (FStar_Parser_AST.pattern,FStar_Parser_AST.term
                                FStar_Pervasives_Native.option,FStar_Parser_AST.term)
      FStar_Pervasives_Native.tuple3 -> FStar_Pprint.document)
  =
  fun pb  ->
    fun uu____5133  ->
      match uu____5133 with
      | (pat,when_opt,e) ->
          let uu____5149 =
            let uu____5150 =
              let uu____5151 =
                let uu____5152 =
                  let uu____5153 =
                    let uu____5154 = p_disjunctivePattern pat  in
                    let uu____5155 =
                      let uu____5156 = p_maybeWhen when_opt  in
                      FStar_Pprint.op_Hat_Hat uu____5156 FStar_Pprint.rarrow
                       in
                    op_Hat_Slash_Plus_Hat uu____5154 uu____5155  in
                  FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5153  in
                FStar_Pprint.op_Hat_Hat FStar_Pprint.bar uu____5152  in
              FStar_Pprint.group uu____5151  in
            let uu____5157 = p_term false pb e  in
            op_Hat_Slash_Plus_Hat uu____5150 uu____5157  in
          FStar_Pprint.group uu____5149

and (p_maybeWhen :
  FStar_Parser_AST.term FStar_Pervasives_Native.option ->
    FStar_Pprint.document)
  =
  fun uu___62_5158  ->
    match uu___62_5158 with
    | FStar_Pervasives_Native.None  -> FStar_Pprint.empty
    | FStar_Pervasives_Native.Some e ->
        let uu____5162 = str "when"  in
        let uu____5163 =
          let uu____5164 = p_tmFormula e  in
          FStar_Pprint.op_Hat_Hat uu____5164 FStar_Pprint.space  in
        op_Hat_Slash_Plus_Hat uu____5162 uu____5163

and (p_tmIff : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Op
        ({ FStar_Ident.idText = "<==>"; FStar_Ident.idRange = uu____5166;_},e1::e2::[])
        ->
        let uu____5171 = str "<==>"  in
        let uu____5172 = p_tmImplies e1  in
        let uu____5173 = p_tmIff e2  in
        infix0 uu____5171 uu____5172 uu____5173
    | uu____5174 -> p_tmImplies e

and (p_tmImplies : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Op
        ({ FStar_Ident.idText = "==>"; FStar_Ident.idRange = uu____5176;_},e1::e2::[])
        ->
        let uu____5181 = str "==>"  in
        let uu____5182 = p_tmArrow p_tmFormula e1  in
        let uu____5183 = p_tmImplies e2  in
        infix0 uu____5181 uu____5182 uu____5183
    | uu____5184 -> p_tmArrow p_tmFormula e

and (p_tmArrow :
  (FStar_Parser_AST.term -> FStar_Pprint.document) ->
    FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun p_Tm  ->
    fun e  ->
      match e.FStar_Parser_AST.tm with
      | FStar_Parser_AST.Product (bs,tgt) ->
          let uu____5195 =
            let uu____5196 =
              separate_map_or_flow FStar_Pprint.empty
                (fun b  ->
                   let uu____5201 = p_binder false b  in
                   let uu____5202 =
                     let uu____5203 =
                       FStar_Pprint.op_Hat_Hat FStar_Pprint.rarrow break1  in
                     FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5203
                      in
                   FStar_Pprint.op_Hat_Hat uu____5201 uu____5202) bs
               in
            let uu____5204 = p_tmArrow p_Tm tgt  in
            FStar_Pprint.op_Hat_Hat uu____5196 uu____5204  in
          FStar_Pprint.group uu____5195
      | uu____5205 -> p_Tm e

and (p_tmFormula : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Op
        ({ FStar_Ident.idText = "\\/"; FStar_Ident.idRange = uu____5207;_},e1::e2::[])
        ->
        let uu____5212 = str "\\/"  in
        let uu____5213 = p_tmFormula e1  in
        let uu____5214 = p_tmConjunction e2  in
        infix0 uu____5212 uu____5213 uu____5214
    | uu____5215 -> p_tmConjunction e

and (p_tmConjunction : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Op
        ({ FStar_Ident.idText = "/\\"; FStar_Ident.idRange = uu____5217;_},e1::e2::[])
        ->
        let uu____5222 = str "/\\"  in
        let uu____5223 = p_tmConjunction e1  in
        let uu____5224 = p_tmTuple e2  in
        infix0 uu____5222 uu____5223 uu____5224
    | uu____5225 -> p_tmTuple e

and (p_tmTuple : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  -> with_comment p_tmTuple' e e.FStar_Parser_AST.range

and (p_tmTuple' : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Construct (lid,args) when is_tuple_constructor lid ->
        let uu____5242 = FStar_Pprint.op_Hat_Hat FStar_Pprint.comma break1
           in
        FStar_Pprint.separate_map uu____5242
          (fun uu____5250  ->
             match uu____5250 with | (e1,uu____5256) -> p_tmEq e1) args
    | uu____5257 -> p_tmEq e

and (paren_if_gt :
  Prims.int -> Prims.int -> FStar_Pprint.document -> FStar_Pprint.document) =
  fun curr  ->
    fun mine  ->
      fun doc1  ->
        if mine <= curr
        then doc1
        else
          (let uu____5262 =
             let uu____5263 =
               FStar_Pprint.op_Hat_Hat doc1 FStar_Pprint.rparen  in
             FStar_Pprint.op_Hat_Hat FStar_Pprint.lparen uu____5263  in
           FStar_Pprint.group uu____5262)

and (p_tmEqWith :
  (FStar_Parser_AST.term -> FStar_Pprint.document) ->
    FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun p_X  ->
    fun e  ->
      let n1 =
        max_level
          (FStar_List.append [colon_equals (); pipe_right ()]
             (operatorInfix0ad12 ()))
         in
      p_tmEqWith' p_X n1 e

and (p_tmEqWith' :
  (FStar_Parser_AST.term -> FStar_Pprint.document) ->
    Prims.int -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun p_X  ->
    fun curr  ->
      fun e  ->
        match e.FStar_Parser_AST.tm with
        | FStar_Parser_AST.Op (op,e1::e2::[]) when
            ((is_operatorInfix0ad12 op) ||
               ((FStar_Ident.text_of_id op) = "="))
              || ((FStar_Ident.text_of_id op) = "|>")
            ->
            let op1 = FStar_Ident.text_of_id op  in
            let uu____5326 = levels op1  in
            (match uu____5326 with
             | (left1,mine,right1) ->
                 let uu____5336 =
                   let uu____5337 = FStar_All.pipe_left str op1  in
                   let uu____5338 = p_tmEqWith' p_X left1 e1  in
                   let uu____5339 = p_tmEqWith' p_X right1 e2  in
                   infix0 uu____5337 uu____5338 uu____5339  in
                 paren_if_gt curr mine uu____5336)
        | FStar_Parser_AST.Op
            ({ FStar_Ident.idText = ":="; FStar_Ident.idRange = uu____5340;_},e1::e2::[])
            ->
            let uu____5345 =
              let uu____5346 = p_tmEqWith p_X e1  in
              let uu____5347 =
                let uu____5348 =
                  let uu____5349 =
                    let uu____5350 = p_tmEqWith p_X e2  in
                    op_Hat_Slash_Plus_Hat FStar_Pprint.equals uu____5350  in
                  FStar_Pprint.op_Hat_Hat FStar_Pprint.colon uu____5349  in
                FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5348  in
              FStar_Pprint.op_Hat_Hat uu____5346 uu____5347  in
            FStar_Pprint.group uu____5345
        | FStar_Parser_AST.Op
            ({ FStar_Ident.idText = "-"; FStar_Ident.idRange = uu____5351;_},e1::[])
            ->
            let uu____5355 = levels "-"  in
            (match uu____5355 with
             | (left1,mine,right1) ->
                 let uu____5365 = p_tmEqWith' p_X mine e1  in
                 FStar_Pprint.op_Hat_Slash_Hat FStar_Pprint.minus uu____5365)
        | uu____5366 -> p_tmNoEqWith p_X e

and (p_tmNoEqWith :
  (FStar_Parser_AST.term -> FStar_Pprint.document) ->
    FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun p_X  ->
    fun e  ->
      let n1 = max_level [colon_colon (); amp (); opinfix3 (); opinfix4 ()]
         in
      p_tmNoEqWith' p_X n1 e

and (p_tmNoEqWith' :
  (FStar_Parser_AST.term -> FStar_Pprint.document) ->
    Prims.int -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun p_X  ->
    fun curr  ->
      fun e  ->
        match e.FStar_Parser_AST.tm with
        | FStar_Parser_AST.Construct
            (lid,(e1,uu____5437)::(e2,uu____5439)::[]) when
            (FStar_Ident.lid_equals lid FStar_Parser_Const.cons_lid) &&
              (let uu____5459 = is_list e  in Prims.op_Negation uu____5459)
            ->
            let op = "::"  in
            let uu____5461 = levels op  in
            (match uu____5461 with
             | (left1,mine,right1) ->
                 let uu____5471 =
                   let uu____5472 = str op  in
                   let uu____5473 = p_tmNoEqWith' p_X left1 e1  in
                   let uu____5474 = p_tmNoEqWith' p_X right1 e2  in
                   infix0 uu____5472 uu____5473 uu____5474  in
                 paren_if_gt curr mine uu____5471)
        | FStar_Parser_AST.Sum (binders,res) ->
            let op = "&"  in
            let uu____5482 = levels op  in
            (match uu____5482 with
             | (left1,mine,right1) ->
                 let p_dsumfst b =
                   let uu____5496 = p_binder false b  in
                   let uu____5497 =
                     let uu____5498 =
                       let uu____5499 = str op  in
                       FStar_Pprint.op_Hat_Hat uu____5499 break1  in
                     FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5498
                      in
                   FStar_Pprint.op_Hat_Hat uu____5496 uu____5497  in
                 let uu____5500 =
                   let uu____5501 = FStar_Pprint.concat_map p_dsumfst binders
                      in
                   let uu____5502 = p_tmNoEqWith' p_X right1 res  in
                   FStar_Pprint.op_Hat_Hat uu____5501 uu____5502  in
                 paren_if_gt curr mine uu____5500)
        | FStar_Parser_AST.Op (op,e1::e2::[]) when is_operatorInfix34 op ->
            let op1 = FStar_Ident.text_of_id op  in
            let uu____5509 = levels op1  in
            (match uu____5509 with
             | (left1,mine,right1) ->
                 let uu____5519 =
                   let uu____5520 = str op1  in
                   let uu____5521 = p_tmNoEqWith' p_X left1 e1  in
                   let uu____5522 = p_tmNoEqWith' p_X right1 e2  in
                   infix0 uu____5520 uu____5521 uu____5522  in
                 paren_if_gt curr mine uu____5519)
        | FStar_Parser_AST.Record (with_opt,record_fields) ->
            let uu____5541 =
              let uu____5542 =
                default_or_map FStar_Pprint.empty p_with_clause with_opt  in
              let uu____5543 =
                let uu____5544 =
                  FStar_Pprint.op_Hat_Hat FStar_Pprint.semi break1  in
                separate_map_last uu____5544 p_simpleDef record_fields  in
              FStar_Pprint.op_Hat_Hat uu____5542 uu____5543  in
            braces_with_nesting uu____5541
        | FStar_Parser_AST.Op
            ({ FStar_Ident.idText = "~"; FStar_Ident.idRange = uu____5549;_},e1::[])
            ->
            let uu____5553 =
              let uu____5554 = str "~"  in
              let uu____5555 = p_atomicTerm e1  in
              FStar_Pprint.op_Hat_Hat uu____5554 uu____5555  in
            FStar_Pprint.group uu____5553
        | uu____5556 -> p_X e

and (p_tmEqNoRefinement : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  -> p_tmEqWith p_appTerm e

and (p_tmEq : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  -> p_tmEqWith p_tmRefinement e

and (p_tmNoEq : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  -> p_tmNoEqWith p_tmRefinement e

and (p_tmRefinement : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.NamedTyp (lid,e1) ->
        let uu____5563 =
          let uu____5564 = p_lidentOrUnderscore lid  in
          let uu____5565 =
            let uu____5566 = p_appTerm e1  in
            FStar_Pprint.op_Hat_Slash_Hat FStar_Pprint.colon uu____5566  in
          FStar_Pprint.op_Hat_Slash_Hat uu____5564 uu____5565  in
        FStar_Pprint.group uu____5563
    | FStar_Parser_AST.Refine (b,phi) -> p_refinedBinder b phi
    | uu____5569 -> p_appTerm e

and (p_with_clause : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    let uu____5571 = p_appTerm e  in
    let uu____5572 =
      let uu____5573 =
        let uu____5574 = str "with"  in
        FStar_Pprint.op_Hat_Hat uu____5574 break1  in
      FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5573  in
    FStar_Pprint.op_Hat_Hat uu____5571 uu____5572

and (p_refinedBinder :
  FStar_Parser_AST.binder -> FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun b  ->
    fun phi  ->
      match b.FStar_Parser_AST.b with
      | FStar_Parser_AST.Annotated (lid,t) ->
          let uu____5579 =
            let uu____5580 = p_lident lid  in
            p_refinement b.FStar_Parser_AST.aqual uu____5580 t phi  in
          soft_parens_with_nesting uu____5579
      | FStar_Parser_AST.TAnnotated uu____5581 ->
          failwith "Is this still used ?"
      | FStar_Parser_AST.Variable uu____5586 ->
          let uu____5587 =
            let uu____5588 = FStar_Parser_AST.binder_to_string b  in
            FStar_Util.format1
              "Imposible : a refined binder ought to be annotated %s"
              uu____5588
             in
          failwith uu____5587
      | FStar_Parser_AST.TVariable uu____5589 ->
          let uu____5590 =
            let uu____5591 = FStar_Parser_AST.binder_to_string b  in
            FStar_Util.format1
              "Imposible : a refined binder ought to be annotated %s"
              uu____5591
             in
          failwith uu____5590
      | FStar_Parser_AST.NoName uu____5592 ->
          let uu____5593 =
            let uu____5594 = FStar_Parser_AST.binder_to_string b  in
            FStar_Util.format1
              "Imposible : a refined binder ought to be annotated %s"
              uu____5594
             in
          failwith uu____5593

and (p_simpleDef :
  Prims.bool ->
    (FStar_Ident.lid,FStar_Parser_AST.term) FStar_Pervasives_Native.tuple2 ->
      FStar_Pprint.document)
  =
  fun ps  ->
    fun uu____5596  ->
      match uu____5596 with
      | (lid,e) ->
          let uu____5603 =
            let uu____5604 = p_qlident lid  in
            let uu____5605 =
              let uu____5606 = p_noSeqTerm ps false e  in
              FStar_Pprint.op_Hat_Slash_Hat FStar_Pprint.equals uu____5606
               in
            FStar_Pprint.op_Hat_Slash_Hat uu____5604 uu____5605  in
          FStar_Pprint.group uu____5603

and (p_appTerm : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.App uu____5608 when is_general_application e ->
        let uu____5615 = head_and_args e  in
        (match uu____5615 with
         | (head1,args) ->
             let uu____5640 =
               let uu____5651 = FStar_ST.op_Bang should_print_fs_typ_app  in
               if uu____5651
               then
                 let uu____5681 =
                   FStar_Util.take
                     (fun uu____5705  ->
                        match uu____5705 with
                        | (uu____5710,aq) -> aq = FStar_Parser_AST.FsTypApp)
                     args
                    in
                 match uu____5681 with
                 | (fs_typ_args,args1) ->
                     let uu____5748 =
                       let uu____5749 = p_indexingTerm head1  in
                       let uu____5750 =
                         let uu____5751 =
                           FStar_Pprint.op_Hat_Hat FStar_Pprint.comma break1
                            in
                         soft_surround_map_or_flow (Prims.parse_int "2")
                           (Prims.parse_int "0") FStar_Pprint.empty
                           FStar_Pprint.langle uu____5751 FStar_Pprint.rangle
                           p_fsTypArg fs_typ_args
                          in
                       FStar_Pprint.op_Hat_Hat uu____5749 uu____5750  in
                     (uu____5748, args1)
               else
                 (let uu____5763 = p_indexingTerm head1  in
                  (uu____5763, args))
                in
             (match uu____5640 with
              | (head_doc,args1) ->
                  let uu____5784 =
                    let uu____5785 =
                      FStar_Pprint.op_Hat_Hat head_doc FStar_Pprint.space  in
                    soft_surround_map_or_flow (Prims.parse_int "2")
                      (Prims.parse_int "0") head_doc uu____5785 break1
                      FStar_Pprint.empty p_argTerm args1
                     in
                  FStar_Pprint.group uu____5784))
    | FStar_Parser_AST.Construct (lid,args) when
        (is_general_construction e) &&
          (let uu____5805 = is_dtuple_constructor lid  in
           Prims.op_Negation uu____5805)
        ->
        (match args with
         | [] -> p_quident lid
         | arg::[] ->
             let uu____5823 =
               let uu____5824 = p_quident lid  in
               let uu____5825 = p_argTerm arg  in
               FStar_Pprint.op_Hat_Slash_Hat uu____5824 uu____5825  in
             FStar_Pprint.group uu____5823
         | hd1::tl1 ->
             let uu____5842 =
               let uu____5843 =
                 let uu____5844 =
                   let uu____5845 = p_quident lid  in
                   let uu____5846 = p_argTerm hd1  in
                   prefix2 uu____5845 uu____5846  in
                 FStar_Pprint.group uu____5844  in
               let uu____5847 =
                 let uu____5848 =
                   FStar_Pprint.separate_map break1 p_argTerm tl1  in
                 jump2 uu____5848  in
               FStar_Pprint.op_Hat_Hat uu____5843 uu____5847  in
             FStar_Pprint.group uu____5842)
    | uu____5853 -> p_indexingTerm e

and (p_argTerm :
  (FStar_Parser_AST.term,FStar_Parser_AST.imp) FStar_Pervasives_Native.tuple2
    -> FStar_Pprint.document)
  =
  fun arg_imp  ->
    match arg_imp with
    | (u,FStar_Parser_AST.UnivApp ) -> p_universe u
    | (e,FStar_Parser_AST.FsTypApp ) ->
        (FStar_Errors.log_issue e.FStar_Parser_AST.range
           (FStar_Errors.Warning_UnexpectedFsTypApp,
             "Unexpected FsTypApp, output might not be formatted correctly.");
         (let uu____5862 = p_indexingTerm e  in
          FStar_Pprint.surround (Prims.parse_int "2") (Prims.parse_int "1")
            FStar_Pprint.langle uu____5862 FStar_Pprint.rangle))
    | (e,FStar_Parser_AST.Hash ) ->
        let uu____5864 = str "#"  in
        let uu____5865 = p_indexingTerm e  in
        FStar_Pprint.op_Hat_Hat uu____5864 uu____5865
    | (e,FStar_Parser_AST.Nothing ) -> p_indexingTerm e

and (p_fsTypArg :
  (FStar_Parser_AST.term,FStar_Parser_AST.imp) FStar_Pervasives_Native.tuple2
    -> FStar_Pprint.document)
  =
  fun uu____5867  ->
    match uu____5867 with | (e,uu____5873) -> p_indexingTerm e

and (p_indexingTerm_aux :
  (FStar_Parser_AST.term -> FStar_Pprint.document) ->
    FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun exit1  ->
    fun e  ->
      match e.FStar_Parser_AST.tm with
      | FStar_Parser_AST.Op
          ({ FStar_Ident.idText = ".()"; FStar_Ident.idRange = uu____5878;_},e1::e2::[])
          ->
          let uu____5883 =
            let uu____5884 = p_indexingTerm_aux p_atomicTermNotQUident e1  in
            let uu____5885 =
              let uu____5886 =
                let uu____5887 = p_term false false e2  in
                soft_parens_with_nesting uu____5887  in
              FStar_Pprint.op_Hat_Hat FStar_Pprint.dot uu____5886  in
            FStar_Pprint.op_Hat_Hat uu____5884 uu____5885  in
          FStar_Pprint.group uu____5883
      | FStar_Parser_AST.Op
          ({ FStar_Ident.idText = ".[]"; FStar_Ident.idRange = uu____5888;_},e1::e2::[])
          ->
          let uu____5893 =
            let uu____5894 = p_indexingTerm_aux p_atomicTermNotQUident e1  in
            let uu____5895 =
              let uu____5896 =
                let uu____5897 = p_term false false e2  in
                soft_brackets_with_nesting uu____5897  in
              FStar_Pprint.op_Hat_Hat FStar_Pprint.dot uu____5896  in
            FStar_Pprint.op_Hat_Hat uu____5894 uu____5895  in
          FStar_Pprint.group uu____5893
      | uu____5898 -> exit1 e

and (p_indexingTerm : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  -> p_indexingTerm_aux p_atomicTerm e

and (p_atomicTerm : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.LetOpen (lid,e1) ->
        let uu____5903 = p_quident lid  in
        let uu____5904 =
          let uu____5905 =
            let uu____5906 = p_term false false e1  in
            soft_parens_with_nesting uu____5906  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.dot uu____5905  in
        FStar_Pprint.op_Hat_Hat uu____5903 uu____5904
    | FStar_Parser_AST.Name lid -> p_quident lid
    | FStar_Parser_AST.Op (op,e1::[]) when is_general_prefix_op op ->
        let uu____5912 = str (FStar_Ident.text_of_id op)  in
        let uu____5913 = p_atomicTerm e1  in
        FStar_Pprint.op_Hat_Hat uu____5912 uu____5913
    | uu____5914 -> p_atomicTermNotQUident e

and (p_atomicTermNotQUident : FStar_Parser_AST.term -> FStar_Pprint.document)
  =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Wild  -> FStar_Pprint.underscore
    | FStar_Parser_AST.Var lid when
        FStar_Ident.lid_equals lid FStar_Parser_Const.assert_lid ->
        str "assert"
    | FStar_Parser_AST.Tvar tv -> p_tvar tv
    | FStar_Parser_AST.Const c ->
        (match c with
         | FStar_Const.Const_char x when x = 10 -> str "0x0Az"
         | uu____5921 -> p_constant c)
    | FStar_Parser_AST.Name lid when
        FStar_Ident.lid_equals lid FStar_Parser_Const.true_lid -> str "True"
    | FStar_Parser_AST.Name lid when
        FStar_Ident.lid_equals lid FStar_Parser_Const.false_lid ->
        str "False"
    | FStar_Parser_AST.Op (op,e1::[]) when is_general_prefix_op op ->
        let uu____5928 = str (FStar_Ident.text_of_id op)  in
        let uu____5929 = p_atomicTermNotQUident e1  in
        FStar_Pprint.op_Hat_Hat uu____5928 uu____5929
    | FStar_Parser_AST.Op (op,[]) ->
        let uu____5933 =
          let uu____5934 =
            let uu____5935 = str (FStar_Ident.text_of_id op)  in
            let uu____5936 =
              FStar_Pprint.op_Hat_Hat FStar_Pprint.space FStar_Pprint.rparen
               in
            FStar_Pprint.op_Hat_Hat uu____5935 uu____5936  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.space uu____5934  in
        FStar_Pprint.op_Hat_Hat FStar_Pprint.lparen uu____5933
    | FStar_Parser_AST.Construct (lid,args) when is_dtuple_constructor lid ->
        let uu____5951 =
          FStar_Pprint.op_Hat_Hat FStar_Pprint.lparen FStar_Pprint.bar  in
        let uu____5952 =
          let uu____5953 = FStar_Pprint.op_Hat_Hat FStar_Pprint.comma break1
             in
          let uu____5954 = FStar_List.map FStar_Pervasives_Native.fst args
             in
          FStar_Pprint.separate_map uu____5953 p_tmEq uu____5954  in
        let uu____5961 =
          FStar_Pprint.op_Hat_Hat FStar_Pprint.bar FStar_Pprint.rparen  in
        FStar_Pprint.surround (Prims.parse_int "2") (Prims.parse_int "1")
          uu____5951 uu____5952 uu____5961
    | FStar_Parser_AST.Project (e1,lid) ->
        let uu____5964 =
          let uu____5965 = p_atomicTermNotQUident e1  in
          let uu____5966 =
            let uu____5967 = p_qlident lid  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.dot uu____5967  in
          FStar_Pprint.prefix (Prims.parse_int "2") (Prims.parse_int "0")
            uu____5965 uu____5966
           in
        FStar_Pprint.group uu____5964
    | uu____5968 -> p_projectionLHS e

and (p_projectionLHS : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  ->
    match e.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Var lid -> p_qlident lid
    | FStar_Parser_AST.Projector (constr_lid,field_lid) ->
        let uu____5973 = p_quident constr_lid  in
        let uu____5974 =
          let uu____5975 =
            let uu____5976 = p_lident field_lid  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.dot uu____5976  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.qmark uu____5975  in
        FStar_Pprint.op_Hat_Hat uu____5973 uu____5974
    | FStar_Parser_AST.Discrim constr_lid ->
        let uu____5978 = p_quident constr_lid  in
        FStar_Pprint.op_Hat_Hat uu____5978 FStar_Pprint.qmark
    | FStar_Parser_AST.Paren e1 ->
        let uu____5980 = p_term false false e1  in
        soft_parens_with_nesting uu____5980
    | uu____5981 when is_array e ->
        let es = extract_from_list e  in
        let uu____5985 =
          FStar_Pprint.op_Hat_Hat FStar_Pprint.lbracket FStar_Pprint.bar  in
        let uu____5986 =
          let uu____5987 = FStar_Pprint.op_Hat_Hat FStar_Pprint.semi break1
             in
          separate_map_or_flow_last uu____5987
            (fun ps  -> p_noSeqTerm ps false) es
           in
        let uu____5990 =
          FStar_Pprint.op_Hat_Hat FStar_Pprint.bar FStar_Pprint.rbracket  in
        FStar_Pprint.surround (Prims.parse_int "2") (Prims.parse_int "0")
          uu____5985 uu____5986 uu____5990
    | uu____5991 when is_list e ->
        let uu____5992 =
          let uu____5993 = FStar_Pprint.op_Hat_Hat FStar_Pprint.semi break1
             in
          let uu____5994 = extract_from_list e  in
          separate_map_or_flow_last uu____5993
            (fun ps  -> p_noSeqTerm ps false) uu____5994
           in
        FStar_Pprint.surround (Prims.parse_int "2") (Prims.parse_int "0")
          FStar_Pprint.lbracket uu____5992 FStar_Pprint.rbracket
    | uu____5999 when is_lex_list e ->
        let uu____6000 =
          FStar_Pprint.op_Hat_Hat FStar_Pprint.percent FStar_Pprint.lbracket
           in
        let uu____6001 =
          let uu____6002 = FStar_Pprint.op_Hat_Hat FStar_Pprint.semi break1
             in
          let uu____6003 = extract_from_list e  in
          separate_map_or_flow_last uu____6002
            (fun ps  -> p_noSeqTerm ps false) uu____6003
           in
        FStar_Pprint.surround (Prims.parse_int "2") (Prims.parse_int "1")
          uu____6000 uu____6001 FStar_Pprint.rbracket
    | uu____6008 when is_ref_set e ->
        let es = extract_from_ref_set e  in
        let uu____6012 =
          FStar_Pprint.op_Hat_Hat FStar_Pprint.bang FStar_Pprint.lbrace  in
        let uu____6013 =
          let uu____6014 = FStar_Pprint.op_Hat_Hat FStar_Pprint.comma break1
             in
          separate_map_or_flow uu____6014 p_appTerm es  in
        FStar_Pprint.surround (Prims.parse_int "2") (Prims.parse_int "0")
          uu____6012 uu____6013 FStar_Pprint.rbrace
    | FStar_Parser_AST.Labeled (e1,s,b) ->
        let uu____6018 = str (Prims.strcat "(*" (Prims.strcat s "*)"))  in
        let uu____6019 = p_term false false e1  in
        FStar_Pprint.op_Hat_Slash_Hat uu____6018 uu____6019
    | FStar_Parser_AST.Op (op,args) when
        let uu____6026 = handleable_op op args  in
        Prims.op_Negation uu____6026 ->
        let uu____6027 =
          let uu____6028 =
            let uu____6029 =
              let uu____6030 =
                let uu____6031 =
                  FStar_Util.string_of_int (FStar_List.length args)  in
                Prims.strcat uu____6031
                  " arguments couldn't be handled by the pretty printer"
                 in
              Prims.strcat " with " uu____6030  in
            Prims.strcat (FStar_Ident.text_of_id op) uu____6029  in
          Prims.strcat "Operation " uu____6028  in
        failwith uu____6027
    | FStar_Parser_AST.Uvar uu____6032 ->
        failwith "Unexpected universe variable out of universe context"
    | FStar_Parser_AST.Wild  ->
        let uu____6033 = p_term false false e  in
        soft_parens_with_nesting uu____6033
    | FStar_Parser_AST.Const uu____6034 ->
        let uu____6035 = p_term false false e  in
        soft_parens_with_nesting uu____6035
    | FStar_Parser_AST.Op uu____6036 ->
        let uu____6043 = p_term false false e  in
        soft_parens_with_nesting uu____6043
    | FStar_Parser_AST.Tvar uu____6044 ->
        let uu____6045 = p_term false false e  in
        soft_parens_with_nesting uu____6045
    | FStar_Parser_AST.Var uu____6046 ->
        let uu____6047 = p_term false false e  in
        soft_parens_with_nesting uu____6047
    | FStar_Parser_AST.Name uu____6048 ->
        let uu____6049 = p_term false false e  in
        soft_parens_with_nesting uu____6049
    | FStar_Parser_AST.Construct uu____6050 ->
        let uu____6061 = p_term false false e  in
        soft_parens_with_nesting uu____6061
    | FStar_Parser_AST.Abs uu____6062 ->
        let uu____6069 = p_term false false e  in
        soft_parens_with_nesting uu____6069
    | FStar_Parser_AST.App uu____6070 ->
        let uu____6077 = p_term false false e  in
        soft_parens_with_nesting uu____6077
    | FStar_Parser_AST.Let uu____6078 ->
        let uu____6099 = p_term false false e  in
        soft_parens_with_nesting uu____6099
    | FStar_Parser_AST.LetOpen uu____6100 ->
        let uu____6105 = p_term false false e  in
        soft_parens_with_nesting uu____6105
    | FStar_Parser_AST.Seq uu____6106 ->
        let uu____6111 = p_term false false e  in
        soft_parens_with_nesting uu____6111
    | FStar_Parser_AST.Bind uu____6112 ->
        let uu____6119 = p_term false false e  in
        soft_parens_with_nesting uu____6119
    | FStar_Parser_AST.If uu____6120 ->
        let uu____6127 = p_term false false e  in
        soft_parens_with_nesting uu____6127
    | FStar_Parser_AST.Match uu____6128 ->
        let uu____6143 = p_term false false e  in
        soft_parens_with_nesting uu____6143
    | FStar_Parser_AST.TryWith uu____6144 ->
        let uu____6159 = p_term false false e  in
        soft_parens_with_nesting uu____6159
    | FStar_Parser_AST.Ascribed uu____6160 ->
        let uu____6169 = p_term false false e  in
        soft_parens_with_nesting uu____6169
    | FStar_Parser_AST.Record uu____6170 ->
        let uu____6183 = p_term false false e  in
        soft_parens_with_nesting uu____6183
    | FStar_Parser_AST.Project uu____6184 ->
        let uu____6189 = p_term false false e  in
        soft_parens_with_nesting uu____6189
    | FStar_Parser_AST.Product uu____6190 ->
        let uu____6197 = p_term false false e  in
        soft_parens_with_nesting uu____6197
    | FStar_Parser_AST.Sum uu____6198 ->
        let uu____6205 = p_term false false e  in
        soft_parens_with_nesting uu____6205
    | FStar_Parser_AST.QForall uu____6206 ->
        let uu____6219 = p_term false false e  in
        soft_parens_with_nesting uu____6219
    | FStar_Parser_AST.QExists uu____6220 ->
        let uu____6233 = p_term false false e  in
        soft_parens_with_nesting uu____6233
    | FStar_Parser_AST.Refine uu____6234 ->
        let uu____6239 = p_term false false e  in
        soft_parens_with_nesting uu____6239
    | FStar_Parser_AST.NamedTyp uu____6240 ->
        let uu____6245 = p_term false false e  in
        soft_parens_with_nesting uu____6245
    | FStar_Parser_AST.Requires uu____6246 ->
        let uu____6253 = p_term false false e  in
        soft_parens_with_nesting uu____6253
    | FStar_Parser_AST.Ensures uu____6254 ->
        let uu____6261 = p_term false false e  in
        soft_parens_with_nesting uu____6261
    | FStar_Parser_AST.Attributes uu____6262 ->
        let uu____6265 = p_term false false e  in
        soft_parens_with_nesting uu____6265
    | FStar_Parser_AST.Quote uu____6266 ->
        let uu____6271 = p_term false false e  in
        soft_parens_with_nesting uu____6271
    | FStar_Parser_AST.VQuote uu____6272 ->
        let uu____6273 = p_term false false e  in
        soft_parens_with_nesting uu____6273

and (p_constant : FStar_Const.sconst -> FStar_Pprint.document) =
  fun uu___65_6274  ->
    match uu___65_6274 with
    | FStar_Const.Const_effect  -> str "Effect"
    | FStar_Const.Const_unit  -> str "()"
    | FStar_Const.Const_bool b -> FStar_Pprint.doc_of_bool b
    | FStar_Const.Const_float x -> str (FStar_Util.string_of_float x)
    | FStar_Const.Const_char x ->
        let uu____6278 = FStar_Pprint.doc_of_char x  in
        FStar_Pprint.squotes uu____6278
    | FStar_Const.Const_string (s,uu____6280) ->
        let uu____6281 = str s  in FStar_Pprint.dquotes uu____6281
    | FStar_Const.Const_bytearray (bytes,uu____6283) ->
        let uu____6288 =
          let uu____6289 = str (FStar_Util.string_of_bytes bytes)  in
          FStar_Pprint.dquotes uu____6289  in
        let uu____6290 = str "B"  in
        FStar_Pprint.op_Hat_Hat uu____6288 uu____6290
    | FStar_Const.Const_int (repr,sign_width_opt) ->
        let signedness uu___63_6308 =
          match uu___63_6308 with
          | FStar_Const.Unsigned  -> str "u"
          | FStar_Const.Signed  -> FStar_Pprint.empty  in
        let width uu___64_6312 =
          match uu___64_6312 with
          | FStar_Const.Int8  -> str "y"
          | FStar_Const.Int16  -> str "s"
          | FStar_Const.Int32  -> str "l"
          | FStar_Const.Int64  -> str "L"  in
        let ending =
          default_or_map FStar_Pprint.empty
            (fun uu____6323  ->
               match uu____6323 with
               | (s,w) ->
                   let uu____6330 = signedness s  in
                   let uu____6331 = width w  in
                   FStar_Pprint.op_Hat_Hat uu____6330 uu____6331)
            sign_width_opt
           in
        let uu____6332 = str repr  in
        FStar_Pprint.op_Hat_Hat uu____6332 ending
    | FStar_Const.Const_range_of  -> str "range_of"
    | FStar_Const.Const_set_range_of  -> str "set_range_of"
    | FStar_Const.Const_range r ->
        let uu____6334 = FStar_Range.string_of_range r  in str uu____6334
    | FStar_Const.Const_reify  -> str "reify"
    | FStar_Const.Const_reflect lid ->
        let uu____6336 = p_quident lid  in
        let uu____6337 =
          let uu____6338 =
            let uu____6339 = str "reflect"  in
            FStar_Pprint.op_Hat_Hat FStar_Pprint.dot uu____6339  in
          FStar_Pprint.op_Hat_Hat FStar_Pprint.qmark uu____6338  in
        FStar_Pprint.op_Hat_Hat uu____6336 uu____6337

and (p_universe : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun u  ->
    let uu____6341 = str "u#"  in
    let uu____6342 = p_atomicUniverse u  in
    FStar_Pprint.op_Hat_Hat uu____6341 uu____6342

and (p_universeFrom : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun u  ->
    match u.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Op
        ({ FStar_Ident.idText = "+"; FStar_Ident.idRange = uu____6344;_},u1::u2::[])
        ->
        let uu____6349 =
          let uu____6350 = p_universeFrom u1  in
          let uu____6351 =
            let uu____6352 = p_universeFrom u2  in
            FStar_Pprint.op_Hat_Slash_Hat FStar_Pprint.plus uu____6352  in
          FStar_Pprint.op_Hat_Slash_Hat uu____6350 uu____6351  in
        FStar_Pprint.group uu____6349
    | FStar_Parser_AST.App uu____6353 ->
        let uu____6360 = head_and_args u  in
        (match uu____6360 with
         | (head1,args) ->
             (match head1.FStar_Parser_AST.tm with
              | FStar_Parser_AST.Var maybe_max_lid when
                  FStar_Ident.lid_equals maybe_max_lid
                    FStar_Parser_Const.max_lid
                  ->
                  let uu____6386 =
                    let uu____6387 = p_qlident FStar_Parser_Const.max_lid  in
                    let uu____6388 =
                      FStar_Pprint.separate_map FStar_Pprint.space
                        (fun uu____6396  ->
                           match uu____6396 with
                           | (u1,uu____6402) -> p_atomicUniverse u1) args
                       in
                    op_Hat_Slash_Plus_Hat uu____6387 uu____6388  in
                  FStar_Pprint.group uu____6386
              | uu____6403 ->
                  let uu____6404 =
                    let uu____6405 = FStar_Parser_AST.term_to_string u  in
                    FStar_Util.format1 "Invalid term in universe context %s"
                      uu____6405
                     in
                  failwith uu____6404))
    | uu____6406 -> p_atomicUniverse u

and (p_atomicUniverse : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun u  ->
    match u.FStar_Parser_AST.tm with
    | FStar_Parser_AST.Wild  -> FStar_Pprint.underscore
    | FStar_Parser_AST.Const (FStar_Const.Const_int (r,sw)) ->
        p_constant (FStar_Const.Const_int (r, sw))
    | FStar_Parser_AST.Uvar id1 -> str (FStar_Ident.text_of_id id1)
    | FStar_Parser_AST.Paren u1 ->
        let uu____6430 = p_universeFrom u1  in
        soft_parens_with_nesting uu____6430
    | FStar_Parser_AST.Op
        ({ FStar_Ident.idText = "+"; FStar_Ident.idRange = uu____6431;_},uu____6432::uu____6433::[])
        ->
        let uu____6436 = p_universeFrom u  in
        soft_parens_with_nesting uu____6436
    | FStar_Parser_AST.App uu____6437 ->
        let uu____6444 = p_universeFrom u  in
        soft_parens_with_nesting uu____6444
    | uu____6445 ->
        let uu____6446 =
          let uu____6447 = FStar_Parser_AST.term_to_string u  in
          FStar_Util.format1 "Invalid term in universe context %s" uu____6447
           in
        failwith uu____6446

let (term_to_document : FStar_Parser_AST.term -> FStar_Pprint.document) =
  fun e  -> p_term false false e 
let (signature_to_document : FStar_Parser_AST.decl -> FStar_Pprint.document)
  = fun e  -> p_justSig e 
let (decl_to_document : FStar_Parser_AST.decl -> FStar_Pprint.document) =
  fun e  -> p_decl e 
let (pat_to_document : FStar_Parser_AST.pattern -> FStar_Pprint.document) =
  fun p  -> p_disjunctivePattern p 
let (binder_to_document : FStar_Parser_AST.binder -> FStar_Pprint.document) =
  fun b  -> p_binder true b 
let (modul_to_document : FStar_Parser_AST.modul -> FStar_Pprint.document) =
  fun m  ->
    FStar_ST.op_Colon_Equals should_print_fs_typ_app false;
    (let res =
       match m with
       | FStar_Parser_AST.Module (uu____6487,decls) ->
           let uu____6493 =
             FStar_All.pipe_right decls (FStar_List.map decl_to_document)  in
           FStar_All.pipe_right uu____6493
             (FStar_Pprint.separate FStar_Pprint.hardline)
       | FStar_Parser_AST.Interface (uu____6502,decls,uu____6504) ->
           let uu____6509 =
             FStar_All.pipe_right decls (FStar_List.map decl_to_document)  in
           FStar_All.pipe_right uu____6509
             (FStar_Pprint.separate FStar_Pprint.hardline)
        in
     FStar_ST.op_Colon_Equals should_print_fs_typ_app false; res)
  
let (comments_to_document :
  (Prims.string,FStar_Range.range) FStar_Pervasives_Native.tuple2 Prims.list
    -> FStar_Pprint.document)
  =
  fun comments  ->
    FStar_Pprint.separate_map FStar_Pprint.hardline
      (fun uu____6560  ->
         match uu____6560 with | (comment,range) -> str comment) comments
  
let (modul_with_comments_to_document :
  FStar_Parser_AST.modul ->
    (Prims.string,FStar_Range.range) FStar_Pervasives_Native.tuple2
      Prims.list ->
      (FStar_Pprint.document,(Prims.string,FStar_Range.range)
                               FStar_Pervasives_Native.tuple2 Prims.list)
        FStar_Pervasives_Native.tuple2)
  =
  fun m  ->
    fun comments  ->
      let decls =
        match m with
        | FStar_Parser_AST.Module (uu____6600,decls) -> decls
        | FStar_Parser_AST.Interface (uu____6606,decls,uu____6608) -> decls
         in
      FStar_ST.op_Colon_Equals should_print_fs_typ_app false;
      (match decls with
       | [] -> (FStar_Pprint.empty, comments)
       | d::ds ->
           let uu____6653 =
             match ds with
             | {
                 FStar_Parser_AST.d = FStar_Parser_AST.Pragma
                   (FStar_Parser_AST.LightOff );
                 FStar_Parser_AST.drange = uu____6666;
                 FStar_Parser_AST.doc = uu____6667;
                 FStar_Parser_AST.quals = uu____6668;
                 FStar_Parser_AST.attrs = uu____6669;_}::uu____6670 ->
                 let d0 = FStar_List.hd ds  in
                 let uu____6676 =
                   let uu____6679 =
                     let uu____6682 = FStar_List.tl ds  in d :: uu____6682
                      in
                   d0 :: uu____6679  in
                 (uu____6676, (d0.FStar_Parser_AST.drange))
             | uu____6687 -> ((d :: ds), (d.FStar_Parser_AST.drange))  in
           (match uu____6653 with
            | (decls1,first_range) ->
                let extract_decl_range d1 = d1.FStar_Parser_AST.drange  in
                (FStar_ST.op_Colon_Equals comment_stack comments;
                 (let initial_comment =
                    let uu____6745 = FStar_Range.start_of_range first_range
                       in
                    place_comments_until_pos (Prims.parse_int "0")
                      (Prims.parse_int "1") uu____6745 FStar_Pprint.empty
                     in
                  let doc1 =
                    separate_map_with_comments FStar_Pprint.empty
                      FStar_Pprint.empty decl_to_document decls1
                      extract_decl_range
                     in
                  let comments1 = FStar_ST.op_Bang comment_stack  in
                  FStar_ST.op_Colon_Equals comment_stack [];
                  FStar_ST.op_Colon_Equals should_print_fs_typ_app false;
                  (let uu____6841 =
                     FStar_Pprint.op_Hat_Hat initial_comment doc1  in
                   (uu____6841, comments1))))))
  