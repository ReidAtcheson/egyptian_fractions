

all : test.native main.native


test.native : test.ml
	ocamlbuild -package zarith test.native

main.native : main.ml
	ocamlbuild -package zarith main.native



.PHONY : clean


clean :
	ocamlbuild -clean
