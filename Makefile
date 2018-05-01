CFLAGS := -gdwarf-4 -g3

default: problem_1 problem_2 problem_3a problem_3b problem_4 problem_5

problem_1: problem_1.c
	$(CC) -O0 $(CFLAGS) -o problem_1 problem_1.c

problem_2: problem_2.c
	$(CC) -O0 -m32 $(CFLAGS) -o problem_2 problem_2.c

module.so: common/module.c
	$(CC) -fPIC -shared -O3 $(CFLAGS) -o module.so common/module.c
	strip --strip-all module.so

module_dbg.so: common/module.c
	$(CC) -fPIC -shared -O3 $(CFLAGS) -o module_dbg.so common/module.c
	objcopy --only-keep-debug module_dbg.so module_dbg.so.debug
	strip --strip-all module_dbg.so
	objcopy --add-gnu-debuglink module_dbg.so.debug module_dbg.so

problem_3a: problem_3.c module.so
	-$(CC) -O0 $(CFLAGS) -o problem_3a problem_3.c module.so

problem_3b: problem_3.c module.so
	$(CC) -O0 $(CFLAGS) -o problem_3b problem_3.c -Wl,-rpath=. module.so

problem_4: problem_4.c module.so
	$(CC) -O0 $(CFLAGS) -o problem_4 problem_4.c -Wl,-rpath=. module.so

problem_5: problem_4.c module_dbg.so
	$(CC) -O0 $(CFLAGS) -o problem_5 problem_4.c -Wl,-rpath=. module_dbg.so

clean:
	-rm -f core
	-rm -f problem_1 problem_2 problem_3a problem_3b problem_4 problem_5 module.so module_dbg.so module_dbg.so.debug