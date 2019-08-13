CFLAGS = --make -O2 -i./src:lib -Ilib

ALEXFILE = Lex.x
HSALEX = Lex.hs

HAPPYFILE = Synt.y
HSHAPPY = Synt.hs

HSFILE = Main.hs

SOURCES = ${shell find . lib -type f -name "*.hs"}

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

zip:
	zip B.zip -r Makefile ${SOURCES} ${ALEXFILE} ${HAPPYFILE}

remove:
	rm *.hi *.o
