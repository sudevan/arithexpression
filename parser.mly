        /* File parser.mly */
        %{
        type nv =
            ZERO
          | SUCC of nv
        %}
        %token SUCC
        %token ZERO
        %token PRED
        %token EOL
        %token ISZERO
        %start main             /* the entry point */
        %type <string> main

        %%
        main:
            expr EOL                { $1 }
        ;
        nv:
          |ZERO                    {"0"}
          |SUCC nv                  {"succ" ^ $2}
        ;
        expr:
          | nv                       {$1}
          | PRED ZERO                { "0"}
          | PRED SUCC nv            { $3 }
          | ISZERO  ZERO             {"true"}
          | ISZERO SUCC nv            {"false"}
          | ISZERO expr               { "iszero" ^ $2}    
        ; 
