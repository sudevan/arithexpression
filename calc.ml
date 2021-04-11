        (* File calc.ml *)
        let _ =
          try
            let lexbuf = Lexing.from_channel stdin in
            while true do
              let result = Parser.main Lexer.token lexbuf in
                if result then print_string("True") else print_string("False"); print_newline(); flush stdout
            done
          with Lexer.Eof ->
            exit 0
