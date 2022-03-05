CHICKEN_CC = chicken-csc -x -r5rs-syntax

SRC = $(shell find . -type f -name '*.scm')
BIN = $(SRC:.scm=)

all: $(BIN)

utils:
	@

%: %.scm
	$(CHICKEN_CC) -o $@ $<

clean:
	rm -f $(BIN)

re: clean all

.PHONY: all clean re
