CFLAGS := -gdwarf-4 -g3

default: problem_1 problem_2 problem_3a problem_3b problem_4 problem_5 problem_6 libsupport.so

problem_1: problem_1.c
	$(CC) -O0 $(CFLAGS) -o problem_1 problem_1.c

problem_2: problem_2.c
	$(CC) -O0 -m32 $(CFLAGS) -o problem_2 problem_2.c

module.so: common/module.c
	$(CC) -fPIC -shared -O3 $(CFLAGS) -o module.so common/module.c
	strip --strip-all module.so
	
libsupport.so: common/support.c
	$(CC) -fPIC -shared -O3 $(CFLAGS) -o libsupport.so common/support.c -Wl,--version-script=common/support.xs
	-rm -f libsupport.so.1.0 libsupport.so.2.0
	ln -s libsupport.so libsupport.so.1.0
	ln -s libsupport.so libsupport.so.2.0

# Building a debug friendly version of the module, this is nice for when
# you need to ship code to customers but would like to be able to read crash dumps later
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

problem_6: problem_6.c libsupport.so
	$(CC) -O0 $(CFLAGS) -o problem_6a problem_6.c -Wl,-rpath=. libsupport.so.1.0 -lm
	$(CC) -O0 $(CFLAGS) -o problem_6b -DAPI_V1 problem_6.c -Wl,-rpath=. libsupport.so.1.0 -lm
	$(CC) -O0 $(CFLAGS) -o problem_6c problem_6.c -Wl,-rpath=. libsupport.so.2.0 -lm
	$(CC) -O0 $(CFLAGS) -o problem_6d -DAPI_V1 problem_6.c -Wl,-rpath=. libsupport.so.2.0 -lm
	
clean:
	-rm -f core
	-rm -f problem_1 problem_2 problem_3a problem_3b problem_4 problem_5 problem_6? module.so module_dbg.so module_dbg.so.debug
	-rm -f libsupport.so libsupport.so.1.0 libsupport.so.2.0
