#
# File          : Makefile
# Description   : Build file for CS 165, Project 2, GDB exploit
#                 


# Environment Setup
#LIBDIRS=-L. -L/usr/lib64/
LIBDIRS=-L. -L/usr/lib/
#INCLUDES=-I. -I/usr/include/
CC=gcc 
CFLAGS=-c $(INCLUDES) -g -Wall -m32 -ffreestanding -fno-stack-protector $(DEFINES)
LINK=gcc -g
LDFLAGS=$(LIBDIRS) -m32 -ffreestanding
AR=ar rc
RANLIB=ranlib

# Suffix rules
.c.o :
	${CC} ${CFLAGS} $< -o $@

#
# Setup builds

TARGETS=cs165-p2 

#
# Project Protections

p2 : $(TARGETS)

cs165-p2 : try_me.o 
	$(LINK) $(LDFLAGS) try_me.o  -o $@

clean:
	rm -f *.o *~ $(TARGETS) 

# fix this
BASENAME=p3-strn
tar: 
	tar cvfz $(BASENAME)-1.tgz -C ..\
	    $(BASENAME)/Makefile \
            $(BASENAME)/cse543-p1.c \
            $(BASENAME)/cse543-strncpy-attack.c \
	    $(BASENAME)/binaries/cse543-x3-server-1 \
	    $(BASENAME)/formats/cse543-format-1.c \
	    $(BASENAME)/formats/cse543-format-1.h \
	    $(BASENAME)/cse543-proto-p3.c \
	    $(BASENAME)/cse543-proto.h \
	    $(BASENAME)/cse543-network.c \
	    $(BASENAME)/cse543-network.h \
	    $(BASENAME)/cse543-ssl.c \
	    $(BASENAME)/cse543-ssl.h \
	    $(BASENAME)/cse543-util.c \
	    $(BASENAME)/cse543-util.h 

