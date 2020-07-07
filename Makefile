OBJ ?= add.o
EXTRA := sub.o mul.o

LIB := test.a

default: $(LIB)

EXTRA_OBJ :=
ifneq (, $(findstring extra, $(MAKECMDGOALS)))

EXTRA_OBJ := $(EXTRA)

endif

$(LIB):: $(EXTRA_OBJ)
	$(AR) r $(LIB) $?

$(LIB):: $(OBJ)
	$(AR) r $(LIB) $?

extra: $(LIB)

clean:
	$(RM) *.o

bclean:
	$(RM) $(LIB)

fclean:
	$(MAKE) clean
	$(MAKE) bclean

.PHONY: extra default
