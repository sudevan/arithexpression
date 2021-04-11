        /* File parser.mly */
        %token ONE
        %token ZERO
        %token OR
        %token AND
        %token LPAREN RPAREN
        %token EOL
        %start main             /* the entry point */
        %type <bool> main
        %%
        main:
            expr EOL                { $1 }
        ;
        expr:
            ONE                     { true }
          | ZERO                     { false }
          | LPAREN expr RPAREN      { $2 }
          | ONE OR expr             { true }
          | ZERO OR expr            { $3 }
          | ONE AND expr            { $3 }
          | ZERO AND expr           { false }
          | expr AND expr            { $1 && $3 }
          | expr OR expr            { $1 || $3 }
        ; 
