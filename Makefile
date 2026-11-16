.POSIX:
.SUFFIXES:
.SUFFIXES: .c .o

CC = cc
CFLAGS = -std=c17 -Wall -Wextra -O2
LDFLAGS =
LDLIBS =
SANFLAGS = -g -O1 -fno-omit-frame-pointer -fsanitize=address,undefined \
	-fno-sanitize-recover=undefined


OBJ = mkcdb.o

all: mkcdb

mkcdb: $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $(OBJ) $(LDLIBS)

.c.o:
	$(CC) $(CFLAGS) -c $<

san:
	$(MAKE) clean
	$(MAKE) CFLAGS='-std=c17 -Wall -Wextra $(SANFLAGS)' LDFLAGS='$(SANFLAGS)'

clean:
	rm -f mkcdb $(OBJ)