CFLAGS := -gdwarf-4 -g3

default: problem_1 problem_2

problem_1: CFLAGS += -O0
problem_1: problem_1.c
	$(CC) $(CFLAGS) -o problem_1 problem_1.c

problem_2: CFLAGS += -O0 -m32
problem_2: problem_2.c
	$(CC) $(CFLAGS) -o problem_2 problem_2.c

clean:
	-rm -f core
	-rm -f problem_1 problem_2