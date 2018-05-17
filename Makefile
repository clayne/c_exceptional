CC = gcc
CFLAGS = -Wall -Werror -std=c99 -pedantic
DEBUGFLAGS = -g
PRODUCTIONFLAGS = -O3
BINARYNAME = exceptional_examples
SOURCEDIR := src
LIB_SOURCE_DIR := src/exceptional

ALL_SOURCES := $(shell find $(SOURCEDIR) -name '*.c')
ALL_LIB_SOURCES := $(shell find $(LIB_SOURCE_DIR) -name '*.c')

debug:
	$(CC) $(CFLAGS) $(DEBUGFLAGS) $(ALL_SOURCES) -o $(BINARYNAME)

production:
	$(CC) $(CFLAGS) $(PRODUCTIONFLAGS) $(ALL_SOURCES) -o $(BINARYNAME)

.PHONY: test
test:
	for f in `find ./test/*.c` ; do \
		target_filename=`dirname $$f`/`basename -s .c $$f` ; \
		echo $${target_filename} ; \
		$(CC) $(CFLAGS) $(DEBUGFLAGS) $(ALL_LIB_SOURCES) $$f -o $${target_filename} ; \
	done
