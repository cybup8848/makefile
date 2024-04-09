if ls ./src/*.o >/dev/null 2>&1;then
	make clean -f makefile
fi
make -f makefile
