if ls *.c >/dev/null 2>&1;then
	rm -f *.o world.out
fi
make -f makefile
