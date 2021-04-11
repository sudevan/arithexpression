        (* File lexer.mll *)
        {
        open Parser        (* The type token is defined in parser.mli *)
        exception Eof
        }
        rule token = parse
            [' ' '\t']     { token lexbuf }     (* skip blanks *)
          | ['\n' ]        { EOL }
          | '0'            { ZERO }
          | "succ"         { SUCC }
          | "pred"          {PRED}
          | "iszero"        {ISZERO}
          | eof            { raise Eof }
