all:lexer.mll parser.mly
	ocamllex lexer.mll       # generates lexer.ml
	ocamlyacc parser.mly     # generates parser.ml and parser.mli
	ocamlc -c parser.mli
	ocamlc -c lexer.ml
	ocamlc -c parser.ml
	ocamlc -c calc.ml
	ocamlc -o calc lexer.cmo parser.cmo calc.cmo
clean:
	rm -rf lexer.ml parser.ml parser.mli *.cmo *.cmi calc
