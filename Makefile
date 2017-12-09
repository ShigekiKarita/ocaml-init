OCB_FLAGS = -use-ocamlfind -I src # -use-menhir
OCB = ocamlbuild $(OCB_FLAGS)


all: native # byte profile debug

clean:
	$(OCB) -clean

native:
	$(OCB) main.native

byte:
	$(OCB) main.byte

profile:
	$(OCB) -tag profile main.native

debug:
	$(OCB) -tag debug main.byte

test:
	$(OCB) -I test test.native
	./test.native

.PHONY: all clean byte native profile debug sanity test

