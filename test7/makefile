SRC_DIR=./src

BUILD_DIR=./build

SRCS=$(shell find $(SRC_DIR) -name "*.c")

OBJS=$(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))

#找出依赖关系
DEPS=$(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.d,$(SRCS))

TARGET=$(BUILD_DIR)/world.out

#-include $(DEPS)   错误，因为此时会先寻找xx.d的规则，而不会生成TARGET

$(TARGET):$(OBJS)
	@echo "building $@ ..."
	@mkdir -p $(dir $@)
	gcc -o $@ $^

#build/xyz.d规则由src/xyz.c生成
$(BUILD_DIR)/%.d:$(SRC_DIR)/%.c
	@mkdir -p $(dir $@);\
	rm -f $@;\
	$(CC) -MM $< >$@.tmp;\
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' <$@.tmp >$@;\
	rm -f $@.tmp

# build/xyz.o 的规则由 src/xyz.o 生成
$(BUILD_DIR)/%.o:$(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	gcc -Wall -c -o $@ $<

clean:
	@echo "clean ..."
	rm -rf $(BUILD_DIR)

-include $(DEPS)





