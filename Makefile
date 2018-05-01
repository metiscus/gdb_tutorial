CFLAGS := -gdwarf-4 -g3

default: problem_1

problem_1: CFLAGS += -O0
problem_1: problem_1.c
	$(CC) $(CFLAGS) -o problem_1 problem_1.c

clean:
	-rm -f core
	-rm -f problem_1