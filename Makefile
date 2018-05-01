CFLAGS := -gdwarf-4 -g3

default: problem_1 problem_2 problem_3a problem_3b problem_4

problem_1: problem_1.c
	$(CC) -O0 $(CFLAGS) -o problem_1 problem_1.c

problem_2: problem_2.c
	$(CC) -O0 -m32 $(CFLAGS) -o problem_2 problem_2.c

module.so: common/module.c
	$(CC) -fPIC -shared -O3 $(CFLAGS) -o module.so common/module.c
	strip --strip-all module.so

problem_3a: problem_3.c module.so
	-$(CC) -O0 $(CFLAGS) -o problem_3a problem_3.c module.so

problem_3b: problem_3.c module.so
	$(CC) -O0 $(CFLAGS) -o problem_3b problem_3.c -Wl,-rpath=. module.so

problem_4: problem_4.c module.so
	$(CC) -O0 $(CFLAGS) -o problem_4 problem_4.c -Wl,-rpath=. module.so

clean:
	-rm -f core
	-rm -f problem_1 problem_2 problem_3a problem_3b problem_4