


main.native : main.ml
	ocamlbuild -package zarith main.native



.PHONY : clean


clean :
	ocamlbuild -clean
