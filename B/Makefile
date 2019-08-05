CFLAGS = -O2

ALEXFILE = Lex.x
HSALEX = Lex.hs

HAPPYFILE = Synt.y
HSHAPPY = Synt.hs

HSFILE = Main.hs

all: compilelite remove

compile: ${SHALEX} ${SHHAPPY}
	ghc ${CFLAGS} ${HSFILE}

compilelite:
	ghc ${CFLAGS} ${HSFILE}

run:
	./Main

${SHALEX}: ${ALEXFILE}
	alex ${ALEXFILE}

${SHHAPPY}: ${HAPPYFILE}
	happy ${HAPPYFILE}

move_to_zip:
	zip B.zip -r Makefile ${HSFILE} ${ALEXFILE} ${HAPPYFILE} ${HSALEX} ${HSHAPPY}

remove:
	rm *.hi *.o
