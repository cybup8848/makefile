SRCS=$(wildcard *.c)

OBJS=$(SRCS:.c=.o)

DEPS=$(SRCS:.c=.d)

TARGET=world.out

$(TARGET):$(OBJS)
	gcc -o $@ $^


%.d:%.c
	rm -rf $@
	$(CC) -MM $< >$@.tmp;\
	sed 's/\($*\)\.o[ :]*/\1.o $@:/g' <$@.tmp >$@;\
	rm -f $@.tmp

#%.d:%.c
#	rm -f $@;\
#	$(CC) -MM $< >$@.tmp;\
#	sed 's,\($*\)\.o[ :]*,\1.o $@:,g' <$@.tmp >$@;\
#	rm -f $@.tmp


%.o:%.c
	gcc -c -o $@ $<

clean:
	rm -rf *.o *.d $(TARGET)

#引入所有的.d文件
include $(DEPS)







































